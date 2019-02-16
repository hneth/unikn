## colors.R | unikn
## hn | 2019 02 16
## ---------------

## Define colors and color palettes. 

## (A) Colors: ------ 

## Define individual colors: ------

seeblau <- rgb(0, 169, 224, names = "seeblau", maxColorValue = 255) # seeblau.4 (non-transparent)

## Source: https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 

## Define color palettes: ------

## (a) Web (sRGB) scale: ---- 

# Definition: 

pal_unikn <- data.frame(                                 #  element: 
  "seeblau1" = rgb(204, 238, 249, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(166, 225, 244, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 199, 235, maxColorValue = 255),  #  3. seeblau3 (non-transparent)
  "seeblau4" = rgb(  0, 169, 224, maxColorValue = 255),  #  4. seeblau4 (= seeblau base color)
  "black"    = rgb(  0,   0,   0, maxColorValue = 255),  #  5. black
  "seegrau4" = rgb(102, 102, 102, maxColorValue = 255),  #  6. grey40 (non-transparent)
  "seegrau3" = rgb(153, 153, 153, maxColorValue = 255),  #  7. grey60 (non-transparent)
  "seegrau2" = rgb(204, 204, 204, maxColorValue = 255),  #  8. grey80 (non-transparent)
  "seegrau1" = rgb(229, 229, 229, maxColorValue = 255),  #  9. grey90 (non-transparent)
  "white"    = rgb(255, 255, 255, maxColorValue = 255),  # 10. white
  stringsAsFactors = FALSE)
# pal_unikn

# Note: Web (sRGB) colors appear to be more vibrant than pal_unikn_ppt variant (below). 

# Documentation:

#' uni.kn default color scale.
#'
#' \code{pal_unikn} provides an uni.kn color scale 
#' as a data frame containing 10 colors.
#'
#' This is the default (web/sRGB) scale. 
#'
#' See https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_unikn
#' dim(pal_unikn)  # 1 10
#' pal_unikn[1]    # named color
#' pal_unikn[[1]]  # color
#'
#' @family color scales
#'
#' @seealso
#' \code{\link{pal_unikn_ppt}} for a ppt version.
#'
#' @export

# Sensibly sorted version (position):
pal_unikn <- pal_unikn[c(4:1, 10:5)] # seeblau (1) > white (5) > grey > black (10)

### Check:
## pal_unikn
## => 
##   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3 seegrau4   black
## 1  #00A9E0  #59C7EB  #A6E1F4  #CCEEF9 #FFFFFF  #E5E5E5  #CCCCCC  #999999  #666666 #000000

## names(pal_unikn)


## (b) PowerPoint scale: ---- 

# Definition:

pal_unikn_ppt <- data.frame(                             #  element:
  "seeblau1" = rgb(200, 229, 239, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(160, 211, 230, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 182, 220, maxColorValue = 255),  #  3. seeblau3 (non-transparent)
  "seeblau4" = rgb(  0, 154, 209, maxColorValue = 255),  #  4. seeblau4 (= seeblau base color)
  "black"    = rgb(  0,   0,   0, maxColorValue = 255),  #  5. black
  "seegrau4" = rgb(102, 102, 102, maxColorValue = 255),  #  6. grey40 (non-transparent)
  "seegrau3" = rgb(153, 153, 153, maxColorValue = 255),  #  7. grey60 (non-transparent)
  "seegrau2" = rgb(204, 204, 204, maxColorValue = 255),  #  8. grey80 (non-transparent)
  "seegrau1" = rgb(229, 229, 229, maxColorValue = 255),  #  9. grey90 (non-transparent)
  "white"    = rgb(255, 255, 255, maxColorValue = 255),  # 10. white
  stringsAsFactors = FALSE)

# Note: PowerPoint colors appear to be more muted, less vibrant than pal_unikn.

# Documentation:

# Sensibly sorted version:

#' uni.kn color scale (ppt version).
#'
#' \code{pal_unikn_ppt} provides an uni.kn color scale 
#' as a data frame containing 10 colors. 
#'
#' This is a secondary (ppt) variant with more muted colors.
#' 
#' See \code{\link{pal_unikn}} for the primary/default (web/sRGB) scale 
#' and https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_unikn_ppt
#' dim(pal_unikn_ppt)  # 1 10
#' pal_unikn_ppt[1]    # named color
#' pal_unikn_ppt[[1]]  # color
#'
#' @family color scales
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @export

pal_unikn_ppt <- pal_unikn_ppt[c(4:1, 10:5)] # seeblau (1) > white (5) > grey > black (10)

### Check:
## pal_unikn_ppt
## => 
##   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3 seegrau4   black
## 1  #009AD1  #59B6DC  #A0D3E6  #C8E5EF #FFFFFF  #E5E5E5  #CCCCCC  #999999  #666666 #000000

# length(pal_unikn)
# names(pal_unikn_ppt)


## (A) Functions: ------

## col_which: Get some [which] specific colors of a palette [pal]: ------ 

#' Get specific colors of a color palette.
#'
#' \code{col_which} returns the colors of a color palette \code{pal} 
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
#' col_which()  # returns default color palette
#' col_which(which = "all")
#' col_which(which = 1:3)
#' col_which(which = rep(1, 20))
#'
#' @family color scales
#'
#' @seealso
#' \code{\link{col_n}} for \code{n} dedicated colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#'
#' @export

col_which <- function(which = "all", pal = pal_unikn){
  
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
# col_which()
# col_which(which = "all")
# col_which(which = 1:3)
# col_which(which = rep(1, 20))



## col_n: Function to get [n] (specific, suitable) colors of a palette [pal]: ------ 

#' Get n dedicated colors of a color palette.
#'
#' \code{col_n} returns \code{n} dedicated colors of a color palette \code{pal}. 
#' 
#' @param n A number specifying the desired number colors of pal (as a number) 
#' or the character string \code{"all"} (to get all colors of \code{pal}). 
#' Default: \code{n = "all"}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' col_n()    # all default colors
#' 
#' # Default palette pal:
#' col_n(1)   # n = 1 color of default color pal
#' col_n(2)
#' col_n(4)
#' col_n(6)
#' col_n(8)
#' col_n(10)  # n = 10 colors of default color pal
#' 
#' col_n(11)  # return maximal number of colors
#' 
#' # Other palettes pal:
#' col_n(3,  RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' col_n(10, RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' @family color scales
#'
#' @seealso
#' \code{\link{col_n_sq}} for \code{n^2} dedicated colors of a color palette; 
#' \code{\link{col_which}} for specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @export

col_n <- function(n = "all", pal = pal_unikn){
  
  # handle inputs:
  stopifnot(length(pal) > 0)
  
  if (is.character(n) && tolower(n) == "all") { n <- length(pal) }
  stopifnot(is.numeric(n))
  stopifnot(n > 0)
  
  if (n > length(pal)){
    
    message(paste0("n exceeds n of colors in pal: Using maximum n = ", length(pal)))
    
    n <- length(pal)
    
  }
  
  out <- NA    # initialize
  
  # Select colors based on current pal and n: 
  if (isTRUE(all.equal(pal, pal_unikn))) {  # pal_unikn:
    
    # message("Get n specific colors of pal_unikn:")
    
    switch(n,
           out <- pal["seeblau4"],  # 1
           out <- pal[c("seeblau4", "white")],  # 2
           out <- pal[c("seeblau4", "seeblau2", "white")],  # 3   
           out <- pal[c("seeblau4", "seeblau2", "white", "black")],  # 4
           out <- pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],  # 5
           out <- pal[c("seeblau4", "seeblau2", "white", "seegrau2", "seegrau4", "black")],  # 6
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 7
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 8
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau1", "seegrau2", "seegrau3", "black")],   # 9
           out <- pal  # all 10
           )
    
  } else {  # any other pal:
    
    message("Unknown pal: Returning first n colors:")
    
    out <- col_which(which = 1:n, pal = pal)  # first n colors
    
  }
  
  return(out)
  
}

# ## Check:
# col_n()    # all default colors
# 
# # Default palette pal:
# col_n(1)   # n = 1 color of default color pal
# col_n(2)
# col_n(4)
# col_n(6)
# col_n(8)
# col_n(10)  # n = 10 colors of default color pal
# 
# col_n(11)  # return maximal number of colors
# 
# # Other palettes pal:
# col_n(3,  RColorBrewer::brewer.pal(n = 5, name = "Blues"))
# col_n(10, RColorBrewer::brewer.pal(n = 5, name = "Blues"))




## col_n_sq: Get n^2 (n x n) specific colors of a palette [pal]: ------ 

#' Get n^2 dedicated colors of a color palette.
#'
#' \code{col_n_sq} returns \code{n^2} dedicated colors of a color palette \code{pal} 
#' (up to a maximum of \code{n + 1} colors). 
#' 
#' @param n A number specifying the desired number colors of pal (as a number) 
#' or the character string \code{"all"} (to get all colors of \code{pal}). 
#' Default: \code{n = "all"}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' col_n_sq(1)
#' col_n_sq(2)
#' col_n_sq(3) #  9 colors
#' col_n_sq(4) # 11 colors = maximum of (n + 1) colors.
#' 
#' @family color scales
#'
#' @seealso
#' \code{\link{col_n}} for \code{n} dedicated colors of a color palette; 
#' \code{\link{col_which}} for specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @export

col_n_sq <- function(n = "all", pal = pal_unikn){
  
  # handle inputs:
  stopifnot(length(pal) > 0)
  
  if (is.character(n) && tolower(n) == "all") { n <- length(pal) }
  stopifnot(is.numeric(n))
  stopifnot(n > 0)
  
  out <- NA    # initialize
  
  if (n == 1) {
    
    out <- pal[1] #  1 color: seeblau4
    
  } else if (n == 2) {
    
    out <- pal[c(1, 3, 5, 10)]   #  4 colors: seeblau4, seeblau2, white, black
    
  } else if (n == 3) {
    
    out <- pal[-7] #  9 colors: seeblau > white > black
    
  } else {
    
    out <- pal[c(1, 1:10)]   # 11 colors: seeblau (2x) > white (6 = mid) > black (11) [default]
    
  }
  
  return(out)
  
}

## Check:
# col_n_sq(1)
# col_n_sq(2)
# col_n_sq(3) #  9 colors
# col_n_sq(4) # 11 colors = maximum of (n + 1) colors.


## plot_pal: Plot a given color palette [pal]: ------ 

#' Plot a color palette.
#'
#' \code{plot_pal} plots (information on) a color palette \code{pal}.
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' plot_pal()  # plots default color palette 
#' 
#' # RColorBrewer palettes: 
#' plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Set1"))
#' plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' # yarrr palettes: 
#' plot_pal(yarrr::piratepal(palette = "appletv"))
#' plot_pal(yarrr::piratepal(palette = "google"))
#'
#' @family color scales
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 theme
#' 
#' @importFrom grDevices col2rgb
#' @importFrom grDevices grey
#' @importFrom grDevices rgb
#'
#' @export

plot_pal <- function(pal = pal_unikn) {

  stopifnot(length(pal) > 0)
    
  n <- 1:length(pal)
  
  name <- names(pal)
  
  # if pal contained no names:  
  if (is.null(name)) {name <- paste0("[", 1:length(pal), "]")}

  df <- data.frame(n = n, name = name)
  
  ggplot2::ggplot(df, aes(x = n)) +
    geom_tile(aes(y = 1, fill = n)) + 
    geom_point(aes(y = 2, col = n), pch = 16, size = (50/length(pal))) + 
    geom_text(aes(y = 3, label = name)) + 
    # geom_text(aes(y = 2, label = pal)) +   
    scale_x_continuous(breaks = 1:length(pal)) + 
    scale_y_continuous(limits = c(0, 4)) +
    scale_color_gradientn(colors = pal) +
    scale_fill_gradientn(colors = pal) +
    theme_minimal() + 
    theme(axis.line.y = element_blank(), 
          axis.text.y = element_blank(), 
          axis.title.y = element_blank(), 
          legend.position = "none", 
          panel.grid.minor = element_blank(), 
          panel.grid.major.y = element_blank())
  
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


## ToDo: Provide additional info on a color scale: ------ 

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


## ToDo: ------

# - any pal: 
# - function to show colors (and options for full color info: nr, name, RGB, hsv)
# - function to get (which) colors of pal

# - unikn: 
#   - make own package
#   - function to get n (good) colors
#   - function to get box in seeblau (or other color)

# - define different color palettes.

## eof. ----------