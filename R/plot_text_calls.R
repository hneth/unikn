## plot_text_calls.R | unikn
## hn  |  uni.kn |  2019 02 25
## ---------------------------

# Specialized functions for plotting formatted text (with decorations):
#
# - mark: highlighting text 
# - line: underlining text 
# - post: postit type xboxes
# - head: title sequences

# Allow an option for creating a new plot vs. adding to an existing plot.

# [B]: Simpler functions that call plot_text() (with fewer options and sensible defaults): -------- 


# (1) mark: Highlight text on a plot: ------ 

# - Documentation: ---- 

#' \code{mark} plots 1 or more text strings (provided as a character vector \code{lbls}) 
#' to an (existing or new) plot and places a colored box behind
#' each label to mark or highlight it (i.e., make it stand out from the background).
#' 
#' \code{mark} uses the base graphics system \code{graphics::}.  
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{lbls} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled.
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{lbls} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled.
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
#' @examples
#' ## Example 1: Simple highlights
#' plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
#' 
#' mark(x = 0, y = .9, lbls = "Please note")
#' mark(x = 0, y = c(.6, .5),
#'      lbls = c("Highlighting text is simple", "but strikingly effective"),
#'      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
#' mark(x = .4, y = c(.3, .2), lbls = c("It is also flexible", "but to be handled with care"), 
#'      cex = 1.2, col_lbl = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
#' 
#' ## Example 2: Messy plot
#' n <- 20
#' set.seed(1)
#' plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), 
#'      axes = FALSE, xlab = "", ylab = "")
#' 
#' # Only 1 label:
#' mark(x = .05, y = .85, lbls = "What a messy plot")
#' 
#' # 2 labels at once:
#' mark(x = c(.35, .55), y = c(.15, .40),
#'      lbls = c("Note something here", "More highlighting here"),
#'      col_bg = c(pal_seeblau[[2]], pal_peach[[3]]), cex = 1.2)
#'            
#' @family text functions
#' 
#' @seealso
#' \code{\link{slide}} and \code{\link{xbox}} to create simple plots (without text).  
#'      
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

mark <- function(x, y, lbls = NA,                             # coordinates and labels of text element(s) 
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
# mark(x = 0, y = .9, lbls = "Please note")
# mark(x = 0, y = c(.6, .5),
#      lbls = c("Highlighting text is simple", "but strikingly effective"),
#      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
# mark(x = .4, y = c(.3, .2), lbls = c("It is also flexible", "but to be handled with care"), cex = 1.2,
#      col_lbl = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
# 
# ## Example 2: Messy plot
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
# 
# # Only 1 label:
# mark(x = .05, y = .85, lbls = "What a messy plot")
# 
# # 2 labels at once:
# mark(x = c(.35, .55), y = c(.15, .40),
#      lbls = c("Note something here", "More highlighting here"),
#      col_bg = c(pal_seeblau[[2]], pal_peach[[3]]), cex = 1.2)



# (2) line: Underline text on a plot: ------ 

# (3) post: Plot a post-it note with text: ------ 

## Use the plot_box function.

# (4) head: Arrange headings (according to title specifications): ------ 




## Test: Testbed for code snippets (used above) ------

# 1. Is there an open plot? Does already some plot exist? ----- 

# # See 
# dev.list() # for a list of current devices
# dev.cur() # evaluates to 1 if null device (no plot).
# 
# # A solution: 
# if (dev.cur() == 1) {
#   "NO plot exists"  # no graphics device open (null device)
# } else {
#   "A plot exists"
# }  


# 2. Are cex and strwidth functions vectorized? -----  
# plot.new()
# # cex vectors:
# text(x = 0, y = c(.8, .5, .2), labels = c("A", "B", "C"), cex = c(1, 2, 3))
# text(x = 0, y = c(.2, .5, .8), labels = c("A", "B", "C"), cex = c(1, 2, 3))
# 
# # font vectors:
# text(x = .2, y = c(.8, .5, .2), labels = c("A", "B", "C"), font = c(1, 2, 4))
# 
# # cex & font vectors:
# text(x = .4, y = c(.8, .5, .2), labels = c("A", "B", "C"), cex = c(1, 2, 3), font = c(1, 2, 4))
# 
# # strwidth:
# strwidth(s = "x", cex = c(1, 2, 3))  # only returns 1st value
# strwidth(s = "x", cex = c(1))
# strwidth(s = "x", cex = c(2))
# strwidth(s = "x", cex = c(3))
# 
# # To get char width values for multiple cex :
# cex_vals <- c(1, 2, 4)
# key_char <- "l"
# char_width <- strwidth(s = key_char, cex = 1) # get width of "l" for cex = 1 (only)
# char_height <- strheight(s = key_char, cex = 1) # get height of "l" for cex = 1 (only)
# 
# char_widths <- char_width * cex_vals  # multiply (single) width of key_char with (vec of) cex_vals
# char_widths
# 
# char_heights <- char_height * cex_vals  # multiply (single) height of key_char with (vec of) cex_vals
# char_widths





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