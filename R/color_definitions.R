## color_definitions.R | unikn
## hn |  uni.kn  |  2019 02 18
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
#' pal_unikn[1]    # named color
#' pal_unikn[[1]]  # color
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_ppt}} for an alternative (ppt) version; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

# Sensibly sorted version (position):
pal_unikn <- pal_unikn[c(4:1, 10:5)] # seeblau (2 as default) > white (5) > grey > black (10)

### Check:
## pal_unikn
## => 
##   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3 seegrau4   black
## 1  #00A9E0  #59C7EB  #A6E1F4  #CCEEF9 #FFFFFF  #E5E5E5  #CCCCCC  #999999  #666666 #000000

## names(pal_unikn)


#   (2) unikn alternative (ppt) palette: ---- 

# Definition:

pal_unikn_ppt <- data.frame(                             #  element:
  "seeblau1" = rgb(200, 229, 239, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(160, 211, 230, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 182, 220, maxColorValue = 255),  #  3. seeblau3 (non-transparent) == preferred color: "seeblau"
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

# Sensibly sorted version:

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
#' pal_unikn_ppt[1]    # named color
#' pal_unikn_ppt[[1]]  # color
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_ppt)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
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




# (B) Additional unikn color palettes: -----

## Source: Excel file provided at
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 

#  (1) seeblau: ----- 

#   (a) Table (from Excel file): ---- 

#    HEX:	   RGB:	         CMYK:		                      Comment:
# 1. CCEEF9	 204 238 249	 20% von C82 | M3  | Y0 | K0		Seeblau  20% Corporate Design
# 2. A6E1F4	 166 225 244	 35% von C82 | M3  | Y0 | K0		Seeblau  35% Corporate Design
# 3. 59C7EB	  89 199 235	 65% von C82 | M3  | Y0 | K0		Seeblau  65% Corporate Design: preferred color: "seeblau"
# 4. 00A9E0	   0 169 224	         C82 | M3  | Y0 | K0		Seeblau 100% Corporate Design
# 5. 008ECE	   0 142 206	         C82 | M23 | Y0 | K0		Seeblau Dunkel *neu*


#   (b) Documentation: ---- 

#' uni.kn seeblau color palette.
#'
#' \code{pal_seeblau} provides an additional uni.kn color palette 
#' as a data frame containing 5 colors (shades of blue/seeblau). 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_seeblau
#' dim(pal_seeblau)  # 1 5
#' pal_seeblau[3]    # preferred (named) color "seeblau3" 
#' pal_seeblau[[3]]  # preferred color "seeblau3" = "#59C7EB"
#' 
#' # Plotting palette:
#' plot_pal(pal_seeblau)
#'
#' @family color palettes
#'
#' @seealso 
#' \code{\link{pal_karpfenblau}} for an alternative blue uni.kn color palette;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_seeblau <- data.frame(                               #  element: 
  "seeblau1" = rgb(204, 238, 249, maxColorValue = 255),  #  1. seeblau1 (non-transparent):  20%
  "seeblau2" = rgb(166, 225, 244, maxColorValue = 255),  #  2. seeblau2 (non-transparent):  35%
  "seeblau3" = rgb( 89, 199, 235, maxColorValue = 255),  #  3. seeblau3 (non-transparent):  65%: preferred color: "seeblau"
  "seeblau4" = rgb(  0, 169, 224, maxColorValue = 255),  #  4. seeblau4 (non-transparent): 100%
  "seeblau5" = rgb(  0, 142, 206, maxColorValue = 255),  #  5. seeblau5 (non-transparent): neu
  stringsAsFactors = FALSE)


#   (d) Preferred color: ---- 

#' uni.kn color seeblau. 
#' 
#' \code{seeblau} provides the preferred color of \code{\link{pal_seeblau}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_seeblau}[3]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' seeblau  # "seeblau3" OR "#59C7EB"
#' all.equal(seeblau, pal_seeblau[3])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_seeblau}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

seeblau <- pal_seeblau[3]  # == seeblau.3 of pal_seeblau OR pal_unikn 

## Check:
# seeblau

#  (2) peach: -----

#   (a) Table (from Excel file): ---- 

#    HEX:	   RGB:	         CMYK:		              Comment:
# 1. FEE2DD	 254 226 221	 C0 | M16 | Y11 | K0		
# 2. FECFC7	 254 207 199	 C0 | M26 | Y18 | K0		
# 3. FFB8AC	 255 184 172	 C0 | M38 | Y27 | K0		
# 4. FEA090	 254 160 144	 C0 | M49 | Y38 | K0		preferred color: "peach" (aus "Erleben", für Akzente)
# 5. FF8E7B	 255 142 123	 C0 | M56 | Y46 | K0		


#   (b) Documentation: ----  

#' uni.kn peach color palette.
#'
#' \code{pal_peach} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of peach). 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_peach
#' dim(pal_peach)  # 1 5
#' pal_peach[4]    # preferred (named) color "peach4" 
#' pal_peach[[4]]  # preferred color "peach4" OR "#FEA090"
#' 
#' # Plotting palette:
#' plot_pal(pal_peach)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_pinky}} and \code{\link{pal_Bordeaux}} for alternative redish uni.kn color palettes;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ----  

pal_peach <- data.frame(                               #  Element: 
  "peach1" = rgb(254, 226, 221, maxColorValue = 255),  #  1. 
  "peach2" = rgb(254, 207, 199, maxColorValue = 255),  #  2. 
  "peach3" = rgb(255, 184, 172, maxColorValue = 255),  #  3. 
  "peach4" = rgb(254, 160, 144, maxColorValue = 255),  #  4. preferred color: "peach" 
  "peach5" = rgb(255, 142, 123, maxColorValue = 255),  #  5. 
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color peach.  
#' 
#' \code{peach} provides the preferred color of \code{\link{pal_peach}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_peach}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' peach  # "peach4" OR "#FEA090"
#' all.equal(peach, pal_peach[4])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_peach}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

peach <- pal_peach[4]  # == peach.4 of pal_peach 

## Check:
# peach

#  (3) grau: ----- 

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	          CMYK:		             Comment:
# 1. E1E2E5	 225 226 229	  C0 | M0 | Y0 | K10
# 2. B8BCC1	 184 188 193	  C0 | M0 | Y0 | K20
# 3. 9AA0A7	 154 160 167	  C0 | M0 | Y0 | K40   preferred color: "grau" 
# 4. 73787E	 115 120 126	  C0 | M0 | Y0 | K60
# 5. 4D5054	  77  80  84	  C0 | M0 | Y0 | K80

#   (b) Documentation: ---- 

#' uni.kn grau color palette.
#'
#' \code{pal_grau} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of grey). 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_grau
#' dim(pal_grau)  # 1 5
#' pal_grau[3]    # preferred (named) color "grau3"
#' pal_grau[[3]]  # preferred color "grau3" OR "#9AA0A7"
#' 
#' # Plotting palette:
#' plot_pal(pal_grau)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_grau <- data.frame(                               #  element: 
  "grau1" = rgb(225, 226, 229, maxColorValue = 255),  #  1. grau1 (non-transparent)
  "grau2" = rgb(184, 188, 193, maxColorValue = 255),  #  2. grau2 (non-transparent)
  "grau3" = rgb(154, 160, 167, maxColorValue = 255),  #  3. grau3 (non-transparent): preferred color: "grau"
  "grau4" = rgb(115, 120, 126, maxColorValue = 255),  #  4. grau4 (non-transparent)
  "grau5" = rgb( 77,  80,  84, maxColorValue = 255),  #  5. grau5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color grau.   
#' 
#' \code{grau} provides the preferred color of \code{\link{pal_grau}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_grau}[3]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' grau  # "grau3" OR "#9AA0A7"
#' all.equal(grau, pal_grau[3])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_grau}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

grau <- pal_grau[3]  # == grau.3 of pal_grau: "grau3" OR "#9AA0A7"

## Check:
# grau

#  (4) petrol: -----

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	          CMYK:		              Comment:
# 1. 9CC6CF	 156 198 207	  C44 | M10 | Y18 | K0		
# 2. 6AAAB7	 106 170 183	  C61 | M17 | Y26 | K2		
# 3. 398D9F	  57 141 159	  C75 | M27 | Y31 | K7		
# 4. 077187	   7 113 135	  C85 | M36 | Y34 | K17	 preferred color: "petrol"
# 5. 035F72	   3  95 114	  C89 | M44 | Y38 | K26	

#   (b) Documentation: ----  

#' uni.kn petrol color palette.
#'
#' \code{pal_petrol} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of grue). 
#'
#' See \url{https://www.uni-konstanz.de} for details, and 
#' \href{https://en.wikipedia.org/wiki/Blue%E2%80%93green_distinction_in_language}{Wikipedia: grue} 
#' for the portmanteau "grue".
#'
#' @examples
#' pal_petrol
#' dim(pal_petrol)  # 1 5
#' pal_petrol[4]    # preferred (named) color "petrol4"
#' pal_petrol[[4]]  # preferred color "petrol4" OR "#077187"
#' 
#' # Plotting palette:
#' plot_pal(pal_petrol)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_seegruen}} for an alternative green/grue uni.kn color palette;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_petrol <- data.frame(                               #  element: 
  "petrol1" = rgb(156, 198, 207, maxColorValue = 255),  #  1. petrol1 (non-transparent)
  "petrol2" = rgb(106, 170, 183, maxColorValue = 255),  #  2. petrol2 (non-transparent)
  "petrol3" = rgb( 57, 141, 159, maxColorValue = 255),  #  3. petrol3 (non-transparent)
  "petrol4" = rgb(  7, 113, 135, maxColorValue = 255),  #  4. petrol4 (non-transparent): preferred color: "petrol"
  "petrol5" = rgb(  3,  95, 114, maxColorValue = 255),  #  5. petrol5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color petrol. 
#' 
#' \code{petrol} provides the preferred color of \code{\link{pal_petrol}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_petrol}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' petrol  # "petrol" OR "#077187"
#' all.equal(petrol, pal_petrol[4])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_petrol}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

petrol <- pal_petrol[4]  # == petrol.4 of pal_petrol: "petrol4" OR "#077187"

## Check:
# petrol

#  (5) seegruen: -----

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	         CMYK:		              Comment:
# 1. 85D1CC	 113 209 204	 C50 | M0  | Y25 | K0		
# 2. 54BFB7	  84 191 183	 C64 | M0  | Y34 | K0		
# 3. 0AA398	  10 163 152	 C78 | M10 | Y47 | K0		
# 4. 0A9086	  10 144 134	 C81 | M20 | Y51 | K4		 preferred color: "seegruen"
# 5. 067E79	   6 126 121	 C84 | M27 | Y52 | K13		

#   (b) Documentation: ----  

#' uni.kn seegruen color palette.
#'
#' \code{pal_seegruen} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of seegruen). 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_seegruen
#' dim(pal_seegruen)  # 1 5
#' pal_seegruen[4]    # preferred (named) color "seegruen4"
#' pal_seegruen[[4]]  # preferred color "seegruen4" OR "#0A9086"
#' 
#' # Plotting palette:
#' plot_pal(pal_seegruen)
#'
#' @family color palettes
#'
#' @seealso 
#' \code{\link{pal_petrol}} for an alternative green uni.kn color palette;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_seegruen <- data.frame(                               #  element: 
  "seegruen1" = rgb(113, 209, 204, maxColorValue = 255),  #  1. seegruen1 (non-transparent)
  "seegruen2" = rgb( 84, 191, 183, maxColorValue = 255),  #  2. seegruen2 (non-transparent)
  "seegruen3" = rgb( 10, 163, 152, maxColorValue = 255),  #  3. seegruen3 (non-transparent)
  "seegruen4" = rgb( 10, 144, 134, maxColorValue = 255),  #  4. seegruen4 (non-transparent): preferred color: "seegruen"
  "seegruen5" = rgb(  6, 126, 121, maxColorValue = 255),  #  5. seegruen5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color seegruen.
#' 
#' \code{seegruen} provides the preferred color of \code{\link{pal_seegruen}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_seegruen}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' seegruen  # "seegruen4" OR "#0A9086"
#' all.equal(seegruen, pal_seegruen[4])  # TRUE
#'
#' @family colors
#'
#' @seealso
#' \code{\link{pal_seegruen}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

seegruen <- pal_seegruen[4]  # == seegruen.4 of pal_seegruen: "seegruen4" OR "#0A9086"

## Check: 
# seegruen

#  (6) karpfenblau: -----

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	          CMYK:		               Comment:
# 1. B4BCD6	 180 188 214	  C34 | M23 | Y8  | K0		
# 2. 8290BB	 130 144 187	  C56 |  41 | Y11 | K0		
# 3. 586BA4	  88 107 164	  C73 | M57 | Y11 | K1		
# 4. 3E5496	  62  84 150	  C86 | M69 | Y10 | K1	 preferred color: "karpfenblau"
# 5. 324376	  50  67 118	  C92 |  77 | Y26 | K11		

#   (b) Documentation: ----  

#' uni.kn karpfenblau color palette.
#'
#' \code{pal_karpfenblau} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of blue carp). 
#'
#' See \url{https://www.uni-konstanz.de} for details. 
#'
#' @examples
#' pal_karpfenblau
#' dim(pal_karpfenblau)  # 1 5
#' pal_karpfenblau[4]    # preferred (named) color "karpfenblau4"
#' pal_karpfenblau[[4]]  # preferred color "karpfenblau4" OR "#3E5496"
#' 
#' # Plotting palette:
#' plot_pal(pal_karpfenblau)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_seeblau}} for the default seeblau uni.kn color palette;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_karpfenblau <- data.frame(                               #  element: 
  "karpfenblau1" = rgb(180, 188, 214, maxColorValue = 255),  #  1. karpfenblau1 (non-transparent)
  "karpfenblau2" = rgb(130, 144, 187, maxColorValue = 255),  #  2. karpfenblau2 (non-transparent)
  "karpfenblau3" = rgb( 88, 107, 164, maxColorValue = 255),  #  3. karpfenblau3 (non-transparent)
  "karpfenblau4" = rgb( 62,  84, 150, maxColorValue = 255),  #  4. karpfenblau4 (non-transparent): preferred color: "karpfenblau"
  "karpfenblau5" = rgb( 50,  67, 118, maxColorValue = 255),  #  5. karpfenblau5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color karpfenblau.  
#' 
#' \code{karpfenblau} provides the preferred color of \code{\link{pal_karpfenblau}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_karpfenblau}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' karpfenblau  # "karpfenblau4" OR "#3E5496"
#' all.equal(karpfenblau, pal_karpfenblau[4])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_karpfenblau}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette. 
#'
#' @export

karpfenblau <- pal_karpfenblau[4]  # == karpfenblau4 of pal_karpfenblau: "karpfenblau4" OR "#3E5496"

## Check:
# karpfenblau


#  (7) pinky: -----

#   (a) Table (from Excel file): ----  

#    HEX:	    RGB:	        CMYK:		                Comment:
# 1. F3BFCB	  243 191 203	  C2  | M33 | Y11 | K0		
# 2. ECA0B2	  236 160 178	  C4  | M48 | Y16 | K0		
# 3. E68098	  230 128 152	  C6  | M62 | Y22 | K0		
# 4. E0607E	  224 96 126	  C7  | M74 | Y31 | K0		preferred color: "pinky"
# 5. CA4A68	  202 74 104	  C16 | M81 | Y40 | K5		

#   (b) Documentation: ----  

#' uni.kn pinky color palette.
#'
#' \code{pal_pinky} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of pink). 
#'
#' See \url{https://www.uni-konstanz.de} for details. 
#'
#' @examples
#' pal_pinky
#' dim(pal_pinky)  # 1 5
#' pal_pinky[4]    # preferred (named) color "pinky4"
#' pal_pinky[[4]]  # preferred color "pinky4" OR "#E0607E"
#' 
#' # Plotting palette:
#' plot_pal(pal_pinky)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_peach}} and \code{\link{pal_Bordeaux}} for alternative redish uni.kn color palettes; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_pinky <- data.frame(                               #  Element: 
  "pinky1" = rgb(243, 191, 203, maxColorValue = 255),  #  1. pinky1 (non-transparent)
  "pinky2" = rgb(236, 160, 178, maxColorValue = 255),  #  2. pinky2 (non-transparent)
  "pinky3" = rgb(230, 128, 152, maxColorValue = 255),  #  3. pinky3 (non-transparent)
  "pinky4" = rgb(224,  96, 126, maxColorValue = 255),  #  4. pinky4 (non-transparent): preferred color: "pinky"
  "pinky5" = rgb(202,  74, 104, maxColorValue = 255),  #  5. pinky5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color pinky.   
#' 
#' \code{pinky} provides the preferred color of \code{\link{pal_pinky}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_pinky}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pinky  # "pinky4" OR "#E0607E"
#' all.equal(pinky, pal_pinky[4])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_pinky}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

pinky <- pal_pinky[4]  # == pinky4 of pal_pinky: "pinky4" OR "#E0607E"

## Check:
# pinky


# +++ here now +++ 


#  (8) Bordeaux: -----

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	          CMYK:		               Comment:
# 1. D2A6B4	 210 166 180	  C18 | M40 | Y19 | K1		
# 2. BC7A8F	 188 122 143	  C26 | M58 | Y27 | K6		
# 3. A54D69	 165  77 105	  C29 | M77 | Y35 | K17		
# 4. 8E2043	 142  32  67	  C29 | M95 | Y47 | K32		preferred color: "Bordeaux"
# 5. 771434	 119  20  52	  C32 | M99 | Y52 | K45		

#   (b) Documentation: ----  

#' uni.kn Bordeaux color palette.
#'
#' \code{pal_Bordeaux} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors (shades of Bordeaux). 
#'
#' See \url{https://www.uni-konstanz.de} for details. 
#'
#' @examples
#' pal_Bordeaux
#' dim(pal_Bordeaux)  # 1 5
#' pal_Bordeaux[4]    # preferred (named) color "Bordeaux4"
#' pal_Bordeaux[[4]]  # preferred color "Bordeaux4" OR "#8E2043"
#' 
#' # Plotting palette:
#' plot_pal(pal_Bordeaux)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_peach}} and \code{\link{pal_pinky}} for alternative redish uni.kn color palettes;  
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_Bordeaux <- data.frame(                               #  Element: 
  "Bordeaux1" = rgb(210, 166, 180, maxColorValue = 255),  #  1. Bordeaux1 (non-transparent)
  "Bordeaux2" = rgb(188, 122, 143, maxColorValue = 255),  #  2. Bordeaux2 (non-transparent)
  "Bordeaux3" = rgb(165,  77, 105, maxColorValue = 255),  #  3. Bordeaux3 (non-transparent)
  "Bordeaux4" = rgb(142,  32,  67, maxColorValue = 255),  #  4. Bordeaux4 (non-transparent): preferred color: "Bordeaux"
  "Bordeaux5" = rgb(119,  20,  52, maxColorValue = 255),  #  5. Bordeaux5 (non-transparent)
  stringsAsFactors = FALSE)

#   (d) Preferred color: ---- 

#' uni.kn color Bordeaux.    
#' 
#' \code{Bordeaux} provides the preferred color of \code{\link{pal_Bordeaux}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_Bordeaux}[4]}. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' Bordeaux  # "Bordeaux4" OR "#8E2043"
#' all.equal(Bordeaux, pal_Bordeaux[4])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_Bordeaux}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

Bordeaux <- pal_Bordeaux[4]  # == Bordeaux4 of pal_Bordeaux: "Bordeaux4" OR "#8E2043"

## Check:
# Bordeaux


#  (9) Ampeltöne: pal_signal -----

#   (a) Table (from Excel file): ----  

#    HEX:	   RGB:	         CMYK:		              Comment:
# 1. 7CCA89	 124 202 137	 C55 | M0  | Y58 | K0		Sehr gut
# 2. EFDC60	 239 220  96	 C10 | M8  | Y72 | K0		Stagnierend
# 3. D01556	 208  21  86	 C11 | M99 | Y44 | K3		Sehr schlecht

#   (b) Documentation: ----  

#' uni.kn signal (Ampel) color palette.
#'
#' \code{pal_signal} provides an additional uni.kn color palette  
#' as a data frame containing 3 colors (Ampel colors). 
#'
#' The colors are arranged as in a traffic-light ("Ampel"): 
#' \enumerate{
#' \item top: red or "bad"
#' \item mid: yellow or "alert"
#' \item bot: green or "good"
#' }
#'
#' See \url{https://www.uni-konstanz.de} for details. 
#'
#' @examples
#' pal_signal
#' dim(pal_signal)  # 1 3
#' pal_signal[2]    # (named) color "signal2"
#' pal_signal[[2]]  # color "signal2" OR "#EFDC60"
#' 
#' # Plotting palette:
#' plot_pal(pal_signal)
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (c) Definition: ---- 

pal_signal <- data.frame(                               #  Element: 
  "signal1" = rgb(208,  21,  86, maxColorValue = 255),  #  3. signal1: top = bad   (non-transparent)
  "signal2" = rgb(239, 220,  96, maxColorValue = 255),  #  2. signal2: mid = alert (non-transparent)
  "signal3" = rgb(124, 202, 137, maxColorValue = 255),  #  1. signal3: bot = good  (non-transparent)
  stringsAsFactors = FALSE)

#   (d) NO Preferred color: ---- 

# Note: As the Ampel palette specification does NOT identify a preferred color,  
#       using "signal" as a dedicated color is NOT part of the official definition. 

#' uni.kn color signal.    
#' 
#' \code{signal} provides the alert color of \code{\link{pal_signal}} 
#' as an atomic data frame and is defined as 
#' \code{\link{pal_signal}[2]}. 
#' 
#' The official specification of \code{\link{pal_signal}} 
#' does not identify a preferred color. 
#' We provide \code{\link{pal_signal}[2]} as a dedicated color 
#' as it is well-suited for creating color gradients 
#' (see \code{\link{col_scale}}). 
#'  
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' signal  # "signal2" OR "#EFDC60"
#' all.equal(signal, pal_signal[2])  # TRUE
#' 
#' @family colors
#'
#' @seealso
#' \code{\link{pal_signal}} for the corresponding color palette; 
#' \code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_unikn_plus}} for a uni.kn color palette with all colors of \code{\link{pal_seeblau}}; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

signal <- pal_signal[2]  # == signal2 of pal_signal: "signal2" OR "#EFDC60"

## Check:
# signal



# (C) Other combinations: -------- 

#  (1) pal_unikn_plus: Combination of pal_seeblau and pal_unikn (11): ------ 

#   (a) Documentation: ----  

#' uni.kn 11 colors in a color palette.
#'
#' \code{pal_unikn_plus} combines the 5 blue colors 
#' from color palette \code{\link{pal_seeblau}} 
#' with the 6 non-blue colors of \code{\link{pal_unikn}} 
#' to a palette containing 11 color values. 
#' 
#' Adding seeblau5 (i.e., \code{pal_seeblau[1]}) to 
#' the default color palette \code{\link{pal_unikn}} 
#' also puts \code{white} at the central (middle) 
#' position of a palette with 11 values:
#' 
#' \code{pal_unikn_plus[[6]]} is \code{white} or \code{"#FFFFFF"}.  
#'
#' This is useful when creating color gradients. 
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_plus
#' dim(pal_unikn_plus)         # 1 11
#' pal_unikn_plus[1]           # seeblau5 (new)
#' pal_unikn_plus[[1]]         # darker blue color value: "#008ECE"
#' pal_unikn_plus["seeblau5"]  # seeblau5 color value by name
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_plus)
#' 
#' # Note:
#' pal_unikn_plus[6] # "white" or "#FFFFFF" as central of 11 colors
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_seeblau}} for the uni.kn seeblau color palette; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients).  
#'
#' @export

#   (b) Definition: ----  

pal_unikn_plus <- cbind(rev(pal_seeblau), pal_unikn[5:10])

# Check: 
# pal_unikn_plus

#  (2) pal_unikn_pref: Scale of all 9 (or 8 + 1) preferred colors: ------

#   (a) Documentation: ----  

#' uni.kn preferred colors in a color palette.
#'
#' \code{pal_unikn_pref} provides an additional uni.kn color palette  
#' that collects the preferred color of each palette 
#' as a data frame containing 9 (or 8 + 1) colors. 
#' 
#' Note that the color \code{\link{signal}} is not identified 
#' as a preferred color according to the official color definition.
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_pref
#' dim(pal_unikn_pref)  # 1 9
#' pal_unikn_pref[1]    # preferred (named) color
#' pal_unikn_pref[[1]]  # preferred color value: #59C7EB"
#' pal_unikn_pref["seeblau"]  # preferred color by name
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_pref)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_n}} to get \code{n} dedicated colors of a known color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (b) Definition: ----  

pal_unikn_pref <- data.frame(            # Element: 
  "seeblau"     = pal_seeblau[[3]],      #  1. seeblau
  "peach"       = pal_peach[[4]],        #  2. peach
  "grau"        = pal_grau[[3]],         #  3. grau 
  "petrol"      = pal_petrol[[4]],       #  4. petrol 
  "seegruen"    = pal_seegruen[[4]],     #  5. seegruen 
  "karpfenblau" = pal_karpfenblau[[4]],  #  6. karpfenblau
  "pinky"       = pal_pinky[[4]],        #  7. pinky 
  "Bordeaux"    = pal_Bordeaux[[4]],     #  8. Bordeaux
  "signal"      = pal_signal[[2]],       # (9.) (alert) signal
  stringsAsFactors = FALSE)

## Check:
# pal_unikn_pref
# plot_pal(pal_unikn_pref)

#  (3) pal_unikn_light: Scale of 8 light colors (in 4 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn light colors in a color palette.
#'
#' \code{pal_unikn_light} provides an additional uni.kn color palette  
#' that collects 2 light colors of 4 color palettes  
#' as a data frame containing 8 colors (in 4 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_light
#' dim(pal_unikn_light)  # 1 8 
#' pal_unikn_light[1]    # color "seeblau3" by position
#' pal_unikn_light[[1]]  # color value by position: #59C7EB"
#' pal_unikn_light["seeblau3"]  # color value by name
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_light)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (b) Definition: ----  

pal_unikn_light <- data.frame(
  pal_seeblau[c(3, 1)],
  pal_seegruen[c(3, 1)],
  pal_peach[c(3, 1)],
  pal_grau[c(2, 1)],
  stringsAsFactors = FALSE)

## Check:
# pal_unikn_light
# plot_pal(pal_unikn_light)

#  (4) pal_unikn_dark: Scale of 8 dark colors (in 4 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn dark colors in a color palette.
#'
#' \code{pal_unikn_dark} provides an additional uni.kn color palette  
#' that collects 2 dark colors of 4 color palettes  
#' as a data frame containing 8 colors (in 4 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_dark
#' dim(pal_unikn_dark)  # 1 8 
#' pal_unikn_dark[1]    # color "karpfenblau5" by position
#' pal_unikn_dark[[1]]  # color value by position: #324376"
#' pal_unikn_dark["karpfenblau5"]  # color value by name
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_dark)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (b) Definition: ----  

pal_unikn_dark <- data.frame(
  pal_karpfenblau[c(5, 3)],
  pal_petrol[c(5, 3)],
  pal_Bordeaux[c(5, 3)],
  pal_pinky[c(5, 3)],
  stringsAsFactors = FALSE)

## Check:
# pal_unikn_dark
# plot_pal(pal_unikn_dark)


#  (5) pal_unikn_pair: Scale of 16 paired colors (in 8 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn pairwise colors in a color palette.
#'
#' \code{pal_unikn_pair} provides an additional uni.kn color palette  
#' that collects 16 paired colors of 8 color palettes  
#' as a data frame containing 16 colors (in 8 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_pair
#' dim(pal_unikn_pair)  # 1 16
#' pal_unikn_pair[1]    # color "karpfenblau4" by position
#' pal_unikn_pair[[1]]  # color value by position: #3E5496"
#' pal_unikn_pair["karpfenblau4"]  # color value by name
#' 
#' # Plotting palette:
#' plot_pal(pal_unikn_pair)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients). 
#'
#' @export

#   (b) Definition: ----  

pal_unikn_pair <- data.frame(
  pal_karpfenblau[c(4, 2)],
  pal_seeblau[c(5, 3)],
  pal_petrol[c(4, 2)],
  pal_seegruen[c(4, 2)],
  pal_Bordeaux[c(4, 2)],
  pal_pinky[c(4, 2)],
  pal_peach[c(4, 2)],
  pal_grau[c(2, 1)],
  stringsAsFactors = FALSE)

## Check:
# pal_unikn_pair
# plot_pal(pal_unikn_pair)


## ToDo: ------

# (1) Color definitions: 
#   - Define additional color palettes: 
#      - pal_unikn_pair for pairwise colors!
#      - pal_unikn_light for light uni.kn colors
#      - pal_unikn_dark for dark uni.kn colors

# (2) ad Functions: 
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