## plot_text.R | unikn
## hn  |  uni.kn |  2019 02 23
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
#' \code{\link{mark}} (reduced version) to mark text with a colored box  
#'                 
#' @import graphics 
#'                          
#'                          

# - Definition: ---- 

box_text <- function(x, y, lbls = NA,             # coordinates and labels of text element(s) 
                     col_lbl = "black", col_bg = NA, col_bg_brd = NA,         # colors
                     adj = NULL, pos = 4, offset = 0, padding = c(.20, .80),  # positions 
                     cex = 2, font = 2                                        # text size and font
){
  
  ## Coordinates: ----
  
  if (missing(y)) {y <- x}  # use x as y if no y provided
  
  # Recycle coordinates (if necessary): 
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
                 cex = cur_cex, font = font, 
                 adj = c(.5, .5) # center text in x and y 
  )
  
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


# (2) plot_text_exp: Enhanced (expert/experimental) version of box_text (also supporting underlining): ------ 

## Note that plot_text_exp is an experimental function, intended for expert users.

# plot_text_exp: Uber function that can do many kinds of things:

# - plot boxes or frames (to a new plotting device, resetting margins)
# - plot text to (existing) plots
# - measure character strings to mark or underline them
# - position text objects according to their sizes (e.g. heights)
# - warn if formatting rules are violated 

# Note: Distinguish between functions that generate NEW plots (like plot_box, box, ...)
#       and functions that add objects (like text) to existing plots!

# - Definition: ---- 

plot_text <- function(lbls = NA,           # labels of text element(s) 
                      x = 0, y = .55,      # coordinates of text lbls 
                      
                      y_layout = "even", # "even", "flush", or 1 numeric value (y-space between subsequent labels)
                      
                      # Text parameters:
                      col = NA,                                                  # col of text lbls 
                      cex = 2, font = 2,                                         # text size and font
                      adj = NULL, pos = NULL, offset = 0,                        # text position   
                      padding = NA,  # set padding (around text, in marking) # padding = NA (default padding) OR: 2 numeric values = c(.5, .5), 
                      
                      # Text decorations:
                      mark = FALSE,                 # flag for mark / highlighting / rectangular box function 
                      col_bg = NA,                  # col of bg of text (mark and line, NOT box/frame)
                      col_bg_border = grey(.50, 1), # col of border of text bg (mark and line, NOT box/frame)
                      lty_bg = 1,                   # lty of text bg (mark and line):  0: ensure absence of border line (a) 
                      lwd_bg = 1,                   # lwd of text bg (mark and line): NA: ensure absence of border line (b)
                      
                      line = FALSE,   # flag for underlining function 
                      cex_lwd = 2,    # if line: scaling factor for line width
                      cex_ldn = .40,  # if line: scaling factor for downwards shift of line
                      
                      # Plotting parameters:
                      xbox = FALSE, frame = FALSE,  # flags for creating a new plot
                      
                      ## Other stuff: 
                      mar_all = NA,  # option to reset all mar values (in nr. of line units)
                      oma_all = NA,  # option to reset all oma values (in nr. of line units)
                      grid = FALSE,  # for debugging (to position objects)
                      ...  # etc.
){
  
  ## Interpret inputs: ----
  
  # (a) 'cex' value(s): 
  cur_cex <- (cex * graphics::par('cex'))  # character expansion factor(s) to use
  
  
  # Set sensible defaults (for robustness):
  
  # (b) col (of lbls): 
  if ( is.na(col) && xbox) {col <- "white"}
  if ( is.na(col) && any(!is.na(lbls)) ) { col <- "black"} 
  
  # (c) col_bg: 
  if (is.na(col_bg) && mark) { col_bg <- pal_seeblau[[2]]} # default mark color: pal_seeblau[[3]]
  if (is.na(col_bg) && line) { col_bg <- pal_seeblau[[4]]} # default underline color: pal_seeblau[[4]] 
  
  
  ## Plotting area: ----- 
  
  # (a) Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  # on.exit(par(opar))               # restore upon exit
  
  # (b) Re-size plotting area (if desired): 
  if (!is.na(mar_all)) {  # reset all mar values:
    par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  }
  
  if (!is.na(oma_all)) {  # reset all oma values:
    par(oma = c(0, 0, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
  }
  
  # (c) Create a new plot (if desired or needed):  
  if (xbox) { # plot xbox:
    
    # message("Plotting desired xbox...") 
    
    col_box <- unlist(seeblau)
    xbox(col = col_box)    
    
  } else if (frame) {  # plot frame:
    
    # message("Plotting desired frame...") 
    
    col_frame <- NA
    col_frame_border <- grey(.33, 1)
    lwd_frame_border <- 1.5
    
    frame(col = col_frame, border = col_frame_border, lwd = lwd_frame_border)
    
  } else if (dev.cur() == 1) {  # no graphics device open (null device)
    
    message("No existing plot: Plotting default frame...")  
    
    col_frame <- NA
    col_frame_border <- grey(.33, 1)
    lwd_frame_border <- 1.5
    
    frame(col = col_frame, border = col_frame_border, lwd = lwd_frame_border)
    
  } else {  # graphics device open:
    
    # message("A plot exists: Adding to existing plot...")
    
  }  # if (box) etc.
  
  # (d) Plot grid: 
  if (grid) {
    plot_grid()
  }
  
  
  ## Measure and scale text elements: ------ 
  
  # (A) Measure key character dimensions (for cex = 1 only, but different fonts 1-4): ----
  
  key_char <- "l"  # key character [see p. 25 of CD Manual]:
  
  key_width_f1  <-  strwidth(s = key_char, cex = 1, font = 1)  # get width  of "l" for cex = 1, font = 1 (only)
  key_width_f2  <-  strwidth(s = key_char, cex = 1, font = 2)  # get width  of "l" for cex = 1, font = 2 (only)
  key_width_f3  <-  strwidth(s = key_char, cex = 1, font = 3)  # get width  of "l" for cex = 1, font = 3 (only)
  key_width_f4  <-  strwidth(s = key_char, cex = 1, font = 4)  # get width  of "l" for cex = 1, font = 4 (only)
  # print(key_width_f2)   # 4debugging: 1 value (NOT vector)
  
  key_height_f1 <- strheight(s = key_char, cex = 1, font = 1)  # get height of "l" for cex = 1, font = 1 (only)
  key_height_f2 <- strheight(s = key_char, cex = 1, font = 2)  # get height of "l" for cex = 1, font = 2 (only)
  key_height_f3 <- strheight(s = key_char, cex = 1, font = 3)  # get height of "l" for cex = 1, font = 3 (only)
  key_height_f4 <- strheight(s = key_char, cex = 1, font = 4)  # get height of "l" for cex = 1, font = 4 (only)
  # print(key_width_f2)   # 4debugging: 1 value (NOT vector)
  
  # Get the REAL char dimensions by scaling key_width/key_height values (for each font size) 
  # by the vector of cur_cex values (at corresponding font size):
  char_width <- rep(NA, length(lbls))  # initialize
  char_width[font == 1] <- key_width_f1 * cur_cex[font == 1]
  char_width[font == 2] <- key_width_f2 * cur_cex[font == 2]
  char_width[font == 3] <- key_width_f3 * cur_cex[font == 3]
  char_width[font == 4] <- key_width_f4 * cur_cex[font == 4]
  # print(char_width)   # 4debugging
  
  char_height <- rep(NA, length(lbls))  # initialize
  char_height[font == 1] <- key_height_f1 * cur_cex[font == 1]
  char_height[font == 2] <- key_height_f2 * cur_cex[font == 2]
  char_height[font == 3] <- key_height_f3 * cur_cex[font == 3]
  char_height[font == 4] <- key_height_f4 * cur_cex[font == 4]
  # print(char_height)   # 4debugging
  
  
  # (B) Measure dimensions of text lbls: ---- 
  
  # Measure dimensions of lbls (for cex = 1 only, but different fonts 1-4): 
  lbls_width_f1  <-  graphics::strwidth(s = lbls, cex = 1, font = 1)  # width(s) of lbls for cex = 1, font = 1 (only)
  lbls_width_f2  <-  graphics::strwidth(s = lbls, cex = 1, font = 2)  # width(s) of lbls for cex = 1, font = 2 (only)
  lbls_width_f3  <-  graphics::strwidth(s = lbls, cex = 1, font = 3)  # width(s) of lbls for cex = 1, font = 3 (only)
  lbls_width_f4  <-  graphics::strwidth(s = lbls, cex = 1, font = 4)  # width(s) of lbls for cex = 1, font = 4 (only)
  # print(lbls_width_f2)  # 4debugging
  
  lbls_height_f1 <- graphics::strheight(s = lbls, cex = 1, font = 1)  # height(s) of lbls for cex = 1, font = 1 (only)
  lbls_height_f2 <- graphics::strheight(s = lbls, cex = 1, font = 2)  # height(s) of lbls for cex = 1, font = 2 (only)
  lbls_height_f3 <- graphics::strheight(s = lbls, cex = 1, font = 3)  # height(s) of lbls for cex = 1, font = 3 (only)
  lbls_height_f4 <- graphics::strheight(s = lbls, cex = 1, font = 4)  # height(s) of lbls for cex = 1, font = 4 (only)
  
  # Get the REAL text dimensions by scaling lbls_width/lbls_height values (for each font size) 
  # by the vector of cur_cex values (at corresponding font size):
  text_width <- rep(NA, length(lbls))  # initialize
  text_width[font == 1] <- lbls_width_f1[font == 1] * cur_cex[font == 1]
  text_width[font == 2] <- lbls_width_f2[font == 2] * cur_cex[font == 2]
  text_width[font == 3] <- lbls_width_f3[font == 3] * cur_cex[font == 3]
  text_width[font == 4] <- lbls_width_f4[font == 4] * cur_cex[font == 4]
  # print(text_width)   # 4debugging
  
  text_height <- rep(NA, length(lbls))  # initialize
  text_height[font == 1] <- lbls_height_f1[font == 1] * cur_cex[font == 1]
  text_height[font == 2] <- lbls_height_f2[font == 2] * cur_cex[font == 2]
  text_height[font == 3] <- lbls_height_f3[font == 3] * cur_cex[font == 3]
  text_height[font == 4] <- lbls_height_f4[font == 4] * cur_cex[font == 4]
  # print(text_height)   # 4debugging
  
  
  # (C) Measure dimension of desired padding (around text): ---- 
  
  if (mark) {
    
    # (A) Padding (for rectangles around text): ----
    
    # Distinguish between 2 types of padding: 
    if (is.na(padding[1])) {  # (1) No padding was specified:
      
      # Use default paddings (based on character sizes) [see p. 25 of CD Manual]: 
      pad_l_r <-  char_width  # padding on left and right: width of letter "l" 
      pad_t_b <- (char_height * 1.5)/2  # padding on top and bottom: 1.5 x height of letter "l" (1/2 on either side).
      # print(pad_l_r)  # 4debugging
      
      # Dimensions of corresponding rectangle(s):  
      
      # (a) by the book (definition): 
      rect_width  <- (text_width  + (2 * pad_l_r))  # x-dim of padded rectangle  
      rect_height <- (text_height + (2 * pad_t_b))  # y-dim of padded rectangle
      padl_width  <- (2 * pad_l_r)/2  # save left padded width (to shift mid-points below)
      
      # (b) by visual inspection: 
      rect_width  <- (text_width  + (1.2 * pad_l_r))  # x-dim of padded rectangle
      rect_height <- (text_height + (1.4 * pad_t_b))  # y-dim of padded rectangle
      padl_width  <- (1.2 * pad_l_r)/2  # save left padded width (to shift mid-points below)
      
      # print(rect_width)  # 4debugging
      
    } else {  # (2) At least 1 padding parameter was specified:
      
      # Use the padding parameter provided: 
      if (length(padding) == 1){  # only 1 value provided: 
        
        padding <- c(padding[1], padding[1])
        # print(padding)  # 4debugging
        
      }
      
      # Dimensions of corresponding rectangle(s):
      rect_width  <- (text_width  + (2 * padding[1] * char_width))   # x-dim of padded rectangle 
      rect_height <- (text_height + (2 * padding[2] * char_height))  # y-dim of padded rectangle
      
      ## OR: NOT char_height, to use same scaling factor in both dimensions:
      # rect_height <- (text_height + (2 * padding[2] * char_width)) # y-dim of padded rectangle  
      
      padl_width  <- (2 * padding[1] * char_width)/2  # save left padded width (to shift mid-points below)
      
    }  # padding etc.
    
  } # if (mark) etc. 
  
  
  ## Compute text positions (AFTER all measurements are known): ------
  
  # (a) x and y coordinates: 
  # if (missing(y)) {y <- x}   # use x as y if no y provided
  y_def <- .55  # default y
  if (missing(y)) {y <- y_def}  # use default
  if (is.null(y)) {y <- y_def}  # use default
  if (is.na(y))   {y <- y_def}  # use default
  
  # Parameter shortcuts:
  N_lbls <- length(lbls)
  y_top <- y[1]       # highest y coordinate
  y_bot_free <- .15   # amount of space free of text at bottom (in % of available y_range/y_top)
  y_bot <- (y_bot_free * abs(y_top - 0))  # lowest y coordinate (border width = 10% of y_range/y_top)
  
  # If more lbls than y coordinates: 
  if (N_lbls > length(y)) {  
    
    # message("More lbls than y-values: Automatic label layout...")
    message(paste0("N_lbls > N(y): Automatic ", as.character(y_layout), " label layout..."))
    
    if (mark) { 
      
      # (a) Adjust y by rect_height (NOT text_height) sequence: 
      # print(paste0("rect_height", 1:N_lbls, " = ", rect_height))  # 4debugging
      
      y <- layout_y(y_top = y_top, y_bot = y_bot, height_seq = rect_height, # !
                    layout_type = y_layout)
      
    } else {  # NOT mark: line or only txt 
      
      # (b) Adjust y by text_height (NOT rect_height) sequence: 
      # print(paste0("text_height", 1:N_lbls, " = ", text_height))  # 4debugging
      
      y <- layout_y(y_top = y_top, y_bot = y_bot, height_seq = text_height, # !
                    layout_type = y_layout)
      
    }
    
    # print(paste0("y", 1:N_lbls, " = ", y))  # 4debugging
    
  } else {
    
    message("N(y) >= N_lbls: Using given y for label layout...")
    
  }
  
  # Recycle coordinates (if necessary): 
  if (length(x) != length(y)){   
    
    lx <- length(x)
    ly <- length(y)
    
    if (lx > ly){
      
      y <- rep(y, ceiling(lx/ly))[1:lx]
      
    } else {
      
      x <- rep(x, ceiling(ly/lx))[1:ly]
      
    }
  }
  
  
  # (b) Is 'pos' specified?
  
  if (!is.null(pos)){
    
    if (pos == 1){  # below: 
      
      adj <- c(.5, 1)
      offset_vec <- c(0, (-offset * char_width))
      
    } else if (pos == 2){  # left: 
      
      adj <- c(1, .5)
      offset_vec <- c((-offset * char_width), 0)
      
    } else if (pos == 3){  # above:
      
      adj <- c(.5, 0)
      offset_vec <- c(0, (+offset * char_width))
      
    } else if (pos == 4){ # right:
      
      adj <- c(0, .5)
      offset_vec <- c((+offset * char_width), 0)
      
    } else {
      
      message("Invalid pos argument. Using pos = NULL...")
      
      pos <- NULL
      offset_vec <- c(0, 0)      
      
    }
    
  } else { # pos is NULL: 
    
    offset_vec <- c(0, 0)
    
  }
  
  
  # (c) Is 'adj' of length 1 or 2?
  
  if (!is.null(adj)){
    
    if (length(adj == 1)){
      
      adj <- c(adj[1], .5)  # use as 1st, 2nd: center
      
    }
    
  } else { # `adj` is NULL: 
    
    adj <- c(.5, .5)  # default: 1st: center, 2nd: center 
    
  }
  
  
  # (d) Compute the midpoints of text(s): 
  
  x_mid <- x + (.5 - adj[1]) * text_width  + offset_vec[1]
  y_mid <- y + (.5 - adj[2]) * text_height + offset_vec[2]
  
  
  ## Plot stuff: ------ 
  
  
  #  A. mark: Highlight background of text (using colored rectangles): ---- 
  
  # mark <- FALSE  # 4debugging
  
  if (mark) {
    
    
    # (A) Correct mid-points of text by padding (to align rectangles, rather than text): ---- 
    # print(padl_width)  # 4debugging
    
    x_mid <- (x_mid + padl_width) 
    
    
    # (B) Plot rectangle(s): ---- 
    graphics::rect(xleft   = (x_mid - rect_width/2),
                   ybottom = (y_mid - rect_height/2),
                   xright  = (x_mid + rect_width/2),
                   ytop    = (y_mid + rect_height/2),
                   col     = col_bg, 
                   border  = col_bg_border,
                   lty     = lty_bg,
                   lwd     = lwd_bg#,
                   # xpd = TRUE  # draw beyond border
    )
    
  } # if (mark) etc.
  
  
  #  B. line: Underline text: ---- 
  
  # line <- FALSE  # 4debugging
  
  if (line) {  
    
    # Line parameters (2): 
    # cex_lwd <- 2    # scaling factor for line width
    # cex_ldn <- .40  # scaling factor for downwards shift of line
    
    # Compute line distance (shifted down from text): 
    # y_dn  <- (.5 * padding[2] * char_width)  # (.5 of rectangle border on bottom)
    # y_dn  <- .015 # fixed distance from text
    
    # Note: Due to using "l" as key_char (above), ... 
    y_dn   <- (cex_ldn * char_height)  # using char_width here would vary less than using char_height. 
    
    # Plot line(s): 
    graphics::segments(x0  = (x_mid  - text_width/2),
                       y0  = ((y_mid - text_height/2) - y_dn),
                       x1  = (x_mid  + text_width/2),
                       y1  = ((y_mid - text_height/2) - y_dn),
                       col = col_bg,
                       lty = 1,
                       lwd = (cex_lwd * par("lwd")),
                       lend = 1  # line end style: 0: round (default), 1: butt, 2: square. 
    )
    
  } # if (line) etc.
  
  
  #  C. txt: Plot text lbls: ---- 
  
  txt <- TRUE  # 4debugging
  
  if (txt) { 
    
    # Plot text lbl(s):
    graphics::text(x = x_mid, y = y_mid, labels = lbls, col = col, 
                   cex = cur_cex, font = font, 
                   # pos = pos, # use pos
                   adj = c(.5, .5)  # always center text in rectangle (x and y) 
    )
    
  } # if (txt) etc.
  
  
  ## Return value(s): ------ 
  
  if (mark) {
    
    # Return the coordinates of rectangles:
    
    if (length(x_mid) == 1){  # Coordinates of 1 rectangle:
      
      invisible(c(x_mid - rect_width/2,  x_mid + rect_width/2, 
                  y_mid - rect_height/2, y_mid + rect_height/2))
      
    } else {  # Coordinates of rectangles:
      
      invisible(cbind(x_mid - rect_width/2,  x_mid + rect_width/2, 
                      y_mid - rect_height/2, y_mid + rect_height/2))
      
    }
    
  } else {
    
    # Return text coordinates:
    
    if (length(x_mid) == 1){  # Coordinates of 1 character string:
      
      invisible(c(x_mid - text_width/2,  x_mid + text_width/2, 
                  y_mid - text_height/2, y_mid + text_height/2))
      
    } else {  # Coordinates of rectangles:
      
      invisible(cbind(x_mid - text_width/2,  x_mid + text_width/2, 
                      y_mid - text_height/2, y_mid + text_height/2))
      
    }
    
    
  } # if (mark) etc.
  
} # plot_text end.


# ## Check: 

# lbl_1 <- c("Titelzeile", "Alle meine steilen Zeilen", "Ausgefeilte Zeilen", "Wichtig mitzuteilen!", "LOL", "etc.")
# lbl_1 <- c("Erste Zeile", "Zweite Zeile", "Dritte Zeile", "Vierte Zeile", "Ziemlich ausgefeilte Zeilen", "Wichtig mitzuteilen!")
# plot_text(x = .05, 
#           y = NA, # y = c(.65, .50, .4, .3, .2, .1),
#           lbls = lbl_1, 
#           y_layout = .08, # "even",  # "even", "flush", OR fixed value (e.g., .08) 
#           cex = c(1, 1, 2, 2, 3, 3), 
#           font = c(2, 1, 2, 1, 2, 1),
#           col_bg = c(unlist(seeblau), "gold"), lwd_bg = NA,
#           pos = NULL, adj = c(0, .5),  offset = 999,
#           # pos = 4, adj = c(1, 1), offset = 0,
#           xbox = TRUE, mark = FALSE, grid = TRUE,
#           mar_all = NA, oma_all = NA
# )

# lbl_2 <- rep("l Hier noch eine durch zwei Mal `l` begrenzte Zeile l", 6)
# plot_text(x = 0, 
#           y = .90, # y = c(.77, .7, .55, .45, .25, .1),
#           lbls = lbl_2, cex = c(1, 1, 2, 2, 3, 3), font = c(2, 1, 2, 1, 2, 1),
#           col_bg = c(unlist(seeblau), "gold"), lwd_bg = 0,
#           pos = NULL, adj = c(0, .5), offset = 999, 
#           # pos = 4, adj = c(1, 1), offset = 0, 
#           padding = 1, # OR: c(.5, .5), 
#           frame = TRUE, mark = TRUE, grid = TRUE, 
#           mar_all = NA, oma_all = NA
# )

# lbl_3 <- rep("l Eine durch 2 `l` begrenzte Zeile l", 5)
# plot_text(x = 0,
#           y = .80, #
#           # y = c(.80, .70, .55, .35, .15),
#           lbls = lbl_3,
#           y_layout = "flush", # .05,
#           cex = c(1, 1.5, 2, 2.3, 2.6), font = c(2, 1),
#           col_bg = c(grey(.1, .1), grey(.1, .2)), lwd_bg = 1/3, col_bg_border = "red",
#           # pos = NULL, adj = c(0, .5), offset = 999,
#           pos = 4, adj = c(1, 1), offset = 0,
#           padding = 1, # OR: c(.5, .5),
#           frame = TRUE, mark = TRUE, grid = F,
#           mar_all = NA, oma_all = NA
# )

## ToDo: ##  
# - Allow setting consistent mar and oma values for key plotting inputs
# - Distinguish between 2 padding versions: default (by "l", as per CD Manual) vs. numeric user-input-based
# - mark: Shift x values (of each individual label) by size of its left padding (so that boxes align on left).

#   +++ here now +++
# - all: Allow automatic spacing: Use only y[1] and then space y-values by text or rect heights (to align boxes).
# - mark: Warn in case of monotonic step functions. 


# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# ## Multiple font values:
# plot_text(x = 0, y = c(.4, .2), lbls = c("m", "m"), font = c(1, 2), col_bg = "green2")  
# # => seems to work (but fonts do not seem to suffer in size?)
#
# ## Multiple cex values:
# plot_text(x = 0, y = c(.8, .6), lbls = c("m", "m"), cex = c(1, 5), col_bg = "red1")     
# # => FAILS to work: ERROR: changing font size with cex is not supported!!!


## Example 0: Plot box

# plot_text(x = 0.02, y = c(.5, .4), lbls = c("ToDo", "Something else here"), xbox = TRUE)

# ## Example 1: Underlining text 
# 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# plot_text(x = 0, y = .9, lbls = "Related matters", adj = 0, line = TRUE, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .6, lbls = "Underlining text can be straightforward", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .5, lbls = "and strikingly effective", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = .55, y = .1, lbls = "Please handle with care", adj = 0, line = TRUE, cex = 1.0, col_lbl = "black", col_bg = pal_signal[[1]])

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

# (4) head: Arrange headings (according to title specifications): ------ 


## Test: Testbed for code snippets (used above) ------

## 1. Is there an open plot? Does already some plot exist? ----- 

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


## 2. Are cex and strwidth functions vectorized? -----  
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