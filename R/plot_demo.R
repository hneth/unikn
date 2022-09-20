## plot_demo.R | unikn
## spds | uni.kn | 2022 09 20
## ---------------------------

## Demo functions for color palettes.

# (A) Common components: ------

# set_seed(): ---- 

set_seed <- function(seed){
  
  if (is.null(seed) || is.na(seed)){
    seed <- sample(1:999, size = 1)  # randomize
  }
  
  set.seed(seed)
  
} # set_seed().



# (B) Individual functions: -----

# plot_bar: A bar plot ---- 

plot_bar <- function(pal, col_par = NULL, alpha = 1, 
                     n = 5,  # scaling: number of categories (for each color) 
                     beside = TRUE, horiz = FALSE, as_prop = FALSE,  # type-specific parameter(s)
                     # args with defaults:
                     main = NULL,
                     sub = NULL, 
                     pal_name = NULL, 
                     seed = NULL){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  # axes <- FALSE
  # cex?
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  set_seed(seed)
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if (alpha < 1){
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
          # col.axis = col_par, col.lab = col_par, 
          # names.arg = names(mx), 
          # legend = TRUE, xlim = c(0, x_max),  # if (legend)
          main = main
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
  
  return(invisible(mx))
  
} # plot_bar().

# # Check:
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"), col_par = "grey")
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"),
#          n = 7, beside = F, horiz = F, as_prop = F, seed = 7)
# plot_bar(pal_unikn_pref, n = 4, beside = F, horiz = T, as_prop = T, col_par = NA)



# plot_polygon: A polygon/mountain range plot ---- 

plot_polygon <- function(pal, col_par = NULL, alpha = 1, 
                         n = 100,  # scaling: x-range
                         # args with defaults:
                         main = NULL,
                         sub = NULL, 
                         pal_name = NULL, 
                         seed = NULL){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  axes <- FALSE
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  if (n_col < 2){ # special case: 
    col_pal <- c(col_pal, par("bg"))  # add bg color of device 
    # col_pal <- c(par("col"), col_pal, par("bg"))  # add fg and bg color of device 
    n_col   <- length(col_pal)
  }
  
  # seed:
  set_seed(seed)
  
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if ( (alpha < 1) & (is.na(col_par) == FALSE) ){
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
  
  # Prepare plot:
  # plot(x = 0, type = "n", 
  #      xlim = c(x_min, x_max), 
  #      ylim = c(y_min, y_max), 
  #      xlab = "X-value", ylab = "Y-value", 
  #      main = "A polygon plot")
  
  plot(0, type = "n",     # (a) empty plot
       # x = dt, col = col_pal,  # (b) generic plot
       xlim = c(x_min, x_max), ylim = c(y_min, y_max),
       main = NA, xlab = NA, ylab = NA
  )
  
  # Create n_col - 1 non-overlapping lines in range:
  for (i in 1:(n_col - 1)){
    
    # Maximum variability:
    if (n_col < 5){
      max_var <- 1/5  # constant
    } else {
      max_var <- 2/i  # mountain range (rugged front, smoother back) 
    }
    
    y <- i + round(c(0, cumsum(runif(N, -max_var, +max_var))), 2)
    
    # Correct min and max y:
    y[y < y_min] <- y_min  
    y[y > y_max] <- y_max
    
    y[y < y_0] <- y_0[y < y_0]  # do not drop below previous/lower line y_0
    # y[y > (i + 6)] <- (i + 6) # impose upper limit
    
    df[paste0("y_", i)] <- y  # record current y value
    
    y_plus <- c(y, rev(y_0))  # prepare for polygon
    polygon(x = x_plus, y = y_plus, col = col_pal[i], border = col_brd) 
    
    y_0 <- y  # remember previous/last/lower y-values
    
  }
  
  # lines(x = x, y = y_0, lwd = 2) 
  
  # Final polygon:
  y <- rep(y_max, length(x))
  df[paste0("y_", n_col)] <- y
  
  y_plus <- c(y, rev(y_0))  # prepare for polygon
  polygon(x = x_plus, y = y_plus, col = col_pal[n_col], border = col_brd)
  
  
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
  
  return(invisible(df))
  
} # plot_polygon().

# # Check:
# plot_polygon(pal_unikn)
# plot_polygon(c("steelblue", "gold", "firebrick", "black"))
# plot_polygon(pal = Seeblau, col_par = usecol(Pinky), seed = 1)  # special case
# x <- plot_polygon(c(rev(pal_seeblau), pal_pinky), col_par = NA, alpha = 1, n = 50)
# head(x)


# plot_table: An area/mosaic plot ---- 

plot_table <- function(pal, col_par = NULL, alpha = 1, 
                       n = 20,  # scaling: instances per dimension is n * n_col
                       # args with defaults:
                       main = NULL,
                       sub = NULL, 
                       pal_name = NULL, 
                       seed = NULL){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  axes <- FALSE
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  set_seed(seed)
  
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if (alpha < 1){
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
  
  plot(#0, 0, type = "n",   # (a) empty plot
    x = tb, col = col_pal,  # (b) generic plot
    border = col_par, 
    main = NA, xlab = NA, ylab = NA
  )
  
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
  
  return(invisible(tb))
  
} # plot_table().

# # Check:
# plot_table(c("steelblue", "gold", "firebrick"), n = 10)
# plot_table(pal_petrol, col_par = NA, n = 10, seed = 3)
# plot_table(pal_unikn_pref, alpha = 2/3, n = 10^5)



# plot_scatter: A plot of points ---- 

#' @importFrom stats runif 

plot_scatter <- function(pal, col_par = NULL, alpha = 1, 
                         n = 500,     # scaling: number of points
                         cex = NULL,  # type-specific parameter(s): point size
                         # args with defaults:
                         main = NULL,
                         sub = NULL, 
                         pal_name = NULL, 
                         seed = NULL){
  
  # Prepare: ---- 
  
  # Parameters currently fixed:
  axes <- TRUE
  
  # Defaults:
  if (is.null(cex)){
    # cex <- sample(c(2, 2.5, 3, 3.5, 4), size = n, replace = TRUE)  # (a) different sizes
    cex <- 3  # (b) all same size
  }
  
  # colors:
  col_pal <- usecol(pal = pal, alpha = alpha)
  n_col <- length(col_pal)
  
  # seed:
  set_seed(seed)
  
  # par: ---- 
  
  opar <- par(no.readonly = TRUE)
  
  if (is.null(col_par)){ # set default:
    col_par <- grDevices::grey(2/3, alpha = 1)  # NA hides border/subtitle
  }
  
  if (alpha < 1){
    col_par <- usecol(col_par, alpha = alpha)  # apply alpha
  }
  
  par(col = col_par)
  
  par(mar = c(4, 3, 3, 2) + 0.1) # default: c(5, 4, 4, 2) + 0.1
  
  
  # Create data: ---- 
  
  # n <- 500
  
  x_min <- 1
  x_max <- n_col
  y_min <- 1
  y_max <- n_col
  
  x <- round(stats::runif(n, min = x_min, max = x_max), 2)
  y <- round(stats::runif(n, min = y_min, max = y_max), 2)
  
  df <- data.frame(x = x, y = y)
  
  # Main plot: ---- 
  
  plot(#0, 0, type = "n",  # (a) empty plot
    x = df$x, y = df$y, type = "p", pch = 20, col = col_pal, cex = cex, # (b) generic plot
    xlim = c(x_min, x_max), ylim = c(y_min, y_max),  
    axes = axes, col.axis = col_par,  
    xlab = NA, ylab = NA)
  
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
  
  return(invisible(df))
  
} # plot_scatter().

# # Check:
# plot_scatter(c("gold", "steelblue", "forestgreen"))
# plot_scatter(pal_unikn, n = 800, col_par = NA)
# x <- plot_scatter(pal_unikn_pref, alpha = 2/3, seed = 101)
# x


# (C) Wrapper function: ------

# demopal: A general function to call specific functions: ---- 

#' Demonstrate a color palette.
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
#'   \item \code{seed} A random seed (for reproducible randomness). 
#'   
#' }
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
#' @param type The type of plot to be used (as character or integer index). 
#' Permissible types are \code{"bar"}, \code{"mosaic"}, \code{"scatter"} (or 1 to 3).
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
  plot_types <- c("bar", "mosaic", "polygon", "scatter")  # as constant
  
  # type: 
  if (is.character(type)){
    
    if (type %in% plot_types){
      type <- which(type == plot_types)
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
         # 2: mosaic/table:
         plot_table(pal = pal, pal_name = pal_name, ...), 
         # 3: polygon:
         plot_polygon(pal = pal, pal_name = pal_name, ...), 
         # 4: scatter/point:
         plot_scatter(pal = pal, pal_name = pal_name, ...), 
         # else:
         plot_polygon(pal = pal, pal_name = pal_name, ...)
  )
  
  # Output: None ----
  
} # demopal(). 


## ToDo: ------

# - Add more plot types.

## eof. ----------