## plot_demo.R | unikn
## spds | uni.kn | 2022 09 17
## ---------------------------

## Demo functions for color palettes.

# A. Common components: ------

# set_seed(): ---- 

set_seed <- function(seed){
  
  if (is.null(seed) || is.na(seed)){
    seed <- sample(1:999, size = 1)  # randomize
  }
  
  set.seed(seed)
  
} # set_seed().



# B. Individual functions: -----

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
  
  
  # Output: Reset par ---- 
  
  on.exit(par(opar))
  
} # plot_bar().

# # Check:
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"), col_par = "grey")
# plot_bar(c("firebrick", "gold", "steelblue", "forestgreen"),
#          n = 7, beside = F, horiz = F, as_prop = F, seed = 7)
# plot_bar(pal_unikn_pref, n = 4, beside = F, horiz = T, as_prop = T, col_par = NA)



# C. Wrapper function: ------

demopal <- function(pal = pal_unikn, col_par = NULL, alpha = 1, type = 1){
  
  plot_types <- c("bar")
  
  pal_name <- deparse(substitute(pal))  # get object name (of input pal)
  
  switch (type,
          # 1: 
          plot_bar(pal = pal, col_par = col_par, alpha = alpha, pal_name = pal_name), 
          # else:
          plot_bar(pal = pal, col_par = col_par, alpha = alpha, pal_name = pal_name)
  )
  
} # demopal(). 


## ToDo: ------

# - Add more plot types.

## eof. ----------