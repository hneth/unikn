## color_fun_2.R | unikn
## spds | uni.kn | 2022 12 29
## --------------------------

## Define color-related functions 
## (e.g., for finding similar colors, match patterns in color names, and creating color palettes). 

## Note: (1) Main functions are in file "color_fun_1.R".


## (2) Auxiliary functions: ---------- 


# 1. newpal(): Define a new color palette ---------- 

# - Documentation: ------ 

#' Define a new color palette 
#'
#' \code{newpal} allows defining new color palettes 
#' (as data frames or vectors). 
#' 
#' @param col A required vector of colors 
#' (specified as R color names, HEX codes, or RGB values). 
#' 
#' @param names An optional character vector of color names. 
#' Default: \code{names = NULL}, using default color names. 
#' Setting \code{names = NA} removes all color names.
#' 
#' @param as_df Should the new color palette be returned as 
#' a data frame (rather than as a vector)? 
#' Default: \code{as_df = FALSE}. 
#' 
#' @examples
#' 
#' newpal(col = c("black", "white"), names = c("dark", "bright"))
#' 
#' # Example: 3 ways of defining a new color palette:
#' 
#' # (1) From R color names: -----
#' 
#' pal_flag_de <- newpal(col = c("black", "firebrick3", "gold"),
#'                       names = c("Schwarz", "Rot", "Gold"))
#' seecol(pal_flag_de, main = "Colors in the flag of Germany")
#' 
#' # (2) From HEX values: -----
#' 
#' # (a) Google logo colors:
#' # Source: https://www.schemecolor.com/google-logo-colors.php
#' color_google <- c("#4285f4", "#34a853", "#fbbc05", "#ea4335")
#' names_google <- c("blueberry", "sea green", "selective yellow", "cinnabar")
#' pal_google   <- newpal(color_google, names_google)
#' seecol(pal_google, main = "Colors of the Google logo", col_brd = "white", lwd_brd = 10)
#' 
#' # (b) German flag (revised):
#' # Based on a different source at
#' # <https://www.schemecolor.com/germany-flag-colors.php>:
#' pal_flag_de_2 <- newpal(col = c("#000000", "#dd0000", "#ffce00"),
#'                         names = c("black", "red", "gold")
#'                         )
#' seecol(pal_flag_de_2, main = "Colors of the German flag (www.schemecolor.com)")
#' 
#' # (c) MPG colors:
#' pal_mpg <- newpal(col = c("#007367", "white", "#D0D3D4"),
#'                   names = c("mpg green", "white", "mpg grey")
#'                   )
#' seecol(pal_mpg, main = "Colors of the Max Planck Society")
#' 
#' # (3) From RGB values: -----
#' 
#' # A barrier-free color palette
#' # Source: Okabe & Ito (2002): Color Universal Design (CUD):
#' #         Fig. 16 of <https://jfly.uni-koeln.de/color/>:  
#' 
#' # (a) Vector of colors (as RGB values):
#' o_i_colors <- c(rgb(  0,   0,   0, maxColorValue = 255),  # black
#'                 rgb(230, 159,   0, maxColorValue = 255),  # orange
#'                 rgb( 86, 180, 233, maxColorValue = 255),  # skyblue
#'                 rgb(  0, 158, 115, maxColorValue = 255),  # green
#'                 rgb(240, 228,  66, maxColorValue = 255),  # yellow
#'                 rgb(  0, 114, 178, maxColorValue = 255),  # blue
#'                 rgb(213,  94,   0, maxColorValue = 255),  # vermillion
#'                 rgb(204, 121, 167, maxColorValue = 255)   # purple
#' )
#' 
#' # (b) Vector of color names:
#' o_i_names <- c("black", "orange", "skyblue", "green", "yellow", "blue", "vermillion", "purple")
#' 
#' # (c) Use newpal() to combine colors and names:
#' pal_okabe_ito <- newpal(col = o_i_colors,
#'                         names = o_i_names)
#' 
#' seecol(pal_okabe_ito,
#'        main = "Color-blind friendly color scale (Okabe & Ito, 2002)")
#' 
#' # (+) Compare custom color palettes: ----- 
#' 
#' my_pals <- list(pal_flag_de, pal_flag_de_2, pal_google, pal_mpg, pal_okabe_ito)
#' seecol(my_pals, col_brd = "white", lwd_brd = 5,
#'        main = "Comparing custom color palettes")
#' 
#' @family color functions
#' 
#' @aliases defpal
#' @aliases defcol
#' 
#' @seealso 
#' \code{\link{seecol}} for viewing and comparing color palettes;  
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{grepal}} for finding named colors; 
#' \code{\link{shades_of}} to defining shades of a given color; 
#' \code{\link{ac}} for adjusting color transparency; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @import graphics 
#' @import grDevices 
#' @import utils
#' 
#' @export 

## Not used:
## @param ... Additional arguments (passed on to \code{\link{usecol()}}). 
## Candiates for additional arguments are 
## \code{n} (an integer for specifying the number of desired colors in the palette) 
## and \code{alpha} (opacity value from 0 to 1). 

# - Definition: ------ 

newpal <- function(col,            # a vector of colors
                   names = NULL,   # a vector of color names
                   as_df = FALSE   # return palette as df? 
                   # ...           # additional arguments to usecol().
) {
  
  # Prepare: ----- 
  
  # Robustify inputs:
  if ( any(is.na(col)) ) stop("'col' must be a vector of (named or HEX) colors without NA values.")
  
  if ( any(!is_col(col)) ) stop("'col' must be a vector containing ONLY (named or HEX) colors.")
  
  if ( any(!is.na(names)) && ((length(col) != length(names))) ) {
    
    message(paste0("Length of 'col' = ", length(col), 
                   " vs. 'names' = ",    length(names), ". Using default names..."))
    names <- NULL
    
  }
  
  if ( is.null(names) ) {
    
    # if ( length(col) == length(names(col)) ){ # all cols have names:
    
    if ( all(nchar(names(col)) > 0) ){ # all cols have names:
      
      names <- names(col)  # keep col names
      
    }
  }
  
  
  # Main: Create data.frame or vector of col: ----- 
  
  outpal <- col  # copy input (df or vector)
  
  
  # Handle names: ----
  
  if ( !is.null(names) && all(is.na(names)) ) { # 1. names were SET to NA:
    
    outpal <- unname(outpal)  # remove names
    
  } else if ( !is.null(names) && all(!is.na(names)) ) { # 2. names exist:
    
    names(outpal) <- names  # use existing names
    
    # } else if ( is.null(names(col)) == FALSE ) { # 2. col input contained SOME names:
    #   
    #  names(outpal) <- names(col)  # use the names of col input
    
  } else { # 3. get default color names:
    
    names(outpal) <- get_col_names(col)  # (a) use helper function (for default and custom color names)
    
    # names(outpal) <- as.character(1:length(col))  # (b) use numeric digits as names
    
  } # if (names).
  
  # # Apply ... arguments:
  # outpal <- usecol(pal = outpal, use_names = TRUE, ...) 
  
  # Handle as_df: ----  
  if (as_df) {
    
    if (!is.data.frame(outpal)){
      
      outpal <- data.frame(outpal, stringsAsFactors = FALSE) # df as column
      
      outpal <- t(outpal) # df as row
      
      outpal <- data.frame(outpal, row.names = NULL, stringsAsFactors = FALSE)
      
    }
    
  } else {
    
    outpal <- unlist(outpal)  # as vector 
    
    if (!is.vector(outpal)) {
      outpal <- as.vector(outpal)  # remove attributes other than names!
    }

  }
  
  
  # Output: ----- 
  
  return(outpal)
  
} # newpal().  

# ## Check:
# # (0) Basics:
# newpal(col = c("black", "white"))  # as named vector (with automatic names)
# newpal(col = c("black", "white"), names = c("b", "w"), as_df = FALSE)  # as vector (with new names)
# newpal(col = c("black", "white"), names = c("b", "w"), as_df = TRUE)   # as data.frame (with new names)
# #
# # # Custom colors / palettes:
# newpal(col = pal_unikn)  # unikn palette (with default names)
# newpal(col = pal_unikn, names = NA)  # unikn palette (without names, as set to NA)
# newpal(col = pal_unikn, names = paste0("c_", 1:11))  # with new names
# newpal(col = pal_unikn, names = paste0("c_", 1:10))  # with default names
# 
# # Combinations: unikn & default colors()
# newpal(col = c(Seeblau, "white", Pinky))  # with automatic names
# newpal(col = c(Seeblau, "white", Pinky), names = LETTERS[1:3])  # with new names 
# newpal(col = c("deeppink", pal_unikn))    # with automatic names
# newpal(col = c("deeppink", pal_unikn), names = letters[1:12])  # with new names
# 
# # As df vs. vector:
# newpal(col = c("black", "white"), as_df = FALSE)  # default: named vector
# newpal(col = c("black", "white"), as_df = TRUE)   # as named df
# seecol(newpal(col = c("black", "white"), names = c("dark", "bright"), as_df = TRUE))   # as named df
# seecol(newpal(col = c("black", "white"), names = c("dark", "bright"), as_df = FALSE))  # as named vector
# 
# seecol(newpal(col = c("black", "white"), names = c("dark", "bright"), as_df = TRUE), n = 5)  # scaled df
# seecol(newpal(col = c("black", "white"), names = c("dark", "bright"), as_df = FALSE), n = 5) # scaled vector

# # (1) From R color names:
# pal_flag_de <- newpal(col = c("black", "firebrick", "gold"),
#                       names = c("Schwarz", "Rot", "Gold"))
# seecol(pal_flag_de, main = "Colors in the flag of Germany")

# # (2) From HEX values:
# 
# # (a) German flag colors revised: 
# # According to a different source:
# # https://www.schemecolor.com/germany-flag-colors.php
# pal_flag_de_2 <- newpal(col = c("#000000", "#dd0000", "#ffce00"),
#                         names = c("black", "electric red", "tangerine yellow"))
# pal_flag_de_2 <- newpal(col = c("#000000", "#dd0000", "#ffce00"),
#                         names = c("black", "red", "gold"))
# seecol(pal_flag_de_2, main = "Colors of German flag (www.schemecolor.com)")
# 
# # (b) Google logo colors:
# # Source: https://www.schemecolor.com/google-logo-colors.php
# color_google <- c("#4285f4", "#34a853", "#fbbc05", "#ea4335")
# names_google <- c("blueberry", "sea green", "selective yellow", "cinnabar")
# pal_google   <- newpal(color_google, names_google)
# seecol(pal_google, main = "Colors of the Google logo", col_brd = "white", lwd_brd = 10)
#
# # (c) MPG colors:
# pal_mpg <- newpal(col = c("#007367", "white", "#D0D3D4"),
#                   names = c("mpg green", "white", "mpg grey")
#                   )
# seecol(pal_mpg, main = "Colors of the Max Planck Society")

# # (3) From RGB values:
# 
# # Source: Okabe & Ito (2002):
# # Color Universal Design (CUD):
# # How to make figures and presentations that are friendly to Colorblind people
# # Fig. 16 of <https://jfly.uni-koeln.de/color/>:
# 
# # (a) Vector of colors (as RGB values):
# o_i_colors <- c(rgb(  0,   0,   0, maxColorValue = 255),  # black
#                 rgb(230, 159,   0, maxColorValue = 255),  # orange
#                 rgb( 86, 180, 233, maxColorValue = 255),  # skyblue
#                 rgb(  0, 158, 115, maxColorValue = 255),  # green
#                 rgb(240, 228,  66, maxColorValue = 255),  # yellow
#                 rgb(  0, 114, 178, maxColorValue = 255),  # blue
#                 rgb(213,  94,   0, maxColorValue = 255),  # vermillion
#                 rgb(204, 121, 167, maxColorValue = 255)   # purple
# )
# 
# # (b) Vector of color names:
# o_i_names <- c("black", "orange", "skyblue", "green", "yellow", "blue", "vermillion", "purple")
# 
# # (c) Create color palette (with newpal):
# pal_okabe_ito <- newpal(col = o_i_colors,
#                         names = o_i_names)
# 
# # Show color palette:
# seecol(pal_okabe_ito,
#        main = "Color-blind friendly color scale (Okabe & Ito, 2002)")

# # Compare custom color palettes:
# my_pals <- list(pal_flag_de, pal_flag_de_2, pal_google, pal_mpg, pal_okabe_ito)
# seecol(my_pals, col_brd = "white", lwd_brd = 5,
#        main = "Comparing custom color palettes")


# 2. grepal(): Find colors matching a pattern (in palette names) -------

# - Documentation: ------ 

#' Get a vector of colors whose names match a regular expression 
#'
#' \code{grepal} returns a vector of colors whose names match a regular expression (regex). 
#' 
#' By default, the \bold{base} R vector of named colors (i.e., \code{colors()}) is searched 
#' for names matching a \code{pattern} (which can be a simple string or regular expression). 
#' 
#' If \code{x} (i.e., the object to be searched) is provided, 
#' it is must be a vector of color names or a data frame of named color objects 
#' (i.e., a color palette). 
#' 
#' If \code{plot = TRUE}, \code{grepal} also visualizes the detected colors  
#' (by passing its result to \code{\link{seecol}}, as a side-effect).
#' 
#' This function facilitates searching colors by name and 
#' yields (a vector of) colors of similar color hue (provided 
#' that the color's hue is expressed in a color's name). 
#' Its name \code{grepal} is an abbreviation of \code{grep} and "pal". 
#'
#' @param pattern A regular expression 
#' (specified as a string/character object). 
#' 
#' @param x A vector of R color names or a data frame of named colors  
#' (i.e., whose names can be searched). 
#' Default: \code{x = colors()}. 
#' 
#' @param ignore_case Should the case of pattern be ignored 
#' (passed to \code{ignore.case} of the \code{grep} function)?   
#' Default: \code{ignore_case = TRUE}.
#' 
#' @param plot Boolean: Plot the output (using \code{\link{seecol}})? 
#' Default: \code{plot = TRUE}. 
#' 
#' @examples
#' grepal("tan")
#' 
#' # With regular expressions:
#' some_grey  <- grepal("gr(a|e)y", plot = FALSE)
#' start_grey <- grepal("^gr(a|e)y", plot = FALSE)
#' only_grey  <- grepal("^gr(a|e)y$", plot = FALSE)
#' 
#' length(some_grey)
#' length(only_grey)
#' 
#' # With other color objects (df as x):
#' grepal("blau", x = pal_unikn)
#' grepal("SEE", x = pal_unikn_pref, ignore_case = FALSE)
#' 
#' # Applications:
#' seecol(grepal("white"), col_bg = "lightblue2", main = "See 'white' colors()")
#' 
#' olives  <- grepal("olive", plot = FALSE)
#' oranges <- grepal("orange", plot = FALSE)
#' seecol(list(olives, oranges), 
#'        pal_names = c("olives", "oranges"), 
#'        main = "Comparing olives and oranges")
#' 
#' @family color functions
#' 
#' @seealso 
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{shades_of}} to defining shades of a given color; 
#' \code{\link{ac}} for adjusting color transparency; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#' 
#' @import grDevices 
#' 
#' @export 

## Not used:
## @param ... Additional arguments (passed on to \code{\link{seecol()}}). 

# - Definition: ------ 

grepal <- function(pattern, 
                   x = colors(),  # ToDo: Consider using all_colors(). 
                   ignore_case = TRUE, 
                   plot = TRUE
                   # ...          # additional arguments to seecol().
){
  
  # Initialize: ----
  
  ix <- NA  # index
  cv <- NA  # color vector
  
  
  # Main: ---- 
  
  # # if (is.vector(x)){ # checks only for absence of attributes other than 'names' (which is FALSE for unikn palettes)!
  # if (!is.data.frame(x)){
  # 
  #   # print("1. x is NOT a data frame:")
  #       
  #   if (is.null(names(x))){ # No names: Search the values of x:
  # 
  #     # print("Searching the elements of x:")
  #           
  #     ix <- grep(x = x, pattern = pattern, ignore.case = ignore_case)
  #     cv <- x[ix]
  #     
  #   } else { # search the names() of x:
  #     
  #     # print("Searching the names() of x:")
  #     
  #     ix <- grep(x = names(x), pattern = pattern, ignore.case = ignore_case)
  #     cv <- x[ix]
  #     
  #   }
  #   
  # } else if (is.data.frame(x)){
  # 
  #   print("2. Searching the names() of data frame x:")
  #       
  #   df <- x  # work with df: 
  #   ix <- grep(x = names(df), pattern = pattern, ignore.case = ignore_case)
  #   cv <- df[ix]
  #   
  # } # if().
  
  
  # Simplify: Only distinguish named from non-named data structures:
  
  if (is.null(names(x))){ # No names: Search the values of x:
    
    message(in_petrol("Searching the ", in_bordeaux("elements"), " of x", sep = ""))
    
    ix <- grep(x = x, pattern = pattern, ignore.case = ignore_case)
    cv <- x[ix]
    
  } else { # search the names() of x:
    
    message(in_petrol("Searching the ", in_bordeaux("names"), " of x", sep = ""))
    
    ix <- grep(x = names(x), pattern = pattern, ignore.case = ignore_case)
    cv <- x[ix]
    
  } # if (names).
  
  # Reset character(0) and named character(0) to NA: 
  if (length(cv) == 0) { cv <- NA }  # to unify types & names
  
  
  # Plot: ----
  
  if (plot & (any(is.na(cv) == FALSE))){
    
    n <- length(cv)
    
    if (n == 1L) { cword <- "color" } else { cword <- "colors" }
    caption <- paste0("Found ", n, " ", cword, " matching ", "'", pattern, "'")
    
    if (n > 0){
      seecol(usecol(cv), main = caption)
    } else {
      message(caption)
    }
    
  } # if (plot).
  
  
  # Output: ---- 
  
  return(cv)
  
} # grepal().  

## Check:
# grepal("cyan")
# 
# # With regular expressions:
# grepal("gr(a|e)y")
# grepal("^gr(a|e)y")
# grepal("^gr(a|e)y$")
# 
# # With other color objects (as x):
# grepal("blau", x = pal_unikn)
# grepal("SEE", x = pal_unikn_pref)
# 
# # Example applications:
# seecol(grepal("cyan"))
# seecol(grepal("white"), col_bg = "lightblue2")
# seecol(grepal("SEE", pal_unikn))
# seecol(grepal("blau", pal_unikn_pref))
# 
# grepal("SEE", pal_unikn)
# seecol(grepal("blau", pal_unikn_pref, plot = FALSE), main = "All colors matching 'blau'")


# 3. simcol(): Find/see similar colors ------

# Goal: Find (named) colors similar to a given color, within some tolerance value(s).

# - Documentation: ------ 

#' Find similar colors 
#'
#' \code{simcol} finds and shows colors 
#' from a palette of color candidates \code{col_candidates} that are similar 
#' to some target color \code{col_target}.
#' 
#' \code{simcol} returns a vector of the (named) colors or color values in 
#' \code{col_candidates} (set to \code{colors()} of \strong{grDevices} per default) 
#' that are similar to the specified target color \code{col_target}. 
#' 
#' If \code{plot = TRUE}, \code{simcol} also visualizes the detected colors  
#' (by passing its result to \code{\link{seecol}}, as a side-effect).
#' 
#' Color similarity is defined in terms of the distance between colors' RGB values, 
#' which must be within the numeric tolerance threshold(s) specified by \code{tol} 
#' (with \code{0 <= tol <= 255}). 
#' Higher \code{tol} values correspond to more permissive similarity judgments.  
#' 
#' If \code{tol} is a scalar, the values of all three RGB dimensions 
#' of \code{col_candidates} must be within the corresponding values of 
#' \code{col_target} to be judged as 'similar'. 
#' If \code{tol} contains three values, the three RGB dimension are compared 
#' in order of the dimensions' rank in \code{col_target} 
#' (i.e., the primary dimension must be within \code{tol[1]}, etc.). 
#' Thus, providing three \code{tol} values allows for 
#' more fine-grained similarity matching. 
#' 
#' @param col_target A (required) target color. 
#' 
#' @param col_candidates A palette of color candidates to be considered. 
#' Default: \code{col_candidates = colors()}.
#' 
#' @param tol Numeric tolerance value(s) 
#' (either 1 or 3 numeric values, in the RGB range from 0 to 255).
#' Values are considered in the order of the RGB value rank in \code{col_target}. 
#' Default: \code{tol = c(25, 50, 75)}. 
#' 
#' @param distinct Boolean: Return only visually distinct colors? 
#' Default: \code{distinct = TRUE} (i.e., remove visual duplicates). 
#' 
#' @param plot Boolean: Plot the output (using \code{\link{seecol}})? 
#' Default: \code{plot = TRUE}. 
#' 
#' @return A named vector of colors or color values. 
#' 
#' @examples 
#' # Basic uses:
#' simcol(col_target = "red")
#' simcol("tan", tol = 15)
#' simcol(Seeblau, tol = c(20, 30, 40))
#' simcol("blue", col_candidates = pal_unikn_pref, tol = 120)
#' 
#' # Fine-tuning the range of color matching:
#' simcol(Seeblau, tol = 30)  # = simcol(Seeblau, tol = c(30, 30, 30))
#' simcol(Seeblau, tol = c(20, 20, 80))
#' 
#' # Increasing tolerance widens range:
#' simcol("grey", c("white", "grey", "black"), tol = 255, distinct = FALSE, plot = FALSE)
#' 
#' @family color functions
#'
#' @seealso
#' \code{\link{seecol}} for plotting/seeing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors; 
#' \code{\link{shades_of}} to defining shades of a given color; 
#' \code{\link{ac}} for adjusting color transparency.
#' 
#' @import grDevices 
#'
#' @export

## Not used:
## @param ... Additional arguments (passed on to \code{\link{seecol()}}). 

# - Definition: ------ 

simcol <- function(col_target, 
                   col_candidates = colors(),  # ToDo: Consider using all_colors().
                   tol = c(25, 50, 75), 
                   distinct = TRUE, 
                   plot = TRUE
                   # ...          # additional arguments to seecol().
){
  
  # Prepare: ---- 
  
  if (length(col_target) != 1){
    stop("col_target must be a scalar (length 1)")
  }
  
  if (is_col(col_target) == FALSE){
    stop("col_target is no color")
  }
  
  if (any(is_col(col_candidates) == FALSE)){
    stop("col_candidates contains non-colors")
  }
  
  if (is.numeric(tol) == FALSE){
    stop("tol must be numeric")
  }
  
  len_tol <- length(tol)
  
  if (len_tol %in% c(1, 3) == FALSE){
    stop("tol must be of length 1 or 3")
  }
  
  if (any(tol < 0) | any(tol > 255)){
    stop("tol values must range from 0 to 255")
  }
  
  outpal <- NA  # initialize
  
  
  # Main: Compute distances and compare with tol criterion ----
  
  # a. Matrix of color distances (in RGB):
  dmx <- t(col_distance(col_candidates, col_target))
  
  if (len_tol == 1){ # 1: tol is scalar:
    
    # a. Logical matrix: Color distance <= tol (in RGB):
    lmx <- t(col_distance(col_candidates, col_target)) <= tol
    
    # b. as df:
    ldf <- as.data.frame(lmx)
    
    # c. Create filter:
    ix_all_true <- ldf$red & ldf$green & ldf$blue
    
    
  } else if (len_tol == 3){ # 2: use 3 tol values to sort RGB dims:
    
    # a. Analyze col_target:
    rgb_target <- grDevices::col2rgb(col_target)
    rgb_ranks <- rank(rgb_target, ties.method = "first")
    
    # b. as df:
    ddf <- as.data.frame(dmx)
    
    # c. Make 3 comparisons (choosing RGB columns in order of tol values):  
    ix_1_true <- ddf[ , which(rgb_ranks == 3)] <= tol[1]  # 1st
    ix_2_true <- ddf[ , which(rgb_ranks == 2)] <= tol[2]  # 2nd
    ix_3_true <- ddf[ , which(rgb_ranks == 1)] <= tol[3]  # 3rd
    
    # d. Create filter:
    ix_all_true <- (ix_1_true & ix_2_true & ix_3_true)
    
  } else {
    
    stop("tol is neither of length 1 nor length 3.")
    
  }
  
  # e. Apply filter:
  outpal <- col_candidates[ix_all_true]
  
  
  # Process outpal: ----
  
  # Sort results by color name? (Default: Sorted by order of col_candidates)
  sort_by_name <- FALSE
  
  if (sort_by_name){
    outpal <- usecol(outpal, use_names = TRUE)  # use color names
    outpal <- outpal[sort(names(outpal))]  # sort by alphabetic names
  }
  
  outpal <- c(col_target, outpal)  # add col_target to front
  
  if (distinct){ # remove visual duplicates:
    
    outpal <- col_distinct(outpal, use_alpha = FALSE) # (based on HEX values, but ignoring transparency)
  }
  
  outpal <- usecol(outpal, use_names = TRUE)  # use color names
  
  
  # Plot: ----
  
  if (plot){
    
    if (is.null(names(col_target)) == FALSE){
      
      col_target_name <- names(col_target) 
      
    } else {
      
      col_target_name <- as.character(col_target)
    }
    
    caption <- paste0("Colors similar to ", "'", col_target_name, "'")
    
    seecol(outpal, main = caption)
    
  } # if (plot).
  
  
  # Output: ----
  
  return(outpal)
  
} # simcol().

# # Check:
# simcol("deepskyblue")
# simcol("deeppink", tol = 50)
# simcol(Seeblau, tol = 40)
# simcol(Seegruen, tol = 40)
# simcol("deepskyblue", col_candidates = pal_unikn, tol = 100)
# simcol("deeppink", col_candidates = pal_unikn_pref, tol = 120)
# 
# # More fine-grained search (3 tol values):
# simcol("deepskyblue", tol = 50) # same as:
# simcol("deepskyblue", tol = c(50, 50, 50))
# simcol("deepskyblue", tol = c(10, 50, 150))
# 
# simcol(Seeblau, tol = 40) # same as:
# simcol(Seeblau, tol = c(40, 40, 40))
# simcol(Seeblau, tol = c(10, 30, 60))
# 
# pal <- c(Seeblau, "deepskyblue")
# seecol(pal)
# simcol(Seeblau, tol = c(20, 20, 100))



# 4. shades_of(): Get n lighter or darker versions of a given color ------ 

# - Documentation: ------ 

#' Get n shades of a color 
#'
#' \code{shades_of} returns a vector of \code{n} colors that are 
#' shades of a color gradient ranging 
#' from an initial color \code{col_1} to a final color \code{col_n}. 
#' 
#' By default, the color gradient returned contains \code{n = 5} colors 
#' that range from the initial color \code{col_1 = "black"} 
#' to the final color \code{col_n = "white"}.  
#' Specifying different values for \code{n} and the 
#' initial or final colors yields different color ranges. 
#' 
#' \code{shades_of} is mostly a wrapper for a special \code{\link{usecol}} command. 
#' However, \code{\link{usecol}} allows defining more 
#' complex color gradients (e.g., by specifying more than two colors). 
#'
#' @param n Number of desired colors.  
#' Default: \code{n = 5}.  
#' 
#' @param col_1 Initial color.   
#' Default: \code{col_1 = "black"}.  
#' 
#' @param col_n Final (n-th) color.   
#' Default: \code{col_n = "white"}.  
#' 
#' @param alpha A factor modifying the opacity alpha 
#' (as \code{alpha.f} in \code{\link{adjustcolor}}) to a value in \code{[0, 1]}. 
#' Default: \code{alpha = NA} (i.e., no modification of opacity).
#' 
#' @examples
#' grey50 <- shades_of(50, col_1 = 'grey1')
#' seecol(grey50, main = "50 shades of grey1")
#' 
#' blue_black <- shades_of(5, Seeblau, col_n = "black")
#' seecol(blue_black, main = "5 shades from Seeblau to black")
#'
#' wine_white <- shades_of(6, Bordeaux, alpha = 1/2)
#' seecol(wine_white, col_brd = "black", lwd_brd = .5, 
#'        main = "Shades of semi-transparent Bordeaux")
#'   
#' @family color functions
#' 
#' @seealso 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors;  
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors; 
#' \code{\link{ac}} for adjusting color transparency.  
#'
#' @import grDevices 
#' 
#' @export 

# - Definition: ------ 

shades_of <- function(n = 5, 
                      col_1 = "black", 
                      col_n = "white", 
                      alpha = NA
){
  
  # Initialize: 
  cv <- NA  # color vector
  
  # Main: Pass to usecol()
  cv <- usecol(pal = c(col_1, col_n), n = n, alpha = alpha)
  
  # Output:
  return(cv)
  
} # shades_of(). 


## Check:
# shades_of(4)
# seecol(shades_of(4, col_1 = Pinky, col_n = "gold"))
# seecol(shades_of(4, col_1 = Bordeaux, alpha = .5))


# 5. ac(): A flexible wrapper of adjustcolor() ------ 

# Goal: Wrap essentials of grDevices::adjustcolor 
#       as a more convenient utility function:

# - Documentation: ------ 

#' Adjust color transparency
#'
#' \code{ac} adjusts the transparency of a color or color palette \code{col} 
#' to an opacity level \code{alpha} (in \code{[0, 1]}).
#'
#' \code{ac} is mostly a wrapper for \code{\link{adjustcolor}} 
#' of the \strong{grDevices} package, but allows for more flexible 
#' combinations of (multiple) \code{col} and \code{alpha} values. 
#' 
#' The name \code{ac} is an abbreviation of "adjust color", 
#' but is also a mnemonic aid for providing "air conditioning". 
#'
#' @param col A (required) color or color palette (as a vector). 
#' 
#' @param alpha A factor modifying the opacity alpha 
#' (as \code{alpha.f} in \code{\link{adjustcolor}}) to a value in \code{[0, 1]}. 
#' Default: \code{alpha = .50} (i.e., medium opacity).
#' 
#' @param use_names A logical value indicating whether color names should be adjusted 
#' to include the values of \code{alpha}. 
#' Default: \code{use_names = TRUE}.  
#' 
#' @return A color vector of the same length as \code{col}, 
#' transformed by \code{\link{adjustcolor}}. 
#' 
#' @examples 
#' ac("black")  # using alpha = .5 by default
#' 
#' # multiple colors:
#' cols <- ac(c("black", "gold", "deepskyblue"), alpha = .50)
#' seecol(cols, main = "Transparent colors")
#' 
#' # multiple alphas:
#' blacks <- ac("black", alpha = 5:0/5)
#' seecol(blacks, main = "One col several alpha values")
#' 
#' bgc <- ac(c("black", "gold"), alpha = 1:6/6)
#' seecol(bgc, main = "More alpha values than cols")
#' 
#' # Using a color palette:
#' seecol(ac(pal_unikn_pref, 2/3), main = "Adding color transparency by ac()")
#' 
#' # Color names:
#' seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = TRUE))
#' seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = FALSE))
#' 
#' @family color functions
#'
#' @seealso
#' \code{\link{seecol}} for plotting/seeing color palettes; 
#' \code{\link{usecol}} for using color palettes;
#' \code{\link{simcol}} for finding similar colors;  
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors.
#' 
#' @import grDevices 
#'
#' @export

# - Definition: ------ 

ac <- function(col, 
               alpha = .50, 
               use_names = TRUE
) {
  
  # Adjust color vector (col_adj): ------ 
  
  len_col   <- length(col)
  len_alpha <- length(alpha)
  n_col     <- max(len_col, len_alpha)
  col_adj   <- rep(NA, n_col)  # initialize 
  
  if (len_alpha == 1){ # 1. default case (len_alpha == 1):
    
    # Main-1: Pass to grDevices::adjustcolor 
    col_adj <- grDevices::adjustcolor(col, alpha.f = alpha)
    
  } else { # 2. multiple alpha values:
    
    # Adjust length of col or alpha vector: 
    if (len_alpha > len_col){ # 1a. extend col to len_alpha:
      col <- rep(col, ceiling(len_alpha/len_col))[1:len_alpha]
    }
    
    if (len_col > len_alpha){ # 1b. extend alpha to len_col:
      alpha <- rep(alpha, ceiling(len_col/len_alpha))[1:len_col]
    }
    
    # Main-2: Pass each pair of col and alpha to grDevices::adjustcolor():
    for (i in 1:n_col){
      col_adj[i] <- grDevices::adjustcolor(col[i], alpha.f = alpha[i])
    }
    
  }
  
  
  # Add/adjust color names (to indicate alpha): ------ 
  
  if (use_names){
    
    if (is.null(names(col))){ # no existing names:
      
      names(col_adj) <- paste0(as.character(col), "_", round(alpha, 2))  
      
    } else { # adjust existing names:
      
      names(col_adj) <- paste0(names(col), "_", round(alpha, 2))
      
    }
    
  } else { 
    
    # names(col_adj) <- NULL      # remove ALL names    
    names(col_adj) <- names(col)  # keep pre-existing names (if present)
    
  } # if (use_names) end. 
  
  
  # Finish: ------ 
  
  return(col_adj)
  
} # ac().


## Check:
# ac("black")  # using alpha = .5 by default
# 
# # multiple colors:
# cols <- ac(c("black", "gold", "deepskyblue"), alpha = .50)
# seecol(cols, main = "Transparent colors")
# 
# # multiple alphas:
# blacks <- ac("black", alpha = 5:0/5)
# seecol(blacks, main = "One col several alpha values")
# 
# bgc <- ac(c("black", "gold"), alpha = 1:6/6)
# seecol(bgc, main = "More alpha values than cols")
# 
# # Without adjusting names:
# seecol(ac(c("black", "gold"), alpha = 1:6/6, use_names = FALSE))
#
# # Using a color palette:
# seecol(ac(pal_unikn_pref, 2/3), main = "Adding color transparency by ac()")
# 
# # Color names:
# seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = TRUE))
# seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = FALSE))



## ToDo: ------

# - newpal(): Recognize existing colors (e.g., "red") and match their existing names.

# - Consider changing the default arguments x and col_candidates of grepal() and simcol() from colors() to
#   1. grepal(x = all_colors()) and
#   2. simcol(col_candidates = all_colors())
#   IFF exporting all_colors() to the user level.

# - Consider creating more vivid versions of some
#   `pal_unikn_pref` colors (e.g., "deepskyblue", "deeppink", etc.)
# 
# - Consider adding Boolean `distinct` argument to `seecol()` or `grepal()` 
#   to allow removing visual duplicates by verifying `col_distinct(pal)` --- with or w/o considering color transparency (see use_alpha argument).
#   Note: `colors()` also uses a `distinct` argument to remove visual duplicates.
# 
# - `seecol()`: Add options for showing HCL values (see HCL_color_exploration.Rmd).
# - `seecol()`: Add options for printing multiple palettes with fixed width and as continuous color palettes.
# - `seecol()` and `newpal()`: Add option for margin notes/crediting color sources.

## eof. ----------