## color_functions.R  |  unikn
## hn  |  uni.kn |  2019 02 18
## ---------------------------

## Define function to plot colors 



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
  
  #apply(col_pos, MAR = 1, function(colors) {
  
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






## see_pal should work like the following: ------------
yarrr::piratepal()


## TODO: 
## 1. Plotting multiple shapes (rectangles) for comparison; add numbers. 
## 2. Plot detailed color palettes, including names, hex and rgb. 

## Helper function to detect hex-colors:
isHexCol <- function(color) {
  return(grepl(pattern = "#[0-9A-F]+", color))
}


## FUnction seepal start: ---------------

seepal <- function(pal = "all",  # which palette to output?
                   hex = NULL,  # determine by crowdedness, whether hex values should be shown in detail view.
                   rgb = NULL   # determine, whether rgb values should be shown in detail view (defaults to TRUE)
                   ) {
  
  ## 0. Preparations: ---------
  op <- par(no.readonly = TRUE)  # save original plotting settings.
  
  # Robustify inputs: 
  if (!(is.null(hex) | is.logical(hex))) stop("Please specify a valid value for 'hex'.")
  if (!(is.null(rgb) | is.logical(rgb))) stop("Please specify a valid value for 'rgb'.")
  
  
  ## 1. Overview function: ------
  if (pal == "all") {
    
    # 1.1 Get all color palettes with the prefix "_pal" from the environment:
    pal_names <- apropos("pal_")  # get all unikn palettes.
    pal_ls <- sapply(pal_names, get)
    
    ## Indicator, whether these are color palettes: 
    is_pal <- lapply(pal_ls, FUN = function(x) {
      
      if (!typeof(x) %in% c("vector", "list")) {
        is_color <- FALSE
      } else {
        is_color <- isHexCol(color = x)
      } 
      return(all(is_color))  # are all entries colors? 
      
    })
    
    ## Get the palettes:
    pal <- pal_ls[unlist(is_pal)]
    
  } 
  
  pal_nm <- gsub("pal_", "", names(pal))  # get palette names from listnames. 

  ## Plotting preparations: 
  distance <- 0  # set distance.
  xlen <- 1  # set x length of boxes.
  # TODO: Allow user to set these inputs? 
  
  ## Get maximum number of colors:
  max_num <- max(unlist(lapply(pal, FUN = length)))
  
  ## Determine xlim based on distance, maximum number of colors, and box length:
  xlim <- c(0 - distance, (1 + distance) * xlen) * max_num * xlen
  # Determine ylim as number of colors in the palette:
  ylim <- length(pal)  
  
  ## Bind palettes to color index:
  pal_mat <- cbind(pal, length(pal):1)  # TODO: Note, that a single palette needs to be a list of length 1!
  
  
  
    ## TODO: How to handle inputs of multiple palettes?  Merge them or display them for comparison.
    ## Possible solution: (a) 1 list entry --> details; (b) more than 1 list entry --> comparison:
    if ( length(pal) > 1 ) {
      
      ## Set margins:
      par(mar = c(3, 6, 3, 1))
      
      # Create empty plot:
      plot(x = 0, type = "n", xlim = xlim, ylim = c(0, ylim),
           xaxt = "n", yaxt = "n",  # hide axes.
           xlab = "", ylab = "", main = "See all KN palettes",
           bty = "n"
      )  
      
      ## TODO: Add fancy KN-design stuff!
      
      
      ## Add the color vectors:
      apply(pal_mat, MAR = 1, FUN = function(row) {
        # print(row[[2]])
        plot_col(x = row[[1]], ypos = row[2], plot.new = FALSE, ylen = 0.8, col_brd = "grey", lwd = 1)
      })
      # TODO: Can I allow to plot the matrix in a vectorized way (unlisting somewhere)?
      
      ## Add color names and indices:
      text(x = -1, y = 1:length(pal), labels = rev(pal_nm), pos = 2, xpd = TRUE)
      text(x = seq(0.5, max_num - 0.5, by = 1), y = -1, 
           labels = paste0("[", 1:max_num, "]"), pos = 3, xpd = TRUE,
           cex = 0.7)
    
      } else {  # if only a list of 1 is specified:
      
      # 2. Detail view: ------------
        
        ## Preps: 
        pal <- unlist(pal)  # TODO: This essentially changes the length of the color vector.  FInd better solution!
        
        ## Set margins:
        par(mar = c(3, 2, 3, 1))
        
        plot(x = 0, type = "n", xlim = xlim, ylim = c(-1, 2),
             xaxt = "n", yaxt = "n",  # hide axes.
             xlab = "", ylab = "", main = paste("See palette", gsub("pal_", "", pal_nm)),
             bty = "n"
        )  # create empty plot.
        
        ## Determine whether to display hex values:
        if (is.null(hex)) {
          hex <- ifelse(strwidth("#XXXXXX") * max_num > xlim[2], FALSE, TRUE)
        }
        
        plot_col(x = pal, ypos = 0.6, plot.new = FALSE, ylen = 0.5, col_brd = "grey", lwd = 1)
        plot_col(x = pal, ypos = 1.2, plot.new = FALSE, xlen = 0.5, shape = "circle")
        
        ## Text elements:
        txt_pos <- seq(0.5, length(pal) - 0.5)
        
        ## Color names:
        text(x = txt_pos, y = 1.8, labels = names(pal), pos = 1, srt = 45, xpd = TRUE)
        ## Color indices:
        text(x = txt_pos, y = -0.1, labels = paste0("[", 1:length(pal), "]"), pos = 3, xpd = TRUE,
             cex = 1)
        ## Hex values:
        if ( hex ) {
          text(x = c(-0.1, txt_pos), y = -0.3, labels = c("Hex", pal), pos = 3, xpd = TRUE,
               cex = 1)
        }
        
        ## RGB values:
        if ( rgb ) {
          text(x = matrix(rep(c(-0.1, txt_pos), 3), nrow = 3, byrow = TRUE),
               y = matrix(rep(c(-0.5, -0.75, -1.0), length(txt_pos) + 1), nrow = 3),
               labels = cbind(c("R", "G", "B"), col2rgb(pal)),
               pos = 3, xpd = TRUE,
               cex = 1)
        }
        
    }
    
  
  # Reset plotting parameters: 
  par(op)
  
  ## Invisibly return palette(s):
  invisible(pal)
}


a <- seepal(pal = "all")  # return all palettes.
a

b <- seepal(pal = list(pal_unikn_pair))  # return one long palette (hex not displayed by default.)
b

c <- seepal(pal = list(pal_Bordeaux), hex = TRUE)




## Original function using ggplot: --------------------------

# plot_pal: Plot information on a given color palette [pal]: ------ 

# - Documentation: ---- 

#' Plot a color palette.
#'
#' \code{plot_pal} plots information on a color palette \code{pal}.
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' plot_pal()  # plots default color palette 
#' plot_pal(pal_unikn_plus) 
#' 
#' ## Not run: 
#' 
#' # Plotting palettes from other packages: ------ 
#' 
#' # RColorBrewer palettes: 
#' plot_pal(RColorBrewer::brewer.pal(n = "all", name = "Set1"))
#' plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' # viridisLite palettes: 
#' plot_pal(viridisLite::viridis(20))
#' plot_pal(viridisLite::inferno(25)) 
#' plot_pal(viridisLite::magma(25))
#' plot_pal(viridisLite::plasma(25))
#'   
#' # yarrr palettes: 
#' plot_pal(yarrr::piratepal(palette = "appletv"))
#' plot_pal(yarrr::piratepal(palette = "google"))
#' 
#' ## End(Not run)
#'
#' @family color palettes
#'
#' @seealso 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients);  
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import ggplot2
#' @import grDevices 
#'
#' @export

# - Definition: ---- 

plot_pal <- function(pal = pal_unikn) {
  
  stopifnot(length(pal) > 0)
  
  n <- 1:length(pal)
  
  name <- names(pal)
  
  # if pal contained no names:  
  if (is.null(name)) {name <- paste0("[", 1:length(pal), "]")}
  
  pal_name <- deparse(substitute(pal)) # gets name of df
  
  df <- data.frame(n = n, name = name)
  
  ggplot2::ggplot(df, aes(x = n)) +
    geom_tile(aes( y = 1, fill = n)) + 
    geom_point(aes(y = 2, col = n), pch = 16, size = (100/length(pal))) +
    geom_text(aes( y = 3, label = name), angle = 45, adj = 0, col = grey(.33, 1)) + 
    # geom_text(aes(y = 2, label = pal)) +   
    scale_x_continuous(breaks = 1:length(pal)) + 
    scale_y_continuous(limits = c(0, 4)) +
    scale_color_gradientn(colors = pal) +
    scale_fill_gradientn(colors = pal) +
    labs(title = paste0("Colors of ", pal_name, ":"), 
         x = "[n]") + 
    theme_minimal() + 
    theme(axis.line.y = element_blank(), 
          axis.text.y = element_blank(), 
          axis.title.y = element_blank(), 
          legend.position = "none", 
          plot.title = element_text(family = "sans", face = "bold"), 
          panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(linetype = 1, size = .25), 
          panel.grid.major.y = element_line(linetype = 1, size = .25))
  
}