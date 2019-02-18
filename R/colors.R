## colors.R | unikn
## hn | 2019 02 18
## ---------------

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

# (1) seeblau: ----- 

#   (a) Table (from Excel file): ---- 

#    HEX:	   RGB:	         CMYK:		                      Comment:
# 1. CCEEF9	 204 238 249	 20% von C82 | M3  | Y0 | K0		Seeblau 20% Corporate Design
# 2. A6E1F4	 166 225 244	 35% von C82 | M3  | Y0 | K0		Seeblau 35% Corporate Design
# 3. 59C7EB	  89 199 235	 65% von C82 | M3  | Y0 | K0		Seeblau 65% Corporate Design: preferred color: "seeblau"
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
  "seeblau1" = rgb(204, 238, 249, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(166, 225, 244, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 199, 235, maxColorValue = 255),  #  3. seeblau3 (non-transparent): preferred color: "seeblau"
  "seeblau4" = rgb(  0, 169, 224, maxColorValue = 255),  #  4. seeblau4 (non-transparent)
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

# (2) peach: -----

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

# (3) grau: ----- 

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

# (4) petrol: -----

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

# (5) seegruen: -----

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

# (6) karpfenblau: -----

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


# (7) pinky: -----

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


# (8) Bordeaux: -----

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


# (9) Ampeltöne: pal_signal -----

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

# (1) pal_unikn_plus: Combination of pal_seeblau and pal_unikn (11): ------ 

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

# (2) pal_unikn_pref: Scale of all X preferred colors: ------

#   (a) Documentation: ----  

#' uni.kn preferred colors in a color palette.
#'
#' \code{pal_unikn_pref} provides an additional uni.kn color palette  
#' that collects the preferred color of each palette 
#' as a data frame containing X colors.
#'
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn_pref
#' dim(pal_unikn_pref)  # 1 X (2)
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
  "seeblau"     = pal_seeblau[[3]],      # 1. seeblau
  "peach"       = pal_peach[[4]],        # 2. peach
  "grau"        = pal_grau[[3]],         # 3. grau 
  "petrol"      = pal_petrol[[4]],       # 4. petrol 
  "seegruen"    = pal_seegruen[[4]],     # 5. seegruen 
  "karpfenblau" = pal_karpfenblau[[4]],  # 6. karpfenblau
  "pinky"       = pal_pinky[[4]],        # 7. pinky 
  "Bordeaux"    = pal_Bordeaux[[4]],     # 8. Bordeaux
  "signal"      = pal_signal[[2]],       # 9. (alert) signal
  stringsAsFactors = FALSE)

## (B) Functions: ------

# pal_which: Get some [which] specific colors of a palette [pal]: ------ 

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

# Documentation: ---- 

#' Plot a color palette.
#'
#' \code{plot_pal} plots information on a color palette \code{pal}.
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' plot_pal()  # plots default color palette 
#' plot_pal(pal = pal_unikn_plus) 
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

# Definition: ---- 

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
          plot.title = element_text(family = "Arial", face = "bold"), 
          panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(linetype = 2), 
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

## ToDo: Provide additional info on a color palette: ------ 

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
# col_gradient <- colorRampPalette(colors = c(pal_seeblau, pal_grau, pal_peach))  # 3 palettes

## Demo: 
# n <- 20
# col_gradient(n)
# plot(rep(1, n), col = (col_gradient(n)), pch = 19, cex = 3)
# plot(rep(1, n), col = (col_gradient(n)), pch = 15, cex = 3)

## Use example code to create a function col_scale:

# col_scale: Provide a color gradient based on given colors or color palettes: -------- 

# Documentation: ---- 

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

# Definition: ---- 

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

# (1) unikn: 
#   - define the additional color palettes.
#   - split color_palettes and color_functions (into separate files). 

# (2) Any color pal: 
#   - split color_palettes and color_functions (into separate files). 
#   - improve function to show colors (and options for full color info: nr, name, HEX, RGB, hsv)
#   - improve function pal_n to get n (good) colors (and consider integrating it into palettes)
#   - provide color gradient function(s) (to return an arbitrary number of colors)
#   - Additional color palettes: 
#      - pal_unikn_pair for pairwise colors!
#      - pal_unikn_light for light uni.kn colors
#      - pal_unikn_dark for dark uni.kn colors

# (3) Other elements:
#   - add a function to get a box in seeblau (or other color)
#   - provide complete ggplot theme(s)
#   - fonts?

## eof. ----------