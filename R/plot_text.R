## plot_text.R | unikn
## spds | uni.kn | 2021 04 24
## ---------------------------

## General functions to plot text with formatting elements (marking/highlighting or underlining).

## (A): General function to plot formatted text with options (e.g., size, font, mark/line decorations): -------- 

## (1) plot_text: Add formatted text labels (with decorations like highlighting or underlining) to a plot: -------- 

# Note that plot_text is an experimental function, intended for expert users.
# plot_text is an enhanced (expert/experimental) version of box_text 
# (also supporting underlining, and arranging text labels). 

# plot_text(): 
# An uber function that can do many kinds of things:
#  - plot boxes or slides (to a new plotting device, resetting margins)
#  - plot text to (existing) plots
#  - measure character strings to mark or underline them
#  - position text objects according to their sizes (e.g. heights)
#  - warn if formatting rules are violated 

# Note: Distinguish between functions that generate NEW plots (like plot_box, box, ...)
#       and functions that add objects (like text) to existing plots!

# - Definition: ---- 

plot_text <- function(labels = NA,        # labels of text element(s) 
                      x = 0, y = .55,     # coordinates of text labels
                      x_layout = NA,      # 3 options: "left", "center", "right"
                      y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w labels (y-space between subsequent labels)
                      
                      # Text parameters:
                      col = NA,      # col of text labels 
                      cex = 1.5,     # text size(s), recycled or truncated to length of labels
                      font = 2,      # font type(s), recycled or truncated to length of labels
                      adj = NULL, pos = NULL, offset = 0,  # text position   
                      padding = NA,  # set padding (around text, in marking) # padding = NA (default padding) OR: 2 numeric values = c(.5, .5), 
                      
                      # Text decorations: 
                      mark = FALSE,         # flag for mark / highlighting / rectangular box function 
                      col_bg = NA,          # col of bg of text (mark and line, NOT box/slide)
                      col_bg_border = NA,   # col of border of text bg (mark and line, NOT box/slide)
                      lty_bg = 1,           # lty of text bg (mark and line):  0: ensure absence of border line (a) 
                      lwd_bg = 1,           # lwd of text bg (mark and line): NA: ensure absence of border line (b)
                      
                      line = FALSE,   # flag for underlining function 
                      cex_lwd = 2.1,  # if line: scaling factor for line width
                      cex_ldn = .42,  # if line: scaling factor for downwards shift of line
                      
                      ## Plotting parameters:
                      # WAS: xbox = FALSE, slide = FALSE,  # flags for creating a new plot
                      new_plot = "none",  # Default: "none" (add to currently existing plot). Options: "blank" (borderless slide), "slide", "xbox"
                      col_bg_plot = NA,   # Color of background of new plot: Defaults: "white" for blank/slide, Seeblau for xbox.
                      mar_all = NA,  # option to reset all mar values (in nr. of line units)
                      oma_all = NA,  # option to reset all oma values (in nr. of line units)
                      grid = FALSE,  # for debugging (to position objects)
                      
                      ## Other stuff:                       
                      ...  # etc. arguments, passed to text()
){
  
  ## Interpret inputs (for robustness): ----
  
  N_labels <- length(labels)
  
  # y coordinates: 
  # if (missing(y)) {y <- x}    # use x as y if no y provided
  y_def <- .55                  # default y
  if (missing(y)) {y <- y_def}  # default y
  if (is.null(y)) {y <- y_def}
  if (any(is.na(y))) {y <- y_def}
  
  # cex value(s): 
  cur_cex <- (cex * graphics::par('cex'))  # character expansion factor(s) to use
  
  # cex: Truncate or recycle cur_cex: ----  
  
  if (N_labels != length(cur_cex)){   
    
    l_cex <- length(cur_cex)
    
    if (l_cex > N_labels){ # truncate cur_cex to a length of N_labels: 
      
      cur_cex <- cur_cex[1:N_labels]
      
    } else { # recycle cur_cex to a length of N_labels: 
      
      cur_cex <- rep(cur_cex, ceiling(N_labels/l_cex))[1:N_labels]
      
    }
    
    # print(paste0("cur_cex = ", cur_cex))  # 4debugging
    
  }
  
  # font: Truncate or recycle font: ----  
  
  if (N_labels != length(font)){   
    
    l_font <- length(font)
    
    if (l_font > N_labels){ # truncate font to a length of N_labels: 
      
      font <- font[1:N_labels]
      
    } else { # recycle font to a length of N_labels: 
      
      font <- rep(font, ceiling(N_labels/l_font))[1:N_labels]
      
    }
    
    # print(paste0("font = ", font))  # 4debugging
    
  }
  
  # Set sensible defaults:
  
  # (a) new_plot:
  if (is.na(new_plot)) {new_plot <- "none"}  # adding to an existing plot
  
  # map different inputs to 4 main cases: 
  if (new_plot == FALSE || tolower(new_plot) == "false" || substr(tolower(new_plot), 1, 2) == "no") {
    new_plot <- "none"
  } 
  
  if ((substr(tolower(new_plot), 1, 5) == "blank") || (substr(tolower(new_plot), 1, 5)  == "empty")) {
    new_plot <- "blank"
  } 
  
  if ((substr(tolower(new_plot), 1, 5) == "slide") || (substr(tolower(new_plot), 1, 5)  == "frame")) {
    new_plot <- "slide"
  } 
  
  if ((substr(tolower(new_plot), 1, 4) == "xbox") || (substr(tolower(new_plot), 1, 3)  == "box")) {
    new_plot <- "xbox"
  } 
  
  # handle other/non-recognized cases: 
  if (!new_plot %in% c("none", "blank", "slide", "xbox")){
    
    message(paste0("Unknown new_plot = ", new_plot, ": Using 'blank' instead..."))
    
    new_plot <- "blank"
    
  }
  
  # (b) col (of labels): 
  if (any(is.na(col)) && (new_plot == "xbox")) {col <- "white"}
  if (any(is.na(col)) && any(!is.na(labels)) ) {col <- "black"} 
  
  # (c) col_bg: 
  if (any(is.na(col_bg)) && mark) {col_bg <- pal_seeblau[[2]]} # default mark color: pal_seeblau[[3]]
  if (any(is.na(col_bg)) && line) {col_bg <- pal_seeblau[[4]]} # default underline color: pal_seeblau[[4]] 
  
  # (d) y_layout:
  # Treat "flush" as special case of numeric layout (fixed distance of 0): 
  if (!is.numeric(y_layout) && (y_layout == "flush")) {y_layout <- 0}  
  
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
  
  if (new_plot == "xbox") { # plot xbox:
    
    # message("Plotting desired xbox...") 
    
    if (is.na(col_bg_plot) || col_bg_plot == "default") {col_box <- col_bg} else {col_box <- col_bg_plot} 
    xbox(col = col_box)
    
  } else if (new_plot == "slide") {  # plot slide (or frame):
    
    # message("Plotting desired slide...") 
    
    if (is.na(col_bg_plot) || col_bg_plot == "default") {col_slide <- NA} else {col_slide <- col_bg_plot} 
    col_slide_border <- grey(.33, 1)
    lwd_slide_border <- 1.0
    
    slide(col = col_slide, border = col_slide_border, lwd = lwd_slide_border)
    
  } else if (new_plot == "blank") {  # plot borderless slide (or frame):
    
    # message("Plotting desired slide...") 
    
    if (is.na(col_bg_plot) || col_bg_plot == "default") {col_slide <- NA} else {col_slide <- col_bg_plot} 
    col_slide_border <- NA
    lwd_slide_border <- 0
    
    slide(col = col_slide, border = col_slide_border, lwd = lwd_slide_border)
    
  } else if (dev.cur() == 1) {  # no graphics device open (null device)
    
    message("No existing plot: Plotting default slide...")  
    
    if (is.na(col_bg_plot) || col_bg_plot == "default") {col_slide <- NA} else {col_slide <- col_bg_plot} 
    col_slide_border <- grey(.33, 1)
    lwd_slide_border <- 1.0
    
    slide(col = col_slide, border = col_slide_border, lwd = lwd_slide_border)
    
  } else {  # graphics device open:
    
    # message("A plot exists: Adding to existing plot...")
    
  }  # if (box) etc.
  
  # (d) Plot grid: 
  if (grid) {plot_grid()}
  
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
  
  # Get the REAL char dimensions by scaling key_width/key_height values (for each font size) 
  # by the vector of cur_cex values (at corresponding font size):
  char_width <- rep(NA, length(labels))  # initialize
  char_width[font == 1] <- key_width_f1 * cur_cex[font == 1]
  char_width[font == 2] <- key_width_f2 * cur_cex[font == 2]
  char_width[font == 3] <- key_width_f3 * cur_cex[font == 3]
  char_width[font == 4] <- key_width_f4 * cur_cex[font == 4]
  # print(char_width)   # 4debugging
  
  char_height <- rep(NA, length(labels))  # initialize
  char_height[font == 1] <- key_height_f1 * cur_cex[font == 1]
  char_height[font == 2] <- key_height_f2 * cur_cex[font == 2]
  char_height[font == 3] <- key_height_f3 * cur_cex[font == 3]
  char_height[font == 4] <- key_height_f4 * cur_cex[font == 4]
  
  # (B) Measure dimensions of text labels: ---- 
  
  # Measure dimensions of labels (for cex = 1 only, but different fonts 1-4): 
  labels_width_f1  <-  graphics::strwidth(s = labels, cex = 1, font = 1)  # width(s) of labels for cex = 1, font = 1 (only)
  labels_width_f2  <-  graphics::strwidth(s = labels, cex = 1, font = 2)  # width(s) of labels for cex = 1, font = 2 (only)
  labels_width_f3  <-  graphics::strwidth(s = labels, cex = 1, font = 3)  # width(s) of labels for cex = 1, font = 3 (only)
  labels_width_f4  <-  graphics::strwidth(s = labels, cex = 1, font = 4)  # width(s) of labels for cex = 1, font = 4 (only)
  # print(labels_width_f2)  # 4debugging
  
  labels_height_f1 <- graphics::strheight(s = labels, cex = 1, font = 1)  # height(s) of labels for cex = 1, font = 1 (only)
  labels_height_f2 <- graphics::strheight(s = labels, cex = 1, font = 2)  # height(s) of labels for cex = 1, font = 2 (only)
  labels_height_f3 <- graphics::strheight(s = labels, cex = 1, font = 3)  # height(s) of labels for cex = 1, font = 3 (only)
  labels_height_f4 <- graphics::strheight(s = labels, cex = 1, font = 4)  # height(s) of labels for cex = 1, font = 4 (only)
  
  # Get the REAL text dimensions by scaling labels_width/labels_height values (for each font size) 
  # by the vector of cur_cex values (at corresponding font size):
  text_width <- rep(NA, length(labels))  # initialize
  text_width[font == 1] <- labels_width_f1[font == 1] * cur_cex[font == 1]
  text_width[font == 2] <- labels_width_f2[font == 2] * cur_cex[font == 2]
  text_width[font == 3] <- labels_width_f3[font == 3] * cur_cex[font == 3]
  text_width[font == 4] <- labels_width_f4[font == 4] * cur_cex[font == 4]
  # print(text_width)   # 4debugging
  
  text_height <- rep(NA, length(labels))  # initialize
  text_height[font == 1] <- labels_height_f1[font == 1] * cur_cex[font == 1]
  text_height[font == 2] <- labels_height_f2[font == 2] * cur_cex[font == 2]
  text_height[font == 3] <- labels_height_f3[font == 3] * cur_cex[font == 3]
  text_height[font == 4] <- labels_height_f4[font == 4] * cur_cex[font == 4]
  
  # (C) Measure dimension of desired padding (around text): ---- 
  
  if (mark) {
    
    # (A) Padding (for rectangles around text): ----
    
    # Distinguish between 2 types of padding: 
    if (is.na(padding[1])) {  # (1) No padding was specified:
      
      # Use default paddings (based on character sizes) [see p. 25 of CD Manual]: 
      pad_l_r <-  char_width  # padding on left and right: width of letter "l" 
      pad_t_b <- (char_height * .5)  # padding on top and bottom: Rectangle = 1.5 x height of letter "l".
      
      # Dimensions of corresponding rectangle(s):  
      
      # (a) by the book (definition): 
      rect_width  <- (text_width  + (2 * pad_l_r))  # x-dim of padded rectangle  
      rect_height <- (text_height + (2 * pad_t_b))  # y-dim of padded rectangle
      padl_width  <- pad_l_r  # save left padded width (to shift mid-points below)
      
      ## (b) by visual inspection: 
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
      
      padl_width  <- (1 * padding[1] * char_width)  # save left padded width (to shift mid-points below)
      
    }  # padding etc.
    
  } # if (mark) etc. 
  
  ## Compute text positions (AFTER all measurements are known): ------
  
  # Extreme y coordinates: ---- 
  y_bot <- NA
  y_top <- NA
  
  plot_dim <- par("usr")  # actual dimensions (of current plot): 4 values: x_min, x_max, y_min, y_max. 
  # print(paste0("Current plot_dim = ", plot_dim))  # 4debugging  
  
  y_top <- min(plot_dim[4], y[1])  # Min of highest possible y value (of current plot) and 1st actual y coordinate (of labels)
  y_bot <- min(plot_dim[3], y[1])  # Min of  lowest possible y value (of current plot) and 1st actual y coordinate (of labels)
  y_bot_blank_space <- .10  # proportion of required blank space at bottom (in % of available y_range/y_top)
  y_bot <- (y_bot_blank_space * abs(y_top - y_bot))  # lowest actual y coordinate tolerated
  # print(paste0("y_bot = ", y_bot))  # 4debugging
  
  # Adjust y values (if fewer y's than labels): ---- 
  
  if (N_labels > length(y)) { # If there are more labels than y coordinates: 
    
    # message(paste0("N_labels > N(y): Automatic ", as.character(y_layout), " label layout..."))
    
    if (mark) { 
      
      # (a) Adjust y by rect_height (NOT text_height) sequence: 
      # print(paste0("rect_height", 1:N_labels, " = ", rect_height))  # 4debugging
      
      y <- layout_y(y_top = y_top, y_bot = y_bot, height_seq = rect_height, # !
                    layout_type = y_layout)
      
    } else {  # NOT mark: line or only txt 
      
      # (b) Adjust y by text_height (NOT rect_height) sequence: 
      # print(paste0("text_height", 1:N_labels, " = ", text_height))  # 4debugging
      
      y <- layout_y(y_top = y_top, y_bot = y_bot, height_seq = text_height, # !
                    layout_type = y_layout)
      
    }
    
    # print(paste0("y", 1:N_labels, " = ", y))  # 4debugging
    
  } else {
    
    # message("N(y) >= N_labels: Using y-values provided for label layout...")
    
  }
  
  
  # x/y coordinates: Recycle if unequal length: ----  
  
  if (length(x) != length(y)){   
    
    lx <- length(x)
    ly <- length(y)
    
    if (lx > ly){
      
      y <- rep(y, ceiling(lx/ly))[1:lx]
      
    } else {
      
      x <- rep(x, ceiling(ly/lx))[1:ly]
      
    }
  }
  
  # pos values: ---- 
  
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
  
  
  # adj values: ---- 
  
  if (!is.null(adj)){
    
    if (length(adj == 1)){
      
      adj <- c(adj[1], .5)  # use as 1st, 2nd: center
      
    }
    
  } else { # `adj` is NULL: 
    
    adj <- c(.5, .5)  # default: 1st: center, 2nd: center 
    
  }
  
  
  # ToDo: Handle special case of "flush" underlining (line == TRUE && y_layout == 0): ---- 
  # if (line && (y_layout == 0)) {
  #   
  #   ## Correct line spacing by accounting for line distance and height:
  #   y_dn   <- (cex_ldn * char_height) # downward shift of each line
  #   y_add  <- (cex_ldn + cex_lwd)       # additional space of each line of text 
  #   
  #   print(y_add)
  #   
  #   y_addends <- c(0, y_add)[1:N_labels]
  #   cum_y_add <- cumsum(y_addends)
  #   
  #   y <- y + cum_y_add
  #   
  # }
  
  
  # Midpoints of text(s): ---- 
  
  x_mid <- x + ((.5 - adj[1]) * text_width)  + offset_vec[1]
  y_mid <- y + ((.5 - adj[2]) * text_height) + offset_vec[2]
  
  
  # Adjust x_layout: ----  +++ here now +++ 
  
  if (!is.na(x_layout)){
    
    # print(x_mid)  # 4debugging
    
    x_min <- plot_dim[1]
    x_max <- plot_dim[2]
    
    x_lay <- substr(tolower(x_layout), 1, 3)  # simplify for robustness 
    # print(paste0("Adjusting x_layout: x_lay = ", x_lay))  # 4debugging
    
    if (x_lay == "cen"){  # (a) center: 
      
      if (is.na(x[1])){ # no first x:
        x_mid <- (x_max - x_min)/2   # center labels in plot_dim 
      } else {
        x_mid <- x_mid[1]  # center labels at 1st label    
      }
    }
    
    if (x_lay == "rig"){  # (b) right: 
      
      if (is.na(x[1])){ # no first x:
        x_mid <- (x_max - x_min)/2 - text_width/2  # right flush at plot center 
      } else {
        x_mid <- x[1] + text_width[1] - text_width/2  # right flush at 1st label 
      }
    }
    
    if (x_lay == "lef"){  # (c) left: 
      
      if (is.na(x[1])){ # no first x:
        x_mid <- (x_max - x_min)/2 + text_width/2  # left flush at plot center 
      } else {
        x_mid <- x[1] + text_width/2  # left flush at 1st label 
      }
    }
    
  } # if (!is.na(x_layout)). 
  
  
  # Check for step-function: ---- 
  
  if (mark && (length(x_mid) > 2) && monotonic(x_mid) && is.na(x_layout)) {
    
    # print(paste0("x_mid = ", x_mid))  # 4debugging 
    
    message("Step-wise titles are discouraged: Consider re-arranging?")
    
  }
  
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
                   col     = col_bg,  # Note: col_bg also used in segments (for underlining)
                   border  = col_bg_border,
                   lty     = lty_bg,
                   lwd     = lwd_bg#,
                   # xpd = TRUE  # draw beyond border
    )
    
    # # Report values beyond current plot dimensions: ----
    # if ( any((x_mid - rect_width/2) < plot_dim[1]) ||
    #      any((x_mid + rect_width/2) > plot_dim[2]) ) {
    #   message("Some x values are beyond current plot dimensions.")
    # }
    # 
    # if ( any((y_mid - rect_height/2) < plot_dim[3]) ||
    #      any((y_mid + rect_height/2) > plot_dim[4]) ) {
    #   message("Some y values are beyond current plot dimensions.")
    # }
    
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
                       y0  = ((y_mid - text_height/2) - y_dn),  # y_dn below text
                       x1  = (x_mid  + text_width/2),
                       y1  = ((y_mid - text_height/2) - y_dn),  # y_dn below text
                       col = col_bg,  # Note: col_bg also used in rect (for marking/highlighting)
                       lty = 1,
                       lwd = (cex_lwd * par("lwd")),  # lwd scaled by cex_lwd
                       lend = 1  # line end styles: 0: round (default), 1: butt, 2: square. 
    )
    
  } # if (line) etc.
  
  
  #  C. txt: Plot text labels: ---- 
  
  txt <- TRUE  # default 
  
  if (txt) { 
    
    # Plot text lbl(s):
    graphics::text(x = x_mid, y = y_mid, 
                   labels = labels, 
                   col = col, 
                   cex = cur_cex, font = font, 
                   # pos = pos,      # pos was used above (to compute x and y)
                   adj = c(.5, .5),  # always center (as x and y are computed as mid points above)
                   # xpd = TRUE, 
                   ...  # etc. arguments, passed to text()
    )
    
    # Report values beyond current plot dimensions: ----
    
    # print(paste0("x_mid = ", x_mid))  # 4debugging
    # print(paste0("text_width = ", text_width))
    # print(paste0("text_height = ", text_height))
    
    if ( (min(x_mid - text_width/2) < plot_dim[1]) ||
         (max(x_mid + text_width/2) > plot_dim[2]) ) {
      message("Some x-values are beyond current plot dimensions.") 
      # print(paste0("max(y_mid + text_width/2) = ", max(y_mid + text_width/2)))  # 4debugging
    }
    
    if ( (min(y_mid - text_height/2) < plot_dim[3]) ||
         (max(y_mid + text_height/2) > plot_dim[4]) ) {
      message("Some y-values are beyond current plot dimensions.")  
      # print(paste0("max(y_mid + text_height/2) = ", max(y_mid + text_height/2)))  # 4debugging
    }
    
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
    
    # Return the coordinates of text labels:
    
    if (length(x_mid) == 1){  # Coordinates of 1 character string:
      
      invisible(c(x_mid - text_width/2,  x_mid + text_width/2, 
                  y_mid - text_height/2, y_mid + text_height/2))
      
    } else {  # Coordinates of rectangles:
      
      invisible(cbind(x_mid - text_width/2,  x_mid + text_width/2, 
                      y_mid - text_height/2, y_mid + text_height/2))
      
    }
    
    
  } # if (mark) etc.
  
} # plot_text() end.


# - Check: ------ 

## Demo cases: 

## (1a) Markieren: 
# lbl_mark <- c("                                                ",
#               "                                      ",
#               "                                                      ",
#               "                                                ",
#               "                              ")
# plot_text(labels = lbl_mark,
#           x = 0, y = .90, y_layout = c(.03),
#           col_bg = Seeblau, col_bg_border = NA,
#           cex = 1.0, pos = 4,
#           new_plot = "blank",
#           mark = TRUE)

## (1b) mark + flush: Formatting headlines/titles: 

# lbl_hl1 <- c("Ich bin", "eine", "Headline.")
# plot_text(labels = lbl_hl1,
#           x = 0, y = .8, y_layout = "flush",
#           col_bg = c(pal_seeblau[[1]], pal_seeblau[[3]], pal_seeblau[[4]]),
#           cex = 2.5, pos = 4,
#           mark = TRUE,
#           new_plot = "blank")

# lbl_hl2 <- c("Ich", "bin keine", "gute Headline.")
# plot_text(labels = lbl_hl2,
#           x = 0, y = .80, y_layout = "flush",
#           col_bg = c(pal_seeblau[[1]], pal_seeblau[[3]], pal_seeblau[[4]]),
#           cex = 2.5, pos = 4,
#           mark = TRUE,
#           new_plot = "blank")
# 
# lbl_hl3 <- c("Ich bin", "eine alternative", "Headline.")
# plot_text(labels = lbl_hl3,
#           x = 0, y = .80, y_layout = "flush",
#           col_bg = c(pal_seeblau[[1]], pal_seeblau[[3]], pal_seeblau[[4]]),
#           cex = 2.5, pos = 4,
#           mark = TRUE,
#           new_plot = "blank")

## (2) Unterstreichen: 
# lbl_line <- c("Teaching", "This is a line of text", "Learning and studying", "Test")
# lbl_line <- c("Das ist korrekt, wahr und wahnsinnig wichtig.")
# plot_text(labels = lbl_line, font = 1,
#           x = 0, y = .90, y_layout = c(.05),
#           col_bg = Seeblau, col_bg_border = NA,
#           cex = 1.5, pos = 4,
#           new_plot = "blank",
#           line = TRUE)
# 
# slogan <- c("Geradlinig", "Authentisch", "Beweglich", "Offen", "Paradiesisch")
# plot_text(labels = slogan, font = 2,
#           x = 0, y = .85, y_layout = "even",
#           col = "black", col_bg = Seeblau, col_bg_border = NA,
#           cex = 1.2, pos = 4,
#           new_plot = "blank",
#           line = TRUE, cex_lwd = 2.5, cex_ldn = .42)

## (3) Merken: 
# xbox()
# ToDo: xbox with text (different cex and font values)

# ## Crucial test cases: 
# # 
# ## (a) xbox with text:
# lbl_1 <- c("Erste Zeile", "Zweite Zeile", "Dritte steile Zeile", "Vierte Zeile zum Verweilen",
#            "Ziemlich ausgefeilte Zeilen", "Wichtig mitzuteilen!")
# plot_text(labels = lbl_1,
#           x = .05,
#           y = NA,  # fewer y-coords than labels
#           # y = c(.65, .50, .4, .3, .2, .1), # fixed y-coords for all labels
#           y_layout = "even",  # "even", "flush", OR fixed numeric value for distance b/w labels (e.g., c(.02, .05), recycled)!
#           cex = c(1, 1, 2, 2, 3, 3),
#           font = c(2, 1, 2, 1, 2, 1),
#           col_bg = c(Seeblau, "gold"), lwd_bg = NA,
#           pos = NULL, adj = c(0, .5),  offset = 999,
#           # pos = 4, adj = c(1, 1), offset = 0,
#           new_plot = "xbox",
#           mark = FALSE, grid = TRUE,
#           mar_all = NA, oma_all = NA
# )
# 
# ## (b) slide with text and line: 
# lbl_2 <- rep("l Eine durch zwei `l` begrenzte Zeile l", 6)
# plot_text(labels = lbl_2,
#           x = .00,
#           y = .80,  # fewer y-coords than labels
#           # y = c(.77, .7, .55, .45, .25, .1), # fixed y-coords for all labels
#           y_layout = c(.05, .10), # "even" or fixed numeric value(s) for distance b/w labels (e.g., c(.02, .05), recycled)!
#           cex = c(1, 1, 1.5, 1.5, 2, 2),
#           font = c(2, 1, 2, 1, 2, 1),
#           col_bg = c(Seeblau, "gold"), lwd_bg = 0,
#           pos = NULL, adj = c(0, .5), offset = 999,
#           # pos = 4, adj = c(1, 1), offset = 0,
#           padding = 1, # OR: c(.5, .5),
#           new_plot = "blank",
#           line = TRUE,
#           grid = TRUE, mar_all = NA, oma_all = NA
# )
# 
# ## (c) slide with text and mark:
# lbl_3 <- rep("In Schrift und Grösse variable Zeilen", 6)
# plot_text(labels = lbl_3,
#           x = 0,
#           y = .80,  # fewer y-coords than labels
#           # y = c(.80, .70, .55, .35, .15), # fixed y-coords for all labels
#           y_layout = c(0, .08), # "even", "flush", or fixed numeric value(s) for distance b/w labels (e.g., c(.02, .05), recycled)!
#           cex = c(1.5, 1, 2, 1.5, 2, 2.5), font = c(2, 1),
#           col_bg = c(grey(0, .10), grey(0, .20)),
#           lwd_bg = 1/3, col_bg_border = "red2",
#           # pos = NULL, adj = c(0, .5), offset = 999,
#           pos = 4, adj = c(1, 1), offset = 0,
#           padding = 1, # OR: c(.5, .5),
#           new_plot = "slide",
#           mark = TRUE,
#           grid = FALSE, mar_all = NA, oma_all = NA
# )

## (A) What works: 
# # - Mixing sizes (cex) and fonts:
# lbl_tst <- rep("Variable Grösse und Schrift", 4)
# plot_text(labels = lbl_tst, new_plot = "slide", y = .85, y_layout = c(.0, .15),
#           cex = c(1.2, .8, 1.8, 1.5), font = c(2, 1, 4, 3), x = .05, pos = 4,
#           mark = TRUE, col_bg = c(pal_seeblau[[2]], pal_seeblau[[3]]))
# 
# plot_text(labels = lbl_tst, new_plot = "xbox", col_bg = Seeblau,
#           x = .02, y = .55, y_layout = c(.03, .15),
#           cex = c(1.2, 1.0, 1.5, 1.2), font = c(2, 1, 2, 3), pos = 4)
# 
# # # - Automatic vertical spacing of labels (in y-direction):
# # #   (see crucial test cases above)
# # 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# # - Multiple cex values:
# plot_text(labels = c("m", "m"), x = 0, y = .8, cex = c(1, 5),
#           col_bg = "red1", mark = TRUE)
# # =>  works (i.e., different cex sizes are supported)
# 
# ## Multiple font values:
# plot_text(labels = rep("m", 4), x = 0, y = .9, y_layout = "flush",
#           cex = 5, font = c(2, 1), pos = 4,
#           col_bg = "gold", mark = TRUE, new_plot = "slide")
# # => works (i.e., different font sizes are supported)

## (B) What fails: 
# # - Rotation of labels is not supported:
# plot_text(labels = "This is a test", x = .20, col = "black",
#           new_plot = "blank", srt = 45, mark = TRUE)
# plot_text(labels = "This is a test", x = .60, col = "black",
#           new_plot = "none", srt = -45, line = TRUE)


## Example 0: Plot box

# plot_text(x = 0.02, y = c(.5, .4), labels = c("ToDo", "Something else here"), xbox = TRUE)

# ## Example 1: Underlining text 
# 
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# plot_text(x = 0, y = .9, labels = "Related matters", adj = 0, line = TRUE, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .6, labels = "Underlining text can be straightforward", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = 0, y = .5, labels = "and strikingly effective", line = TRUE, cex = 1.2, col_bg = pal_seeblau[[4]])
# plot_text(x = .55, y = .1, labels = "Please handle with care", adj = 0, line = TRUE, cex = 1.0, col_lbl = "black", col_bg = pal_signal[[1]])

# ## Example 2: Marking text in messy plot
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), 
#      axes = FALSE, xlab = "", ylab = "")
# 
# # Adjust cex, font and adj:
# plot_text(x = .05, y = .90, labels = "What a messy plot", mark = TRUE,
#          col_bg = seeblau[[1]], adj = c(0, 0), padding = c(.25, .85), cex = 2)
# 
# # Vector of 2 labels, using argument 'pos' to position right of coordinates:
# plot_text(x = c(.30, .62), y = c(.20, .42), mark = TRUE,
#          labels = c("Note something here", "More highlighting here"),
#          col_bg = c(pal_seeblau[[2]], "gold"), pos = 4, padding = c(.25, .85), cex = 1.2)


## Done: ------

# - Clean up code.  [2021-04-17]

## ToDo: ------

# - etc.

## eof. ----------