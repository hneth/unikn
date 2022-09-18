## plot_demo.R | unikn
## spds | uni.kn | 2022 09 18
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

# plot_bar: Bar plot ---- 

plot_bar <- function(pal, col_par = NULL, alpha = 1, 
                     n = 5,  # scaling: number of categories (for each color) 
                     beside = TRUE, horiz = FALSE, as_prop = FALSE, # bar plot specific parameters  
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
  plot_type <- "bar"
  
  if (!beside) { plot_type <- paste("stacked", plot_type) }  
  if (horiz) { plot_type <- paste("horizontal", plot_type) }
  
  plot_title <- paste("A", plot_type, "plot")
  if (as_prop) { plot_title <- paste(plot_title, "(as proportions)") }
  
  # title(main = paste("A", plot_type, "plot"))  
  
  barplot(mx, 
          beside = beside, horiz = horiz, 
          col = col_pal, border = col_par, density = NA,
          # col.axis = col_par, col.lab = col_par, 
          # names.arg = names(mx), 
          # legend = TRUE, xlim = c(0, x_max),  # if (legend)
          main = plot_title
  )
  
  # # Background rectangle (if axes == FALSE):
  # bwd <- .04  # border width
  # rect(xleft = (x_min - bwd), ybottom = (y_min - bwd), 
  #      xright = (x_max + bwd), ytop = (y_max + bwd), 
  #      border = col_par, xpd = TRUE)
  
  # Subtitle:
  if (is.null(pal_name)){
    pal_name <- deparse(substitute(pal))  # get object name (of input pal)
  }
  subnote  <- paste("Illustrating color palette", pal_name)
  mtext(subnote, side = 1, line = 2, adj = 1, cex = .95)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  return(invisible(mx))
  
} # plot_bar().

# # Check:
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"), col_par = "grey")
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"),
#          n = 7, beside = F, horiz = F, as_prop = F, seed = 7)
# plot_bar(pal_unikn_pref, n = 4, beside = F, horiz = T, as_prop = T, col_par = NA)


# plot_table: Area/mosaic plot: ---- 

plot_table <- function(pal, col_par = NULL, alpha = 1, 
                       n = 20,  # scaling: instances per dimension is n * n_col 
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
  plot_type <- "mosaic" # "table"
  title(main = paste("A", plot_type, "plot"))
  
  if (is.null(pal_name)){
    pal_name <- deparse(substitute(pal))  # get object name (of input pal)
  }
  subnote  <- paste("Illustrating color palette", pal_name)
  mtext(subnote, side = 1, line = 2, adj = 1, cex = .95)
  
  
  # Output: ---- 
  
  on.exit(par(opar))
  
  return(invisible(tb))
  
} # plot_table().

# # Check:
# plot_table(c("steelblue", "gold", "firebrick"), n = 10)
# plot_table(pal_petrol, col_par = NA, n = 10, seed = 3)
# plot_table(pal_unikn_pref, alpha = 2/3, n = 10^5)


# (C) Wrapper function: ------

demopal <- function(pal = pal_unikn, type = NA, ...){
  
  # Prepare: ---- 
  plot_types <- c("bar", "mosaic")  # as constant
  
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
  
  pal_name <- deparse(substitute(pal))  # get object name (of input pal)
  
  # Main: ---- 
  
  switch(type,
         # 1: bar: 
         plot_bar(pal = pal, pal_name = pal_name, ...), 
         # 2: mosaic/table:
         plot_table(pal = pal, pal_name = pal_name, ...), 
         # else:
         plot_bar(pal = pal, pal_name = pal_name, ...)
  )
  
  # Output: None ----
  
} # demopal(). 


## ToDo: ------

# - Add more plot types.

## eof. ----------