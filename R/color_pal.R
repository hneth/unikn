## color_pal.R  |  unikn
## ng/hn | uni.kn | 2019 02 28
## ---------------------------

## Main functions to access and plot color palettes. 

## plot_shape: Plot a shape in a certain color: ------

plot_shape <- function(pos_x, pos_y,  # midpoint of the rectangle. 
                       col_fill,  # color for filling. 
                       col_brd = NA,
                       xlen = 1, ylen = 1,  # height of the axis lengths. 
                       shape = "rect",  # shape parameter. 
                       ...
) {
  
  ## Robustify inputs: -----
  
  ## TODO!
  
  ## Prepare inpust for vectorized solution? -----
  len_max <- max(c(length(pos_y), length(pos_x)))  # get length of longer position vector. 
  
  # Recycle all vectors to length of longest vector:
  pos_x <- rep(pos_x, length.out = len_max)
  pos_y <- rep(pos_y, length.out = len_max)
  xlen <- rep(xlen, length.out = len_max)
  ylen <- rep(ylen, length.out = len_max)
  
  
  ## For rectangular shape: -----
  if (shape == "rect") {
    
    # rect(xleft  = (box_x - xlen/2), ybottom = (box_y - ylen/2),
    #      xright = (box_x + xlen/2), ytop    = (box_y + ylen/2),
    #      col = unlist(col_fill),
    #      border = col_brd
    #      # lwd = box.lwd,
    #      # ...  # TODO: ... does not work?!
    # )
    
    symbols(x = pos_x, y = pos_y, rectangles = cbind(xlen, ylen),
            add = TRUE,
            inches = FALSE,  # use unit on x axis.
            fg = col_brd,  # line color.
            bg = col_fill  # filling.
    )
    
  }
  
  ## For circles:  -----
  if (shape == "circle") {
    
    symbols(x = pos_x, y = pos_y, circles = xlen/2,  # only uses xlen! 
            add = TRUE, 
            inches = FALSE,  # use unit on x axis. 
            fg = col_brd,  # line color. 
            bg = col_fill  # filling.
    )
  } 
  
}

## TODO: Even use function below?  It may be computationally more 
## efficient to only use the function above in a higher level function.

## plot_col: Plot a vector of colors as circles or rectangles: -------

plot_col <- function(x,  # a *vector* of colors to be plotted. 
                     ypos = 1,  # position on y axis. 
                     shape = "rect",
                     xlen = 1, ylen = 1, 
                     distance = 0,  # distance of shapes (to be taken from size). 
                     plot.new = TRUE,  # TODO: Set to false once done! 
                     ...
) {
  
  
  ## 1. Control inputs: -------------------------------------
  
  ## Robustify parameters:
  # TODO!
  
  ## Get key parameters:
  len_x <- length(x)
  
  ## Should a new plot be created? 
  if (plot.new) {
    
    if (distance > 0) {
      xlim <- c(0 - distance * len_x, len_x * (1 + distance))
    } else {
      xlim <- c(0, len_x)
    }
    
    
    plot(x = 0, type = "n", xlim = xlim, ylim = c(0, 2))  # create empty plot.
  } else {
    
    ## Check, whether a graphic device is available: 
    if (dev.cur() == 1) {
      stop("No graphic device to be plotted on.  Please open a plot or set plot.new to 'TRUE'.")
    }
  }
  
  ## 2. Calculate position parameters: ------------------------
  
  # Define positions of shape centers:
  pos_x <- 1:len_x - 0.5
  
  # change the distances:
  mid <- mean(pos_x)  # get midpoint. 
  add <- cumsum(rep(distance, sum(pos_x < mid)))  # values to be added to the first half. 
  sub <- add * (-1)  # values to be subtracted from the second half. 
  pos_x <- pos_x + if(len_x %% 2 == 0) c(rev(sub), add) else  # for even numbers no center position needed.
    c(rev(sub), 0, add)  # include the middle for uneven numbers. 
  
  ## 3. Plot all shapes: --------------------------------------
  # col_pos <- cbind(color = unlist(x), pos_x = pos_x)  # data to be plotted. 
  
  #apply(col_pos, MARGIN = 1, function(colors) {
  
  ypos <- rep(ypos, length.out = len_x)  # length out ypos to the length of x. 
  xlen <- rep(xlen, length.out = len_x)
  ylen <- rep(ylen, length.out = len_x)
  
  ## Plotting:
  plot_shape(pos_x = pos_x,  # x positions of the shapes. 
             pos_y = ypos,  # position in y dimension (given). 
             xlen = xlen, ylen = ylen,  # length of the axes. 
             col_fill = unlist(x),  # filling color. 
             shape = shape,  # shape parameter. 
             ...
  )
  #}
  # )
  # TODO: Is there a quicker (vectorized) way?
  ## Vectorize in previous function? (i.e., sapply over vectors of input values?)
  
}




## isHexCol: Helper function to detect hex-colors: -------- 

isHexCol <- function(color) {
  return(grepl(pattern = "#[0-9A-F]+", color))
}

# TODO: General color function! 

# TODO: Determine sizing of boxed, circles and text dynamically! 
# - For hex and rgb: below critical cex do not plot.
# - for shapes and text: prevent overlap. 

## seepal: Main interface to color palettes: ---------- 

# - Definition: ------- 

seepal <- function(pal = "all",     # which palette to output?
                   n = "all",
                   hex = NULL,      # determine by crowdedness, whether hex values should be shown in detail view.
                   rgb = NULL,      # determine, whether rgb values should be shown in detail view (defaults to TRUE)
                   col_brd = NULL,  # border color of the boxes. 
                   ...              # additional arguments to plot.default().
) {
  
  ## 0. Preparations: ---------
  op <- par(no.readonly = TRUE)  # save original plotting settings.
  
  # Robustify inputs: 
  if ( !(is.null(hex) | is.logical(hex)) ) stop("Please specify a valid value for 'hex'.")
  if ( !(is.null(rgb) | is.logical(rgb)) ) stop("Please specify a valid value for 'rgb'.")
  
  
  ## 1. Process the 'pal' argument: ------------------------
  ## 1.1 Test, whether a valid argument was specified: --------
  # Valid arguments comprise: 
  # - "all" (the default); plots all palettes in the environment.
  # - a single palette name as character.
  # - a list of length > 0  
  # TODO: A single color of type list
  # - a character vector of length > 0
  
  len_pal <- length(pal)  # get length of the specified palette. 
  typ_pal <- typeof(pal)  # get type of the specified palette. 
  
  stopifnot(len_pal > 0)  # stop if no palette is specified. 
  
  pal_tmp <- pal  # specify temporary palette for processing (to retain input). 
  pal_name <- deparse(substitute(pal)) # name of pal (as df)
  
  ## 1.2 Check, whether palette is of length 1 (single color or all): 
  if ( len_pal == 1 ) {
    
    ## 1.2.1 Overview: -----
    if ( pal == "all" ) {
      
      # Get all color palettes with the prefix "pal_" from the environment:
      pal_names <- utils::apropos("pal_")  # get all unikn palettes.
      pal_ls <- sapply(pal_names, get)
      
      # Indicator, whether these are color palettes: 
      is_pal <- lapply(pal_ls, FUN = function(x) {
        
        if (!typeof(x) %in% c("vector", "list")) {
          is_color <- FALSE
        } else {
          is_color <- isHexCol(color = x)
        } 
        return(all(is_color))  # are all entries colors? 
        
      })
      
      # Get the palettes:
      pal_tmp <- pal_ls[unlist(is_pal)]
      
      # Check if palette is non-empty:
      if (length(pal_tmp) == 0) {
        stop("No palettes defined in the environment.")
        # return(NULL)
      }
      
      # Select the number of colors:
      pal_tmp <- lapply(pal_tmp, FUN = pal_n, n = n)  # get n colors of each. 
      
      pal_nm <- gsub("pal_", "", names(pal_tmp))  # get palette names from listnames. 
      
      title <- "See all unikn palettes"  # specify title.
      
      
      ## 1.2.2 Single palette name: ------
      
    } else {  # if pal != "all".
      
      ## TODO: Function to test for colors in general!
      
      ## NOTE: is.character can pertain to a single color or a palette name!
      
      ## No single color but palette (note: length == 1 is already tested!):
      if ( !isHexCol(pal) ) {  # TODO: Allow for other color models!
        
        # Test, whether the palette name exists:
        pal_tmp <- tryCatch(
          
          expr = {get(pal)},
          
          error = function(error) {
            err_msg <- paste0(error, "The specified palette is not defined in the current namespace.")
            stop(err_msg)
          }
        )
        
        pal_tmp <- list(pal_tmp)  # bind palette into list of length 1. 
        title <- paste0("See palette ", gsub("pal_", "", pal))
        
      } else {
        
        title <- paste0("See color ", pal)  # TODO: Does a single color need any further processing? 
        
        ## TODO: Translate to name if possible? 
        
      } 
      
    }
  }  # eof. length == 1. 
  
  ## 1.3 Palette as list or vector: -------
  
  if ( length(pal_tmp) > 1 & !all(pal == "all")) {  # test again, if a palette has been retrieved before! 
    
    pal_tmp <- pal_n(n = n, pal_tmp)  # include the color selection (if there is more than one color).
    
    ## Wrap in list:
    # TODO: Neater solution? 
    pal_tmp <- list(pal_tmp)
    
    nm <- deparse(substitute(pal))
    
    title <- paste0("See palette ", gsub("pal_", "", nm))
    
  }
  
  
  ## 2. Plotting parameters: ---------
  
  ## Plotting preparations: 
  distance <- 0   # set distance OF WHAT?
  xlen <- 1       # set x length of color boxes.
  # TODO: Allow user to set these inputs? 
  
  # Get maximum number of colors:
  max_ncol <- max(unlist(lapply(pal_tmp, FUN = length)))
  
  # Determine xlim based on distance, maximum number of colors, and box length:
  xlim <- c(0 - distance, (1 + distance) * xlen) * max_ncol * xlen
  # print(paste0("xlim = ", xlim))
  
  # Determine ylim as number of colors in the palette:
  ylim <- c(0, length(pal_tmp))   
  # print(paste0("ylim = ", ylim))
  
  # Bind palette(s) to their color index:
  pal_mat <- cbind(pal_tmp, length(pal_tmp):1)  # TODO: Note, that a single palette needs to be a list of length 1!
  
  
  ## 3. Plotting: ------------------
  
  ## 3.1 Plot an overview for a list of palettes: 
  ## TODO: How to handle inputs of multiple palettes?  Merge them or display them for comparison.
  ## Possible solution: (a) 1 list entry --> details; (b) more than 1 list entry --> comparison:
  if (length(pal_tmp) > 1) {
    
    # Set margins:
    par(mar = c(3, 6, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = ylim,
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")  
    
    # Grid:
    grid <- TRUE  # 4debugging
    
    if (grid) {
      
      x_vals <- 0:max(ylim)
      y_vals <- 1:max_ncol
      y_vals <- y_vals[(y_vals %% 5) == 0]  # steps of 5
      y_vals <- y_vals - xlen/2
      
      abline(h = x_vals,
             v = y_vals,
             col = grey(.50, .50),
             lwd = .5)
      
    } # if (grid) etc. 
    
    ## TODO: Add fancy KN-design stuff!
    
    # Add the color vectors:
    apply(pal_mat, MARGIN = 1, FUN = function(row) {
      # print(row[[2]])
      plot_col(x = row[[1]], ypos = row[2], plot.new = FALSE, ylen = 0.8, col_brd = col_brd, lwd = 0)
    })
    # TODO: Can I allow to plot the matrix in a vectorized way (unlisting somewhere)?
    
    ## Add color names and indices:
    cex_lbl <- .90
    
    text(x = 0, y = 1:length(pal_tmp), labels = rev(pal_nm), 
         cex = cex_lbl, pos = 2, xpd = TRUE,
         offset = 1  # 1 character.
    )
    text(x = seq(0.5, (max_ncol - 0.5), by = 1), y = -1, 
         labels = paste0("[", 1:max_ncol, "]"), pos = 3, xpd = TRUE,
         cex = (cex_lbl - .10))
    
  } else {  # if length(pal_tmp) list is NOT > 1:
    
    # 3.2 Detail view of 1 palette: ------------
    
    # NOTE: Only necessary as long palettes are lists!
    
    pal_tmp <- unlist(pal_tmp)  # TODO: This essentially changes the length of the color vector.  FInd better solution!
    
    # Set margins:
    par(mar = c(3, 2, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = c(-1, 2),
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")
    
    # Text elements:
    txt_pos <- seq(0.5, length(pal_tmp) - 0.5)
    
    # Grid:
    grid <- TRUE  # 4debugging
    
    if (grid) {
      
      y_rgb <- c(-0.60, -0.75, -0.90)
      abline(h = c(c(0.6, 1.2, 1.6, -0.1), c(-0.45, y_rgb) + 0.03),
             v = txt_pos,
             col = grey(.50, .25),
             lwd = .5)
      
    } # if (grid) etc. 
    
    # Find cex so that it is as large as possible:
    cex_lim <- 0.7  # lower limit for cex. 
    
    # Determine whether to display hex values:
    cex_hex <- par("cex")
    wdth_hex <- strwidth("#XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex")  # is the width small enough?
    
    while (wdth_hex > xlim[2]) {
      
      cex_hex <- cex_hex - 0.1
      wdth_hex <- strwidth("#XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex")  # is the width small enough?
      
    }
    
    # print(cex_hex)  # 4debugging
    
    ## If it is NULL, determine based on width and max cex.
    ## Otherwise use the provided value.
    if ( is.null(hex) ) {
      
      hex <- ifelse(wdth_hex > xlim[2] | cex_hex < cex_lim, FALSE, TRUE)  # test, whether hex can be displayed.
      
      # TODO: Is the width even needed? 
    } 
    
    # Determine, whether to display rgb values:
    cex_rgb <- par("cex")
    wdth_rgb <- strwidth("999", cex = cex_rgb) * max_ncol
    while (wdth_rgb > xlim[2]) {
      
      cex_rgb <- cex_rgb - 0.1
      wdth_rgb <- strwidth("999", cex = cex_rgb) * max_ncol  # is the width small enough?
      
    }
    
    ## If it is NULL, determine based on width and max cex.
    ## Otherwise use the provided value.
    if ( is.null(rgb) ) {
      rgb <- ifelse(wdth_rgb > xlim[2] | cex_rgb < cex_lim, FALSE, TRUE)
    }
    
    # Plot rectangles:
    plot_col(x = pal_tmp, ypos = 0.6, plot.new = FALSE, ylen = 0.5, col_brd = col_brd, lwd = 1,
             ...
    )
    
    # Plot circles:
    # TODO: Dynamically determine xlen:
    circle_len <- ifelse(xlim[2] / 10 < 0.5, xlim[2] / 10, 0.5)
    
    plot_col(x = pal_tmp, ypos = 1.2, plot.new = FALSE, xlen = circle_len, shape = "circle",
             ...)
    
    # Color names:
    text(x = txt_pos, y = 1.6, labels = names(pal_tmp), # pos = 3, 
         srt = 45, xpd = TRUE, offset = 1,
         adj = c(0, 0))
    
    # Color indices:
    text(x = txt_pos, y = 0, labels = paste0("[", 1:length(pal_tmp), "]"), pos = 3, xpd = TRUE,
         cex = 1)
    
    # Hex values:
    if (hex) {
      
      ## Convert to hex if not already given in this format: 
      if (!all(isHexCol(pal_tmp))) { 
        pal_tmp <- rgb(t(col2rgb(pal_tmp)), maxColorValue = 255)
      }
      
      ## Plot the values: 
      text(x = -.25, y = -0.35, labels = "Hex:", font = 2, pos = 3, xpd = TRUE, 
           cex = cex_hex)
      text(x = txt_pos, y = -0.35, labels = pal_tmp, pos = 3, xpd = TRUE,
           cex = cex_hex, srt = 0)
      
    } # if (hex) etc.
    
    # RGB values:
    if (rgb) {
      
      text(x = rep(0, 3),
           y = y_rgb,
           labels = c("R:", "G:", "B:"), font = 2, 
           pos = 2, offset = 0, xpd = TRUE,
           cex = cex_rgb)
      text(x = matrix(rep(txt_pos, 3), nrow = 3, byrow = TRUE),
           y = matrix(rep(y_rgb, length(txt_pos) + 1), nrow = 3),
           labels = col2rgb(pal_tmp),
           pos = 2, offset = -.67, xpd = TRUE,
           cex = cex_rgb)
      
    } # if (rgb) etc.
    
  }  # if (length(pal_tmp) > 1) etc. 
  
  # Reset plotting parameters: 
  par(op)
  
  # Invisibly return pal_tmp palette(s):
  invisible(pal_tmp)
}


# - Check: ------- 

## (a) Multiple palettes: ---- 

# seepal("all")
# seepal("all", col_brd = grey(0, .25), lwd = .1)

## Return a subset of colors:
# seepal(pal = "all", n = 2)  

## Critical calls: 
# seepal("all", n =  4)  # works, but many messages
# seepal("all", n = 12)  # works, but even more messages

## 2 palettes: 
# seepal(c(pal_unikn_light, pal_unikn_dark), hex = TRUE)

# ToDo: 
# - group in 2 sets: "unikn" vs. "others"
# - allow grep for name components (e.g., "see", or "unikn")? 
# - allow grep for palette properties (e.g., > 5 colors)? 
# - default/random palette?

## (b) 1 palette: ---- 

# seepal(pal_unikn)
# seepal(pal_unikn_plus, hex = TRUE)

# seepal(pal = "seblau")  # raise error.

## Return a subset of colors:
# seepal(pal = pal_petrol, n = 3)
# seepal(pal = pal_unikn_light, n = 3)

## Critical calls:
# seepal(pal_unikn, n =  4)  # works (4 selected)
# seepal(pal_unikn, n = 20)  # fails (max n = 11 of pal_unikn_plus selected)

# seepal(pal_bordeaux, n =  3)  # works (3 selected)
# seepal(pal_bordeaux, n = 10)  # fails (max n = 5 returned)

# seepal(pal_unikn_light, n = 3)   # mostly works (first 3 chosen)
# seepal(pal_unikn_light, n = 10)  # mostly fails (max n = 10 returned)



## (c) Creating new palettes: ---- 

# see colorRampPalette() to extend/stretch color palettes
# ?: What happens when only subsets are selected
#    (a) averages between min and max color?
#    (b) choose existing colors for as long as possible

## Color gradients: 
# gradient <- col_scale(c(rev(pal_seeblau), "white", pal_peach))
# seepal(gradient(50))

## ToDo: 2 main cases: 
# - n < available colors in palettes: Select some from available colors (rather than generating new ones)
# - n > available colors in palettes: Extend/stretch color palettes (rather than individual colors)

## Currently to be commented out for building (probably no palettes loaded before the function is executed):
# a <- seepal(pal = "all")  # return all palettes.
# a

# b <- seepal(pal = pal_unikn_pair)  # return one long palette (hex not displayed by default.)
# seepal(pal = pal_unikn_pair, hex = TRUE)  # display hex independent of fontsize.
# seepal(pal = pal_unikn_pair)  

# c <- seepal(pal = pal_bordeaux, hex = TRUE)


## TODO: Function to select colors differently!
 
# rmp <- colorRampPalette(c(pal_seeblau, "white", pal_grau, pal_peach))

# seepal(rmp(.5))
# seepal(c("black", "yellow", "green"))


## ToDo: ------

# - Naming: Remove "pal_" from names? (Currently, pal_n uses full names...)


## eof. ----------


