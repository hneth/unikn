## color_def_2.R | unikn
## spds | uni.kn  | 2019 04 02
## ---------------------------

## Define colors and color palettes (2 of 2).

# (C) Other combinations of unikn color palettes: -------- 

#  (1) pal_unikn: Combination of pal_seeblau [5] and pal_unikn_web (11): ------ 

#   (a) Documentation: ----  

#' unikn default color palette (11 colors).
#'
#' \code{pal_unikn} combines the 5 blue colors 
#' from color palette \code{\link{pal_seeblau}} 
#' with the 6 non-blue colors of \code{\link{pal_unikn}} 
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
#' See \url{https://www.uni-konstanz.de} for details.
#'
#' @examples
#' pal_unikn
#' dim(pal_unikn)         # 1 11
#' 
#' # Access by position:
#' pal_unikn[1]    # new color "seeblau5" (as df)
#' pal_unikn[[1]]  # new color value "#008ECE"
#' 
#' # Access by name: 
#' pal_unikn["seeblau5"]   # new color "seeblau5" (as df) 
#' pal_unikn[["seeblau5"]] # new color value "#008ECE"
#' 
#' # Plotting palette:
#' seecol(pal_unikn)
#' 
#' # Note:
#' pal_unikn[6] # "white" or "#FFFFFF" as central of 11 colors
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{pal_seeblau}} for the uni.kn seeblau color palette; 
#' \code{\link{seecol}} to show color palettes;
#' \code{\link{usecol}} to use color palettes.   
#'
#' @export

#   (b) Definition: ----  

pal_unikn <- cbind(rev(pal_seeblau), pal_unikn_web[5:10])

# Check: 
# pal_unikn

#  (2) pal_unikn_pref: Scale of all 9 (or 8 + 1) preferred colors: ------

#   (a) Documentation: ----  

#' uni.kn preferred colors in a color palette.
#'
#' \code{pal_unikn_pref} provides an additional uni.kn color palette  
#' that collects the preferred color of each palette 
#' as a data frame containing 9 (or 8 + 1) colors. 
#' 
#' Note that the (alert) color \code{\link{Signal}} is 
#' not a preferred color according to the official color 
#' definition.
#'
#' See \url{https://www.uni-konstanz.de} for details.
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
#' # Plotting palette:
#' seecol(pal_unikn_pref)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} to show color palettes;
#' \code{\link{usecol}} to use color palettes.   
#'
#' @export

#   (b) Definition: ----  

pal_unikn_pref <- data.frame(            # Element: 
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

## Check:
# pal_unikn_pref
# seecol(pal_unikn_pref)

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
#' 
#' # Access by position:
#' pal_unikn_light[1]    # color "seeblau3" (as df)
#' pal_unikn_light[[1]]  # color value "#59C7EB" 
#' 
#' # Access by name: 
#' pal_unikn_light["seeblau3"]   # color "seeblau3" (as df) 
#' pal_unikn_light[["seeblau3"]] # color value "#59C7EB"  
#' 
#' # Plotting palette:
#' seecol(pal_unikn_light)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} to show color palettes;
#' \code{\link{usecol}} to use color palettes.   
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

## Check:
# pal_unikn_light
# seecol(pal_unikn_light)

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
#' seecol(pal_unikn_dark)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_pair}} for a pairwise uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} to show color palettes;
#' \code{\link{usecol}} to use color palettes.   
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
#' seecol(pal_unikn_pair)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{pal_unikn_light}} for a lighter uni.kn color palette; 
#' \code{\link{pal_unikn_dark}} for a darker uni.kn color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette; 
#' \code{\link{seecol}} to show color palettes;
#' \code{\link{usecol}} to use color palettes. 
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

## Check:
# pal_unikn_pair
# seecol(pal_unikn_pair)



## ToDo: ------

# - Export all preferred color values (as HEX character value) with Capital letter names!
# - Do NOT export the other palettes and values, but use "seecol" function as user-interface. 

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