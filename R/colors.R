## colors.R | unikn
## hn | 2019 02 16
## ---------------

## Define colors and color palettes. 

## (A) Colors: ------ 


## Sources: 
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 

## Color palettes: ------

## (1) Basic color palettes: -----

##   (a) unikn default (web/sRGB) palette: ---- 

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
#' See https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_unikn
#' dim(pal_unikn)  # 1 10
#' pal_unikn[1]    # named color
#' pal_unikn[[1]]  # color
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_ppt}} for an alternative (ppt) version; 
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette. 
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


##   (b) unikn alternative (ppt) palette: ---- 

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
#' and https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_unikn_ppt
#' dim(pal_unikn_ppt)  # 1 10
#' pal_unikn_ppt[1]    # named color
#' pal_unikn_ppt[[1]]  # color
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette. 
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


## (2) Additional unikn color palettes: -----

## Source: Excel file provided at
## https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 

##   (a) seeblau: ---- 

# Table (from Excel file): 

# HEX:	   RGB:	         CMYK:		                      Comment:
# CCEEF9	 204 238 249	 20% von C82 | M3  | Y0 | K0		Seeblau 20% Corporate Design
# A6E1F4	 166 225 244	 35% von C82 | M3  | Y0 | K0		Seeblau 35% Corporate Design
# 59C7EB	  89 199 235	 65% von C82 | M3  | Y0 | K0		Seeblau 65% Corporate Design: preferred color: "seeblau"
# 00A9E0	   0 169 224	         C82 | M3  | Y0 | K0		Seeblau 100% Corporate Design
# 008ECE	   0 142 206	         C82 | M23 | Y0 | K0		Seeblau Dunkel *neu*


# Documentation: 

#' uni.kn seeblau color palette.
#'
#' \code{pal_seeblau} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors.
#'
#' See https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_seeblau
#' dim(pal_seeblau)  # 1 5
#' pal_seeblau[3]    # preferred (named) color
#' pal_seeblau[[3]]  # preferred color "seeblau"
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette. 
#'
#' @export

# Definition:

pal_seeblau <- data.frame(                               #  element: 
  "seeblau1" = rgb(204, 238, 249, maxColorValue = 255),  #  1. seeblau1 (non-transparent)
  "seeblau2" = rgb(166, 225, 244, maxColorValue = 255),  #  2. seeblau2 (non-transparent)
  "seeblau3" = rgb( 89, 199, 235, maxColorValue = 255),  #  3. seeblau3 (non-transparent): preferred color: "seeblau"
  "seeblau4" = rgb(  0, 169, 224, maxColorValue = 255),  #  4. seeblau4 (non-transparent)
  "seeblau5" = rgb(  0, 142, 206, maxColorValue = 255),  #  5. seeblau5 (non-transparent): neu
  stringsAsFactors = FALSE)

# Corresponding preferred color:

seeblau <- pal_seeblau[3]  # == seeblau.3 of pal_seeblau OR pal_unikn 


##   (b) peach: ----

# Table (from Excel file): 

# HEX:	   RGB:	         CMYK:		              Comment:
# FEE2DD	 254 226 221	 C0 | M16 | Y11 | K0		
# FECFC7	 254 207 199	 C0 | M26 | Y18 | K0		
# FFB8AC	 255 184 172	 C0 | M38 | Y27 | K0		
# FEA090	 254 160 144	 C0 | M49 | Y38 | K0		preferred color: "peach" (aus "Erleben", für Akzente)
# FF8E7B	 255 142 123	 C0 | M56 | Y46 | K0		


# Documentation: 

#' uni.kn peach color palette.
#'
#' \code{pal_peach} provides an additional uni.kn color palette  
#' as a data frame containing 5 colors.
#'
#' See https://www.uni-konstanz.de for details.
#'
#' @examples
#' pal_peach
#' dim(pal_peach)  # 1 5
#' pal_peach[4]    # preferred (named) color
#' pal_peach[[4]]  # preferred color "peach"
#'
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette. 
#'
#' @export

# Definition: 

pal_peach <- data.frame(                               #  Element: 
  "peach1" = rgb(254, 226, 221, maxColorValue = 255),  #  1. 
  "peach2" = rgb(254, 207, 199, maxColorValue = 255),  #  2. 
  "peach3" = rgb(255, 184, 172, maxColorValue = 255),  #  3. 
  "peach4" = rgb(254, 160, 144, maxColorValue = 255),  #  4. preferred color: "peach" 
  "peach5" = rgb(255, 142, 123, maxColorValue = 255),  #  5. 
  stringsAsFactors = FALSE)

# Corresponding preferred color:

peach <- pal_peach[4]  # == peach.4 of pal_peach 


##   (c) grau: ---- 

# Table (from Excel file): 

# HEX:	   RGB:	          CMYK:		             Comment:
# E1E2E5	 225 226 229	  C0 | M0 | Y0 | K10
# B8BCC1	 184 188 193	  C0 | M0 | Y0 | K20
# 9AA0A7	 154 160 167	  C0 | M0 | Y0 | K40   preferred color: "grau" 
# 73787E	 115 120 126	  C0 | M0 | Y0 | K60
# 4D5054	  77  80  84	  C0 | M0 | Y0 | K80


##   (d) petrol: ----

# Table (from Excel file): 

# HEX:	   RGB:	        CMYK:		                 Comment:
# 9CC6CF	 156 198 207	  C44 | M10 | Y18 | K0		
# 6AAAB7	 106 170 183	  C61 | M17 | Y26 | K2		
# 398D9F	  57 141 159	  C75 | M27 | Y31 | K7		
# 077187	   7 113 135	  C85 | M36 | Y34 | K17	 preferred color: "petrol"
# 035F72	   3  95 114	  C89 | M44 | Y38 | K26		


##   (e) seegruen: ----

# Table (from Excel file): 

# HEX:	   RGB:	         CMYK:		               Comment:
# 85D1CC	 113 209 204	 C50 | M0 | Y25 | K0		
# 54BFB7	  84 191 183	 C64 | M0 | Y34 | K0		
# 0AA398	  10 163 152	 C78 | M10 | Y47 | K0		
# 0A9086	  10 144 134	 C81 | M20 | Y51 | K4		 preferred color: "seegrün"
# 067E79	   6 126 121	 C84 | M27 | Y52 | K13		


##   (f) karpfenblau: ----

# Table (from Excel file): 

# HEX:	  RGB:	        CMYK:		                Comment:
# B4BCD6	180 188 214	  C34 | M23 | Y8  | K0		
# 8290BB	130 144 187	  C56 |  41 | Y11 | K0		
# 586BA4	 88 107 164	  C73 | M57 | Y11 | K1		
# 3E5496	 62  84 150	  C86 | M69 | Y10 | K1		preferred color: "karpfenblau"
# 324376	 50  67 118	  C92 |  77 | Y26 | K11		


##   (g) pinky: ----

# Table (from Excel file): 

# HEX:	  RGB:	        CMYK:		                Comment:
# F3BFCB	243 191 203	  C2  | M33 | Y11 | K0		
# ECA0B2	236 160 178	  C4  | M48 | Y16 | K0		
# E68098	230 128 152	  C6  | M62 | Y22 | K0		
# E0607E	224 96 126	  C7  | M74 | Y31 | K0		preferred color: "pinky"
# CA4A68	202 74 104	  C16 | M81 | Y40 | K5		

##   (h) Bordeaux: ----

# Table (from Excel file): 

# HEX:	  RGB:	        CMYK:		                Comment:
# D2A6B4	210 166 180	  C18 | M40 | Y19 | K1		
# BC7A8F	188 122 143	  C26 | M58 | Y27 | K6		
# A54D69	165  77 105	  C29 | M77 | Y35 | K17		
# 8E2043	142  32  67	  C29 | M95 | Y47 | K32		preferred color: "Bordeaux"
# 771434	119  20  52	  C32 | M99 | Y52 | K45		

##   (i) Ampeltöne: ----

# Table (from Excel file): 

# HEX:	  RGB:	        CMYK:		                Comment:
# 7CCA89	 124 202 137	 C55 | M0  | Y58 | K0		        Sehr gut
# EFDC60	 239 220  96	 C10 | M8  | Y72 | K0		        Stagnierend
# D01556	 208  21  86	 C11 | M99 | Y44 | K3		        Sehr schlecht


##   (+) Scale of all preferred colors: ------

pal_unikn_pref <- data.frame(  #  element: 
  "seeblau" = pal_seeblau[3],  #  1. seeblau
  "peach"   = pal_peach[4],    #  2. peach
  stringsAsFactors = FALSE)




## (B) Functions: ------


## pal_which: Get some [which] specific colors of a palette [pal]: ------ 

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
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette.
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



## pal_n: Function to get [n] (specific, suitable) colors of a known palette [pal]: ------ 

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
#' pal_n(99)  # returns maximal number of colors
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
  
  if (n > length(pal)){
    
    message(paste0("n exceeds n of colors in pal: Using maximum n = ", length(pal)))
    
    n <- length(pal)
    
  }
  
  out <- NA    # initialize
  
  # Select colors based on current pal and n: 
  if (isTRUE(all.equal(pal, pal_unikn))) {  # (1) pal == pal_unikn:
    
    # message("Get n specific colors of pal_unikn:")
    
    switch(n,
           out <- pal[c("seeblau3")],  # 1
           out <- pal[c("seeblau4", "seeblau2")],  # 2
           out <- pal[c("seeblau4", "seeblau2", "white")],  # 3   
           out <- pal[c("seeblau4", "seeblau2", "white", "black")],  # 4
           out <- pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],  # 5
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau3", "black")],  # 6
           out <- pal[c("seeblau4", "seeblau3", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 7
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau2", "seegrau4", "black")],  # 8
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1", "white", "seegrau1", "seegrau2", "seegrau3", "black")],   # 9
           out <- pal  # all 10 colors of pal_unikn
    )
    
  } else if (isTRUE(all.equal(pal, pal_seeblau))) {  # (2) pal == pal_seeblau:
    
    # message("Get n specific colors of pal_seeblau:")
    
    switch(n,
           out <- pal[c("seeblau3")],  # 1
           out <- pal[c("seeblau4", "seeblau2")],  # 2
           out <- pal[c("seeblau5", "seeblau3", "seeblau1")],  # 3   
           out <- pal[c("seeblau4", "seeblau3", "seeblau2", "seeblau1")],  # 4              
           out <- pal  # all 5 colors of pal_seeblau
    )
    
  } else {  # (+) any other pal:
    
    message("Unknown pal: Returning the first n colors:")
    
    out <- pal_which(which = 1:n, pal = pal)  # first n colors
    
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




## pal_n_sq: Get n^2 (n x n) specific colors of a palette [pal]: ------ 

#' Get n^2 dedicated colors of a color palette.
#'
#' \code{pal_n_sq} returns \code{n^2} dedicated colors of a color palette \code{pal} 
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
#' pal_n_sq(1)
#' pal_n_sq(2)
#' pal_n_sq(3) #  9 colors
#' pal_n_sq(4) # 11 colors = maximum of (n + 1) colors.
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_n}} for \code{n} dedicated colors of a known color palette; 
#' \code{\link{pal_which}} for specific colors of a color palette; 
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
    
    out <- pal[2] #  1 color: seeblau3
    
  } else if (n == 2) {
    
    out <- pal[c(1, 3, 5, 10)]   #  4 colors: seeblau4, seeblau2, white, black
    
  } else if (n == 3) {
    
    out <- pal[-7] #  9 colors: seeblau > white > black
    
  } else {
    
    out <- pal[c(1:2, 2:10)]   # 11 colors: seeblau (seeblau.3: 2x) > white (6 = mid) > black (11) [default]
    
  }
  
  return(out)
  
}

## Check:
# pal_n_sq(1)
# pal_n_sq(2)
# pal_n_sq(3) #  9 colors
# pal_n_sq(4) # 11 colors = maximum of (n + 1) colors.


## plot_pal: Plot information on a given color palette [pal]: ------ 

#' Plot information on a color palette.
#'
#' \code{plot_pal} plots information on a color palette \code{pal}.
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
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import ggplot2
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 theme
#' 
#' @import grDevices 
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
  
  pal_name <- deparse(substitute(pal)) # gets name of df
  
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
    labs(title = paste0("Colors of ", pal_name, ":"), 
         x = "[n]") + 
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


## ToDo: ------

# (1) unikn: 
#   - define additional color palettes.
#   - function to get n (good) colors
#   - function to get a box in seeblau (or other color)
#   - fonts?

# (2) any color pal: 
# - improve function to show colors (and options for full color info: nr, name, HEX, RGB, hsv)

## eof. ----------