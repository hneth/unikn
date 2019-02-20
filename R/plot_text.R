## plot_text.R | unikn
## hn  |  uni.kn |  2019 02 20
## ---------------------------

## Plot text with formatting elements (marking/highlighting or underlining).

## [A]: Full versions (with abundant options): -------- 

# (1) box_text: Add text with a colored background box to a plot: ------

## Adapted from Ian Kopacka's solution to a question at: 
## https://stackoverflow.com/questions/45366243/text-labels-with-background-colour-in-r

# - Documentation: ---- 

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

# - Definition: ---- 

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
  char_width  <- graphics::strwidth(s = "n", cex = cur_cex, font = font)    # width of letter "n" 
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
  
  # Compute dimensions of rectangle(s):  
  rect_width  <- (text_width  + (2 * padding[1] * char_width))
  rect_height <- (text_height + (2 * padding[2] * char_width))
  
  # Draw rectangle(s):
  graphics::rect(xleft   = (x_mid - rect_width/2),
                 ybottom = (y_mid - rect_height/2),
                 xright  = (x_mid + rect_width/2),
                 ytop    = (y_mid + rect_height/2),
                 col     = col_bg, 
                 border  = col_bg_brd)
  
  # Draw text lbl(s):
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

# ## Check: 
#
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


# (2) plot_text: Enhanced version of box_text (also supporting underlining): ------ 

# - Definition: ---- 

plot_text <- function(x, y, lbls = NA,               # coordinates and labels of text element(s) 
                      col_lbl = NA, col_bg = NA, col_bg_brd = NA,         # colors
                      adj = NULL, pos = 4, offset = 0, padding = c(.20, .80),  # positions 
                      cex = 2, font = 2,                                       # text size and font
                      box = FALSE, mark = FALSE, line = FALSE, txt = TRUE      # Boolean flags
){
  
  ## Sensible defaults (for robustness): ----
  
  # col_lbl: 
  if (is.na(col_lbl) && box) { col_lbl <- "white"}
  if (is.na(col_lbl) && txt) { col_lbl <- "black"} 
  
  # col_bg: 
  if (is.na(col_bg) && box)  { col_bg <- pal_seeblau[[3]]}
  if (is.na(col_bg) && mark) { col_bg <- pal_seeblau[[3]]}
  if (is.na(col_bg) && line) { col_bg <- pal_seeblau[[4]]}  

  
  ## Plot box (if desired): ----
  
  # 1. box: plot blue box (with "x"): ---- 
  
  # box <- FALSE  # 4debugging
  
  # +++ here now +++ 
  
  if (box) {
    
    ## Preamble: ----- 
    
    ## Record graphical parameters (par):
    opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
    on.exit(par(opar)) # restore original settings
    
    
    ## Plotting area: ----- 
    
    ## Margins (in lines): 
    mar_all <- 0  # all inner
    oma_all <- 0  # all outer
    oma_l   <- 0  # left
    
    par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
    par(oma = c(0, oma_l, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
    # par(omd = c(0, 0, 1, 1))
    
    ## Plot empty canvas:
    ## Plot empty canvas:
    # plot(0, 0, type = "n", xlim = c(0,1), ylim = c(0,1), 
    #      bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
    plot.new()
    
    # Box parameters:
    x_left <- 0
    y_bot  <- 0
    x_right <- 1
    y_top   <- 1
    
    # Draw rectangle:
    rect(xleft = x_left, ybottom = y_bot, xright = x_right, ytop = y_top,
         col = col_bg, 
         lty = 0,  # ensure absence of border line (a)
         lwd = NA  # ensure absence of border line (b)
         # border = col_brd,
         # density = density,
         # angle = angle,
         # lwd = lwd
         # ...  # etc. 
    )
    
    ## Mark X (in top right corner): ----- 
    
    # X parameters: 
    p1 <- .85
    p2 <- .95
    
    # Draw segments:
    segments(x0 = c(p1, p1), y0 = c(p1, p2), 
             x1 = c(p2, p2), y1 = c(p2, p1),
             col = "white", lty = 1, lwd = 1.41)
    
  } # if (box) etc.
  
  
  ## Compute x and y coordinates: ----
  
  if (missing(y)) {y <- x}  # use x as y if no y provided
  
  # Recycle coords (if necessary):
  if (length(x) != length(y)){
    lx <- length(x)
    ly <- length(y)
    if (lx > ly){
      y <- rep(y, ceiling(lx/ly))[1:lx]
    } else {
      x <- rep(x, ceiling(ly/lx))[1:ly]
    }
  }
  
  ## Compute parameters of text labels: ----
  
  ## Interpret inputs:
  # cur_font <- graphics::par('font')
  cur_cex <-  (cex * graphics::par('cex'))  # character expansion factor to use
  # print(cur_cex)  # 4debugging
  
  # Measure dimensions of text elements:
  char_width  <- graphics::strwidth(s = "n", cex = cur_cex, font = font)    # width of lowercase "n" 
  text_height <- graphics::strheight(s = lbls, cex = cur_cex, font = font)  # text height(s)
  text_width  <- graphics::strwidth(s = lbls, cex = cur_cex, font = font)   # text width(s)
  # print(text_width)  # 4debugging
  
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
  
  # Compute dimensions of rectangle(s):  
  rect_width  <- (text_width  + (2 * padding[1] * char_width))
  rect_height <- (text_height + (2 * padding[2] * char_width))
  
  
  ## Plot text (optionally with mark or line): ------ 
  
  
  
  # 2. mark: highlight background: ---- 
  
  # mark <- FALSE  # 4debugging
  
  if (mark) {
    
    # Draw rectangle(s):
    graphics::rect(xleft   = (x_mid - rect_width/2),
                   ybottom = (y_mid - rect_height/2),
                   xright  = (x_mid + rect_width/2),
                   ytop    = (y_mid + rect_height/2),
                   col     = col_bg, 
                   border  = col_bg_brd)
    
  } # if (mark) etc.
  
  # 3. line: underline text: ---- 
  
  # line <- FALSE  # 4debugging
  
  if (line) {  
    
    # Line parameters:
    cex_l <- 2    # constant scaling factor for line width
    y_dn  <- (.5 * padding[2] * char_width)  # (.5 of rectangle border on bottom)
    y_dn  <- .015 # fixed distance from text
    
    # Draw line(s):
    graphics::segments(x0  = (x_mid - text_width/2),
                       y0  = ((y_mid - text_height/2) - y_dn),
                       x1  = (x_mid + text_width/2),
                       y1  = ((y_mid - text_height/2) - y_dn),
                       col = col_bg,
                       lty = 1,
                       lwd = (cex_l * par("lwd")),
                       lend = 1  # line end style: 0: round (default), 1: butt, 2: square. 
    )
    
  } # if (line) etc.
  
  
  # 4. txt: Plot text lbls: ---- 
  
  # txt <- TRUE  # 4debugging
  
  if (txt) { 
    
    # Draw text lbl(s):
    graphics::text(x = x_mid, y = y_mid, labels = lbls, col = col_lbl, 
                   cex = cur_cex, font = font, adj = c(.5, .5))
    
  } # if (txt) etc.
  
  
  # Return value(s): ----
  
  if (length(x_mid) == 1){  # Coordinates of 1 rectangle: 
    invisible(c(x_mid - rect_width/2, x_mid + rect_width/2, y_mid - rect_height/2,
                y_mid + rect_height/2))
  } else {  # Coordinates of rectangles:
    invisible(cbind(x_mid - rect_width/2, x_mid + rect_width/2, y_mid - rect_height/2,
                    y_mid + rect_height/2))
  }
  
} # plot_text end.


# ## Check: 
# 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# ## Multiple font values:
# plot_text(x = 0, y = c(.4, .2), lbls = c("m", "m"), font = c(1, 2), col_bg = "green2")  
# # => seems to work (but fonts do not seem to suffer in size?)
#
# ## Multiple cex values:
# plot_text(x = 0, y = c(.8, .6), lbls = c("m", "m"), cex = c(1, 5), col_bg = "red1")     
# # => FAILS to work: ERROR: changing font size with cex is not supported!!!

## Example: Plot box

# plot_text(x = 0.02, y = c(.5, .4), lbls = c("ToDo", "Something else here"), box = TRUE)


# ## Example 1: Underlining text 
# 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# plot_text(x = 0, y = .9, lbls = "Related matters", line = TRUE, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .6, lbls = "Underlining text can be straightforward", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .5, lbls = "and strikingly effective", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = .55, y = .1, lbls = "Please handle with care", line = TRUE, cex = 1.0, col_lbl = "black", col_bg = pal_signal[[1]])

# ## Example 2: Marking text in messy plot
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
# 
# # Adjust cex, font and adj:
# plot_text(x = .05, y = .90, lbls = "What a messy plot", mark = TRUE,
#          col_bg = seeblau[[1]], adj = c(0, 0), padding = c(.25, .85), cex = 2)
# 
# # Vector of 2 lbls, using argument 'pos' to position right of coordinates:
# plot_text(x = c(.30, .62), y = c(.20, .42), mark = TRUE,
#          lbls = c("Note something here", "More highlighting here"),
#          col_bg = c(pal_seeblau[[2]], "gold"), pos = 4, padding = c(.25, .85), cex = 1.2)


## [B]: Reduced versions (with fewer options and sensible defaults): -------- 


# (1) mark: Highlight text on a plot: ------ 

# - Documentation: ---- 

#' \code{mark} places 1 or more text strings (of a character vector \code{lbls}) 
#' onto a plot and places a colored box behind
#' each label to mark or highlight it (i.e., make it stand out from the background).
#' 
#' \code{mark} uses the base graphics system \code{graphics::}. 
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
#' mark(x = 0, y = .9, lbls = "Please note")
#' mark(x = 0, y = c(.6, .5),
#'      lbls = c("Highlighting text is simple", "but strikingly effective"),
#'      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
#' mark(x = .4, y = c(.3, .2), lbls = c("It is also flexible", "but to be handled with care"), cex = 1.2,
#'      col_lbl = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
#' 
#' ## Example 2: Messy plot
#' n <- 20
#' set.seed(1)
#' plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), axes = F, xlab = "", ylab = "")
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
#' \code{\link{plot_box}} to plot text in a colored box 
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

# (4) head: Arrange headings (according to specifications): ------ 


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