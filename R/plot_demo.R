## plot_demo.R | unikn
## spds | uni.kn | 2024 05 17
## --------------------------

## Demo functions for color palettes.

# (A) Common components: See file plot_util.R --------


# (B) Individual functions: --------

# 1. plot_bar(): A bar plot ------ 

# Note: ... is passed to barplot().

plot_bar <- function(pal, col_par = NULL, alpha = 1, 
                     n = 5,  # scaling: number of categories (for each color) 
                     beside = TRUE, horiz = FALSE, as_prop = FALSE,  # type-specific parameter(s)
                     # args with defaults:
                     main = NULL,
                     sub = NULL, 
                     pal_name = NULL, 
                     seed = NULL,
                     ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  
  # Create data: ---- 
  
  n_cat <- n  # n of categories for each col
  N <- n_col * n_cat  # N of cells/bars
  mx <- matrix(sample(1:10, size = N, replace = TRUE), ncol = n_cat, nrow = n_col, dimnames = list(1:n_col, LETTERS[1:n_cat]))
  
  if (as_prop){ # Convert mx into proportions (per category/column): 
    
    col_sums <- colSums(mx)
    col_sums_rep <- rep(col_sums, each = nrow(mx))
    mx <- mx/col_sums_rep
    
  }
  
  # Main plot: ---- 
  
  legend <- FALSE
  
  if (legend){
    
    # Get x_max (for legend position): 
    if (beside & !horiz & !as_prop){
      
      x_max <- N + 1.50 * n_cat
      
    } else if (beside & horiz & as_prop){
      
      x_max <- max(mx)/max(colSums(mx)) + .10
      
    } else if (!beside & horiz & !as_prop){
      
      x_max <- max(colSums(mx)) + 15
      
    } else if (!beside & horiz & as_prop){
      
      x_max <- 1 + .15
      
    } else {
      
      x_max <- n + (1/3 * n)
      
    }
    
    # print(x_max)  # 4debugging
    
  }
  
  # Titles:
  if (is.null(main)){ # default title:
    plot_type <- "bar"
    
    if (!beside) { plot_type <- paste("stacked", plot_type) }  
    if (horiz) { plot_type <- paste("horizontal", plot_type) }
    
    main <- paste("A", plot_type, "plot")
    if (as_prop) { main <- paste(main, "(as proportions)") }
  }
  
  # title(main = main)  
  
  barplot(mx, 
          beside = beside, horiz = horiz, 
          col = col_pal, border = col_par, density = NA,
          axes = plot_axes(col_par), # col.axis = col_par,
          # names.arg = names(mx), 
          # legend = TRUE, xlim = c(0, x_max),  # if (legend)
          main = main,
          ...
  )
  
  # # Background rectangle (if axes == FALSE):
  # bwd <- .04  # border width
  # rect(xleft = (x_min - bwd), ybottom = (y_min - bwd), 
  #      xright = (x_max + bwd), ytop = (y_max + bwd), 
  #      border = col_par, xpd = TRUE)
  
  # Subtitle:
  if (is.null(sub)){ # default subtitle:
    if (is.null(pal_name)){
      pal_name <- deparse(substitute(pal))  # get object name (of input pal)
    }
    sub  <- paste("Illustrating color palette", pal_name)
  }
  mtext(sub, side = 1, line = 2, adj = 1, cex = .95)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  # print(mx) # as side effect / 4debugging
  
  return(invisible(mx))
  
} # plot_bar().

# # Check:
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"), col_par = "black")
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"),
#          n = 7, beside = F, horiz = F, as_prop = F, seed = 7)
# plot_bar(pal_unikn_pref, n = 4, beside = F, horiz = T, as_prop = T, col_par = NA)



# 2. plot_ncurve(): Plot overlapping normal curves ------

# Note: ... passed to polygon().

#' @importFrom stats runif 
#' @importFrom stats dnorm

plot_ncurve <- function(pal, col_par = NULL, alpha = 2/3, 
                        n = 100,  # scaling: x_max value 
                        # args with defaults:
                        main = NULL,
                        sub = NULL, 
                        pal_name = NULL, 
                        seed = NULL, 
                        ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # Colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # Seed:
  set_seed(seed)
  
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  
  # Create data: ---- 
  
  # Dimensions: 
  x_min <- 0
  x_max <- n
  
  delta_x <- abs(x_max - x_min)  
  n_steps <- max(delta_x + 1, 11)
  
  # Curve parameters:
  mn <- runif(n_col, min = x_min + n/10, max = x_max - n/10)
  sd <- runif(n_col, min = n/10, max = n * 3/10)
  
  # Hack: 1st curve has medium mean and lowest sd/maximum height:
  mn[1] <- runif(1, min = (x_min + n * .20), max = (x_max - n * .20))
  sd[1] <- n/10  # min sd/max height
  
  mn <- round(mn, digits = 2)
  sd <- round(sd, digits = 2)  
  
  df <- data.frame(mn = mn,
                   sd = sd)
  
  # Plot: ----
  
  # Color:
  col_brd <- col_par 
  
  # Loop: 1 curve per n_col:
  for (i in 1:n_col){ 
    
    # Polygon boundaries:
    x_upper <- seq(from = x_min, to = x_max, length.out = n_steps)
    x_lower <- rev(x_upper)
    y_upper <- dnorm(x_upper, mean = mn[i], sd = sd[i])
    y_lower <- rep(0, length(x_lower))
    
    xxp <- c(x_lower, x_upper)
    yyp <- c(y_lower, y_upper)
    
    if (i == 1) { # first curve: 
      
      # Initialize empty plot:
      plot(0, type = "n", 
           xlim = c(min(xxp), max(xxp)), ylim = c(min(yyp), max(yyp)), 
           axes = plot_axes(col_par), # col.axis = col_par,
           xlab = NA, ylab = NA,      # cex.axis = cex_lbl
           main = NA
      )
      
      # Axes:
      # if (axes == FALSE) {
      #   
      #   x_seq <- seq(x_min, x_max, length.out = 11)
      #   x_lbl <- paste0(x_seq) 
      #   y_seq <- seq(min(yyp), max(yyp), length.out = 5)
      #   y_lbl <- paste0(round(y_seq, 2))
      #   
      #   axis(side = 1, at = x_seq, labels = x_lbl)  # x at bottom
      #   axis(side = 2, at = y_seq, labels = y_lbl)  # y at left
      #   
      # }
      
      # Titles:
      if (is.null(main)){ # default title:
        plot_type <- "curve"  # "normal curve"
        main <- paste("A", plot_type, "plot")
      }
      
      title(main = main)
      
      if (is.null(sub)){ # default subtitle:
        if (is.null(pal_name)){
          pal_name <- deparse(substitute(pal))  # get object name (of input pal)
        }
        sub <- paste("Illustrating color palette", pal_name)
      }
      mtext(sub, side = 1, line = 2, adj = 1, cex = .95)
      
      
      # Draw first polygon:
      polygon(xxp, yyp, col = col_pal[i], border = col_brd, ...)  
      
    } else {
      
      # Drow polygons 2 to n_col:
      polygon(xxp, yyp, col = col_pal[i], border = col_brd, ...) 
      
    }
    
  } # for i.
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  # print(df) # as side effect / 4debugging
  
  return(invisible(df))
  
} # plot_ncurve().

# # Check: 
# plot_ncurve(c("steelblue", "gold", "forestgreen", "firebrick"), alpha = 2/3)
# plot_ncurve(pal_unikn_pref, col_par = NA, alpha = 1/3)


# 3. plot_polygon(): A polygon/mountain range plot ------ 

# Note: ... passed to polygon().

plot_polygon <- function(pal, col_par = NULL, alpha = 1, 
                         n = 100,  # scaling: x-range
                         # args with defaults:
                         main = NULL,
                         sub = NULL, 
                         pal_name = NULL, 
                         seed = NULL,
                         ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  if (n_col < 2){ # special case: 
    col_pal <- c(col_pal, par("bg"))  # add bg color of device 
    # col_pal <- c(par("col"), col_pal, par("bg"))  # add fg and bg color of device 
    n_col   <- length(col_pal)
  }
  
  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  # Create data: ---- 
  
  N <- n  # Note: x has N + 1 levels.
  
  # Initialize:
  x <- 0:N
  y_0 <- rep(0, length(x))
  
  x_plus <- c(x, rev(x))  # prepare for polygon
  df <- data.frame(x = x, y_0 = y_0)  # prepare df
  
  # Main plot: ---- 
  
  x_min <- 0
  x_max <- N
  
  y_min <- 0
  y_max <- n_col
  
  col_brd <- col_par 
  
  # Initialize empty plot:
  plot(0, type = "n",
       xlim = c(x_min, x_max), ylim = c(y_min, y_max),
       axes = plot_axes(col_par), # col.axis = col_par,
       xlab = NA, ylab = NA,
       main = NA
  )
  
  # Create n_col - 1 non-overlapping lines in range:
  for (i in 1:(n_col - 1)){
    
    # Maximum variability:
    if (n_col < 10){
      max_var <- 1/5  # constant
    } else {
      max_var <- 3/(i * 2)  # mountain range (rugged front, smoother back) 
    }
    
    y <- i + round(c(0, cumsum(runif(N, -max_var, +max_var))), 2)
    
    # Correct min and max y:
    y[y < y_min] <- y_min  
    y[y > y_max] <- y_max
    
    y[y < y_0] <- y_0[y < y_0]  # do not drop below previous/lower line y_0
    # y[y > (i + 6)] <- (i + 6) # impose upper limit
    
    df[paste0("y_", i)] <- y  # record current y value
    
    y_plus <- c(y, rev(y_0))  # prepare for polygon
    polygon(x = x_plus, y = y_plus, col = col_pal[i], border = col_brd, ...) 
    
    y_0 <- y  # remember previous/last/lower y-values
    
  }
  
  # lines(x = x, y = y_0, lwd = 2) 
  
  # Final polygon:
  y <- rep(y_max, length(x))
  df[paste0("y_", n_col)] <- y
  
  y_plus <- c(y, rev(y_0))  # prepare for polygon
  polygon(x = x_plus, y = y_plus, col = col_pal[n_col], border = col_brd, ...)
  
  
  # # Background rectangle (if axes == FALSE):
  # bwd <- .06  # border width
  # rect(xleft = (x_min - bwd), ybottom = (y_min - bwd), 
  #      xright = (x_max + bwd), ytop = (y_max + bwd), 
  #      border = col_par, xpd = TRUE)
  
  # Titles:
  if (is.null(main)){ # default title:
    plot_type <- "polygon"
    main <- paste("A", plot_type, "plot")
  }
  
  title(main = main)
  
  if (is.null(sub)){ # default subtitle:
    if (is.null(pal_name)){
      pal_name <- deparse(substitute(pal))  # get object name (of input pal)
    }
    sub <- paste("Illustrating color palette", pal_name)
  }
  mtext(sub, side = 1, line = 2, adj = 1, cex = .95)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  # print(df) # as side effect / 4debugging
  
  return(invisible(df))
  
} # plot_polygon().

# # Check:
# plot_polygon(pal_unikn)
# plot_polygon(c("steelblue", "gold", "firebrick", "black"))
# plot_polygon(pal = Seeblau, col_par = usecol(Pinky), seed = 1)  # special case
# x <- plot_polygon(c(rev(pal_seeblau), pal_pinky), col_par = NA, alpha = 1, n = 50)
# head(x)


# 4. plot_table(): An area/mosaic plot ------ 

# Note: ... passed to plot().

plot_table <- function(pal, col_par = NULL, alpha = 1, 
                       n = 20,  # scaling: instances per dimension is n * n_col
                       # args with defaults:
                       main = NULL,
                       sub = NULL, 
                       pal_name = NULL, 
                       seed = NULL,
                       ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # Colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  if (n_col < 2){ # special case: 
    col_pal <- c(col_pal, par("bg"))  # add bg color of device 
    # col_pal <- c(par("col"), col_pal, par("bg"))  # add fg and bg color of device 
    n_col   <- length(col_pal)
  }
  
  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging
  
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  
  
  # Create data: ---- 
  
  s <- n * n_col
  x <- sample(1:n_col, size = s, replace = TRUE)
  y <- sample(1:n_col, size = s, replace = TRUE)
  
  tb <- table(x, y)
  
  
  # Main plot: ---- 
  
  x_min <- 0
  x_max <- 1
  y_min <- 0
  y_max <- 1
  
  # Generic plot (mosaic plot): 
  plot(#0, 0, type = "n",   # (a) empty plot
    x = tb, col = col_pal,  # (b) generic plot
    border = col_par, 
    # axes = plot_axes(col_par), # col.axis = col_par,
    xlab = NA, ylab = NA,
    main = NA,
    ...)
  
  # Background rectangle (if axes == FALSE):
  bwd <- .06  # border width
  rect(xleft = (x_min - bwd), ybottom = (y_min - bwd),
       xright = (x_max + bwd), ytop = (y_max + bwd),
       border = col_par, xpd = TRUE)
  
  # Titles:
  if (is.null(main)){ # default title:
    plot_type <- "mosaic" # "table"
    main <- paste("A", plot_type, "plot")
  }
  
  title(main = main)
  
  if (is.null(sub)){ # default subtitle:
    if (is.null(pal_name)){
      pal_name <- deparse(substitute(pal))  # get object name (of input pal)
    }
    sub  <- paste("Illustrating color palette", pal_name)
  }
  mtext(sub, side = 1, line = 2, adj = 1, cex = .95)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  # print(tb) # as side effect / 4debugging
  
  return(invisible(tb))
  
} # plot_table().

# # Check:
# plot_table(c("steelblue", "gold", "firebrick"), n = 10)
# plot_table(pal_petrol, col_par = NA, n = 10, seed = 3)
# plot_table(pal_unikn_pref, alpha = 2/3, n = 10^5)



# 5. plot_scatter(): A plot of scattered dots / points ------ 

# Note: ... passed to plot().

#' @importFrom stats runif 

plot_scatter <- function(pal, col_par = NULL, alpha = 2/3, 
                         n = 500,     # scaling: number of points
                         cex = NULL,  # type-specific parameter(s): point size
                         # args with defaults:
                         main = NULL,
                         sub = NULL, 
                         pal_name = NULL, 
                         seed = NULL,
                         ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # Defaults:
  if (is.null(cex)){
    # cex <- sample(c(2, 2.5, 3, 3.5, 4), size = n, replace = TRUE)  # (a) different sizes
    cex <- 3  # (b) all same size
  }
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  
  # Create data: ---- 
  
  # n <- 500
  
  x_min <- 0
  x_max <- n_col
  y_min <- 0
  y_max <- n_col
  
  x <- round(stats::runif(n, min = x_min, max = x_max), 2)
  y <- round(stats::runif(n, min = y_min, max = y_max), 2)
  
  df <- data.frame(x = x, y = y)
  
  
  # Modify df (to add 3d-perspective effect): ----
  
  perspective_3d <- FALSE # TRUE
  
  if (perspective_3d){
    
    # Reduce viewing level (horizon):
    # df$y  <- .25 * df$y
    # y_max <- max(df$y)
    
    # Re-arrange rows of df:
    df <- df[order(y, decreasing = TRUE), ]  # lower y-values on top
    
    # Reduce size of points with larger y values:
    max_cex_reduce <- cex/2
    
    max_y <- max(df$y)
    min_y <- min(df$y)
    y_pos <- df$y > 1     # logical index of values to reduce
    cex   <- rep(cex, n)  # as vector
    
    # cex[y_pos] <- cex[y_pos] / (.999 * df$y[y_pos])  # shrink object cex by y-value
    cex[y_pos] <- cex[y_pos] - max_cex_reduce * df$y[y_pos]/(max_y - min_y)
    
    # x-distortion: Reduce range of x-values depending on y-values:
    
    # shift points with high y-values to right:
    max_shift_right <- 2
    max_shift_left  <- 2
    
    max_x <- max(df$x)
    min_x <- min(df$x)    
    max_y <- max(df$y)
    min_y <- min(df$y)
    
    old_x_range <- (max_x - min_x)
    new_x_range <- (max_x - max_shift_left) - (min_x + max_shift_right)
    
    scale_y <- df$y / (max_y - min_y)
    scale_x <- df$x / old_x_range
    
    new_x <- (min_x + max_shift_right) + scale_x * new_x_range
    
    df$x <- new_x # * scale_y
    
    
    # + (max_shift_right * df$y / (max_y - min_y)) 
    #             - (max_shift_left  * df$y / (max_y - min_y))   # +++ here now +++
    
    # remove border:
    # col_par <- NA
    
  } # if (perspective_3d).
  
  
  # Main plot: ---- 
  
  plot(#0, 0, type = "n",  # (a) empty plot
    x = df$x, y = df$y, type = "p", 
    pch = 21, bg = col_pal, col = col_par, cex = cex, # (b) generic plot
    xlim = c(x_min, x_max), ylim = c(y_min, y_max),  
    axes = plot_axes(col_par), # col.axis = col_par,
    xlab = NA, ylab = NA,
    main = NA,
    ...
  )
  
  # # Background rectangle (if axes == FALSE):
  # bwd <- .08  # border width
  # rect(xleft = (x_min - bwd), ybottom = (y_min - bwd), 
  #      xright = (x_max + bwd), ytop = (y_max + bwd), 
  #      border = col_par, xpd = TRUE)
  
  # Titles:
  if (is.null(main)){ # default title:
    plot_type <- "scatter"
    main <- paste("A", plot_type, "plot")
  }
  title(main = main)
  
  if (is.null(sub)){ # default subtitle:
    if (is.null(pal_name)){
      pal_name <- deparse(substitute(pal))  # get object name (of input pal)
    }
    sub <- paste("Illustrating color palette", pal_name)
  }
  mtext(sub, side = 1, line = 2, adj = 1, cex = .95)
  
  # Points:
  # points(x, y, pch = 20, col = col_pal, cex = 3)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  # print(df) # as side effect / 4debugging
  
  return(invisible(df))
  
} # plot_scatter().

# # Check:
# plot_scatter(c("gold", "steelblue", "forestgreen"))
# plot_scatter(pal_unikn, n = 800, col_par = NA)
# x <- plot_scatter(pal_unikn_pref, alpha = 2/3, seed = 101)
# x

# 3d-effect (with perspective_3d <- TRUE):
# plot_scatter(pal_unikn, n = 1000, alpha = 1, cex = 3, col_par = "black")


# + plot_shapes(): An array of shapes / icons ------ 

plot_shapes <- function(pal, col_par = NULL, alpha = 2/3, 
                        n = 1,     # scaling: number of shapes (per color in pal)
                        cex = NULL,  # type-specific parameter(s): point size
                        # args with defaults:
                        main = NULL,
                        sub = NULL, 
                        pal_name = NULL, 
                        seed = NULL,
                        ...
){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  
  # Defaults:
  if (is.null(cex)){
    # cex <- sample(c(2, 2.5, 3, 3.5, 4), size = n, replace = TRUE)  # (a) different sizes
    cex <- 5  # (b) all same size
  }
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ((is.na(alpha) == FALSE) && (alpha < 1)){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  par(pty = "s") # generates a square plotting region
  
  
  # Create data: ---- 
  
  # n <- 500
  
  i <- 1:n_col  # i colors
  
  x_min <- 1
  x_max <- 5
  y_min <- 1
  y_max <- ((n_col - 1) %/% x_max) + 1
  
  
  x <- ((i - 1) %%  x_max) + 1  # in left-right order
  
  y <- ((i - 1) %/% x_max) + 1
  y <- (y_max - y) + 1  # in top-down order
  
  # Reduce/scale values:
  x <- x
  y <- y
  
  df <- data.frame(x = x, y = y)
  
  
  # Main plot: ---- 
  
  plot(x = x, y = y, 
       xlim = c(x_min, x_max), ylim = c(y_min, y_max), 
       cex = cex, bg = col_pal, 
       ...)  # pass pch
  
  
  # +++ here now +++
  
  
  # Output: ----
  
  on.exit(par(opar))
  
  print(df) # as side effect / 4debugging
  
  return(invisible(df))
  
} # plot_shapes().

# Check:
# plot_shapes(usecol(c("gold", "deepskyblue", "deeppink"), n = 13), pch = 23)


# (C) Wrapper function: --------

# 6. demopal(): A general function to call specific functions ------ 

#' Demonstrate a color palette (in a plot) 
#'
#' \code{demopal} provides an example plot of some \code{type} 
#' to illustrate a color palette \code{pal}. 
#' 
#' The \code{demopal} wrapper function passes a range of arguments to more specific functions. 
#' Common arguments include:
#' 
#' \itemize{
#' 
#'   \item \code{col_par} Default color for \code{par(col)}; 
#'   \item \code{alpha} Default value for color transparency (in 0:1);  
#'   \item \code{n} A scaling parameter (for random data generation);  
#' 
#'   \item \code{main} plot title (on top); 
#'   \item \code{sub} plot subtitle (on right margin);  
#'   
#'   \item \code{seed} A random seed value (for reproducible randomness). 
#'   
#' }
#' 
#' The fit between a color palette \code{pal} and plot \code{type} 
#' depends on the uses of colors in a plot. 
#' For instance, overlaps of transparent color areas can be evaluated 
#' with plot \code{type = "curve"} or plot \code{type = "scatter"} 
#' (and \code{0 < alpha < 1}). 
#' 
#' Some functions additionally accept type-specific arguments 
#' (e.g., \code{beside}, \code{horiz}, and \code{as_prop}, for plot \code{type = "bar"}, 
#' and \code{cex} for plot \code{type = "scatter"}). 
#' 
#' The type-specific functions usually generate some random data 
#' (scaled by a parameter \code{n}) that is being plotted. 
#' This data is returned (as an invisible R object)  
#' to enable a plot's reconstruction. 
#' 
#' @param pal A color palette (to be illustrated).
#' Default: \code{pal = pal_unikn}. 
#' 
#' @param type The type of plot to be used (as character string or integer value). 
#' Permissible types are 
#' \code{"bar"}, \code{"curve"}, \code{"mosaic"}, \code{"polygon"}, or \code{"scatter"} 
#' (or an integer value from 1 to 5, respectively).
#' 
#' @param pal_name A name for the input color palette \code{pal} (shown on bottom-right margin). 
#' Default: \code{pal_name = NULL} (deparsing to input name).
#' 
#' @param ... Auxiliary arguments passed to \code{type}-specific plots (see details). 
#' 
#' @return The random data that was plotted (as an invisible R object). 
#' 
#' @examples
#' demopal(pal = pal_petrol, type = 1)
#' 
#' my_pal <- c(rev(pal_pinky), pal_seeblau) 
#' # Selecting plot type:
#' demopal(my_pal, type = 2)          # by numeric index
#' demopal(my_pal, type = "polygon")  # by name
#' 
#' # Passing type-specific arguments:
#' demopal(type = "scatter", col_par = "black", n = 200, cex = c(2, 4, 6), seed = 101)
#' 
#' @family color functions
#' 
#' @aliases democol
#' @aliases demofun
#' @aliases demoplot
#' 
#' @seealso 
#' \code{\link{seepal}} for plotting color palettes;  
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{shades_of}} to defining shades of a given color; 
#' \code{\link{ac}} for adjusting color transparency; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @import graphics 
#' @import grDevices 
#' 
#' @export 

demopal <- function(pal = pal_unikn, type = NA, pal_name = NULL, ...){
  
  # Prepare: ---- 
  
  if (all(is.na(pal))) { return(NA) }  # handle pal = NA case
  
  plot_types <- c("bar", "curve", "mosaic", "polygon", "scatter")  # as constant
  
  # type:
  if (is.character(type)){
    
    # Increase robustness:
    type_1_3 <- substr(tolower(type), 1, 3)
    ptyp_1_3 <- substr(plot_types, 1, 3)
    
    # Alternative names: 
    
    # "mosaic":
    if (type_1_3 == "are") { type_1_3 <- "mos" }  # "area"  
    if (type_1_3 == "tab") { type_1_3 <- "mos" }  # "table"
    
    # "polygon":
    if (type_1_3 == "mou") { type_1_3 <- "pol" }  # "mountain"
    if (type_1_3 == "rid") { type_1_3 <- "pol" }  # "ridge"
    
    # "curve":
    if (type_1_3 == "dis") { type_1_3 <- "cur" }  # "distribution"
    if (type_1_3 == "his") { type_1_3 <- "cur" }  # "histogram"
    if (type_1_3 == "ncu") { type_1_3 <- "cur" }  # "ncurve"
    if (type_1_3 == "nor") { type_1_3 <- "cur" }  # "normal"
    if (type_1_3 == "wav") { type_1_3 <- "cur" }  # "wave"
    
    # "scatter":
    if (type_1_3 == "poi") { type_1_3 <- "sca" }  # "point"
    
    if (type_1_3 %in% ptyp_1_3){
      type <- which(type_1_3 == ptyp_1_3)  # numeric
    } else {
      plot_types_q <- add_quotes(plot_types)
      message(paste("The plot type", add_quotes(type), "is not in", plot_types_q))
      type <- NA
    }
  }
  
  if (is.na(type) | is.numeric(type) == FALSE){
    type <- sample(1:length(plot_types), size = 1)  # random type
  }
  
  if (is.null(pal_name)){
    pal_name <- deparse(substitute(pal))  # get object name (of input pal)
  }
  
  # Main: ---- 
  
  switch(type,
         # 1: bar: 
         plot_bar(pal = pal, pal_name = pal_name, ...), 
         # 2. curve/ncurve:
         plot_ncurve(pal = pal, pal_name = pal_name, ...), 
         # 3: mosaic/table:
         plot_table(pal = pal, pal_name = pal_name, ...), 
         # 4: polygon:
         plot_polygon(pal = pal, pal_name = pal_name, ...), 
         # 5: scatter/point:
         plot_scatter(pal = pal, pal_name = pal_name, ...), 
         # else:
         plot_polygon(pal = pal, pal_name = pal_name, ...)
  )
  
  # Output: None ----
  
} # demopal(). 


## ToDo: --------

# - Add 3d-perspective effects (e.g., to scatterplot).
# - Add more plot types.

## eof. ----------