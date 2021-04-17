## plot_box.R | unikn
## spds | uni.kn | 2021 04 17
## ---------------------------

## General function to plot rectangular boxes (e.g., frames, slides, etc.)

## (A): General functions to plot rectangular boxes, frames, (etc.): -------- 

## plot_box: Enhanced (expert/experimental) function that plots ONLY a colored box with an "x" (but NO text): -----

## Note: plot_box is an experimental function, intended only for expert users.

# - Definition: ----

plot_box <- function(col = Seeblau,  # default box bg/fill color: Seeblau ("#59C7EB")
                     ## Expert uses: ## 
                     # Box parameters:
                     box_dim = c(0, 0, 1, 1),  # Box dimensions: As c(xleft, ybottom, xright, ytop), as in rect() function 
                     lty =  0,                 # Default: lty =  0: ensure absence of border line (a)
                     lwd = NA,                 # Default: lwd = NA: ensure absence of border line (b)
                     # "x" parameters: 
                     cross = TRUE,     # plot an "x" (in top-right corner)
                     x_col = "white",  # color of "x" segments 
                     x_cex = .10,      # size of "x" (as an expansion factor)
                     x_dis = .025,     # distance of "x" from box border (as a fraction of box size)
                     x_lwd = 1.2,      # lwd of "x" segements
                     # Plot parameters:
                     mar_all = NA,  # option to reset all mar values (in nr. of line units)
                     oma_all = NA,  # option to reset all oma values (in nr. of line units)
                     grid = FALSE,  # 4debugging
                     # etc.:
                     ...  # etc. (passed to rect, not to segments)
) {
  
  # (0) Interpret inputs: -----
  
  # Box parameters:
  # box_dim <- c(0, 0, 1, 1) # xleft ybottom xright ytop (as in rect)
  
  box_left  <- box_dim[1]
  box_bot   <- box_dim[2]
  box_right <- box_dim[3]
  box_top   <- box_dim[4]
  
  box_width  <- (box_right - box_left)
  box_height <- (box_top - box_bot)
  
  # "x" parameters: 
  x_dis <- x_dis * min(box_width, box_height)  # scale x_dis by box size 
  
  # (1) Create a new plot: -----
  
  # Preamble: ----- 
  
  # Plotting area: ----- 
  
  # Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  # on.exit(par(opar))             # restore upon exit
  
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
  
  
  # Draw grid of plot points:
  # grid <- TRUE  # 4debugging
  
  if (grid) {
    
    # grid() # default grid
    
    # Utility function:
    plot_grid()
    
  }
  
  # (2) Scale x-dimension: ----- 
  
  # (a) Current device: Determine plot aspect ratio (for scaling purposes):
  # plot_xy <- dev.size("in")            # use EITHER par("pin") OR dev.size("in")
  # plot_ratio <- plot_xy[1]/plot_xy[2]  # current aspect ratio
  # scale_x <- 1/plot_ratio              # multiplicative correction factor (for x-widths)
  
  # (b) Current box dimensions (defined above):
  # scale_x <- box_height/box_width
  
  # (c) Assume square:
  scale_x <- 1
  
  # print(paste0("scale_X = ", scale_x)) # 4debugging
  
  
  # (3) Plot a colored box (using rect): ----- 
  
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
  
  # (4) Plot an "x" (in top right corner): ----- 
  
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
    #          col = x_col, lty = 1, lwd = x_lwd)
    # 
    # # (b) "\"
    # segments(x0 = x0_a, y0 = y1_a, 
    #          x1 = x1_a, y1 = y0_a,
    #          col = x_col, lty = 1, lwd = x_lwd)
    
    # (c) Entire "x" at once:
    segments(x0 = c(x0_a, x0_a), y0 = c(y0_a, y1_a), 
             x1 = c(x1_a, x1_a), y1 = c(y1_a, y0_a),
             col = x_col, lty = 1, lwd = x_lwd)
    
  } # if (cross) etc. 
  
  # (5) Exit: ----- 
  
  # on.exit(par(opar)) # restore original settings
  invisible() # restores par(opar)
  
} # plot_box() end. 


# - Check: ------ 

## Basic uses:

# plot_box()

# plot_box(Bordeaux)
# plot_box(Karpfenblau)
# plot_box(col = "forestgreen") 

## Expert uses: 

# Box dimensions:
# plot_box(col = Bordeaux, box_dim  = c(0, 0, 2, 1), grid = TRUE)  # x = 2, y = 1
# plot_box(col = Petrol, box_dim  = c(0, 0, 1, 2), grid = TRUE)    # x = 1, y = 2

# plot_box(col = grey(.50, .50), grid = TRUE)

# # Assuming a square canvas:
# plot_box(box_dim = c(5, 5, 10, 10), x_cex = .10, grid = TRUE)  # square box in upper right corner
# 
# # Test calls:
# 
# # Setting box size and margins:
# plot_box(box_dim = c(6, 6, 10, 10), x_cex = .10,  # square box in upper right corner
#          mar_all = 2, oma_all = 1, grid = TRUE)   # adjust margins, show grid
# 
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

## Done: ------

# - etc.

## ToDo: ------

## - etc.

## eof. ----------