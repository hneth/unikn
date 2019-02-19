## color_functions.R  |  unikn
## hn  |  uni.kn |  2019 02 18
## ---------------------------

## Define function to plot colors 



## plot_shape: Plot a shape in a certain color: ------

plot_shape <- function(box_x, box_y,  # midpoint of the rectangle. 
                       col_fill,  # color for filling. 
                       col_brd = NA,
                       xlen = 1, ylen = 1,  # height of the axis lengths. 
                       shape = "rect",  # shape parameter. 
                       ...
                       ) {
  
  ## Robustify inputs: -----
  
  ## TODO!
  
  
  ## Prepare inpust for vectorized solution? -----
  
  
  ## For rectangular shape: -----
  if (shape == "rect") {
    
    rect(xleft  = (box_x - xlen/2), ybottom = (box_y - ylen/2),
         xright = (box_x + xlen/2), ytop    = (box_y + ylen/2),
         col = unlist(col_fill),
         border = col_brd
         # lwd = box.lwd,
         # ...  # TODO: ... does not work?!
    )
  }
  
  ## For circles:  -----
  if (shape == "circle") {
    
    symbols(x = box_x, y = box_y, circles = xlen/2,  # only uses xlen! 
            add = TRUE, 
            inches = FALSE,  # use unit on x axis. 
            fg = col_brd,  # line color. 
            bg = col_fill  # filling.
            )
  } 
  
}

## plot_col: Plot a vector of colors as circles or rectangles: -------

plot_col <- function(x,  # a vector of colors to be plotted. 
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
    plot(x = 0, type = "n", xlim = c(0, len_x), ylim = c(0, 2))  # create empty plot.
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
                          c(rev(sub), mid, add)  # include the middle for uneven numbers. 
  
  ## 3. Plot all shapes: --------------------------------------
  col_pos <- cbind(color = unlist(x), pos_x = pos_x)  # data to be plotted. 
  
  apply(col_pos, MAR = 1, function(colors) {

    plot_shape(box_x = as.numeric(colors["pos_x"]),  # x positions of the shapes. 
               box_y = ypos,  # position in y dimension (given). 
               xlen = xlen, ylen = ylen,  # length of the axes. 
               col_fill = colors["color"],  # filling color. 
               shape = shape  # shape parameter. 
               )
    }
  )
  # TODO: Is there a quicker (vectorized) way?
  ## Vectorize in previous function? (i.e., sapply over vectors of input values?)
  
}


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