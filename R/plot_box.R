## plot_box.R | unikn
## hn  |  uni.kn |  2019 02 24
## ---------------------------

## Plot boxes (e.g., xbox, slides, etc.)

## (A): Key functions to plot colored boxes, frames, (etc.): -------- 

## plot_box: Enhanced (expert/experimental) function that plots ONLY a colored box with "x" (but NO text): -----

## Note that plot_box is an experimental function, intended for expert users.

# - Definition: ----

plot_box <- function(col = Seeblau,  # default box bg/fill color: Seeblau ("#59C7EB")
                     ## Expert uses: 
                     # - Parameters for box:
                     box_dim = c(0, 0, 1, 1),  # Box dimensions: As c(xleft, ybottom, xright, ytop), as in rect() function 
                     lty =  0,   #  Default: lty =  0: ensure absence of border line (a)
                     lwd = NA,   #  Default: lwd = NA: ensure absence of border line (b)
                     # - Parameters for "x": 
                     x_col = "white",
                     x_cex = .10,   # size of "x" (as an expansion factor)
                     x_dis = .025,  # distance of "x" from box border (as a fraction of box size)
                     x_lwd = 1.2,   # lwd of "x" segements
                     # - Other stuff:
                     cross = TRUE,  # plot "x" (in top-right corner)
                     mar_all = NA,  # option to reset all mar values (in nr. of line units)
                     oma_all = NA,  # option to reset all oma values (in nr. of line units)
                     grid = FALSE,  # 4debugging
                     ...  # etc. (passed to rect, not to segments)
) {
  
  ## (0) Interpret inputs: -----
  
  # Box parameters:
  # box_dim <- c(0, 0, 1, 1) # xleft ybottom xright ytop (as in rect)
  
  box_left  <- box_dim[1]
  box_bot   <- box_dim[2]
  box_right <- box_dim[3]
  box_top   <- box_dim[4]
  
  box_width  <- (box_right - box_left)
  box_height <- (box_top - box_bot)
  
  # "x" parameters: 
  x_dis <- x_dis * min(box_width, box_height)  # scale x_dis with box size 
  
  ## (1) Create a new plot: -----
  
  ## Preamble: ----- 
  
  ## Plotting area: ----- 
  
  # Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  # on.exit(par(opar))               # restore upon exit
  
  if (!is.na(mar_all)) {  # reset all mar values:
    par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.  
  }  
  
  if (!is.na(oma_all)) {  # reset all oma values:
    par(oma = c(0, 0, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.    
  }
  
  ## Plot empty canvas: 
  ## (a) Original: 
  # plot.new()
  
  ## (b) Box fills entire canvas: 
  # plot(0, 0, type = "n", xlim = c(box_left, box_right), ylim = c(box_bot, box_top), 
  #      bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  
  # (c) Canvas begins at origin (0, 0), even when box_left or box_right are larger:
  x_min <- min(0, box_left)
  x_max <- box_right
  y_min <- min(0, box_bot)
  y_max <- box_top
  
  plot(0, 0, type = "n", xlim = c(x_min, x_max), ylim = c(y_min, y_max), 
       bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  
  
  ## Draw a grid of plot points:
  
  # grid <- TRUE  # 4debugging
  
  if (grid) {
    
    # grid() # default grid
    
    ## Call utility function:
    plot_grid(x_min = x_min, x_max = x_max, 
              y_min = y_min, y_max = y_max)
    
  }
  
  ## Determine plot aspect ratio (for scaling purposes):
  plot_xy <- dev.size("in")            # use EITHER par("pin") OR dev.size("in")
  plot_ratio <- plot_xy[1]/plot_xy[2]  # current aspect ratio
  scale_x <- 1/plot_ratio              # multiplicative correction factor (for x-widths)
  # print(scale_x)  # 4debugging
  
  
  ## (2) Plot a colored box (using rect): ----- 
  
  # Draw rectangle:
  rect(xleft = box_left, ybottom = box_bot, xright = box_right, ytop = box_top,
       col = col, 
       lty = lty,  #  Default: lty =  0: ensure absence of border line (a)
       lwd = lwd,  #  Default: lwd = NA: ensure absence of border line (b)
       # border = col_brd,
       # density = density,
       # angle = angle,
       ...  # etc. 
  )
  
  ## (3) Plot an "x" (in top right corner): ----- 
  
  if (cross) {
    
    ## (a) If box is a square: 
    
    # # Parameters of "x" (coordinates): 
    # p1 <- .85  # (fractions of 1)
    # p2 <- .95
    # 
    # # Draw segments:
    # segments(x0 = c(p1, p1), y0 = c(p1, p2), 
    #          x1 = c(p2, p2), y1 = c(p2, p1),
    #          col = "white", lty = 1, lwd = 1.41)
    
    ## (b) For any box dimension: 
    
    # Size of "x":
    
    # Parameters:
    # x_cex <- .10
    # x_dis <- .04
    
    ## Size of "x": 
    # x_corr   <- (box_width/box_height) # correction factor for reducing length of diagonal (when x_cex = 1).
    # x_size   <- (x_cex * min(box_width, box_height)) - (2 * x_dis)
    # x_height <- (x_size * 1)
    # x_width  <- (x_size * scale_x) * (box_width/box_height)  # scaled TWICE!
    # x_width  <- (x_size * scale_x)  # scaled once!
    
    # x_height <- (x_cex * box_height) -  (2 * x_dis)     # account for x_dis (as a constant size)
    # x_height <- (x_cex * (box_height)) - (2 * x_dis * box_height)     # account for x_dis (as a fraction of box_height)
    x_height <- (x_cex * box_height)  # -  (2 * x_dis)  # independent of x_dis
    
    x_width  <- (x_height * scale_x)  # scaled height!
    
    # Distance of "x" from border: 
    dist_top   <- (x_dis * 1)
    # dist_right <- (x_dis * scale_x) * (box_width/box_height)  # scaled TWICE!
    # dist_right <- (x_dis * scale_x)  # scaled once!
    
    dist_right <- (dist_top * scale_x)  # scaled dist_top!
    
    # Parameters of "x" endpoints: 
    x0_a <- (box_right - dist_right - x_width)
    y0_a <- (box_top - dist_top - x_height)
    x1_a <- (box_right - dist_right)
    y1_a <- (box_top - dist_top)
    
    # Draw segments:
    # # (a) "/"  
    # segments(x0 = x0_a, y0 = y0_a, 
    #          x1 = x1_a, y1 = y1_a,
    #          col = x_col, lty = 1, lwd = 1.41)
    # 
    # # (b) "\"
    # segments(x0 = x0_a, y0 = y1_a, 
    #          x1 = x1_a, y1 = y0_a,
    #          col = x_col, lty = 1, lwd = 1.41)
    
    # (c) Entire "x" at once:
    segments(x0 = c(x0_a, x0_a), y0 = c(y0_a, y1_a), 
             x1 = c(x1_a, x1_a), y1 = c(y1_a, y0_a),
             col = x_col, lty = 1, lwd = x_lwd)
    
  } # if (cross) etc. 
  
  ## (3) Exit: ----- 
  
  # on.exit(par(opar)) # restore original settings
  invisible() # restores par(opar)
  
} # plot_box end. 

## Check:

# ## Basic uses: ---- 
# plot_box(col = unlist(Bordeaux))
# plot_box(col = unlist(karpfenblau))
# 
# ## Expert uses: ---- 
# 
# # Assuming a square canvas: 
# plot_box(box_dim = c(5, 5, 10, 10), x_cex = .10, grid = TRUE)  # square box in upper right corner
# 
# # Test calls:
# # Assuming non-square canvases: 
# plot_box(box_dim = c(5, 5, 15, 10), x_cex = 1, x_dis = 0, grid = TRUE)  # box wider than high (in upper right) with max "x"
# plot_box(box_dim = c(5, 5, 10, 15), x_cex = 1, x_dis = 0, grid = TRUE)  # box higher than wide (in upper right) with max "x"
# # Note: "x" appears orthogonal when grid is evenly spaced (i.e., dimensions of display device match plotting region). 
# 
# # Assuming a square canvas: Square box (in upper right) with max "x"
# plot_box(box_dim = c(5, 5, 10, 10), x_cex = 1, x_dis = 0, x_col = "red3", x_lwd = 2, grid = TRUE) 
# 
# # Varying x_dis: 
# plot_box(box_dim = c(5, 5, 10, 10), x_dis = 0/4, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box(box_dim = c(5, 5, 10, 10), x_dis = 1/4, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box(box_dim = c(5, 5, 10, 10), x_dis = 1/2, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box(box_dim = c(5, 5, 10, 10), x_dis = 1/1, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)


## plot_box_txt: Plot box with "x" and text: ---------- 

# - Documentation: ---- 

#' Plot a colored box (with top x and text). 
#' 
#' \code{plot_box_txt} generates a box with a cross (x) in its top-right corner 
#' and places 1 or more text strings (of a character vector \code{lbls}) 
#' in the box. 
#' 
#' \code{plot_box_txt} uses the base graphics system \code{graphics::}. 
#' 
#' This is an earlier version of the more powerful 
#' \code{plot_box} function. 
#' 
#' @param lbls A character vector specifying the text label(s)  
#' to be written. If \code{lbls} contains multiple character strings, 
#' each one is placed on a new line. 
#' Default: \code{lbls = NA}. 
#' 
#' @param col_lbl The color(s) of the text label(s).
#' Default: \code{col_lbl = "white"}. 
#' 
#' @param col_bg The color(s) to fill the box with. 
#' Default: \code{col_bg = seeblau}.
#' 
#' @param cex A numeric character expansion factor, which is  
#' multiplied by \code{par("cex")} to yield the final character size. 
#' Default: \code{cex = 2}.
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (bold).
#' 
#' @param lbl_x  A fraction in \code{[0, 1]} that determines the 
#' x-value of the left edge of text in \code{lbls}. 
#' Default: \code{lbl_x = .02} (i.e., 2\% from the left border). 
#' 
#' @param lbl_y  A fraction in \code{[0, 1]} that determines the 
#' y-value of the top line of text in \code{lbls}.  
#' To safe-guard the space to the left of the top cross, 
#' a maximum value of 1 corresponds to 80\% of the box height.) 
#' Default: \code{lbl_y = .65} (i.e., 65\% x 80\% = 52\% of box height). 
#' 
#' @family text functions
#' 
#' @seealso
#' \code{\link{mark}} to mark text with a colored box. 
#' 
#' @examples
#' plot_box_txt()
#' plot_box_txt(lbls = "A heading appears here.")
#' plot_box_txt(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
#' 
#' plot_box_txt(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
#' 
#' # Note: As a vector of character strings for lbls is converted into separate lines of text,
#' #       the following examples yield identical results:
#' plot_box_txt(lbls = c("1st line of text.", 
#'                       "A 2nd longer line of text.", 
#'                       "The 3rd line of text."))
#' plot_box_txt(lbls = "1st line of text.\nA 2nd longer line of text.\nThe 3rd line of text.")
#'
#' # Box logos:
#' plot_box_txt(lbls = c("unikn::"), col_bg = Seeblau, cex = 2.5)
#' plot_box_txt(lbls = "ToDo", cex = 4, col_bg = unlist(pal_Bordeaux[4]))
#' plot_box_txt(lbls = "R", col_bg = pal_seeblau[[5]], cex = 10, lbl_y = .7)
#'
#' @import graphics 
#'
#' 

# - Definition: ----

plot_box_txt <- function(lbls = "",  # character vector of labels to place (as lines of text)  
                         col_lbl = "white",   # text color
                         col_bg = Seeblau,    # default box bg/fill color: Seeblau ("#59C7EB")
                         cex = 2, 
                         font = 2,
                         lbl_x = .02, 
                         lbl_y = .65  # fraction in [0, 1] that determines y-value of top line of text 
                         # A (max. of 1 corresponds to 80% of box) 
) {
  
  ## (1) Plot a box (as a new plot): -----
  
  ## Preamble: ----- 
  
  ## Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  on.exit(par(opar)) # restore original settings
  
  ## Plotting area: ----- 
  
  ## Margins (in lines): 
  mar_all <- 0  # all inner
  oma_all <- 0  # all outer
  
  par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  par(oma = c(0, 0, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
  # par(omd = c(0, 0, 1, 1))
  
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
  graphics::rect(xleft = x_left, ybottom = y_bot, xright = x_right, ytop = y_top,
                 col = col_bg, 
                 lty = 0,  # ensure absence of border line (a)
                 lwd = NA  # ensure absence of border line (b)
                 # border = col_brd,
                 # density = density,
                 # angle = angle,
                 # lwd = lwd
                 # ...  # etc. 
  )
  
  ## Plot an "x" (in top right corner): ----- 
  
  # Parameters of "x" (coordinates): 
  p1 <- .86  # (fractions of 1)
  p2 <- .96
  
  # Draw segments:
  graphics::segments(x0 = c(p1, p1), y0 = c(p1, p2), 
                     x1 = c(p2, p2), y1 = c(p2, p1),
                     col = "white", lty = 1, lwd = 1.41)
  
  
  ## (2) Add text labels (to existing plot): -----
  
  ## Interpret inputs:
  # cur_font <- graphics::par('font')
  cur_cex <-  (cex * graphics::par('cex'))  # character expansion factor to use
  # print(cur_cex)  # 4debugging
  
  ## Measure dimensions of text elements:
  char_width  <- graphics::strwidth(s = "n", cex = cur_cex, font = font)      # width of lowercase "n" 
  char_height  <- graphics::strheight(s = "N", cex = cur_cex, font = font)    # height of uppercase "N" 
  # text_height <- graphics::strheight(s = lbls, cex = cur_cex, font = font)  # text height(s)
  # text_width  <- graphics::strwidth(s = lbls, cex = cur_cex, font = font)   # text width(s)
  # # print(text_width)  # 4debugging
  
  ## Combine all lbls into 1:
  all_lbls <- paste(lbls, sep = "", collapse = "\n") # put each label into a new line
  lbls_height <- round(graphics::strheight(s = all_lbls, units = "figure", cex = cur_cex, font = font), 4) # height of all_lbls
  lbls_width <- round(graphics::strwidth(s = all_lbls, units = "figure", cex = cur_cex, font = font), 4)   # width of all_lbls
  # # print(paste0("all_lbls = '", all_lbls, "', width = ", lbls_width, ", height = ", lbls_height))  # 4debugging
  
  ## Plot text lbls: ---- 
  
  # Parameters: 
  # lbl_y_scaled <- ((lbl_y * .80) - char_height)  # reserve 20% on top (for "x" area)
  lbl_y_scaled <- (lbl_y * .80)  # reserve 20% on top (for "x" area)
  # print(lbl_y_scaled)  # 4debugging
  
  graphics::text(x = lbl_x, y = lbl_y_scaled, labels = all_lbls, 
                 col = col_lbl, cex = cur_cex, font = font, adj = c(0, 1))
  
  ## (3) Exit: ----- 
  
  on.exit(par(opar)) # restore original settings
  invisible() # restores par(opar)
  
} # plot_box_txt end.

## Check:
# plot_box_txt()
# plot_box_txt(lbls = "A heading appears here.")
# plot_box_txt(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
# 
# plot_box_txt(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
# 
# # Note: As a vector of character strings for lbls is converted into separate lines of text,
# #       the following examples yield identical results:
# plot_box_txt(lbls = c("The 1st line of text.", 
#                       "A 2nd and longer line of text.", 
#                       "The 3rd line of text."))
# plot_box_txt(lbls = "The 1st line of text.\nA 2nd and longer line of text.\nThe 3rd line of text.")
# 
# # Box logos:
# plot_box_txt(lbls = c("unikn::"), col_bg = pal_seeblau[[3]], cex = 2.5)
# plot_box_txt(lbls = "ToDo", cex = 4, col_bg = unlist(pal_seeblau[5]))
# plot_box_txt(lbls = "R", col_bg = pal_seeblau[[5]], cex = 10, lbl_y = .7)
#
## Box with address/contact details:
# plot_box_txt(lbls = c("Dr. B. F. Skinner", " ",
#                       "Department of Psychology",
#                       "Office F101",
#                       "Tel.: +49 7531 88-0815",
#                       "Fax: +49 7531 88-0810",
#                       "b.f.skin@uni-konstanz.de"),
#              lbl_x = .03, lbl_y = .73,
#              font = 1, cex = 1.0, col_bg = pal_petrol[[4]])


## Test: Testbed for code above: ------ 

# # Aspect ratio of current plot:
# plot_xy <- par("pin")                # use par("pin") OR dev.size("in")
# plot_ratio <- plot_xy[1]/plot_xy[2]  # current aspect ratio
# scale_x <- 1/plot_ratio              # multiplicative correction factor (for x-widths)
# scale_x


## ToDo: ------

## Separate into multiple functions:
## - plot box (plots colored box with top "x")
## - plot txt (plots lines of text)
## - plot_both combines both
## - mark as a reduced version of plot_both

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