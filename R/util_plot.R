## util_plot.R | unikn
## spds | uni.kn |  2020 10 11
## ---------------------------

# Plot-related utility functions (mostly for internal use, not exported).


## Utility functions for plotting: -------- 



# plot_axes: Check whether axes are desired: ------

# Goal: In demopal() plots: Hide axes when col_par has been set to NA:
# Return: Boolean/logical value.

plot_axes <- function(col_par){
  
  if (!is.null(col_par) && is.na(col_par)) { # if col_par has been set to NA: 
    
    FALSE  # w/o axes 
    
  } else {
    
    TRUE # default
    
  }
  
} # plot_axes().


# plot_col: Plot a vector of colors (as circles or rectangles) -------

plot_col <- function(x,         # a *vector* of colors to be plotted. 
                     ypos = 1,  # position on y axis. 
                     shape = "rect",
                     xlen = 1, ylen = 1, 
                     distance = 0,     # distance between shapes (to be subtracted from size). 
                     plot.new = TRUE,  # TODO: Set to FALSE once done! 
                     ...               # other graphics parameters (e.g., lwd)
) {
  
  # 1. Handle inputs: -----
  
  # Key parameters:
  len_x <- length(x)  # length of vector x (i.e., nr. of colors to plot)
  
  # Should a new plot be created? 
  if (plot.new) {
    
    if (distance > 0) {
      xlim <- c(0 - distance * len_x, len_x * (1 + distance))
    } else {
      xlim <- c(0, len_x)
    }
    
    plot(x = 0, type = "n", xlim = xlim, ylim = c(0, 2))  # create an empty plot.
    
  } else {
    
    # Check for graphic device: 
    if (dev.cur() == 1) {
      stop("No graphic device to be plotted on.  Please open a plot or set plot.new to 'TRUE'.")
    }
    
  }
  
  
  # 2. Position parameters: -----
  
  # Shape centers:
  xpos <- (1:len_x) - 0.5  # subtracting 0.5 assumes a shape width of 1.
  
  # ToDo: Allow scaling shape widths to fill a FIXED total width 
  #       (e.g., each shape with a width of 10/len_x).
  
  # Adjust xpos by distance:
  mid <- mean(xpos)  # get midpoint. 
  add <- cumsum(rep(distance, sum(xpos < mid)))  # values to be added to the 1st half 
  sub <- add * (-1)                              # values to be subtracted from the 2nd half 
  xpos <- xpos + if (len_x %% 2 == 0) {c(rev(sub), add)} else  # even numbers: no center position needed
  {c(rev(sub), 0, add)}                                      # odd numbers: include a middle (0)
  
  # Recycle other constants (to len_x):
  ypos <- rep(ypos, length.out = len_x) 
  xlen <- rep(xlen, length.out = len_x)
  ylen <- rep(ylen, length.out = len_x)
  
  
  # 3. Plot shapes: ------ 
  
  plot_shape(pos_x = xpos,  # x positions of the shapes. 
             pos_y = ypos,  # position in y dimension (given). 
             xlen = xlen, ylen = ylen,  # length of the axes. 
             col_fill = unlist(x),  # filling color. 
             shape = shape,  # shape parameter. 
             ...  # graphics parameters (e.g., lwd)
  )
  
} # plot_col().



# plot_exists: Check whether a plot exists ------ 

plot_exists <- function(){
  
  if (is.null(dev.list())) {FALSE} else {TRUE}
  
} # plot_exists().



# plot_grid: Plot a grid of points (to position objects) ------ 

plot_grid <- function(col = grey(0, .50)){
  
  if (dev.cur() == 1) {  # no graphics device open (null device)
    
    message("No existing plot: Please plot something first...")  
    
  } else {
    
    # Determine dimensions of current plot: ---- 
    
    dim_plot <- par("usr")  # Note added 4% margin if par("xaxs") == "r"
    
    x_min <- dim_plot[1] 
    x_max <- dim_plot[2]
    y_min <- dim_plot[3]
    y_max <- dim_plot[4]
    
    x_dim <- abs(x_max - x_min)  # dimensions
    y_dim <- abs(y_max - y_min)
    
    # max values in figure range (excluding axes):
    if (x_min < 0){
      x_top <- x_min + x_max
    } else {
      x_top <- x_max
    }
    
    if (y_min < 0){
      y_top <- y_min + y_max
    } else {
      y_top <- y_max
    }
    
    # Add default grid: ---- 
    
    grid(col = col)
    
    # Mark extreme points: ---- 
    
    # (a) overall (far corners):
    points(x_min, y_min, pch = 15, col = col, cex = 1)  # bot left
    points(x_max, y_min, pch = 15, col = col, cex = 1)  # bot right
    points(x_min, y_max, pch = 15, col = col, cex = 1)  # top left 
    points(x_max, y_max, pch = 15, col = col, cex = 1)  # top right    
    
    # (b) figure:
    points(0,     0,     pch = 1, col = col, cex = 2)  # plot origin
    points(x_top, y_top, pch = 0, col = col, cex = 2)  # plot max
    
    
    # Plot a grid of points: ---- 
    
    # Parameters: 
    x_dig <- nchar(as.integer(x_dim))  # N of digits
    y_dig <- nchar(as.integer(y_dim)) 
    
    min_dig <- min(x_dig, y_dig)
    max_dig <- max(x_dig, y_dig)
    
    stepsize <- 10^(min_dig - 1)  # use min (to plot points even when dimension differ in order of magnitude)
    
    grid_x <- rep(seq(0, x_top, by = stepsize), times = length(seq(0, y_top, by = stepsize)))  # x/horizontal
    grid_y <- rep(seq(0, y_top, by = stepsize), each =  length(seq(0, x_top, by = stepsize)))  # y/vertical
    
    # Plot points: 
    points(grid_x, grid_y, pch = 3, col = col, cex = 3/4)
    
  }
  
} # plot_grid().

## Check: 
# # Defaults: 
# plot.new()
# plot_grid()
# 
# # Larger plot:
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1000), ylim = c(0, 500))
# plot_grid(col = "red")
# 
# # Dimensions differ by order of magnitude:
# plot(x = 0, y = 0, type = "n", xlim = c(0, 100), ylim = c(0, 10))
# plot_grid(col = "steelblue")



# plot_mar: Set plotting margins ------

plot_mar <- function(mar_all = 0, oma_all = 0){
  
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
  
} # plot_mar().

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



# plot_shape: Plot a shape in some color ------

plot_shape <- function(pos_x, pos_y,  # midpoint of shape  
                       col_fill,      # fill color  
                       col_brd = NA,
                       xlen = 1, ylen = 1,  # height of axis lengths  
                       shape = "rect",      # shape 
                       ...  # other graphics parameters (e.g., lwd): passed to symbols() 
) {
  
  # Prepare inputs for vectorized solution: -----
  
  len_max <- max(c(length(pos_y), length(pos_x)))  # get length of longer position vector. 
  
  # Recycle all vectors to length of longest vector:
  pos_x <- rep(pos_x, length.out = len_max)
  pos_y <- rep(pos_y, length.out = len_max)
  xlen  <- rep(xlen,  length.out = len_max)
  ylen  <- rep(ylen,  length.out = len_max)
  
  
  # Rectangles: ----- 
  
  if (shape == "rect") {
    
    symbols(x = pos_x, y = pos_y, 
            rectangles = cbind(xlen, ylen),  # as matrix: width and height of rectangles
            add = TRUE,
            inches = FALSE,  # use unit on x axis
            fg = col_brd,    # line color
            bg = col_fill,   # filling
            ...              # other graphics parameters (e.g., lwd)
    )
    
  }
  
  # Circles: ----- 
  
  if (shape == "circle") {
    
    symbols(x = pos_x, y = pos_y, 
            circles = xlen/2,  # as vector (only using xlen): radii of circles
            add = TRUE, 
            inches = FALSE,  # use unit on x axis 
            fg = col_brd,    # line color
            bg = col_fill,   # filling
            ...              # graphics parameters (e.g., lwd)
    )
    
  } 
  
} # plot_shape().




# layout_y: Compute y-coordinates given y range, heights of objects, and layout_type options ------

layout_y <- function(y_top, y_bot, height_seq, layout_type) {
  
  y_out  <- NA  # initialize  
  N_lbls <- length(height_seq)
  
  # Handle inputs: ---- 
  
  # Treat layout_type == "flush" as special case of numeric layout_type (fixed distance of 0):
  if (!is.numeric(layout_type) && (layout_type == "flush")) {layout_type <- 0} 
  
  # Handle unknown layout_type: 
  if ( !is.numeric(layout_type) && 
       ( (layout_type != "even") ) ) {
    
    warning("Unknown layout_type: Using 'even' layout...")
    
    layout_type <- "even"
    
  }
  
  # (A) Numeric distance values: Space gaps by some given numeric value(s): ---- 
  
  if (is.numeric(layout_type)) {
    
    line_dist <- layout_type  #  some fixed line distance value(s) (constant or vector)
    # if (is.na(line_dist)) { line_dist <- .10 }  # some default value         
    
    ## OLD: 1 constant line_dist value:
    # line_dist_constant    <- line_dist[1]  # use 1st value as constant
    # line_distance_addends <- c(0, rep(line_dist_constant, (N_lbls - 1)))  # start with 0, N_lbls values overall
    # line_distance_cumsum  <- cumsum(line_distance_addends) 
    
    # NEW: 1 or more line_dist values: 
    # Recycle line_dist to a length of N_lbls (if necessary): 
    if (length(line_dist) < N_lbls){
      line_dist <- rep(line_dist, ceiling(N_lbls/length(line_dist)))[1:N_lbls]
    }
    line_distance_addends <- c(0, line_dist)[1:N_lbls]  # start with 0, N_lbls values overall
    
  } # if if (is.numeric(layout_type)) etc. 
  
  
  # (B) Compute equal distance values for "even" layout_type: ----   
  
  if (!is.numeric(layout_type) && (layout_type == "even")){
    
    # ## 1. Consider only (between) line distances (not line heights): ---- 
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
    
  } # if (layout_type == "even") etc. 
  
  
  # # (C) Flush layout: ----
  # 
  # # Note: layout_type == "flush" is no longer needed, as it is a special case of numeric 
  # #       layout_type = 0" (handled below): 
  # 
  # if (!is.numeric(layout_type) && (layout_type == "flush")){
  #   
  #   # Problem: Rectangles can vary in height (due to cex and font differences).
  #   # Solution: Desired distance between 2 rectangles A (current) and B (next) depends on both heights: 
  #   #           50% of A (current) + 50% of B (next):
  #   
  #   next_height <- c(height_seq[2:N_lbls], 0)           # height of next rect
  #   y_dist <- (1/2 * height_seq) + (1/2 * next_height)  # desired distances in y direction
  #   cum_y_dist <- cumsum(y_dist)                              # cumulative distances in y direction
  #   act_y_dist <- c(0, cum_y_dist)[1:N_lbls]   # shift by 1: start with 0, drop final cum_y_dist
  #   
  #   y_out <- (y_top - act_y_dist)
  #   
  # } # if (layout_type == "flush") etc.   
  
  
  line_distance_cumsum  <- cumsum(line_distance_addends) 
  
  ## Account for different (text/rect) heights: 
  # Problem: Rectangles can vary in height (due to cex and font differences).
  # Solution: Desired distance between 2 rectangles A (current) and B (next) depends on both heights: 
  #           50% of A (current) + 50% of B (next):
  
  next_height <- c(height_seq[2:N_lbls], 0)           # height of next rect
  y_dist <- (1/2 * height_seq) + (1/2 * next_height)  # desired distances in y direction
  cum_y_dist <- cumsum(y_dist)                        # cumulative distances in y direction
  act_y_dist <- c(0, cum_y_dist)[1:N_lbls]   # shift by 1: start with 0, drop final cum_y_dist
  
  y_out <- (y_top - (line_distance_cumsum + act_y_dist))
  
  # print(paste0("y_out = ", y_out))  # 4debugging  
  
  # (D) Warn if lowest y is below y_bot: ----
  min_y_out <- min(y_out, na.rm = TRUE)
  
  # print(paste0("y_bot = ", y_bot))          # 4debugging
  # print(paste0("min_y_out = ", min_y_out))  # 4debugging
  
  if (min_y_out < y_bot) {
    message(paste0("Minimum y of layout is ", min_y_out, ", while y_bot = ", y_bot))
  }
  
  
  # (E) Output: ---- 
  
  return(y_out)
  
} # layout_y(). 

## Check:
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



## ToDo: ------

# (1) layout_y: Implement 2 special "layout_type"s of "flush" and "even" 
#               as special cases of numeric y-values (y_dist = 0 and y_dist = constant)

## eof. ----------