## color_utils.R  |  unikn
## ng | uni.kn | 2019 03 25
## ---------------------------

## Utility functions to access and plot color palettes. 

## 1. General functions: -------
## isHexCol: Helper function to detect hex-colors: -------- 

isHexCol <- function(color) {
  return(grepl(pattern = "#[0-9A-F]+", color))
}

## Helper lookup_pal: A list of all unikn palette names  ------
# which is not changed by user input and generated on load:
# lookup_pal <- utils::apropos("pal_")  # get all unikn palettes.
# TODO: Where to put this?


## 2. Color getting functions: ------

## get_col(): Get a palette or list of palettes by keyword, n argument uses grDevices::colorRampPalette(): -------

get_col <- function(pal, n = "all") {
  
  ## 1. Process the 'pal' argument: ------------------------
  
  ## 1.1 Test, whether a valid argument was specified: --------
  # Valid arguments comprise: 
  # - "all" (the default); plots all palettes in the environment.
  # - a single palette name as character.
  # - a list of length > 0  
  # TODO: A single color of type list
  # - a character vector of length > 0
  
  # pal <- tolower(pal)  # TODO: tolower() is problematic, as one cannot access the single colors in uppercase. 
  
  # # Correct order: First test for non-character argument(s) then for character inputs:
  ## Test, whether the palette exists:
  dep_pal <- deparse(substitute(pal))   #deparse palette to check for existence.
  
  if ( !exists(dep_pal) ) {
    
    dep_pal_exists <- tryCatch(
      
      {
        exists(paste0("pal_", dep_pal))
        # print("here")
        # print(exists(paste0("pal_", dep_pal)))
      },
      
      error = function(e) {
        
        tryCatch( 
          {exists(pal)}          , 
          
          error = function(e) {
            
            stop(paste0("No matching color palette found for input", dep_pal))
            
          })
      }
    )
    
    ## If the palette has been found to exist:
    if ( dep_pal_exists ) {
      
      pal <- paste0("pal_", dep_pal)
      
    }
    
  }  # eof. existence check.
  
  len_pal <- length(pal)  # get length of the specified palette. 
  typ_pal <- typeof(pal)  # get type of the specified palette. 
  
  stopifnot(len_pal > 0)  # stop if no palette is specified. 
  
  tmp <- pal  # specify temporary palette for processing (to retain input). 
  pal_name <- deparse(substitute(pal)) # name of pal (as df)
  
  ## 1.2 Check, whether palette is of length 1 (keyword or single color; potentially also list): 
  if ( len_pal == 1 ) {
    
    # TODO: Test for list of colors of legth 1? 
    
    if ( pal == "tmp" ) stop("Color palettes must not be named tmp.")  # TODO: Nicer solution possible?
    
    ## 1.2.1 Getting by keyword: -------------------
    keys <- c("all", "unikn_all", "all_unikn", "grad_all", "all_grad")
    
    if ( pal %in% keys ) {  # is pal in keys?
      
      # Get all color palettes with the prefix "pal_" from the environment.
      
      all_pal <- utils::apropos("pal_")  # all palettes in the environment. 
      ix_unikn <- grepl("pal_unikn", all_pal)  # index for all unikn palettes. 
      
      ## The three cases: -----
      pal_names <- switch( pal, 
                           all = all_pal[all_pal != "tmp"],
                           unikn_all = all_pal[ix_unikn],
                           all_unikn = all_pal[ix_unikn],
                           grad_all = all_pal[!ix_unikn],
                           all_grad = all_pal[!ix_unikn]
      )
      
      # Get all palettes specified by keyword:
      lst_pal <- sapply(pal_names, get)
      
      # Indicator, whether these are color palettes: 
      is_pal <- lapply(lst_pal, FUN = function(x) {
        
        if (!typeof(x) %in% c("vector", "list")) {
          is_color <- FALSE
        } else {
          is_color <- isHexCol(color = x)
        } 
        return(all(is_color))  # are all entries colors? 
        
      })
      
      # Get the palettes:
      tmp <- lst_pal[unlist(is_pal)]
      
      # Check if palette is non-empty:
      if (length(tmp) == 0) {
        stop("No color palettes defined in the current environment.")
      }
      
      ## Order palettes:
      if ( pal == "all" ) {
        ix <- c(grep("pal_unikn", names(tmp)), grep("pal_signal", names(tmp)))
        
        tmp <- c(tmp[ix], tmp[-ix])
      }
      
      pal_nm <- names(tmp)  # get palette names from listnames. 
      
      ## 1.2.2 Single palette name: ------
    } else {  # if pal not defined by keyword.
      
      ## TODO: Function to test for colors in general?
      
      ## NOTE: is.character can pertain to a single color or a palette name!
      
      ## No single color but specification of a palette (note: length == 1 is already tested!):
      if ( !isHexCol(pal) & !pal %in% colors() ) {  # TODO: Allow for other color models!
        
        # Test, whether the palette name exists:
        tmp <- tryCatch(
          
          expr = {
            get(pal)  # try to find the palette in namespace.
          },
          
          error = function(error) {
            
            ## Allow color aliases:
            out <- tryCatch(
              expr = {
                # TODO!
                input <- sub("[[:punct:]]", "", pal)  # Substitute first puctuation sign # TODO: What to substitute?
                get(paste0("pal_", input))  # try to find the palette in namespace.
              },
              
              error = function(error) {
                err_msg <- paste0(error, "The specified color palette is not defined in the current namespace.")
                stop(err_msg)
              }
            )
            
            
          }
        )
        
        tmp <- list(tmp)  # bind palette into list of length 1. 
        names(tmp) <- paste0(pal)
        # title <- paste0("See palette ", gsub("pal_", "", pal))
        
      } 
    }
    
  } else { # eof. length == 1; call, if a full palette has been specified. 
    
    # TODO: Allow to mix palettes! (e.g., c("pal_bordeaux", "pal_unikn"))?
    
    # Correct order: First test for non-character argument(s) then for character inputs:
    dep_pal <- deparse(substitute(pal))
    # print(dep_pal)
    
    if ( is.null(names(tmp))) {
      
      names(tmp) <- pal
      # if no names are provided assign color names. 
      
    } else if (any(names(tmp) == "")) {
      
      names(tmp)[names(tmp) == ""] <- pal[names(tmp) == ""] 
      # if some names are not provided, replace with color names. 
      
    } 
    
    tmp <- list(tmp)
    nm <- deparse(substitute(pal))  # This needs to be done in the other function as well. 
    names(tmp) <- nm  # name the list. 
    
  }  
  
  
  ## Color selection: --------
  if ( n != "all" ) {
    # tmp <- use_pal_n(n = n, tmp)
    # If we have a list of palettes (currently by keywords only):
    tmp <- lapply(tmp, FUN = function(pal) {
      out <- grDevices::colorRampPalette(pal)
      # print(out(n))
      return(out(n))
    })
    
  }
  
  # print(tmp)  # TODO: Rather create a print method for this!
  return(tmp)  # return the whole object invisibly!
  # return(pal_tmp)
  
}



## 3. Plotting functions: ------
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
  
} # plot_col end. 