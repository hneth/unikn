## plot_text.R | unikn
## hn  |  uni.kn |  2019 02 19
## ---------------------------

## Plot text with formatting elements (highlighting or underlining).


## box_text: Add text with a colored background box to a plot: ------

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
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) to highlight or fill the rectangle(s) with. 
#' Default: \code{col_bg = NA} (transparent rectangles).
#' 
#' @param col_bg_brd The color(s) for rectangle border(s). 
#' Default: \code{col_bg_brd = NA} (no borders).
#' 
#' @param adj Adjustment of label position, 
#' 1 or 2 adjustment values in \code{[0, 1]} which specify 
#' the x (and optionally y) adjustment of the labels. 
#' Default: \code{adj = NULL}. 
#' 
#' @param pos A position specifier for the text. If specified, this overrides
#' any \code{adj} value given. Values of 1, 2, 3 and 4, respectively indicate
#' positions below, to the left of, above and to the right of the specified
#' coordinates. 
#' Default: \code{pos = 4} (right). 
#' 
#' @param offset When \code{pos} is specified, this value sets the offset of
#' the label from the specified coordinate in fractions of a character width. 
#' Default: \code{offset = NULL}. 
#' 
#' @param padding A factor used for the padding of the box around
#' the text (in fractions of a character width). 
#' If a vector of length 2 is specified then 2 different factors 
#' are used for padding in the x- and y-direction, respectively. 
#' Default: \code{padding = c(.20, .80)}. 
#' 
#' @param cex A numeric character expansion factor, 
#' multiplied by \code{par("cex")} to yield the character size. 
#' Default: \code{cex = 2}. 
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (i.e., bold).
#' 
#' @return Returns the coordinates of the background rectangle(s). 
#' If multiple labels are placed in a vector then the coordinates are returned
#' as a matrix with columns corresponding to xleft, xright, ybottom, ytop.
#' If only one label is placed, its coordinates are returned as a vector.
#' 
#' @author Adapted from code by Ian Kopacka.
#' 
#' @examples
#' ## Example 1: Simple highlights
#' plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1))
#' box_text(x = 0, y = .9, lbls = "Something to notice", col_bg = unlist(seeblau))
#' box_text(x = 0, y = .7, lbls = "Highlighting text is really simple", cex = 1.5, col_bg = "gold")
#' box_text(x = 0, y = .6, lbls = "and strikingly effective", cex = 1.5, col_bg = pal_seeblau[[1]])
#' 
#' ## Example 2: Messy plot
#' n <- 20
#' set.seed(1)
#' plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
#' 
#' # Adjust cex, font and adj:
#' box_text(x = .05, y = .90, lbls = "What a messy plot",
#'          col_bg = seeblau[[1]], adj = c(0, 0), padding = c(.25, .85), cex = 2)
#' 
#' # Vector of 2 lbls, using argument 'pos' to position right of coordinates:
#' box_text(x = c(.30, .60), y = c(.20, .40),
#'          lbls = c("Note something here", "Some highlighting here"),
#'          col_bg = c(pal_seeblau[[2]], "gold"), pos = 4, padding = c(.25, .85), cex = 1.2)
#' 
#' @family text functions
#' 
#' @seealso
#' \code{\link{highlight}} (reduced version) to mark text with a colored box  
#'                 
#' @import graphics 
#'                          
#'                          

## - Definition: ---- 

box_text <- function(x, y, lbls = NA,               # coordinates and labels of text element(s) 
                     col_lbl = "black", col_bg = NA, col_bg_brd = NA,         # colors
                     adj = NULL, pos = 4, offset = 0, padding = c(.20, .80),  # positions 
                     cex = 2, font = 2                                        # text size and font
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

# ## Example 1: Simple highlights 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1))
# box_text(x = 0, y = .9, lbls = "Something to notice", col_bg = unlist(seeblau))
# box_text(x = 0, y = .7, lbls = "Highlighting text is really simple", cex = 1.5, col_bg = "gold")
# box_text(x = 0, y = .6, lbls = "and strikingly effective", cex = 1.5, col_bg = pal_seeblau[[1]])
# 
# ## Example 2: Messy plot 
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
# 
# # Adjust cex, font and adj:
# box_text(x = .05, y = .90, lbls = "What a messy plot",
#          col_bg = seeblau[[1]], adj = c(0, 0), padding = c(.25, .85), cex = 2)
# 
# # Vector of 2 lbls, using argument 'pos' to position right of coordinates:
# box_text(x = c(.30, .60), y = c(.20, .40),
#          lbls = c("Note something here", "Some highlighting here"),
#          col_bg = c(pal_seeblau[[2]], "gold"), pos = 4, padding = c(.25, .85), cex = 1.2)


## Reduced version (with fewer arguments):

## highlight: Place and highlight text on plot: ------ 

## - Documentation: ---- 

#' \code{highlight} places 1 or more text strings (of a character vector \code{lbls}) 
#' onto a plot and places a colored box behind
#' each label to highlight it (i.e., make it stand out from the background).
#' 
#' \code{highlight} uses the base graphics system \code{graphics::}. 
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
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) to highlight or fill the rectangle(s) with. 
#' Default: \code{col_bg = NA} (transparent rectangles).
#' 
#' @param cex A numeric character expansion factor, 
#' multiplied by \code{par("cex")} to yield the character size. 
#' Default: \code{cex = 2}. 
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (i.e., bold).
#' 
#' 
#' @examples
#' ## Example 1: Simple highlights
#' plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
#' 
#' highlight(x = 0, y = .9, lbls = "Something to notice")
#' highlight(x = 0, y = c(.7, .6), 
#'           lbls = c("Highlighting text is simple", "but strikingly effective"), 
#'           cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
#' highlight(x = .5, y = c(.4, .3), lbls = c("It is also flexible", "but should be handled with care"), cex = 1.2, 
#'           col_lbl = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
#' 
#' ## Example 2: Messy plot
#' n <- 20
#' set.seed(1)
#' plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
#' 
#' # Only 1 label:
#' highlight(x = .05, y = .90, lbls = "What a messy plot")
#' 
#' # 2 labels at once:
#' highlight(x = c(.30, .60), y = c(.20, .40),
#'           lbls = c("Note something here", "Some highlighting here"),
#'           col_bg = c(pal_seeblau[[2]], "gold"), cex = 1.2)
#'           
#' @family text functions
#' 
#' @seealso
#' \code{\link{plot_box}} to plot text in a colored box 
#'      
#' @import graphics 
#'                          
#' @export 

## - Definition: ---- 

highlight <- function(x, y, lbls = NA,                             # coordinates and labels of text element(s) 
                      col_lbl = "black", col_bg = unlist(seeblau), # color(s)
                      cex = 2, font = 2                            # text size and font
){
  
  # Pass on (to richer box_text function):
  box_text(x = x, y = y, lbls = lbls, col_lbl = col_lbl, col_bg = col_bg, cex = cex, font = font)
  
}


# ## Check:
#
# ## Example 1: Simple highlights
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# highlight(x = 0, y = .9, lbls = "Something to notice")
# highlight(x = 0, y = c(.7, .6), 
#           lbls = c("Highlighting text is simple", "but strikingly effective"), 
#           cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
# highlight(x = .5, y = c(.4, .3), lbls = c("It is also flexible", "but should be handled with care"), cex = 1.2, 
#           col_lbl = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
# 
# ## Example 2: Messy plot
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
# 
# # Only 1 label:
# highlight(x = .05, y = .90, lbls = "What a messy plot")
# 
# # 2 labels at once:
# highlight(x = c(.30, .60), y = c(.20, .40),
#           lbls = c("Note something here", "Some highlighting here"),
#           col_bg = c(pal_seeblau[[2]], "gold"), cex = 1.2)


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