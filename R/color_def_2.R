## color_def_2.R | unikn
## spds | uni.kn  | 2022 10 25
## ---------------------------

## Define colors and color palettes (2 of 2).

# (C) Other combinations of unikn color palettes: -------- 

#  (1) pal_unikn: Combination of pal_seeblau [5] and pal_unikn_web (11): ------ 

#   (a) Documentation: ----  

#' unikn default color palette (11 colors).
#'
#' \code{pal_unikn} combines the 5 shades of blue colors 
#' from color palette \code{\link{pal_seeblau}} 
#' with the 6 non-blue colors of \code{\link{pal_unikn_web}} 
#' to a palette containing 11 color values. 
#' 
#' Adding seeblau5 (i.e., \code{pal_seeblau[1]}) to 
#' the default color palette \code{\link{pal_unikn}} 
#' also puts \code{white} at the central (middle) 
#' position of a palette with 11 values:
#' 
#' \code{pal_unikn[[6]]} is \code{white} or \code{"#FFFFFF"}.  
#'
#' This is useful when creating color gradients. 
#'
#' See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
#'
#' @examples
#' pal_unikn
#' dim(pal_unikn)  # 1 11
#' 
#' # Access by position:
#' pal_unikn[1]    # new color "seeblau5" (as df)
#' pal_unikn[[1]]  # new color value "#008ECE"
#' 
#' # Access by name: 
#' pal_unikn["seeblau5"]   # new color "seeblau5" (as df) 
#' pal_unikn[["seeblau5"]] # new color value "#008ECE"
#' 
#' # Viewing/using color palette:
#' seecol(pal_unikn)
#' demopal(pal_unikn, type = "curve", main = "Default colors of Konstanz University")
#' 
#' # Note:
#' pal_unikn[6] # "white" or "#FFFFFF" as central of 11 colors
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_seeblau}} for the uni.kn seeblau color palette; 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes.    
#'
#' @export

#   (b) Definition: ----  

pal_unikn <- cbind(rev(pal_seeblau), pal_unikn_web[5:10])

# Check: 
# pal_unikn

#  (2) pal_unikn_pref: Scale of all 9 (or 8 + 1) preferred colors: ------


#   (+) Original definition: ---- 

pal_unikn_pref <- data.frame(  # Element: 
  "Seeblau"     = Seeblau,     # pal_seeblau[[3]],      #  1. seeblau
  "Peach"       = Peach,       # pal_peach[[4]],        #  2. peach
  "Grau"        = Grau,        # pal_grau[[3]],         #  3. grau 
  "Petrol"      = Petrol,      # pal_petrol[[4]],       #  4. petrol 
  "Seegruen"    = Seegruen,    # pal_seegruen[[4]],     #  5. seegruen 
  "Karpfenblau" = Karpfenblau, # pal_karpfenblau[[4]],  #  6. karpfenblau
  "Pinky"       = Pinky,       # pal_pinky[[4]],        #  7. pinky 
  "Bordeaux"    = Bordeaux,    # pal_bordeaux[[4]],     #  8. bordeaux
  "Signal"      = Signal,      # pal_signal[[2]],       # (9.) (alert) signal
  stringsAsFactors = FALSE)

#   (a) Documentation: ----  

#' uni.kn preferred colors in a color palette.
#'
#' \code{pal_unikn_pref} provides an additional uni.kn color palette  
#' that collects the preferred color of each palette 
#' as a data frame containing 9 (or 8 + 1) colors. 
#' 
#' The colors are arranged in a sequence that provides 
#' high contrasts between adjacent colors. 
#' 
#' Note that the (alert) color \code{\link{Signal}} is 
#' not a preferred color according to the official color 
#' definition.
#'
#' See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
#'
#' @examples
#' pal_unikn_pref
#' dim(pal_unikn_pref)  # 1 9
#' 
#' # Access by position:
#' pal_unikn_pref[1]    # color Seeblau (as df)
#' pal_unikn_pref[[1]]  # color value "#59C7EB" 
#' 
#' # Access by name: 
#' pal_unikn_pref["Seeblau"]   # color "seeblau3" (as df) 
#' pal_unikn_pref[["Seeblau"]] # color value "#59C7EB" 
#' 
#' # Viewing/using color palette:
#' seecol(pal_unikn_pref)
#' demopal(pal_unikn_pref, type = "mosaic", main = "Preferred colors of Konstanz University")
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes.    
#'
#' @export

#   (b) Definition: ----  
#   Re-arrange original order (for higher contrasts):

pal_unikn_pref <- pal_unikn_pref[c(1, 7, 5, 2, 6, 9, 8, 3, 4)]

rownames(pal_unikn_pref) <- "1"  # fix/set rownames() of palette

## Check:
# pal_unikn_pref
# rownames(pal_unikn_pref)
# seecol(pal_unikn_pref)


#  (3) pal_unikn_light: Scale of 8 light colors (in 4 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn light colors in a color palette.
#'
#' \code{pal_unikn_light} provides an additional uni.kn color palette  
#' that collects 2 light colors of 4 color palettes  
#' as a data frame containing 8 colors (in 4 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
#'
#' @examples
#' pal_unikn_light
#' dim(pal_unikn_light)  # 1 8 
#' 
#' # Access by position:
#' pal_unikn_light[1]    # color "seeblau3" (as df)
#' pal_unikn_light[[1]]  # color value "#59C7EB" 
#' 
#' # Access by name: 
#' pal_unikn_light["seeblau3"]   # color "seeblau3" (as df) 
#' pal_unikn_light[["seeblau3"]] # color value "#59C7EB"  
#' 
#' # Viewing/using color palette:
#' seecol(pal_unikn_light)
#' demopal(pal_unikn_light, type = "bar", main = "Light colors of Konstanz University")
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes.   
#'
#' @export

#   (b) Definition: ----  

pal_unikn_light <- data.frame(
  pal_seeblau[c(3, 1)],
  pal_peach[c(3, 1)],
  pal_seegruen[c(3, 1)], 
  pal_pinky[c(2, 1)],
  pal_grau[c(2, 1)],
  stringsAsFactors = FALSE)

rownames(pal_unikn_light) <- "1"  # fix/set rownames() of palette

## Check:
# pal_unikn_light
# rownames(pal_unikn_light)
# seecol(pal_unikn_light)


#  (4) pal_unikn_dark: Scale of 8 dark colors (in 4 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn dark colors in a color palette.
#'
#' \code{pal_unikn_dark} provides an additional uni.kn color palette  
#' that collects 2 dark colors of 4 color palettes  
#' as a data frame containing 8 colors (in 4 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
#'
#' @examples
#' pal_unikn_dark
#' dim(pal_unikn_dark)  # 1 8 
#' pal_unikn_dark[1]    # color "karpfenblau5" by position
#' pal_unikn_dark[[1]]  # color value by position: #324376"
#' pal_unikn_dark["karpfenblau5"]  # color value by name
#' 
#' # Viewing/using color palette:
#' seecol(pal_unikn_dark)
#' demopal(pal_unikn_dark, type = "points", main = "Dark colors of Konstanz University")
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes.    
#'
#' @export

#   (b) Definition: ----  

pal_unikn_dark <- data.frame(
  pal_karpfenblau[c(5, 3)],
  pal_bordeaux[c(5, 3)],
  pal_petrol[c(5, 3)], 
  pal_pinky[c(5, 3)],
  pal_grau[c(5, 3)],
  stringsAsFactors = FALSE)

rownames(pal_unikn_dark) <- "1"  # fix/set rownames() of palette

## Check:
# pal_unikn_dark
# seecol(pal_unikn_dark)


#  (5) pal_unikn_pair: Scale of 16 paired colors (in 8 pairs) from other palettes: ------ 

#   (a) Documentation: ----  

#' uni.kn pairwise colors in a color palette.
#'
#' \code{pal_unikn_pair} provides an additional uni.kn color palette  
#' that collects 16 paired colors of 8 color palettes  
#' as a data frame containing 16 colors (in 8 pairs). 
#' 
#' See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
#'
#' @examples
#' pal_unikn_pair
#' dim(pal_unikn_pair)  # 1 16
#' pal_unikn_pair[1]    # color "karpfenblau4" by position
#' pal_unikn_pair[[1]]  # color value by position: #3E5496"
#' pal_unikn_pair["karpfenblau4"]  # color value by name
#' 
#' # Viewing/using color palette:
#' seecol(pal_unikn_pair)
#' demopal(pal_unikn_pair, type = "polygon", main = "A pair-wise color palette")
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes. 
#'
#' @export

#   (b) Definition: ----  

# darker/brighter pairs:

pal_unikn_pair <- data.frame(
  pal_karpfenblau[c(4, 2)],
  pal_seeblau[c(5, 3)],
  pal_petrol[c(4, 2)],
  pal_seegruen[c(4, 2)],
  pal_bordeaux[c(4, 2)],
  pal_pinky[c(4, 2)],
  pal_peach[c(4, 2)],
  pal_grau[c(2, 1)],
  stringsAsFactors = FALSE)

# # brighter/darker pairs:
# 
# pal_unikn_pair <- data.frame(
#   pal_karpfenblau[c(2, 4)],
#   pal_seeblau[c(3, 5)],
#   pal_petrol[c(2, 4)],
#   pal_seegruen[c(2, 4)],
#   pal_bordeaux[c(2, 4)],
#   pal_pinky[c(2, 4)],
#   pal_peach[c(2, 4)],
#   pal_grau[c(1, 2)],
#   stringsAsFactors = FALSE)

rownames(pal_unikn_pair) <- "1"  # fix/set rownames() of palette

## Check:
# pal_unikn_pair
# seecol(pal_unikn_pair)




# (D) Crayon colors: -------- 

# Define crayon styles: ------ 

# lighter:
in_grau     <- crayon::make_style(pal_grau[[4]], grey = TRUE, colors = 256)
in_peach    <- crayon::make_style(pal_peach[[5]],    colors = 256)
in_pinky    <- crayon::make_style(pal_pinky[[5]],    colors = 256)
in_seeblau  <- crayon::make_style(pal_seeblau[[5]],  colors = 256)
in_seegruen <- crayon::make_style(pal_seegruen[[5]], colors = 256)

# darker:
in_bordeaux    <- crayon::make_style(pal_bordeaux[[4]],    colors = 256)
in_petrol      <- crayon::make_style(pal_petrol[[4]],      colors = 256)
in_karpfenblau <- crayon::make_style(pal_karpfenblau[[4]], colors = 256)

# Notes:
# - See details of ?crayon::make_style() for using the grey and colors arguments.  
# - In contexts outside the unikn pkg, the RStudio terminal only shows the 256 ANSI colors.


# demo_crayons: ------

demo_crayons <- function(){
  
  cat(crayon::black(# "Crayon colors:",
                    in_bordeaux("bordeaux"), 
                    in_grau("grau"),
                    in_karpfenblau("karpfenblau"), 
                    in_peach("peach"), 
                    in_petrol("petrol"), 
                    in_pinky("pinky"), 
                    in_seeblau("seeblau"), 
                    in_seegruen("seegruen"), 
                    sep = " | ")
  )
  
} # demo_crayons().



## Sources: Links to unikn color definitions ------ 

# Defining CD elements according to specifications publicly provided at https://www.uni-konstanz.de. 
# Sources for color definitions: 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 


## ToDo: ------

# (+) Additional elements:
#   - ggplot_addon: provide complete ggplot theme(s)
#   - text elements: heading and underline (with seeblau color defaults)
#   - fonts?
#   - logo: Merken-boX or hexagon in seeblau with letter "R"

## eof. ----------