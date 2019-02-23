## plot_util.R | unikn
## hn  |  uni.kn |  2019 02 22
## ---------------------------

## Utility functions for plotting 
## (for internal use, not exported): 

## plot_mar: Set plotting margins: ------ 

plot_mar <- function(mar_all = 0,
                     oma_all = 0){
  
  # Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  on.exit(par(opar)) # restore original settings
  
  ## Plotting area: ----- 
  
  ## Margins (in lines): 
  # mar_all <- 0  # all inner
  # oma_all <- 0  # all outer
  
  par(mar = c(0, 0, 0, 0) + mar_all)      # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  par(oma = c(0, 0, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
  
  ## Plot:
  plot(0, 0, type = "p")
  grid()
  points(x = 0, y = 0, pch = 3, cex = 2, col = "forestgreen")
  text(x = 0, y = 0, labels = "Origin", cex = 1, font = 1, pos = 4, col = "firebrick")
  
  # Return:
  invisible()
  
}

## Check:
# par("mar")  # => # 5.1 4.1 4.1 2.1 (default)
# par("oma")  # => # 0   0   0   0   (default)

## Outside of function:
# plot(0, 0, type = "p")
# grid()
# points(x = 0, y = 0, pch = 3, cex = 2, col = "forestgreen")
# text(x = 0, y = 0, labels = "Origin", cex = 1, font = 1, pos = 4, col = "firebrick")

## Inside of function:
# plot_mar()


## plot_grid: Helper function to plot a grid of points (to position objects): ------ 

plot_grid <- function(x_min = 0, x_max = 1, y_min = 0, y_max = 1, col = grey(0, .50)){
  
  if (dev.cur() == 1) {  # no graphics device open (null device)
    
    message("No existing plot: Please plot something first...")  
    
  } else {
    
    # Add default grid: 
    grid(col = col)
    
    # Mark points:
    points(0, 0, pch = 1, col = col, cex = 2)  # origin
    points(x_max, y_max, pch = 0, col = col, cex = 2)  # top right
    
    # Grid parameters:
    if ((abs(x_max - x_min) > 1) && (abs(y_max - y_min) > 1)) { 
      stepsize <- 1
    } else { 
      stepsize <- 1/10 
    }
    
    grid_x <- rep(seq(x_min, x_max, by = stepsize), times = length(seq(y_min, y_max, by = stepsize)))  # x/horizontal
    grid_y <- rep(seq(y_min, y_max, by = stepsize), each =  length(seq(x_min, x_max, by = stepsize)))  # y/vertical
    
    # Plot grid of points:    
    points(grid_x, grid_y, pch = 3, col = col, cex = 3/4)
    
  }
  
} # plot_grid end.

## Check:
# plot.new()
# plot_grid()

# plot(x = 0, y = 0, type = "n", xlim = c(0, 10), ylim = c(0, 5))
# plot_grid(x_max = 10, y_max = 5)
# plot_grid(col = "gold")

## layout_y: Adjust y values given height of objects for different lbl_layout options: ------

layout_y <- function(y_top, y_bot, height_seq, layout_type) {
  
  y_out <- NA  # initialize  
  N_lbls <- length(height_seq)
  
  # Warn if layout_type is unknown: ---- 
  
  if ( !is.numeric(layout_type) && 
       ( (layout_type != "even") && (layout_type != "flush") ) ) {
    
    warning("layout_y: Unknown layout_type!  Returning y_out of 0...")
    
    y_out <- 0
    
  }
  
  # (A) Flush layout: ----
  
  if (!is.numeric(layout_type) && (layout_type == "flush")){
    
    # Problem: Rectangles can vary in height (due to cex and font differences).
    # Solution: Desired distance between 2 rectangles A (current) and B (next) depends on both heights: 
    #           50% of A (current) + 50% of B (next):
    
    next_height <- c(height_seq[2:N_lbls], 0)           # height of next rect
    y_dist <- (1/2 * height_seq) + (1/2 * next_height)  # desired distances in y direction
    cum_y_dist <- cumsum(y_dist)                              # cumulative distances in y direction
    act_y_dist <- c(0, cum_y_dist)[1:N_lbls]   # shift by 1: start with 0, drop final cum_y_dist
    
    y_out <- (y_top - act_y_dist)
    
  } # if (layout_type == "flush") etc. 
  
  
  # (B) Even layout: ----   
  
  if (!is.numeric(layout_type) && (layout_type == "even")){
    
    # ## 1. Consider only (between) line distances (NOT line heights): ---- 
    # 
    # # Compute line_dist if NOT considering height_sum:
    # line_dist <- abs(y_top - y_bot) / (N_lbls - 0)  # evenly spaced across available space (from y_top to y_bot)
    # 
    # line_distance_addends  <- c(0, rep(line_dist, (N_lbls - 1)))  # start with 0, N_lbls values overall
    # line_distance_cumsum   <- cumsum(line_distance_addends) 
    # 
    # y_out <- (y_top - line_distance_cumsum)
    
    
    ## 2. Also incorporate line heights: ---- 
    
    # Compute line_dist when also considering height_sum:
    height_sum <- sum(height_seq)
    line_dist <- abs((y_top - y_bot) - height_sum) / (N_lbls - 1)  # evenly spaced across remaining space (after removing height_sum)
    
    line_distance_addends  <- c(0, rep(line_dist, (N_lbls - 1)))  # start with 0, N_lbls values overall
    line_distance_cumsum   <- cumsum(line_distance_addends) 
    
    
    cum_height_seq <- cumsum(c(0, height_seq))[1:N_lbls]  # cumulative height: Start with 0, drop final cumsum
    
    y_out <- (y_top - (line_distance_cumsum + cum_height_seq))
    
    
    # 3. Allow for different heights: 
    # Problem: Rectangles can vary in height (due to cex and font differences).
    # Solution: Desired distance between 2 rectangles A (current) and B (next) depends on both heights: 
    #           50% of A (current) + 50% of B (next):
    
    next_height <- c(height_seq[2:N_lbls], 0)           # height of next rect
    y_dist <- (1/2 * height_seq) + (1/2 * next_height)  # desired distances in y direction
    cum_y_dist <- cumsum(y_dist)                              # cumulative distances in y direction
    act_y_dist <- c(0, cum_y_dist)[1:N_lbls]   # shift by 1: start with 0, drop final cum_y_dist
    
    y_out <- (y_top - (line_distance_cumsum + act_y_dist))
    
  } # if (layout_type == "even") etc. 
  
  
  # (C) Space by some fixed numeric value(s): ---- 
  
  if (is.numeric(layout_type)) {
    
    line_dist <- layout_type  #  some fixed line distance value(s) (constant or vector)
    # if (is.na(line_dist)) { line_dist <- .10 } # some default value         
    
    ## (a) OLD: 1 single line_dist value:
    # line_dist_constant <- line_dist[1]  # use 1st value as constant
    # line_distance_addends  <- c(0, rep(line_dist_constant, (N_lbls - 1)))  # start with 0, N_lbls values overall
    # line_distance_cumsum   <- cumsum(line_distance_addends) 
    
    # (b) NEW: 1 or more line_dist values: 
    # Recycle line_dist to a length of N_lbls (if necessary): 
    if (length(line_dist) < N_lbls){
      line_dist <- rep(line_dist, ceiling(N_lbls/length(line_dist)))[1:N_lbls]
    }
    line_distance_addends <- c(0, line_dist)[1:N_lbls]  # start with 0, N_lbls values overall
    line_distance_cumsum  <- cumsum(line_distance_addends) 
    
    ## 1. Consider only (between) line distances: 
    # y_out <- (y_top - line_distance_cumsum)
    
    
    # 2. Also incorporate line heights:
    cum_height_seq <- cumsum(c(0, height_seq))[1:N_lbls]  # cumulative height: Start with 0, drop final cumsum 
    
    y_out <- (y_top - (line_distance_cumsum + cum_height_seq))
    
    
    # 3. Allow for different heights: 
    # Problem: Rectangles can vary in height (due to cex and font differences).
    # Solution: Desired distance between 2 rectangles A (current) and B (next) depends on both heights: 
    #           50% of A (current) + 50% of B (next):
    
    next_height <- c(height_seq[2:N_lbls], 0)           # height of next rect
    y_dist <- (1/2 * height_seq) + (1/2 * next_height)  # desired distances in y direction
    cum_y_dist <- cumsum(y_dist)                              # cumulative distances in y direction
    act_y_dist <- c(0, cum_y_dist)[1:N_lbls]   # shift by 1: start with 0, drop final cum_y_dist
    
    y_out <- (y_top - (line_distance_cumsum + act_y_dist))
    
  } # if if (is.numeric(layout_type)) etc. 
  
  
  # Notes or warning messages: ----
  min_y_out <- min(y_out)
  
  if (min_y_out < y_bot) {
    message(paste0("Minimum y of layout is ", min_y_out, ", while y_bot = ", y_bot)) 
  }
  
  # Return: ---- 
  
  return(y_out)
  
} # layout_y end. 

## Check:
#
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = "even")
#
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = "flush")
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.30, 5), layout_type = "flush") # see message 
#
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = .25) # fixed steps as constant
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = c(.2, .3)) # fixed steps as vector (is recycled)
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = c(.1, .2, .3, .4)) # fixed steps as vector (is recycled)
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = c(.1, .2, .3, .4, 99)) # fixed steps as vector (additional value ignored) 
#
# layout_y(y_top = 1, y_bot = 0, height_seq = rep(.10, 5), layout_type = "odd")  # warning and return 0.


## Test: Testbed for code above: ------ 


## ToDo: ------

# (1) layout_y: Implement 2 special "layout_type"s of "flush" and "even" 
#               as special cases of numeric y-values (y_dist = 0 and y_dist = constant)


## eof. ----------