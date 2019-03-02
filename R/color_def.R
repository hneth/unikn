## color_def.R | unikn
## hn |  uni.kn  |  2019 03 02
## ---------------------------

## Define colors and color palettes. 

## Colors: ------ 

## Sources for color definitions: 
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 

## Color palettes: ------

# (A) Basic color palettes: -----

#   (1) unikn default (web/sRGB) palette: ---- 

# Definition: 

pal_unikn <- data.frame(                                 #  element: 
  "seeblau1" = rgb(204, 238, 249, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(166, 225, 244, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 199, 235, maxColorValue = 255),  #  3. seeblau3 (non-transparent) == preferred color: "Seeblau"
  "seeblau4" = rgb(  0, 169, 224, maxColorValue = 255),  #  4. seeblau4 (= OLD seeblau base color)
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

#' uni.kn default color palette.
#'
#' \code{pal_unikn} provides the default uni.kn color palette  
#' as a data frame containing 10 colors.
#'
#' This is the primary (web/sRGB) scale. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn
#' dim(pal_unikn)  # 1 10
#' 
#' # Access by position:
#' pal_unikn[2]    # 2nd named color "seeblau3" (as df)
#' pal_unikn[[2]]  # 2nd color value "#59C7EB"
#' 
#' # Access by name: 
#' pal_unikn["seeblau3"]    # color "seeblau3" (as df)
#' pal_unikn[["seeblau3"]]  # color value "#59C7EB"
#' 
#' # Plotting palette:
#' seepal(pal_unikn)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_ppt}} for an alternative (ppt) version; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{seepal}} to show and use color palettes. 
#'
#' @export

# Sensibly sorted version (position):
pal_unikn <- pal_unikn[c(4:1, 10:5)] # seeblau (2 as default) > white (5) > grey > black (10)

# # Check:
# pal_unikn
# =>
#   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3 seegrau4   black
# 1  #00A9E0  #59C7EB  #A6E1F4  #CCEEF9 #FFFFFF  #E5E5E5  #CCCCCC  #999999  #666666 #000000
# 
# names(pal_unikn)


#   (2) unikn alternative (ppt) palette: ---- 

# Definition:

pal_unikn_ppt <- data.frame(                             #  element:
  "seeblau1" = rgb(200, 229, 239, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(160, 211, 230, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 182, 220, maxColorValue = 255),  #  3. seeblau3 (non-transparent) == preferred color: "Seeblau"
  "seeblau4" = rgb(  0, 154, 209, maxColorValue = 255),  #  4. seeblau4 (= OLD: seeblau base color)
  "black"    = rgb(  0,   0,   0, maxColorValue = 255),  #  5. black
  "seegrau4" = rgb(102, 102, 102, maxColorValue = 255),  #  6. grey40 (non-transparent)
  "seegrau3" = rgb(153, 153, 153, maxColorValue = 255),  #  7. grey60 (non-transparent)
  "seegrau2" = rgb(204, 204, 204, maxColorValue = 255),  #  8. grey80 (non-transparent)
  "seegrau1" = rgb(229, 229, 229, maxColorValue = 255),  #  9. grey90 (non-transparent)
  "white"    = rgb(255, 255, 255, maxColorValue = 255),  # 10. white
  stringsAsFactors = FALSE)

# Note: PowerPoint colors appear to be more muted, less vibrant than pal_unikn.

# Documentation:

#' uni.kn secondary color palette (ppt version).
#'
#' \code{pal_unikn_ppt} provides an alternative uni.kn color palette  
#' as a data frame containing 10 colors. 
#'
#' This is a secondary (ppt) variant with more muted colors.
#' 
#' See \code{\link{pal_unikn}} for the primary/default (web/sRGB) scale 
#' and \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_ppt
#' dim(pal_unikn_ppt)  # 1 10
#' 
#' # Access by position:
#' pal_unikn_ppt[2]    # 2nd named color "seeblau3" (as df)
#' pal_unikn_ppt[[2]]  # 2nd color value "#59B6DC"
#' 
#' # Access by name: 
#' pal_unikn_ppt["seeblau3"]    # color "seeblau3" (as df)
#' pal_unikn_ppt[["seeblau3"]]  # color value "#59B6DC"
#' 
#' # Plotting palette:
#' seepal(pal_unikn_ppt)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{seepal}} to show and use color palettes. 
#'
#' @export

# Sensibly sorted version: 
pal_unikn_ppt <- pal_unikn_ppt[c(4:1, 10:5)] # seeblau (1) > white (5) > grey > black (10)

### Check:
## pal_unikn_ppt
## => 
##   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3 seegrau4   black
## 1  #009AD1  #59B6DC  #A0D3E6  #C8E5EF #FFFFFF  #E5E5E5  #CCCCCC  #999999  #666666 #000000

# length(pal_unikn)
# names(pal_unikn_ppt)


## ToDo: ------

# Cleaner version of color_definitions.R, with fewer components and exports:
# (1) official color palettes: NOT exported, but accessed via "seecol" user-interface function. 
# (2) official preferred colors: Capitalized and exported (for convenient access).  
# (3) Additional color palettes (unikn_plus/_pref/_light/_dark/_pair): Move to a separate/later file. 

# - Export all preferred color values (as HEX character value) with Capital letter names!
# - Do NOT export the other palettes and values, but use "seecol" function as user-interface. 

## eof. ----------