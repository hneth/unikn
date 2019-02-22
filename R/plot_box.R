## plot_box.R | unikn
## hn  |  uni.kn |  2019 02 22
## ---------------------------

## Plot blue box etc.


## plot_box: ---------- 

# - Documentation: ---- 

#' Plot a box (with color and text, and top x). 
#' 
#' \code{plot_box} generates a box with a cross (x) in its top-right corner 
#' and places 1 or more text strings (of a character vector \code{lbls}) 
#' in the box. 
#' 
#' \code{plot_box} uses the base graphics system \code{graphics::}. 
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
#' plot_box(lbls = "A heading appears here.")
#' plot_box(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
#' 
#' plot_box(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
#' 
#' # Note: As a vector of character strings for lbls is converted into separate lines of text,
#' #       the following examples yield identical results:
#' plot_box(lbls = c("The 1st line of text.", "A 2nd and longer line of text.", "The 3rd line of text."))
#' plot_box(lbls = "The 1st line of text.\nA 2nd and longer line of text.\nThe 3rd line of text.")
#'
#' # Box logos:
#' plot_box(lbls = c("unikn::"), col_bg = pal_seeblau[[3]], cex = 2.5)
#' plot_box(lbls = "ToDo", cex = 4, col_bg = unlist(pal_seeblau[5]))
#' plot_box(lbls = "R", col_bg = pal_seeblau[[5]], cex = 10, lbl_y = .7)
#'
#' @import graphics 
#'                          
#' @export 

# - Definition: ----

plot_box <- function(lbls = NA,  # character vector of labels to place (as lines of text)  
                     col_lbl = "white",              # text color
                     col_bg = as.character(seeblau), # box color
                     cex = 2, 
                     font = 2,
                     lbl_x = .02, 
                     lbl_y = .65  # fraction in [0, 1] that determines y-value of top line of text (max. of 1 corresponds to 80% of box) 
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
  oma_l   <- 0  # left
  
  par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  par(oma = c(0, oma_l, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
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
  p1 <- .85  # (fractions of 1)
  p2 <- .95
  
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
  
} # plot_box end.

## Check:
# plot_box(lbls = "A heading appears here.")
# plot_box(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
# 
# plot_box(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
# 
# # Note: As a vector of character strings for lbls is converted into separate lines of text,
# #       the following examples yield identical results:
# plot_box(lbls = c("The 1st line of text.", "A 2nd and longer line of text.", "The 3rd line of text."))
# plot_box(lbls = "The 1st line of text.\nA 2nd and longer line of text.\nThe 3rd line of text.")
# 
# # Box logos:
# plot_box(lbls = c("unikn::"), col_bg = pal_seeblau[[3]], cex = 2.5)
# plot_box(lbls = "ToDo", cex = 4, col_bg = unlist(pal_seeblau[5]))
# plot_box(lbls = "R", col_bg = pal_seeblau[[5]], cex = 10, lbl_y = .7)
#
## Box with address/contact details:
# plot_box(lbls = c("Dr. B. F. Skinner", " ",
#                   "Department of Psychology",
#                   "Office F101",
#                   "Tel.: +49 7531 88-0815",
#                   "Fax: +49 7531 88-0810",
#                   "b.skin@uni-konstanz.de"),
#          lbl_x = .03, lbl_y = .73,
#          font = 1, cex = 1.0, col_bg = pal_petrol[[4]])

## plot_box_exp: Expert/experimental version that plots ONLY a colored box with "x" (but NO text): -----

## Note that plot_box_exp is an experimental function, intended for expert users.

# - Definition: ----

plot_box_exp <- function(col = unlist(seeblau),    # box bg color (WAS: box_bg)
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
  
  on.exit(par(opar)) # restore original settings
  invisible() # restores par(opar)
  
} # plot_box_exp end. 

## Check:

# ## Basic uses: ---- 
# # plot_box_exp(col = unlist(Bordeaux))
# plot_box_exp(col = unlist(karpfenblau))
# 
# ## Expert uses: ---- 
# 
# # Assuming a square canvas: 
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_cex = .10, grid = TRUE)  # square box in upper right corner
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_cex = 1, grid = TRUE)    # square box (in upper right) with max "x"
# 
# # Test calls:
# # Assuming non-square canvases: 
# plot_box_exp(box_dim = c(5, 5, 15, 10), x_cex = 1, x_dis = 0, grid = TRUE)  # box wider than high (in upper right) with max "x"
# plot_box_exp(box_dim = c(5, 5, 10, 15), x_cex = 1, x_dis = 0, grid = TRUE)  # box higher than wide (in upper right) with max "x"
# # Note: "x" appears orthogonal when grid is evenly spaced (i.e., dimensions of display device match plotting region). 
# 
# # Assuming a square canvas: 
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 0, x_col = "red3", x_cex = 1)
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 0, x_col = "red3", x_cex = 1, x_lwd = 3)
# 
# # Varying x_dis: 
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 0/4, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 1/4, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 1/2, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)
# plot_box_exp(box_dim = c(5, 5, 10, 10), x_dis = 1/1, x_col = "red3", x_cex = 1, x_lwd = 2, grid = TRUE)


## xbox: Plot a colored box with "x" (a simple version of plot_box_exp): ------ 

# - Documentation: ---- 

#' Plot a box (with x). 
#' 
#' \code{xbox} plots a box with a cross (x) in its top-right corner. 
#' 
#' @param col The color to fill the box with (i.e., its background color).  
#' Default: \code{col = unlist(seeblau)}. 
#' 
#' @param dim The x- and y-dimensions of the box. 
#' Default: \code{dim = c(1, 1)} (i.e., a unit square). 
#' 
#' @family plot functions
#' 
#' @seealso
#' \code{\link{frame}} to plot a frame. 
#' 
#' @examples
#' xbox()  # default box
#'
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

xbox <- function(col = unlist(seeblau),
                 dim = c(1, 1)  # dimension: Default: dim = c(1, 1) (i.e., unit square).
                 # ...  # etc. 
) {
  
  # Dimensions:
  if (length(dim) == 1){  # only 1 value provided: 
    dim <- c(dim[1], dim[1])  # use as square
  }
  
  # Call expert function (with sensible defaults):
  plot_box_exp(col = col,
               box_dim = c(0, 0, dim[1], dim[2]) 
               # ...  # etc.
  )
  
} # xbox end. 

## Check:
# xbox()  # default xbox

## Simple variants:
# xbox(col = unlist(seegruen))
# xbox(col = unlist(Bordeaux))
# xbox(dim = c(2, 1)) # 2:1 dimension (twice as wide than high)

## frame: Plot a colored frame without "x": (a simple version of plot_box_exp): ------ 

# - Documentation: ---- 

#' Plot a frame (or slide). 
#' 
#' \code{frame} plots an empty frame or slide.  
#' 
#' @param col The color to fill the frame with (i.e., its background color).  
#' Default: \code{col = NA} (i.e., system default for transparency). 
#' 
#' @param dim The x- and y-dimensions of the frame. 
#' Default: \code{dim = c(4/3, 1)} (i.e., unit height, 4/3 wider than high). 
#' 
#' @param border The color of the border. 
#' Default: \code{border = grey(.33, 1)}.
#' 
#' @param lwd The line width of the border. 
#' Default: \code{lwd = 1.5}.
#' 
#' @family plot functions
#' 
#' @seealso
#' \code{\link{xbox}} to plot a box. 
#' 
#' @examples
#' frame()  # default frame
#'
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

frame <- function(col = NA,
                  dim = c(4/3, 1),  # dimension: Default: dim = c(4/3, 1) (i.e., unit height, 4/3 wider than high).
                  border = grey(.33, 1),
                  lwd = 1.5){
  
  # Dimensions:
  if (length(dim) == 1){  # only 1 value provided: 
    dim <- c(dim[1], dim[1])  # use as square
  }
  
  # Call expert function (with sensible defaults):
  plot_box_exp(col = col,
               border = border,
               lty = 1,
               lwd = lwd,
               cross = FALSE
               # ...  # etc.
  )
  
} # frame end.

## Check:
# frame()  # default frame

## Simple variants:
# frame(col = unlist(pal_seeblau[[1]]), lwd = 0)  
# frame(dim = c(18:9)) # larger and 2:1 wider than high


# +++ here now +++


## ToDo: 
# Adopt a more modular approach: 
# 1 - Plot a colored box without text (as full expert vs. naive user function).
# 2 - Plot text into an existing box with a dedicated plot_text function.
# 3 - Do NOT combine labels into 1, to allow using a different fonts (and colors) for different character strings:
#     Instead: Use coordinates for 1st line and place subsequent lines based on text heights (of each string).

# plot_box(lbls = c("Plakativ und sachlich", "Hier steht etwas, das ich mir merken muss."), font = c(2, 1))  # fails to work (as labels are combined into 1)
# plot_box(lbls = c("Plakativ und sachlich", "Hier steht etwas, das ich mir merken muss."), cex = c(1, 2)) # fails to work (as cex are not applied)

## plot_txt: Plot lines of text (into an existing plot): -------- 



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