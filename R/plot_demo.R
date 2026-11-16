## plot_demo.R | unikn
## spds | uni.kn | 2026 11 16
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
  
  # Number of categories per color (bounded to a readable range, so a large shared 'n'
  # — e.g., from demopal() — does not explode the bar plot or exceed LETTERS):
  n_cat <- max(1L, min(as.integer(round(n)), 10L))
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
                        n = 1,       # scaling: number of shapes (per color in pal)
                        cex = NULL,  # type-specific parameter(s): shape size
                        pch = 21,    # type-specific parameter(s): shape symbol (21:25 are fillable)
                        order = "keep",  # color order: "keep"/"shuffle"/"rev", a logical, or a custom index vector
                        labels = NA,         # color labels: NA/"no", "names"/"hex"/"rgb" (or combos), or a custom vector
                        label_pos = "below", # label position: "below" each shape, or in its "center"
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
  auto_cex <- is.null(cex)  # auto-scale shape size to the grid cell (below), unless cex is given

  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)

  # color names (for labels): taken from the INPUT palette (usecol() drops names):
  pal_names <- names(unlist(pal, use.names = TRUE))
  if (is.null(pal_names) || length(pal_names) != n_col) { pal_names <- NULL }

  # seed:
  seed <- set_seed(seed)
  # print(seed)  # replicability / 4debugging

  # Color order (applied to col_pal; "shuffle" is reproducible via 'seed', set above):
  if (is.logical(order)){

    idx <- if (isTRUE(order)) sample.int(n_col) else seq_len(n_col)  # TRUE: shuffle; FALSE: keep

  } else if (is.numeric(order)){

    idx <- as.integer(order)  # a custom index vector (into the palette)

  } else {  # a character keyword:

    idx <- switch(tolower(as.character(order)),
                  "keep" = , "original" = , "none" = seq_len(n_col),  # palette order (default)
                  "shuffle" = , "random" = sample.int(n_col),         # randomized (reproducible via seed)
                  "rev" = , "reverse" = rev(seq_len(n_col)),          # reversed
                  { message(paste0("plot_shapes: Unknown 'order' ", add_quotes(order), "; keeping palette order."))
                    seq_len(n_col) })
  }

  idx <- idx[!is.na(idx) & idx >= 1 & idx <= n_col]  # keep only valid indices
  if (length(idx) < 1) { idx <- seq_len(n_col) }     # fall back to palette order

  col_pal <- col_pal[idx]
  n_col   <- length(col_pal)
  if (!is.null(pal_names)) { pal_names <- pal_names[idx] }  # keep names aligned with colors

  # Resolve color labels (per shape), as in seecol() / plot_cube():
  sh_lbls   <- NULL
  known_lbl <- c("name", "names", "rgb", "hex")
  no_lbls   <- (length(labels) == 1) && (is.na(labels) || tolower(labels) %in% c("no", "none", "off"))

  if (!no_lbls){

    lab <- tolower(labels)

    if (all(lab %in% known_lbl)){  # one or more label TYPES (names/rgb/hex):

      types <- unique(ifelse(lab == "name", "names", lab))  # keep order; normalize "name"

      rgb_m <- grDevices::col2rgb(col_pal)
      Rv <- rgb_m["red", ]; Gv <- rgb_m["green", ]; Bv <- rgb_m["blue", ]
      hexv <- toupper(grDevices::rgb(Rv, Gv, Bv, maxColorValue = 255))
      nmv  <- pal_names
      if (is.null(nmv)) { nmv <- hexv } else { nmv[is.na(nmv) | nmv == ""] <- hexv[is.na(nmv) | nmv == ""] }

      make_part <- function(ty) switch(ty,
                                       "names" = nmv,                                   # color names (else HEX)
                                       "rgb"   = paste0("(", Rv, ", ", Gv, ", ", Bv, ")"),  # RGB triplet
                                       "hex"   = hexv)                                  # HEX value

      parts   <- lapply(types, make_part)
      sh_lbls <- do.call(paste, c(parts, sep = "\n"))  # stack types on separate lines

    } else {  # a custom label vector (recycled):

      sh_lbls <- rep(as.character(labels), length.out = n_col)

    }
  }

  show_lbls  <- !is.null(sh_lbls)
  pos_below  <- show_lbls && (tolower(label_pos)[1] %in% c("below", "under", "bottom", "down", "b"))
  pos_center <- show_lbls && !pos_below  # "center"/"centre"/"mid"/"in" (anything not "below")

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

  # (Square cells are achieved via asp = 1 in the plot call below, not pty = "s".)


  # Create data: ----

  i <- 1:n_col  # i colors

  # Arrange the n_col shapes on a near-square grid (filled left-to-right, top-down;
  # a ragged final row is left-aligned):
  ncol_g <- ceiling(sqrt(n_col))        # number of columns (near-square)
  nrow_g <- ceiling(n_col / ncol_g)     # number of rows

  x <- ((i - 1) %%  ncol_g) + 1         # column (1 ... ncol_g), in left-right order
  y <- ((i - 1) %/% ncol_g) + 1         # row from top
  y <- (nrow_g - y) + 1                 # flip to top-down order (row 1 on top)

  # Plot limits (with 1/2-cell padding, so shapes never touch the border):
  x_min <- 0.5;  x_max <- ncol_g + 0.5
  y_min <- 0.5;  y_max <- nrow_g + 0.5

  df <- data.frame(x = x, y = y)
  
  
  # Main plot: ----

  # (a) Empty plot (no axes; asp = 1 gives square, uniformly spaced cells):
  plot(x = x, y = y, type = "n", asp = 1,
       xlim = c(x_min, x_max), ylim = c(y_min, y_max),
       axes = FALSE, xlab = NA, ylab = NA, main = NA,
       ...)

  # (b) Cell size (inches) + auto-scale shape size (unless 'cex' was provided):
  cell_in <- min(abs(grconvertX(1, "user", "inches") - grconvertX(0, "user", "inches")),
                 abs(grconvertY(1, "user", "inches") - grconvertY(0, "user", "inches")))
  if (auto_cex){
    fill <- if (pos_below) 0.60 else 0.92  # "below" labels need room, so shapes are smaller
    # A pch symbol at cex = 1 spans about 0.685 * par("cin")[2] inches (empirical, for pch 21:25):
    cex <- (fill * cell_in) / (0.685 * par("cin")[2])
  }

  # (c) Draw the shapes (filled for pch 21:25):
  points(x = x, y = y, pch = pch, bg = col_pal, col = col_par, cex = cex)

  # (d) Color labels (optional): "center" = inside each shape; "below" = beneath it:
  if (show_lbls){

    lab_lines <- unlist(strsplit(sh_lbls, "\n"))
    max_w  <- max(graphics::strwidth(lab_lines, units = "inches", cex = 1), na.rm = TRUE)
    n_line <- max(vapply(strsplit(sh_lbls, "\n"), length, integer(1)))
    cex_w  <- (0.90 * cell_in) / max_w  # scale label to fit a cell's width

    if (pos_center){  # label inside each shape (auto-contrast text color):

      # Actual shape diameter in USER units (a pch 21:25 symbol spans ~0.375 * cex * cin inches):
      d_user  <- (0.375 * cex * par("cin")[2]) / cell_in
      w_i     <- vapply(strsplit(sh_lbls, "\n"), function(ls) max(graphics::strwidth(ls, units = "user", cex = 1)), numeric(1))
      nl_i    <- vapply(strsplit(sh_lbls, "\n"), length, integer(1))
      h1_u    <- graphics::strheight("Mg", units = "user", cex = 1)  # 1-line height (user units)
      cex_wi  <- (0.72 * d_user) / w_i                               # fit each label's width in its shape
      cex_hi  <- (0.80 * d_user) / (nl_i * h1_u)                     # fit its line(s) in the shape height
      cex_lbl <- pmin(cex_wi, cex_hi, 1.3)                           # per-label size (short names stay larger)

      rgb_lum <- grDevices::col2rgb(col_pal)  # per-shape luminance (to pick text color):
      lum     <- 0.299 * rgb_lum["red", ] + 0.587 * rgb_lum["green", ] + 0.114 * rgb_lum["blue", ]
      lbl_col <- ifelse(lum > 140, grDevices::grey(.10), "white")  # dark on light fills, light on dark

      text(x, y, labels = sh_lbls, col = lbl_col, cex = cex_lbl, xpd = TRUE)

    } else {  # label beneath each shape:

      cex_lbl <- min(cex_w, 1.0)
      text(x, y - 0.42, labels = sh_lbls, col = grDevices::grey(.10), cex = cex_lbl, xpd = TRUE)

    }

  }

  # Titles:
  if (is.null(main)){ # default title:
    plot_type <- "shapes"
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
#' @param pal A color palette (to be illustrated),
#' provided as a color vector, a palette (data frame), or
#' the \emph{name} of a palette object (as a character string,
#' e.g., \code{"pal_petrol"}, which is then resolved to the palette).
#' Default: \code{pal = pal_unikn}.
#'
#' @param type The type of plot to be used (as a character string or integer value).
#' Permissible types are
#' \code{"bar"}, \code{"curve"}, \code{"mosaic"}, \code{"polygon"}, \code{"scatter"},
#' or \code{"shapes"} (or an integer value from 1 to 6, respectively).
#'
#' \code{type} may also be a \emph{vector} of several types
#' (or \code{type = "all"}, for every type), in which case the corresponding
#' demo plots are arranged in a grid (via \code{\link{par}(mfrow)}),
#' to compare a palette across plot types.
#' An invalid or missing \code{type} (\code{NA}) selects a random type
#' (reproducible when \code{seed} is set).
#' Default: \code{type = NA}.
#'
#' @param pal_name A name for the input color palette \code{pal} (shown on bottom-right margin).
#' Default: \code{pal_name = NULL} (deparsing to input name).
#'
#' @param seed A random seed value (for reproducible randomness),
#' passed to the \code{type}-specific plots. Setting \code{seed}
#' also renders a random \code{type} choice reproducible.
#' Default: \code{seed = NULL} (using \emph{and returning} a random seed).
#'
#' @param ... Auxiliary arguments passed to \code{type}-specific plots (see details).
#'
#' @return The random data that was plotted (as an invisible R object);
#' for several \code{type}s, a named list of the data of each plot.
#' 
#' @examples
#' demopal(pal = pal_petrol, type = 1)
#' 
#' my_pal <- c(rev(pal_pinky), pal_seeblau) 
#' # Selecting plot type:
#' demopal(my_pal, type = 2)          # by numeric index
#' demopal(my_pal, type = "polygon")  # by name
#' demopal(my_pal, type = "shapes")   # colored shapes
#'
#' # Passing a palette by its name (as a character string):
#' demopal("pal_seeblau", type = "bar")
#'
#' # Several plot types at once (arranged in a grid):
#' demopal(pal_petrol, type = c("bar", "scatter", "shapes"))
#' demopal(pal_unikn, type = "all", seed = 101)  # every type (reproducible)
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

demopal <- function(pal = pal_unikn, type = NA, pal_name = NULL, seed = NULL, ...){

  # Prepare: ----

  # (a) pal_name: Note whether a name was provided (before deriving a default):
  user_pal_name <- !is.null(pal_name)

  # Derive a default pal_name from the input expression (before 'pal' is reassigned):
  if (!user_pal_name){
    pal_name <- paste(deparse(substitute(pal)), collapse = "")  # object name (of input pal)
  }

  # (b) pal: Allow 'pal' to be the NAME of a palette object (as a character string),
  #     e.g., demopal("pal_petrol"). A single string that is itself a valid color
  #     (e.g., "red") or an unknown name is kept as a (1-color) palette:
  if (is.character(pal) && length(pal) == 1L &&
      !(pal %in% grDevices::colors()) && exists(pal, inherits = TRUE)){

    cand <- get(pal, inherits = TRUE)

    if (is.data.frame(cand) || is.atomic(cand) || is.list(cand)){
      if (!user_pal_name) { pal_name <- pal }  # use the clean object name as label
      pal <- cand
    }
  }

  # Keep an auto-derived pal_name (e.g., from a long inline expression) from
  # overflowing the subtitle; a user-supplied pal_name is left as given:
  if (!user_pal_name && nchar(pal_name) > 24){
    pal_name <- paste0(substr(pal_name, 1, 21), "...")
  }

  if (all(is.na(pal))) { return(NA) }  # handle pal = NA case

  # (c) seed: Fix the random seed ONCE, so that BOTH a random 'type' choice and
  #     the plotted data are reproducible; the resolved seed is passed to each helper:
  seed <- set_seed(seed)

  plot_types <- c("bar", "curve", "mosaic", "polygon", "scatter", "shapes")  # as constant

  # Lookup vector: Map the first 3 letters of each type name (or an alias) to its canonical type:
  type_alias <- c("bar" = "bar",                                          # bar
                  "cur" = "curve",   "ncu" = "curve",   "dis" = "curve",  # curve: "ncurve", "distribution",
                  "his" = "curve",   "nor" = "curve",   "wav" = "curve",  #        "histogram", "normal", "wave"
                  "mos" = "mosaic",  "are" = "mosaic",  "tab" = "mosaic", # mosaic: "area", "table"
                  "pol" = "polygon", "mou" = "polygon", "rid" = "polygon",# polygon: "mountain", "ridge"
                  "sca" = "scatter", "poi" = "scatter",                   # scatter: "point"
                  "sha" = "shapes",  "ico" = "shapes",  "sym" = "shapes") # shapes: "icon", "symbol"

  # (d) type: Helper to resolve 1 'type' (character or numeric) into a valid
  #     integer index (or NA, after a message, if invalid):
  resolve_type <- function(t){

    if (length(t) == 1 && is.na(t)) { return(NA_real_) }  # NA: Choose randomly (below)

    if (is.character(t)){  # a (possibly abbreviated or alternative) type name:

      key <- substr(tolower(t), 1, 3)
      idx <- match(type_alias[key], plot_types)  # NA for unknown keys

      if (is.na(idx)){
        message(paste("The plot type", add_quotes(t), "is not in", add_quotes(plot_types)))
        return(NA_real_)
      }

      return(idx)
    }

    # a numeric type (index):
    t <- as.integer(round(t))

    if (length(t) == 1 && !is.na(t) && t %in% seq_along(plot_types)){
      return(t)
    } else {
      message(paste0("The plot type ", t, " is not in 1:", length(plot_types)))
      return(NA_real_)
    }

  } # resolve_type().

  # Resolve the requested type(s) into a vector of valid integer indices:
  if (length(type) == 1 && is.character(type) &&
      tolower(type) %in% c("all", "every", "grid")){

    type_idx <- seq_along(plot_types)  # "all": Every available type (in a grid)

  } else {

    type_idx <- vapply(type, resolve_type, numeric(1), USE.NAMES = FALSE)  # 1 or more types

  }

  # Replace any invalid/NA type(s) by a random valid type (reproducible, as seed is set):
  na_t <- is.na(type_idx)
  if (any(na_t)){
    type_idx[na_t] <- sample(seq_along(plot_types), size = sum(na_t), replace = TRUE)
  }

  # Main: ----

  # Helper to draw 1 demo plot (of type index 'ti') and return its (invisible) data:
  draw_one <- function(ti){
    switch(ti,
           plot_bar(pal = pal, pal_name = pal_name, seed = seed, ...),      # 1: bar
           plot_ncurve(pal = pal, pal_name = pal_name, seed = seed, ...),   # 2: curve/ncurve
           plot_table(pal = pal, pal_name = pal_name, seed = seed, ...),    # 3: mosaic/table
           plot_polygon(pal = pal, pal_name = pal_name, seed = seed, ...),  # 4: polygon
           plot_scatter(pal = pal, pal_name = pal_name, seed = seed, ...),  # 5: scatter/point
           plot_shapes(pal = pal, pal_name = pal_name, seed = seed, ...)    # 6: shapes
    )
  }

  n_type <- length(type_idx)

  if (n_type == 1){  # (a) a single demo plot:

    out <- draw_one(type_idx)

  } else {  # (b) several demo plots (arranged in a grid):

    opar <- par(no.readonly = TRUE)
    on.exit(par(opar))

    nr <- floor(sqrt(n_type))
    nc <- ceiling(n_type / nr)
    par(mfrow = c(nr, nc))
    plot.new()  # start a new page (as pointing to panel 1 via 'mfg' would draw over the current one)

    out <- vector("list", n_type)

    for (k in seq_len(n_type)){
      # Point to the k-th panel explicitly (as each helper restores 'par' on exit):
      par(mfg = c(((k - 1) %/% nc) + 1, ((k - 1) %% nc) + 1, nr, nc))
      out[[k]] <- draw_one(type_idx[k])
    }

    names(out) <- plot_types[type_idx]

  }

  # Output: The plotted (random) data, returned invisibly ----

  return(invisible(out))

} # demopal().


## Done: ------

# - Exposed plot_shapes() as type "shapes" (6th type, with aliases "icon"/"symbol").
# - Validated numeric 'type' (out-of-range values now message + fall back to random).
# - Made a random 'type' choice reproducible (resolve 'seed' once, up front).
# - Allowed 'type' to be a vector (or "all"): Arrange several demos in a grid.
# - Allowed 'pal' to be the NAME of a palette object (as a character string).
# - Returned the plotted data invisibly (a named list for several types).



# - Fixed bug: Several types (e.g., type = "all") now start a new page (rather than drawing over the current plot).
# - Refactored the type alias mapping into a single named lookup vector (type_alias).


## ToDo next: ------

# - none


## ToDo in future: ------

# - Add 3d-perspective effects (e.g., to scatterplot).
# - Add more plot types.


## eof. ----------