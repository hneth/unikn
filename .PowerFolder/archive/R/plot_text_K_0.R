## plot_text.R | unikn
## hn  |  uni.kn |  2019 02 19
## ---------------------------

## Plot text with formatting elements (highlighting or underlining).


## box_text: Add text with a colored background box to a plot ------

## Adapted from Ian Kopacka's solution to a question at: 
## https://stackoverflow.com/questions/45366243/text-labels-with-background-colour-in-r

## - Documentation: ---- 

#' \code{box_text} places 1 or more text strings (of a character vector \code{lbls}) 
#' onto a plot and places a colored box behind
#' each label to highlight it (i.e., make it stand out from the background).
#' 
#' \code{box_text} uses the base graphics system \code{graphics::}. 
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{lbls} should be written. 
#' If the length of \code{x} and \code{y} differs, the shorter one is recycled.
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{lbls} should be written.
#' 
#' @param lbls A character vector specifying the text labels 
#' to be written.
#' 
#' @param col_lbl The color(s) of the text label(s).
#' 
#' @param col_bg The color(s) to fill or shade the rectangle(s) with. 
#' The default \code{col_bg = NA} implies no fill 
#' (i.e., draws transparent rectangles).
#' 
#' @param col_bg_brd The color(s) for rectangle border(s). 
#' The default \code{NA} omits borders.
#' 
#' @param adj One or two adjustment values in \code{[0, 1]} which specify 
#' the x (and optionally y) adjustment of the labels.
#' 
#' @param pos A position specifier for the text. If specified this overrides
#' any \code{adj} value given. Values of 1, 2, 3 and 4, respectively indicate
#' positions below, to the left of, above and to the right of the specified
#' coordinates.
#' 
#' @param offset When \code{pos} is specified, this value sets the offset of
#' the label from the specified coordinate in fractions of a character width.
#' 
#' @param padding A factor used for the padding of the box around
#' the text. Padding is specified in fractions of a character width. If a
#' vector of length 2 is specified then 2 different factors are used for the
#' padding in x- and y-direction.
#' 
#' @param cex A numeric character expansion factor, which is  
#' multiplied by \code{par("cex")} to yield the final character size.
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (bold).
#' 
#' @return Returns the coordinates of the background rectangle(s). 
#' If multiple labels are placed in a vector then the coordinates are returned
#' as a matrix with columns corresponding to xleft, xright, ybottom, ytop.
#' If only one label is placed, its coordinates are returned as a vector.
#' 
#' @author Adapted from code by Ian Kopacka.
#' 
#' @examples
#' ## Create some noisy background:
#' plot(x = runif(500), y = runif(500), type = "p", pch = 16, cex = 3, col = grey(.33, .10))
#' 
#' ## Adjust cex, font and adj:
#' box_text(x = .01, y = .95, lbls = "What a messy plot",
#'          col_bg = "skyblue1", adj = c(0, 0), padding = c(.25, .75), cex = 1.8)
#' 
#' ## Vector of 2 lbls, using argument 'pos' to position right of coordinates:
#' box_text(x = c(.15, .60), y = c(.10, .50),
#'          lbls = c("Some highlighted text here.", "Something else here."),
#'          col_bg = c("skyblue2", "gold"), pos = 4, padding = c(.25, 1))
#'    
#' @import graphics 
#'                          
#' @export 

## - Definition: ---- 

box_text <- function(x, y, lbls = NA, # coordinates and labels of text element(s) 
                     col_lbl = NULL, col_bg = NA, col_bg_brd = NA,  # colors
                     adj = NULL, pos = NULL, offset = .5, padding = c(.5, .5),  # positions 
                     cex = 1, font = 2  # text size and font
){
  
  ## Coordinates: ----
  
  if (missing(y)) {y <- x}  # use x as y if no y provided
  
  # Recycle coords if necessary:
  if (length(x) != length(y)){
    lx <- length(x)
    ly <- length(y)
    if (lx > ly){
      y <- rep(y, ceiling(lx/ly))[1:lx]
    } else {
      x <- rep(x, ceiling(ly/lx))[1:ly]
    }
  }
  
  ## Text labels: ----
  
  # Interpret inputs:
  cur_font <- graphics::par('font')
  cur_cex <- graphics::par('cex') * cex  # character expansion factor to use
  
  # Measure dimensions of text elements:
  char_width <- graphics::strwidth(s = "n", cex = cur_cex, font = font)     # width of "n" 
  text_height <- graphics::strheight(s = lbls, cex = cur_cex, font = font)  # text height(s)
  text_width  <- graphics::strwidth(s = lbls, cex = cur_cex, font = font)   # text width(s)
  
  # Is 'adj' of length 1 or 2?
  if (!is.null(adj)){
    if (length(adj == 1)){
      adj <- c(adj[1], 0.5)
    }
  } else {
    adj <- c(0.5, 0.5)
  }
  
  # Is 'pos' specified?
  if (!is.null(pos)){
    if (pos == 1){
      adj <- c(0.5, 1)
      offset_vec <- c(0, -offset * char_width)
    } else if (pos == 2){
      adj <- c(1, 0.5)
      offset_vec <- c(-offset * char_width, 0)
    } else if (pos == 3){
      adj <- c(0.5, 0)
      offset_vec <- c(0, offset * char_width)
    } else if (pos == 4){
      adj <- c(0, 0.5)
      offset_vec <- c(offset * char_width, 0)
    } else {
      stop('Invalid argument pos')
    }
  } else {
    offset_vec <- c(0, 0)
  }
  
  # Padding for boxes:
  if (length(padding) == 1){ # only 1 value provided: 
    padding <- c(padding[1], padding[1])
  }
  
  # Compute midpoints of text(s):
  x_mid <- x + (-adj[1] + 1/2) * text_width  + offset_vec[1]
  y_mid <- y + (-adj[2] + 1/2) * text_height + offset_vec[2]
  
  # Draw rectangle(s):
  rect_width  <- (text_width  + (2 * padding[1] * char_width))
  rect_height <- (text_height + (2 * padding[2] * char_width))
  graphics::rect(xleft   = x_mid - rect_width/2,
                 ybottom = y_mid - rect_height/2,
                 xright  = x_mid + rect_width/2,
                 ytop    = y_mid + rect_height/2,
                 col     = col_bg, 
                 border  = col_bg_brd)
  
  # Draw text lbls:
  graphics::text(x = x_mid, y = y_mid, labels = lbls, col = col_lbl, 
                 cex = cur_cex, font = font, adj = c(.5, .5))
  
  # Return value(s):
  if (length(x_mid) == 1){  # Coordinates of 1 rectangle: 
    invisible(c(x_mid - rect_width/2, x_mid + rect_width/2, y_mid - rect_height/2,
                y_mid + rect_height/2))
  } else {  # Coordinates of rectangles:
    invisible(cbind(x_mid - rect_width/2, x_mid + rect_width/2, y_mid - rect_height/2,
                    y_mid + rect_height/2))
  }
  
} # box_text end.

### Check: 
# ## Create some noisy background:
# plot(x = runif(500), y = runif(500), type = "p", pch = 16, cex = 3, col = grey(.33, .10))
# 
# ## Adjust cex, font and adj:
# box_text(x = .01, y = .95, lbls = "What a messy plot",
#           col_bg = "skyblue1", adj = c(0, 0), padding = c(.25, .75), cex = 1.8)
# 
# ## Vector of 2 lbls, using argument 'pos' to position right of coordinates:
# box_text(x = c(.15, .60), y = c(.10, .50),
#          lbls = c("Some highlighted text here.", "Something else here."),
#          col_bg = c("skyblue2", "gold"), pos = 4, padding = c(.25, 1))




## ToDo: ------

# (1) Functions: 
#   - improve function to show colors (and options for full color info: nr, name, HEX, RGB, hsv)
#   - improve function pal_n to get n (good) colors (and consider integrating it into palettes)
#   - provide color gradient function(s) (to return an arbitrary number of colors)

# (+) Additional elements:
#   - add a function to get a boX in seeblau (or another fill color)
#   - ggplot_addon: provide complete ggplot theme(s)
#   - text elements: heading and underline (with seeblau color defaults)
#   - fonts?
#   - logo: Merken-boX or hexagon in seeblau with letter "R"

## eof. ----------