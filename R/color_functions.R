## color_functions.R  |  unikn
## hn  |  uni.kn |  2019 02 18
## ---------------------------

## Define color-related functions 
## (e.g., for choosing from, plotting, and creating color palettes). 

## Functions: ------


# pal_which: Get some [which] specific colors of a palette [pal]: ------ 

# - Documentation: ---- 

#' Get specific colors of a color palette.
#'
#' \code{pal_which} returns the colors of a color palette \code{pal} 
#' that are specified in a numeric vector \code{which}.
#' 
#' @param which A numeric vector specifying the desired colors of pal (by position) 
#' or the character string \code{"all"} (to get all colors of \code{pal}). 
#' Default: \code{which = "all"}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' pal_which()  # returns default color palette
#' pal_which(which = "all")
#' pal_which(which = 1:3)
#' pal_which(which = rep(1, 20))
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#'
#' @export

# - Definition: ---- 

pal_which <- function(which = "all", pal = pal_unikn){
  
  # handle inputs:
  stopifnot(length(pal) > 0)
  if (is.character(which) && tolower(which) == "all") { which <- c(1:length(pal)) }
  stopifnot(is.numeric(which))
  
  out <- NA    # initialize
  
  # get which colors of pal: 
  out <- pal[which]
  
  return(out)
  
}

# ## Check:
# pal_which()
# pal_which(which = "all")
# pal_which(which = 1:3)
# pal_which(which = rep(1, 20))




# pal_n: Function to get [n] (specific, suitable) colors of a known palette [pal]: ------ 

# - Documentation: ---- 

#' Get n dedicated colors of a known color palette.
#'
#' \code{pal_n} returns \code{n} dedicated colors of a known color palette \code{pal}. 
#' 
#' @param n A number specifying the desired number colors of pal (as a number) 
#' or the character string \code{"all"} (to get all colors of \code{pal}). 
#' Default: \code{n = "all"}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' pal_n()                   # all colors of default color palette
#' pal_n(n = 4)              # 4 colors of default color palette
#' pal_n(pal = pal_seeblau)  # all colors of another color palette
#' 
#' # Default pal:
#' pal_n(1)   # n = 1 color of default color pal
#' pal_n(2)
#' pal_n(4)
#' pal_n(6)
#' pal_n(8)
#' pal_n(10)  # n = 10 colors of default color pal
#' 
#' pal_n(99)  # returns maximal number of colors: pal_unikn_plus (11)
#' 
#' # Other palettes pal:
#' pal_n(3,  RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' pal_n(10, RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_n_sq}} for \code{n^2} dedicated colors of a color palette; 
#' \code{\link{pal_which}} for specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @export

# - Definition: ---- 

pal_n <- function(n = "all", pal = pal_unikn){
  
  # handle inputs:
  stopifnot(length(pal) > 0)
  
  if (is.character(n) && tolower(n) == "all") { n <- length(pal) }
  stopifnot(is.numeric(n))
  stopifnot(n > 0)
  
  if (n > length(pal)){  # n exceeds numbers of available colors in pal: 
    
    # Special case: Switch to longer pal_unikn_plus when (pal == pal_unikn): 
    if (isTRUE(all.equal(pal, pal_unikn))) { 
      
      message(paste0("n exceeds the 10 of colors in pal_unikn: \nUsing pal_unikn_plus with n = ", length(pal_unikn_plus), " instead."))
      
      pal <- pal_unikn_plus
      n <- length(pal)
      
    } else {  # (+) any other pal:
      
      message(paste0("n exceeds n of colors in pal: Using maximum n = ", length(pal)))
      n <- length(pal)
      
    }
    
  }
  
  out <- NA    # initialize
  
  # Select colors based on current pal and n: 
  
  # (A) Basic color palettes: 
  if (isTRUE(all.equal(pal, pal_unikn))) {  # (1) pal == pal_unikn:
    
    # message("Get n specific colors of pal_unikn:")
    
    switch(n,
           out <- pal[c("seeblau3")],  # 1 preferred color
           out <- pal[c("seeblau4", "seeblau2")],  # 2
           out <- pal[c("seeblau4", "seeblau2", "white")],  # 3   
           out <- pal[c("seeblau4", "seeblau2", "white", "black")],  # 4
           out <- pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],  # 5
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau3", "black")],  # 6
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 7
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 8
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau1", "seegrau2", "seegrau3", "black")],  # 9
           out <- pal  # all 10 colors of pal_unikn
    )
    
  } else if (isTRUE(all.equal(pal, pal_unikn_plus))) {  # (2) pal == pal_unikn_plus:
    
    # message("Get n specific colors of pal_unikn_plus:")
    
    switch(n,
           out <- pal[c("seeblau3")],  # 1 preferred color
           out <- pal[c("seeblau4", "seeblau2")],  # 2
           out <- pal[c("seeblau4", "seeblau2", "white")],  # 3   
           out <- pal[c("seeblau4", "seeblau2", "white", "black")],  # 4
           out <- pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],  # 5
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau3", "black")],  # 6
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 7
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 8
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau1", "seegrau2", "seegrau3", "black")],  # 9
           out <- pal[c("seeblau5", "seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau1", "seegrau2", "seegrau3", "black")],  # 10
           out <- pal  # all 11 colors of pal_unikn_plus
    )
    
    # (B) Additional color palettes:      
  } else if (isTRUE(all.equal(pal, pal_seeblau))) {  # (1) pal_seeblau:
    
    # message("Get n specific colors of pal_seeblau:")
    
    switch(n,
           out <- pal[c("seeblau3")],  # 1 preferred color
           out <- pal[c("seeblau4", "seeblau2")],  # 2
           out <- pal[c("seeblau5", "seeblau3", "seeblau1")],  # 3   
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1")],  # 4              
           out <- pal  # all 5 colors of pal_seeblau
    )
    
  } else if (isTRUE(all.equal(pal, pal_peach))) {  # (2) pal_peach:
    
    # message("Get n specific colors of pal_peach:")
    
    switch(n,
           out <- pal[c("peach4")],  # 1 preferred color
           out <- pal[c("peach4", "peach2")],  # 2
           out <- pal[c("peach5", "peach3", "peach1")],  # 3   
           out <- pal[c("peach5", "peach4", "peach2", "peach1")],  # 4              
           out <- pal  # all 5 colors of pal_peach
    )
    
  } else if (isTRUE(all.equal(pal, pal_grau))) {  # (3) pal_grau:
    
    # message("Get n specific colors of pal_grau:")
    
    switch(n,
           out <- pal[c("grau3")],  # 1 preferred color 
           out <- pal[c("grau4", "grau2")],  # 2
           out <- pal[c("grau5", "grau3", "grau1")],  # 3   
           out <- pal[c("grau5", "grau4", "grau2", "grau1")],  # 4              
           out <- pal  # all 5 colors of pal_grau
    )
    
  } else if (isTRUE(all.equal(pal, pal_petrol))) {  # (4) pal_petrol:
    
    # message("Get n specific colors of pal_petrol:")
    
    switch(n,
           out <- pal[c("petrol4")],  # 1 preferred color
           out <- pal[c("petrol4", "petrol2")],  # 2
           out <- pal[c("petrol5", "petrol3", "petrol1")],  # 3   
           out <- pal[c("petrol5", "petrol4", "petrol2", "petrol1")],  # 4              
           out <- pal  # all 5 colors of pal_petrol 
    )
    
  } else if (isTRUE(all.equal(pal, pal_seegruen))) {  # (5) pal_seegruen:
    
    # message("Get n specific colors of pal_seegruen:")
    
    switch(n,
           out <- pal[c("seegruen4")],  # 1 preferred color
           out <- pal[c("seegruen4", "seegruen2")],  # 2
           out <- pal[c("seegruen5", "seegruen3", "seegruen1")],  # 3   
           out <- pal[c("seegruen5", "seegruen4", "seegruen2", "seegruen1")],  # 4              
           out <- pal  # all 5 colors of pal_seegruen 
    )
    
  } else if (isTRUE(all.equal(pal, pal_karpfenblau))) {  # (6) pal_karpfenblau:
    
    # message("Get n specific colors of pal_karpfenblau:")
    
    switch(n,
           out <- pal[c("karpfenblau4")],  # 1 preferred color
           out <- pal[c("karpfenblau4", "karpfenblau2")],  # 2
           out <- pal[c("karpfenblau5", "karpfenblau3", "karpfenblau1")],  # 3   
           out <- pal[c("karpfenblau5", "karpfenblau4", "karpfenblau2", "karpfenblau1")],  # 4              
           out <- pal  # all 5 colors of pal_karpfenblau 
    )
    
  } else if (isTRUE(all.equal(pal, pal_pinky))) {  # (7) pal_pinky:
    
    # message("Get n specific colors of pal_pinky:")
    
    switch(n,
           out <- pal[c("pinky4")],  # 1 preferred color
           out <- pal[c("pinky4", "pinky2")],  # 2
           out <- pal[c("pinky5", "pinky3", "pinky1")],  # 3   
           out <- pal[c("pinky5", "pinky4", "pinky2", "pinky1")],  # 4              
           out <- pal  # all 5 colors of pal_pinky 
    )
    
  } else if (isTRUE(all.equal(pal, pal_Bordeaux))) {  # (8) pal_Bordeaux:
    
    # message("Get n specific colors of pal_Bordeaux:")
    
    switch(n,
           out <- pal[c("Bordeaux4")],  # 1 preferred color
           out <- pal[c("Bordeaux4", "Bordeaux2")],  # 2
           out <- pal[c("Bordeaux5", "Bordeaux3", "Bordeaux1")],  # 3   
           out <- pal[c("Bordeaux5", "Bordeaux4", "Bordeaux2", "Bordeaux1")],  # 4              
           out <- pal  # all 5 colors of pal_Bordeaux 
    )
    
  } else {  # (+) any other pal:
    
    message("Unknown pal: Returning the first n colors:")
    
    out <- pal_which(which = 1:n, pal = pal)  # first n colors of pal
    
  }
  
  return(out)
  
}

# ## Check:
# pal_n()    # all default colors
# 
# # Default palette pal:
# pal_n(1)   # n = 1 color of default color pal
# pal_n(2)
# pal_n(4)
# pal_n(6)
# pal_n(8)
# pal_n(10)  # n = 10 colors of default color pal
# 
# pal_n(11)  # return maximal number of colors
# 
# # Other palettes pal:
# pal_n(3,  RColorBrewer::brewer.pal(n = 5, name = "Blues"))
# pal_n(10, RColorBrewer::brewer.pal(n = 5, name = "Blues"))




# pal_n_sq: Get n^2 (n x n) specific colors of a palette [pal]: ------ 

# - Documentation: ---- 

#' Get n^2 dedicated colors of a color palette.
#'
#' \code{pal_n_sq} returns \code{n^2} dedicated colors of a color palette \code{pal} 
#' (up to a maximum of \code{n + 1} colors). 
#' 
#' Note that \code{pal_n_sq} was created for \code{pal = \link{pal_unikn}} 
#' for small values of \code{n} (\code{n = 1, 2, 3}) and 
#' returns the 11 colors of \code{\link{pal_unikn_plus}} for any \code{n > 3}. 
#' 
#' Use the more specialized function \code{\link{pal_n}} for choosing 
#' \code{n} dedicated colors of a known color palette. 
#' 
#' @param n A number specifying the desired number colors of pal (as a number) 
#' or the character string \code{"all"} (to get all colors of \code{pal}). 
#' Default: \code{n = "all"}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' pal_n_sq(1) #  1 color: seeblau3
#' pal_n_sq(2) #  4 colors
#' pal_n_sq(3) #  9 colors (5: white)
#' pal_n_sq(4) # 11 colors of pal_unikn_plus (6: white)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{plot_pal}} to plot color palettes; 
#' \code{\link{col_scale}} to create color scales (gradients);  
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @export

# - Definition: ---- 

pal_n_sq <- function(n = "all", pal = pal_unikn){
  
  # handle inputs:
  stopifnot(length(pal) > 0)
  
  if (is.character(n) && tolower(n) == "all") { n <- length(pal) }
  stopifnot(is.numeric(n))
  stopifnot(n > 0)
  
  out <- NA    # initialize
  
  if (n == 1) {
    
    out <- pal[2]  #  1 preferred color: seeblau3
    
  } else if (n == 2) {
    
    out <- pal[c(1, 3, 5, 10)]  #  4 colors: seeblau4, seeblau2, white, black
    
  } else if (n == 3) {
    
    out <- pal[-7]  #  9 colors: seeblau > white > black
    
  } else { # n > 3: 9+ colors: 
    
    if (isTRUE(all.equal(pal, pal_unikn))) {
      
      # out <- pal[c(1:2, 2:10)]   # 11 colors: seeblau (seeblau.3: 2x) > white (6 = mid) > black (11) [default]  
      
      out <- pal_unikn_plus        # 11 colors: seeblau.5 > white (6 = mid) > black (11)  
      
    } else { # any other pal:
      
      out <- pal
      
    }
    
  } # if (n == etc.)
  
  return(out)
  
}

## Check:
# pal_n_sq(1)
# pal_n_sq(2)
# pal_n_sq(3) #  9 colors
# pal_n_sq(4) # 11 colors = maximum of (n + 1) colors.



# plot_pal: Plot information on a given color palette [pal]: ------ 

# - Documentation: ---- 

#' Plot a color palette.
#'
#' \code{plot_pal} plots information on a color palette \code{pal}.
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' plot_pal()  # plots default color palette 
#' plot_pal(pal_unikn_plus) 
#' 
#' ## Not run: 
#' 
#' # RColorBrewer palettes: 
#' plot_pal(RColorBrewer::brewer.pal(n = "all", name = "Set1"))
#' plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' # yarrr palettes: 
#' plot_pal(yarrr::piratepal(palette = "appletv"))
#' plot_pal(yarrr::piratepal(palette = "google"))
#' 
#' ## End(Not run)
#'
#' @family color palettes
#'
#' @seealso 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients);  
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import ggplot2
#' @import grDevices 
#'
#' @export

# - Definition: ---- 

plot_pal <- function(pal = pal_unikn) {
  
  stopifnot(length(pal) > 0)
  
  n <- 1:length(pal)
  
  name <- names(pal)
  
  # if pal contained no names:  
  if (is.null(name)) {name <- paste0("[", 1:length(pal), "]")}
  
  pal_name <- deparse(substitute(pal)) # gets name of df
  
  df <- data.frame(n = n, name = name)
  
  ggplot2::ggplot(df, aes(x = n)) +
    geom_tile(aes( y = 1, fill = n)) + 
    geom_point(aes(y = 2, col = n), pch = 16, size = (100/length(pal))) +
    geom_text(aes( y = 3, label = name), angle = 45, adj = 0, col = grey(.33, 1)) + 
    # geom_text(aes(y = 2, label = pal)) +   
    scale_x_continuous(breaks = 1:length(pal)) + 
    scale_y_continuous(limits = c(0, 4)) +
    scale_color_gradientn(colors = pal) +
    scale_fill_gradientn(colors = pal) +
    labs(title = paste0("Colors of ", pal_name, ":"), 
         x = "[n]") + 
    theme_minimal() + 
    theme(axis.line.y = element_blank(), 
          axis.text.y = element_blank(), 
          axis.title.y = element_blank(), 
          legend.position = "none", 
          plot.title = element_text(family = "sans", face = "bold"), 
          panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(linetype = 1, size = .25), 
          panel.grid.major.y = element_line(linetype = 1, size = .25))
  
}

# ## Check: 
# plot_pal()
# 
# # RColorBrewer palettes: 
# plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Set1"))
# plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Blues"))
# 
# # yarrr palettes: 
# plot_pal(yarrr::piratepal(palette = "appletv"))
# plot_pal(yarrr::piratepal(palette = "google"))

# ToDo: Provide additional info on a color palette: ------ 

# ## (1) Values:
# RColorBrewer::brewer.pal(n = 5, name = "Greens")
# as.character(RColorBrewer::brewer.pal(n = 5, name = "Greens")) 
# # ???: How to print values in labels of graphs?
# 
# ## (2) Color names:
# names(RColorBrewer::brewer.pal(n = 5, name = "Greens"))  # => no names!
# 
# ## (3) RGB values:
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))
# 
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[, 5]  # RGB of 5th color
# 
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[1, ]  # R values
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[2, ]  # G values
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[3, ]  # B values
# 
# ## (4) HSV values: 
# col_rgb <- col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens")[5])
# col_rgb
# 
# rgb2hsv(r = col_rgb[1], g = col_rgb[2], b = col_rgb[3]) 


## Color gradients: -------- 

## Test: Using colorRampPalette:

## Examples: 
# col_gradient <- colorRampPalette(colors = c("firebrick", "gold", "forestgreen", "steelblue"))
# col_gradient <- colorRampPalette(colors = pal_unikn_plus)
# 
# col_gradient <- colorRampPalette(colors = c(seeblau, peach))  # 2 individual colors
# col_gradient <- colorRampPalette(colors = c(pal_seeblau[2], pal_karpfenblau[5]))  # 2 colors from palettes
# col_gradient <- colorRampPalette(colors = c(pal_seeblau, pal_petrol))  # 2 palettes
# 
# col_gradient <- colorRampPalette(colors = c(seeblau, grau, peach))  # 3 colors
# col_gradient <- colorRampPalette(colors = c(pal_seeblau[4], pal_grau[2], pal_peach[5]))  # 3 colors from palettes
col_gradient <- colorRampPalette(colors = c(pal_seeblau, pal_grau, pal_peach))  # 3 palettes

# ## Demo: 
# n <- 10
# col_gradient(n)
# plot(rep(1, n), col = (col_gradient(n)), pch = 19, cex = 10)
# 
# plot(rep(1, n), col = (col_gradient(n)), pch = 15, cex = 3)
# text(x = 10, y = 1.2, labels = col_gradient(n)[10])

## Use example code to create a function col_scale:


# col_scale: Provide a color gradient based on given colors or color palettes: -------- 

# - Documentation: ---- 

#' Provide a color gradient scale.
#'
#' \code{col_scale} provides a color gradient 
#' based on a sequence of input colors or color palettes 
#' defined by \code{col}.
#' 
#' \code{col_scale} uses \code{grDevices::colorRampPalette} to  
#' provide a function that takes an integer argument 
#' (the required number of colors) to  
#' return a character vector of (rgb) colors 
#' interpolating color sequence provided by \code{col}.
#' 
#' For best results, consider combining existing color palettes 
#' with base color "white" (see Examples).
#' 
#' @param col A list of colors or color palettes. 
#' Default: \code{col = \link{pal_unikn}}. 
#' 
#' @param ... Additional parameters 
#' (passed to \code{grDevices::colorRampPalette}). 
#'
#' @examples
#' ## Creating color gradients: ------ 
#' 
#' # Gradients extending 1 color palette:
#' col_scale()(5)  # 5 colors of default scale pal_unikn
#' col_scale(pal_petrol)(10)  # 10 colors of pal_petrol
#' 
#' # Gradients over 2+ colors:
#' col_scale(c(seeblau, peach))(10)
#' col_scale(c(signal, petrol))(10)  
#' col_scale(c(seeblau, "white", pinky))(10)
#' col_scale(c(karpfenblau, seeblau, "gold"))(10)  # "gold" shines brighter than signal
#' 
#' # Gradients over 2+ color palettes:
#' col_scale(c(pal_seeblau, pal_peach))(10)
#' col_scale(c(pal_seeblau, pal_karpfenblau))(10)
#' col_scale(c(pal_seeblau, pal_grau, pal_petrol))(10)
#' 
#' # Gradients over 3+ color palettes and colors:
#' col_scale(c(rev(pal_seeblau), "white", pal_pinky))(11)
#' col_scale(c(rev(pal_seeblau), "white", pal_petrol))(11)
#' col_scale(c(rev(pal_karpfenblau), "white", pal_Bordeaux))(11) 
#' 
#' ## Creating and plotting color gradients: ------ 
#' 
#' # (1) Extending color palettes: ----
#' plot_pal(col_scale()(20))
#' plot_pal(col_scale(pal_seeblau)(10))
#' plot_pal(col_scale(pal_Bordeaux)(10))
#'
#' # (2) Combining colors or palettes: ---- 
#' 
#' # Combining 2+ colors to create new palettes:
#' plot_pal(col_scale(c(seeblau, signal))(10))
#' plot_pal(col_scale(c(signal, petrol))(10))  
#' plot_pal(col_scale(c(seeblau, "white", pinky))(10)) 
#' plot_pal(col_scale(c(karpfenblau, seeblau, "white"))(10))  
#' plot_pal(col_scale(c(Bordeaux, "white", petrol))(10)) 
#' plot_pal(col_scale(c(seeblau, "white", petrol))(10))
#' plot_pal(col_scale(c(karpfenblau, seeblau, "gold"))(10))  # "gold" shines brighter than signal
#'  
#' # Combining 2+ color palettes into new palettes:
#' plot_pal(col_scale(c(rev(pal_seeblau), pal_petrol))(10))  
#' plot_pal(col_scale(c(rev(pal_seeblau), pal_peach))(10)) 
#' plot_pal(col_scale(c(rev(pal_karpfenblau), pal_Bordeaux))(10)) 
#' plot_pal(col_scale(c(rev(pal_seegruen), pal_pinky))(10))
#' plot_pal(col_scale(c(rev(pal_petrol), pal_Bordeaux))(10)) 
#' 
#' # Combining 2 palettes and mid-color "white" to new palettes:
#' plot_pal(col_scale(c(rev(pal_seeblau), "white", pal_pinky))(11))
#' plot_pal(col_scale(c(rev(pal_seeblau), "white", pal_petrol))(11))
#' plot_pal(col_scale(c(rev(pal_karpfenblau), "white", pal_Bordeaux))(11)) 
#' plot_pal(col_scale(c(rev(pal_seegruen), "white", pal_peach))(11))
#' plot_pal(col_scale(c(rev(pal_petrol), "white", pal_Bordeaux))(11))
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{plot_pal}} to plot color palettes; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @import grDevices 
#'
#' @export

# - Definition: ---- 

col_scale <- function(col = pal_unikn, ...){
  
  out_gradient <- colorRampPalette(colors = col, ...)
  
  return(out_gradient)
  
}

## Check:

# # Gradients over 1 color palette:
# col_scale()(5)  # 5 colors of default scale pal_unikn
# col_scale(pal_petrol)(12)  # 12 colors of pal_petrol
# 
# # Gradients over 2 colors:
# col_scale(c(seeblau, peach))(10)
# col_scale(c(seegruen, petrol))(10)
# 
# # Gradients over 2 color palettes:
# col_scale(c(pal_seeblau, pal_peach))(10)
# col_scale(c(pal_seeblau, pal_karpfenblau))(10)
# 
# # Gradients over 3+ colors:
# col_scale(c(seeblau, grau, seegruen, peach))(10)
# 
# # Gradients over 3+ color palettes:
# col_scale(c(pal_seeblau, pal_grau, pal_petrol))(10)




## ToDo: ------

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