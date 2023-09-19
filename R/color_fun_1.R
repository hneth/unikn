## color_fun_1.R | unikn
## spds | uni.kn | 2023 09 19
## --------------------------

## Define color-related functions 
## (e.g., for choosing from, using, plotting, and viewing color palettes). 

## Note: (2) Auxiliary functions are in file "color_fun_2.R".


## (1) Main functions: ---------- 


# usecol(): Use a color palette (as is) ---------  

# - Documentation: ------ 

#' Use a color or color palette 
#'
#' \code{usecol} allows using a color or color palette \code{pal} (e.g., for plotting).
#' 
#' \code{usecol} also allows modifying and combining color palettes in various ways. 
#'  
#' @param pal A color palette (as a vector of colors or color palettes). 
#' Default: \code{pal = \link{pal_unikn}}. 
#' 
#' @param n An integer value specifying the desired number of colors from the palette. 
#' Default: \code{n = "all"} (i.e., use all colors of a color palette).  
#' For the palettes defined by \strong{unikn}, \code{n} is set to a pre-defined selection of 
#' colors if the desired number of colors is smaller than the available number.  
#' For all other palettes and values of \code{n} larger than \code{length(pal)}, 
#' \code{n} compresses or extends the palette using \code{\link{colorRampPalette}}.
#' 
#' @param alpha A factor modifying the opacity alpha 
#' (as \code{alpha.f} in \code{\link{adjustcolor}}) to a value in \code{[0, 1]}. 
#' Default: \code{alpha = NA} (i.e., no modification of opacity).
#' 
#' @param distinct Boolean: Return only visually distinct colors? 
#' Default: \code{distinct = FALSE} (i.e., include duplicate colors).
#' 
#' @param use_names A logical value indicating whether colors should be returned as a named vector.
#' Default: \code{use_names = FALSE}, for compatibility with \code{ggplot}.  
#' 
#' @param use_col_ramp A logical value specifying whether the default of using pre-selected colors
#' should be overridden and \code{\link{colorRampPalette}} should be used to process \code{n}. 
#' Default: \code{use_col_ramp = FALSE}. 
#' 
#' @return A (named) vector of colors (of type character). 
#' 
#' @examples 
#' usecol(pal = pal_unikn, n = "all")  # default color palette 
#' usecol(pal = pal_unikn, n =  4)     # selecting n dedicated colors
#' usecol(pal = pal_unikn, n = 20)     # extending color palette  
#'
#' # Mixing a new color palette: 
#' pal_1 <- usecol(pal = c(rev(pal_seeblau), "white", pal_pinky))  
#' seecol(pal_1)
#' 
#' # Mixing and extending a color palette: 
#' pal_2 <- usecol(pal = c(rev(pal_seegruen), "white", pal_bordeaux), n = 20)  
#' seecol(pal_2)
#' 
#' # Defining and using a custom color palette:
#' pal_princeton_1 <- c("#E77500", "white", "black")
#' names(pal_princeton_1) <- c("orange_w", "white", "black")
#'
#' pal_3 <- usecol(pal_princeton_1, n = 7)
#' seecol(pal_3)
#' 
#' # Removing visual duplicates:
#' usecol(c("black", "#000000", "gray", "grey", "red", "red1"), distinct = TRUE)
#' seecol(usecol(c(pal_unikn, pal_seeblau), distinct = TRUE), title = "Using distinct colors")
#' 
#' @family color functions
#'
#' @seealso
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors; 
#' \code{\link{shades_of}} to defining shades of a given color; 
#' \code{\link{ac}} for adjusting color transparency; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#' 
#' @import grDevices 
#'
#' @export

# - Definition: ---- 

usecol <- function(pal = pal_unikn,
                   n = "all",
                   alpha = NA,  # regulate transparency
                   distinct = FALSE,   # remove visual duplicates? 
                   use_names = FALSE,  # should colors be returned as a named vector?
                   use_col_ramp = FALSE) {
  
  ## Handle NA input: ----
  
  if (all(is.na(pal))) { return(NA) }
  
  
  ## Parse input: ---- 
  
  parenv <- parent.frame()
  
  # parse_pal(pal = pal)
  
  
  pal_inp <- tryCatch(
    
    {
      suppressWarnings(parse_pal(pal = pal))  # suppress warnings in parsing. 
    },
    
    # Handle errors by checking further:
    error = function(e) {
      
      # Get object name in parenv (always triggered by seecol):
      pal <- deparse(substitute(expr = pal, env = parenv))
      
      # Remove slashes and quotes:
      pal <- gsub("\\\\", "", pal)
      pal <- gsub("\"",   "", pal)
      
      # Recursion: Re-parse with new input pal: 
      parse_pal(pal = pal)
      
    }
  )
  
  
  # Set n to length pal_inp, if n == "all": -----
  
  if (n == "all") { n <- length(pal_inp) }
  
  pal_def <- FALSE  # assume by default that an undefined palette is used.
  # Check this in the next step (this variable serves to control flow).
  
  if ( all(unlist(lapply(X = all_pals, FUN = exists))) ) { # if all palettes in all_pals exist: 
    
    val_all_pals_lst <- lapply(X = all_pals, FUN = get)  # get VALUES of all_pals (as list) 
    
  } else { # not all current palettes are pre-defined:
    
    val_all_pals_lst <- NA
    
  }
  
  
  # Is the input one of the pre-defined palettes? ----- 
  
  if (!use_col_ramp) {
    
    # Get index vector of specified pal_inp (as logical):
    pal_ix <- sapply(val_all_pals_lst, function(x) { return(isTRUE(all.equal(pal_inp, unlist(x)))) }) 
    
    # If none fits, check reversed palettes:
    
    rev_pal <- FALSE  # initialize flag
    
    if (!any(pal_ix)) {
      
      pal_ix <- sapply(X = val_all_pals_lst, FUN = function(x) isTRUE(all.equal(rev(pal_inp), x))) # check for reversed pal_inp
      
      if (any(pal_ix)) { rev_pal <- TRUE }  # if palette is reversed, update pal_rev to TRUE.
    }
    
    # Problem: The palettes pal_unikn and uni_konstanz contain the SAME colors. 
    #          => pal_ix contains 2 TRUE positions.   
    if (sum(pal_ix) > 1){ # HACK: If there are multiple TRUE in pal_ix: 
      
      pos_true <- which(pal_ix)
      pal_ix[pos_true[-1]] <- FALSE  # set all but 1st to FALSE
      
    }
    
    
    # If input corresponds to any palette: ----- 
    
    if ( any(pal_ix) & (length(pal_inp) >= n) ) {
      
      pal_name <- all_pals[pal_ix]  # get palette name (from ALL pre-defined palettes)
      # print(pal_name)  # 4debugging
      
      pal <- pal_inp  # redefine
      # print(pal)  # 4debugging
      
      # Define sets of known palettes:
      set1 <- pal_name %in% c("pal_peach",
                              "pal_petrol",
                              "pal_pinky",
                              "pal_karpfenblau",
                              "pal_bordeaux",
                              "pal_seegruen")
      set2 <- pal_name %in% c("pal_grau", "pal_seeblau")
      set3 <- pal_name %in% c("pal_unikn_web", "pal_unikn_ppt") 
      set4 <- pal_name %in% c("pal_unikn")
      set5 <- pal_name %in% c("pal_unikn_pair")
      set6 <- pal_name %in% c("pal_unikn_dark", "pal_unikn_light", "pal_unikn_pref")  # categorical scales
      set7 <- pal_name %in% c("pal_signal")  # categorical scale
      
      # set8 <- pal_name %in% add_pals  # (8) all added/contributed palettes
      
      # Determine pal_set (as a number):
      pal_set <- which(c(set1, set2, set3, set4, set5, set6, set7))  # , set8))
      # print(paste0("pal_set = ", pal_set))  # 4debugging
      
      
      # Determine color output for pal_set:
      out_col <- switch(pal_set,
                        
                        # Set colors based on pal_set and n:
                        
                        # Set 1: -----
                        switch(n,
                               pal[4], # main color
                               pal[c(4, 2)],
                               pal[c(5, 3, 1)],
                               pal[c(5, 4, 2, 1)],
                               pal),
                        
                        # Set 2: -----
                        switch(n,
                               pal[3], # main color
                               pal[c(4, 2)],
                               pal[c(5, 3, 1)],
                               pal[c(5, 4, 2, 1)],
                               pal),
                        
                        # Set 3: -----
                        switch(n,
                               pal[2],  # 1
                               pal[c(1, 3)],  # 2
                               pal[c(1, 3, 5)],  # 3
                               pal[c(1, 3, 5, 10)],  # 4
                               pal[c(1, 3, 5, 8, 10)],  # 5
                               pal[c(1, 2, 4, 5, 8, 10)],  # 6
                               pal[c(1, 2, 4, 5, 7, 9, 10)],  # 7
                               pal[c(1, 2, 3, 4, 5, 7, 9, 10)],  # 8
                               pal[c(1, 2, 3, 4, 5, 7, 8, 9, 10)],  # 9
                               pal),
                        
                        # Set 4: "pal_unikn" -----
                        switch(n,
                               pal[c("seeblau3")],
                               # 1 preferred color:
                               pal[c("seeblau4", "seeblau2")],
                               # 2:
                               pal[c("seeblau4", "seeblau2", "white")],
                               # 3:
                               pal[c("seeblau4", "seeblau2", "white", "black")],
                               # 4:
                               pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],
                               # 5:
                               pal[c("seeblau4",
                                     "seeblau3",
                                     "seeblau1",
                                     "white",
                                     "seegrau3",
                                     "black")],
                               # 6:
                               pal[c("seeblau4",
                                     "seeblau3",
                                     "seeblau1",
                                     "white",
                                     "seegrau2",
                                     "seegrau4",
                                     "black")],
                               # 7:
                               pal[c(
                                 "seeblau4",
                                 "seeblau3",
                                 "seeblau2",
                                 "seeblau1",
                                 "white",
                                 "seegrau2",
                                 "seegrau4",
                                 "black"
                               )],
                               # 8:
                               pal[c(
                                 "seeblau4",
                                 "seeblau3",
                                 "seeblau2",
                                 "seeblau1",
                                 "white",
                                 "seegrau1",
                                 "seegrau2",
                                 "seegrau3",
                                 "black"
                               )],
                               # 9:
                               pal[c(
                                 "seeblau5",
                                 "seeblau4",
                                 "seeblau3",
                                 "seeblau2",
                                 "seeblau1",
                                 "white",
                                 "seegrau1",
                                 "seegrau2",
                                 "seegrau3",
                                 "black"
                               )],
                               # 10:
                               pal  # all 11 colors of pal_unikn (previously: pal_unikn_plus) 
                        ),
                        
                        # Set 5: "pal_unikn_pair" -----
                        pal[c("seeblau5", "seeblau3", "pinky4", "pinky2", "petrol4", 
                              "petrol2", "bordeaux4", "bordeaux2", "seegruen4", "seegruen2",
                              "peach4", "peach2", "karpfenblau4", "karpfenblau2", "grau2", "grau1")[1:n]],
                        
                        # Set 6: In categorical uni.kn scales -----
                        pal[1:n],  # first n colors
                        
                        # Set 7: "pal_signal" -----
                        pal[c("signal1", "signal3", "signal2")[1:n]],  # first n of SWAPPED signal colors
                        
                        # Set 8: In add_pals -----
                        pal[1:n]  # first n colors
                        
                        # etc. 
                        
      )
      
      # If palette was reversed, reverse result as well:
      if (rev_pal) { out_col <- rev(out_col) } 
      
      pal_def <- TRUE  # flag that palette is defined
      
    } # if ( any(pal_ix) & length(pal_inp) >= n).
    
  } # if ( !use_col_ramp ).
  
  
  # No defined pal or excess N of colors: Use colorRamp: ----- 
  
  if (!pal_def) {
    
    # Decide, whether to use colorRamp or not:
    if (n == length(pal_inp)) {
      
      out_col <- pal_inp
      
    } else {
      
      # use colorRamp (removing all names): 
      out_col <- grDevices::colorRampPalette(pal_inp)(n) 
      
    } # if (n == length(pal_inp)).
    
  } # if (!pal_def). 
  
  
  # Process out_col: ------ 
  
  # - Name the palette (as comment attribute): ---- 
  comment(out_col) <- ifelse(pal_def, pal_name, "custom")
  
  # - Get color names (if no names are given): ---- 
  if ( use_names & all(is.null(names(out_col))) ) {
    
    # # (A) Combine kn_names with color() names:
    # 
    # # 1. Names from predefined kn palettes:
    # kn_names <- names(unlist(val_all_pals_lst))[match(out_col, unlist(val_all_pals_lst))]
    # 
    # # 2. Predefined color names (in R colors()):
    # col_names <- colors()[match(
    #   grDevices::rgb(t(grDevices::col2rgb(out_col)), maxColorValue = 255),
    #   c(grDevices::rgb(t(grDevices::col2rgb(colors())), maxColorValue = 255))
    # )]
    # 
    # # Replace NA values by "":
    # kn_names[is.na(kn_names)]   <- ""
    # col_names[is.na(col_names)] <- ""
    # 
    # # Combine name vectors (to avoid duplicates):
    # col_names[col_names == kn_names] <- ""  # remove duplicates in col names
    # col_names[!col_names == "" & !kn_names == ""] <-
    #   paste0("/", col_names[!col_names == "" & !kn_names == ""]) # distinguish different names for the same color
    # 
    # names(out_col) <- paste0(kn_names, col_names)
    
    
    # (B) Use new helper function (in util_color.R):
    
    # FAILS:     
    # names(out_col) <- get_col_names(col = out_col, custom_pals = val_all_pals_lst)  # use helper function (with VALUES of val_all_pals_lst)
    
    # WORKS: +++ here now +++ 
    names(out_col) <- get_col_names(col = out_col, custom_pals = all_pals)  # use helper function (with NAMES of all pals)
    
    
  } # if (no names in out_col).
  
  # - Remove names if required (default): ---- 
  if ( !use_names ) { out_col <- unname(out_col) }
  
  # - Handle alpha: ----
  if ( !(is.null(alpha) | is.na(alpha))) { 
    
    cmnt <- comment(out_col)  # save palette name
    out_col <- grDevices::adjustcolor(out_col, alpha.f = alpha)
    comment(out_col) <- cmnt  # restore name
    
  }
  
  # - Remove visual duplicates: ---- 
  if ( distinct ){
    
    out_col <- col_distinct(out_col, use_alpha = FALSE) # (based on HEX values, but ignoring transparency)
    
  }
  
  
  
  # Output: ---- 
  
  return(out_col)
  
} # usecol().

# ## Check:
# usecol(c("black", "white"), use_names = TRUE)
# usecol(c("black", "white"), n = 5, use_names = TRUE)
# usecol(c("black", "white"), n = 5, use_names = FALSE)
# 
# usecol(pal_unikn, use_names = TRUE)
# usecol(pal_unikn, n =  5, use_names = TRUE)
# usecol(pal_unikn, n = 15, use_names = TRUE)
# usecol(pal_unikn, n = 15, use_names = FALSE)
# 
# usecol(c(Seeblau, "deepskyblue", Pinky, "deeppink"), use_names = TRUE)
# usecol(c(Seeblau, "deepskyblue", Pinky, "deeppink"), use_names = FALSE)
# seecol(usecol(c(Seeblau, "deepskyblue", Pinky, "deeppink"), use_names = TRUE))


# seecol(): Plot/see the colors of a palette or multiple palettes ---------- 

# - Documentation: ------ 

#' Plot color palettes (to see their colors) 
#'
#' \code{seecol} provides an interface to plotting (or "seeing") 
#' the colors of a palette or comparing multiple color palettes. 
#' 
#' \code{seecol} has two main modes, based on the contents of its \code{pal} argument:
#' 
#' \enumerate{
#' 
#'   \item if \code{pal} is set to a \emph{specific} color palette (or a vector of multiple colors or color palettes):
#'
#'   Plot the current color palette and optional details on its colors.
#'
#'   \item if \code{pal = "unikn_all"} or a list of \emph{multiple} color palettes: 
#'
#'   Plot visual vectors of all current color palettes for comparing them. 
#'
#' }
#' 
#' Specifying \code{distinct = TRUE} removes visual duplicate colors (based on HEX values, 
#' ignoring transparency), but only when showing an individual color palette \code{pal}. 
#' 
#' Various title options (i.e., \code{main}, \code{sub}, and \code{mar_note}) and 
#' a \code{pal_names} argument add control over plotted text labels. 
#' However, the length of a character vector provided to \code{pal_names} must correspond 
#' to the number of (custom) color palettes or colors. 
#' 
#' @param pal A single color palette (as a vector of colors), 
#' multiple color palettes (as a list), 
#' or a recognized keyword (as a character string). 
#' Default: \code{pal = "unikn_all"} (i.e., plot all color palettes 
#' provided by the \bold{unikn} package). 
#' 
#' Recognized keywords are: 
#' 
#' \enumerate{
#'
#'   \item \code{"all"}: All color palettes of the \bold{unikn} package.
#'
#'   \item \code{"all_unikn"} or \code{"unikn_all"}: All uni.kn color palettes 
#'   (of the \href{https://www.uni-konstanz.de/}{University of Konstanz}).
#'
#'   \item \code{"unikn_basic"}: All basic uni.kn palettes. 
#'   
#'   \item \code{"grad_all"}: All uni.kn palettes with color gradients. 
#'   
#'   \item \code{"pair_all"}: All uni.kn palettes with pairwise colors. 
#'   
#'   \item \code{"pref_all"}: All preferred uni.kn colors and their gradients. 
#'   
#'   \item \code{"add"}: Additional/contributed color palettes 
#'   (deprecated, as additional color palettes were migrated to the \bold{unicol} R package).
#' }
#' 
#' \code{seecol} does also recognize keywords (e.g., \code{"all_unikn"}) or 
#' keywords without \code{"unikn"} (e.g., \code{"basic"}).
#' 
#' @param n Number of colors to show or use. 
#' If \code{n} is lower or higher than the length of the current 
#' color palette \code{pal}, the color palette is reduced or extrapolated 
#' (using \code{grDevices::colorRampPalette}). 
#' Default: \code{n = "all"} (i.e., show all colors in palette). 
#' 
#' @param alpha A factor modifying the opacity alpha 
#' (as \code{alpha.f} in \code{\link{adjustcolor}}) to a value in \code{[0, 1]}. 
#' Default: \code{alpha = NA} (i.e., no modification of opacity). 
#' 
#' @param hex Should HEX color values be shown? 
#' Default: \code{hex = NULL} (i.e., show HEX color values 
#' when there is sufficient space to print them). 
#' 
#' @param rgb Should RGB color values be shown?
#' Default: \code{rgb = NULL} (i.e., show RGB color values 
#' when there is sufficient space to print them). 
#' 
#' @param col_bg Color of plot background. 
#' Default: \code{col_bg = NULL}. 
#' 
#' @param col_brd Color of shape borders (if shown). 
#' Default: \code{col_brd = NULL}. 
#' 
#' @param lwd_brd Line width of shape borders (if shown). 
#' Default: \code{lwd_brd = NULL}. 
#' 
#' @param grid Show grid in the color plot?  
#' Default: \code{grid = TRUE}. 
#' 
#' @param main Main plot title (as a character string). 
#' Default: \code{main = NA} creates a default title.
#' 
#' @param sub Optional subtitle (as a character string). 
#' Default: \code{sub = NULL} (i.e., no subtitle).
#' 
#' @param title Deprecated plot title. 
#' Use \code{main} instead.
#' 
#' @param mar_note Optional margin note (on bottom right). 
#' Default: \code{mar_note = NA} (i.e., no margin note). 
#' 
#' @param pal_names Names of color palettes or colors 
#' (as a character vector). 
#' Default: \code{pal_names = NA} (for default names). 
#' 
#' @param ... Other graphical parameters 
#' (passed to \code{plot}). 
#' 
#' @examples
#' # See multiple color palettes: 
#' seecol()  # default: seecol(pal = "all") 
#' 
#' # See details of one color palette: 
#' seecol(pal_unikn)  # see a specific color palette
#' 
#' # Combining colors or color palettes: 
#' seecol(c(rev(pal_seeblau), pal_seegruen))        # combine color palettes
#' seecol(c(rev(pal_seeblau), "white", pal_pinky))  # combine color palettes and color names
#' seecol(c("black", "firebrick", "gold"))          # combine color names
#' 
#' # Using n to reduce or extend color palettes:
#' seecol(n =  3)  # viewing reduced ranges of all palettes
#' seecol(n = 12)  # viewing extended ranges of all palettes
#' 
#' seecol(pal_unikn, n = 5, 
#'        main = "Reduced version of pal_unikn (n = 5)")  # reducing pal_unikn
#' seecol(pal_seeblau, n = 8, 
#'        main = "Extended version of pal_seeblau (n = 8)")  # extending pal_seeblau
#' 
#' # Combining and extending color palettes: 
#' seecol(c(rev(pal_seeblau), "white", pal_bordeaux), n = 17, 
#'        main = "Diverging custom color palette (with 17 colors)")
#' 
#' # Defining custom color palettes:
#' pal_mpg <- c("#007367", "white", "#D0D3D4")  # mixing hex values and color names
#' names(pal_mpg) <- c("mpg green", "mpg white", "mpg grey")  # color names
#' 
#' pal_bdg <- usecol(c(Bordeaux, "gold"), n = 10)  # using usecol
#' 
#' # Viewing extended color palette: 
#' seecol(pal_mpg, n = 9, main = "Custom color palette of the Max Planck Society")
#' 
#' # Comparing (and labeling) custom color palettes: 
#' seecol(list(pal_mpg, pal_bdg, pal_unikn), n = 7,
#'        pal_names = c("Max Planck", "Bordeaux-Gold", "Uni Konstanz"), 
#'        main = "Comparing and labeling custom color palettes")
#' 
#' ## Viewing color palettes from other packages: 
#' # library(RColorBrewer)
#' # seecol(brewer.pal(name = "RdBu", n = 11))  # viewing "RdBu" palette from RColorBrewer
#' 
#' ## Extending color palettes:
#' # seecol(brewer.pal(name = "RdBu", n = 11), n = 15)  # extending palette to 15 colors
#' 
#' @family color functions
#' 
#' @aliases seepal 
#'
#' @seealso 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
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

# - Definition: ------ 

seecol <- function(pal = "unikn_all",  # which palette?
                   n = "all",          # n of colors
                   alpha = NA,         # opacity / transparency level
                   hex = NULL,         # determine by crowdedness, whether hex values should be shown in detail view.
                   rgb = NULL,         # determine, whether rgb values should be shown in detail view (defaults to TRUE)
                   col_bg = NULL,      # color of background
                   col_brd = NULL,     # border color of the boxes
                   lwd_brd = NULL,     # line width of box borders
                   grid = TRUE,        # show grid? 
                   main = NA,          # main plot title (using the default 'main = NA' constructs a default title)
                   sub = NULL,         # plot subtitle (on bottom)
                   title = NULL,       # Deprecated: plot title (replaced by main)
                   mar_note = NA,      # optional margin note (on bottom right)
                   pal_names = NA,     # names of color palettes or colors (as character vector)
                   ...                 # additional arguments to plot.default()
) {
  
  # 1. Preparations: ------- 
  
  # Handle NA input: ----
  
  if (all(is.na(pal))) { return(NA) }
  
  # Deprecated arguments: ---- 
  
  if ((is.null(title) == FALSE) & (is.na(main))){
    # Replace title by main (quietly, to accommodate ggplot users): 
    main <- title 
    title <- NULL
  }
  
  if (is.null(title) == FALSE){
    message("The 'title' argument is deprecated. Please use 'main' instead")
    main <- title  # Note: Any prior settings of main is lost.
  }
  
  if (pal == "add"){
    message("As the 'add' keyword is deprecated, I will use 'all' instead.\nAdditional color palettes were migrated to the 'unicol' R package.")
    pal <- "all"
  }
  
  # Constants/parameters: ---- 
  
  op <- par(no.readonly = TRUE)  # save original plotting settings.
  keys <- c(# 
    # (a) all palettes (of the unikn package):
    "all", 
    # (b) local/uni.kn palettes:
    "all_unikn", "unikn_all",               # all local/uni.kn palettes
    "basic", "unikn_basic", "basic_unikn",  # basic uni.kn palettes. 
    "pair", "all_pair", "pair_all",         # paired uni.kn palettes. 
    "pref", "pref_all", "all_pref",         # preferred uni.kn palettes and gradients. 
    "grad", "grad_all", "all_grad",         # uni.kn gradients.
    # (c) added/contributed palettes:
    "add"
  )
  
  # Robustify inputs: ----
  
  if ( !(is.null(hex) | is.logical(hex)) ) stop("Please specify a valid value for 'hex'.")
  if ( !(is.null(rgb) | is.logical(rgb)) ) stop("Please specify a valid value for 'rgb'.")
  
  # Check for keyword: ---- 
  by_key <- tryCatch(
    { 
      all(pal %in% keys)
    },
    error = function(e) {
      FALSE
    },
    silent = TRUE
  )
  
  # Check whether pal input is a list: 
  compare <- tryCatch(
    {
      is.list(pal) & any(lapply(pal, length) > 1)  # get length of each component. 
    },
    error = function(e) {FALSE},
    silent = TRUE
  )
  
  # Getting a list of palettes by keyword: 
  if (by_key) {
    
    # Main plot titles: ---- 
    
    # Default main title given a keyword:
    if (is.na(main)){
      # (a) all palettes (of the unikn package):
      if (pal %in% c("all") ) main <- "All unikn color palettes"
      # (b) local/uni.kn palettes:
      if (pal %in% c("all_unikn", "unikn_all")) main <- "See uni.kn color palettes"
      if (pal %in% c("basic", "unikn_basic", "basic_unikn")) main <- "See basic uni.kn color palettes"
      if (pal %in% c("pair", "all_pair", "pair_all")) main <- "See pairwise uni.kn color palettes"
      if (pal %in% c("pref", "pref_all", "all_pref")) main <- "See preferred uni.kn colors and gradients"
      if (pal %in% c("grad", "grad_all", "all_grad")) main <- "See uni.kn color gradients"
      # (c) added/contributed palettes:
      if (pal %in% c("add") ) main <- "Additional unikn color palettes"      
    }
    
    pal_tmp <- get_pal_key(pal = pal, n = n, alpha = alpha)  # get color palette by its key
    
  } else if (compare){
    
    pal_tmp <- lapply(X = pal, usecol, n = n, alpha = alpha, use_names = TRUE)  # get all palettes separately 
    
    if (is.na(main)){
      main <- "Compare a custom set of color palettes"  # default title
    }
    
    # Set or get palette names:
    if ((!any(is.na(pal_names))) &                # pal_names were provided
        (length(pal_names) == length(pal_tmp))){  # and of appropriate length:  
      
      names(pal_tmp) <- pal_names  # use custom pal_names. 
      
    } else { # assign names from comment attribute: 
      
      names(pal_tmp) <- lapply(pal_tmp, comment)  
      
      if (is.null(names(pal_tmp))){ # no names exist: 
        
        names(pal_tmp) <- paste0("pal_", 1:length(pal_tmp))  # use default names
        
      } else if (any(names(pal_tmp) == "custom")) {
        
        ix_cp <- (names(pal_tmp) == "custom") 
        
        if ((!any(is.na(pal_names))) &           # pal_names were provided
            (length(pal_names) == sum(ix_cp))){  # and of appropriate length:  
          
          names(pal_tmp)[ix_cp] <- pal_names  # use custom pal_names
          
        } else { # use default names: 
          
          # (a) use pal_nr:
          # names(pal_tmp)[ix_cp] <- paste0("pal_", which(ix_cp))
          
          # (b) use element names of the pal list argument:
          list_element_names <- paste0(as.character(substitute(pal)))[-1]
          # print(list_element_names)  # 4debugging
          
          names(pal_tmp) <- list_element_names  # +++ here now +++ 
          
        }
      }
    }
    
  } else { # if no keyword or list was provided: One palette 
    
    # Get palette:
    pal_tmp <- usecol(pal = pal, n = n, alpha = alpha, use_names = TRUE)  # create a list of length 1
    
    # Debugging:
    nm <- ifelse(length(unlist(pal_tmp)) == 1 | comment(pal_tmp) == "custom", 
                 "", paste0(" ", comment(pal_tmp)))   
    
    pl <- ifelse(length(unlist(pal_tmp)) == 1, names(pal_tmp), "palette")  # classify as palette or not
    
    cst <- ifelse(comment(pal_tmp) == "custom" & length(unlist(pal_tmp)) != 1, "custom ", "")
    
    if (is.na(main)){
      main <- paste0("See ", cst, "color ", pl, nm)  # assemble main title 
    }
    
    pal_tmp <- list(pal_tmp)  # list the palette (leave the comment attribute)
    
  }
  
  if ( n != "all" | !is.na(alpha) ) {
    n_txt <- ifelse(n != "all", paste0("n = ", n), "")
    alp_txt <- ifelse(!is.na(alpha), paste0("alpha = ", alpha), "")
    comma <- ifelse(nchar(n_txt) == 0 | nchar(alp_txt) == 0, "", ", ")
    
    if (is.na(main)){
      main <- paste0(main, " (", alp_txt, comma, n_txt, ")")  # assemble main title 
    }
  }
  
  # Check interplay of col_brd and lwd_brd:
  if (!is.null(lwd_brd) && (lwd_brd <= 0)){
    message("Setting (lwd_brd <= 0) is not allowed: Using lwd_brd = NULL.")
    lwd_brd <- NULL  # correct to default
  }
  
  if (!is.null(col_brd) && is.null(lwd_brd)){
    message("Setting col_brd requires lwd_brd: Using lwd_brd = 1.")
    lwd_brd <- 1   # correct to sensible value
  }
  
  if (!is.null(lwd_brd) && is.null(col_brd)){
    message("Setting lwd_brd requires col_brd: Using col_brd = 'white'.")
    col_brd <- "white"   # correct to sensible value
  }
  
  
  # 2. Plotting parameters: -------- 
  
  distance <- 0   # set distance of boxes?
  xlen <- 1       # set x length of color boxes.
  
  # Get maximum number of colors:
  max_ncol <- max(unlist(lapply(pal_tmp, FUN = length)))
  
  # Determine xlim based on distance, maximum number of colors, and box length:
  xlim <- c(0 - distance, (1 + distance) * xlen) * max_ncol * xlen
  
  # Determine ylim as number of colors in the palette:
  ylim <- c(0, length(pal_tmp) + 0.2)   
  
  # Bind palette(s) to their color index:
  pal_mat <- cbind(pal_tmp, length(pal_tmp):1)  # ToDo: Note that a single palette needs to be a list of length 1!
  
  
  # 3. Plotting: -------- 
  
  # 1. multiple list entries --> compare palettes
  # 2. only ONE list entry   --> details of a palette
  
  # 3-1. Plot a list of palettes: -------  
  
  if (length(pal_tmp) > 1) {
    
    # print(length(pal_tmp))  # 4debugging
    
    # list_element_names <- paste0(as.character(substitute(pal)))[-1]
    # print(list_element_names)
    # # OR: 
    # rlang::enexpr(pal)  
    
    # Set margins:
    if ((is.null(sub) == FALSE) && (is.na(sub) == FALSE) && (sub != "") ){
      par(mar = c(5.2, 6, 3, 1))  # enable subtitle at bottom (line 5)
    } else { # default:
      par(mar = c(3, 6, 3, 1))    # mar default is c(5, 4, 4, 2) + 0.1       
    }
    
    # Set bg color:
    par(bg = col_bg)
    
    # Prepare canvas/blank plot: 
    plot(x = 0, 
         type = "n", 
         xlim = xlim, ylim = ylim,
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = main,
         sub = sub, 
         bty = "n",
         ...  # other graphical parameters
    )
    
    if (grid) {
      
      x_vals <- 0:max(ylim)
      
      dims <- max(ylim) * max_ncol
      grfac <- c(3, 4, 5)[c(dims < 100, dims > 100 & dims < 150, dims > 150)]
      # ensure an appropriate number of vertical lines using gridfactor. 
      y_vals <- 1:max_ncol
      y_vals <- y_vals[(y_vals %% grfac) == 0]  # steps of 5
      y_vals <- y_vals - xlen/2
      
      abline(h = x_vals,
             v = y_vals,
             col = grey(.50, .50),
             lwd = .5)
      
    } # if (grid) etc. 
    
    # Dynamic updating of ylen on number of palettes: 
    ylen <- 0.8
    
    # Add the color vectors:
    # if (is.null(lwd_brd)) { lwd_brd <- 0 } # set default lwd_brd
    
    apply(pal_mat, MARGIN = 1, FUN = function(row) {
      plot_col(x = row[[1]], ypos = row[2], plot.new = FALSE, 
               ylen = ylen, col_brd = col_brd, lwd = lwd_brd)
    })
    
    # Label pal names:
    cex_lbl <- .90
    
    text(x = 0, y = 1:length(pal_tmp), 
         labels = rev(names(pal_tmp)), 
         cex = cex_lbl, pos = 2, xpd = TRUE,
         offset = 1  # 1 character.
    )
    
    txt_ind <- paste0("[", 1:max_ncol, "]")
    cex_ind <- par("cex")
    wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))
    pos_ind <- seq(0.5, (max_ncol - 0.5), by = 1)
    
    while (wdth_ind > xlim[2]) {
      
      txt_ind <- txt_ind[seq(1, length(txt_ind), by = 2)]  # only show every 2nd index.
      pos_ind <- pos_ind[seq(1, length(pos_ind), by = 2)]
      wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))  # is the width small enough?
      
    } # while end. 
    
    # Labels of color indices:
    cex_ixs <- .80
    yix <- -0.02 * length(pal_tmp)  # dynamic positioning of indices. 
    
    text(x = pos_ind, y = yix, labels = txt_ind, pos = 1, xpd = TRUE,
         cex = cex_ixs, col = grey(0, 2/3))
    
  } else {  # if length(pal_tmp) list is NOT > 1:
    
    
    
    # 3-2. Plot a detailed view of 1 palette: -------  
    
    names(pal_tmp) <- NULL  # remove first order names! 
    
    pal_tmp <- unlist(pal_tmp)  
    
    # Set margins:
    if ((is.null(sub) == FALSE) && (is.na(sub) == FALSE) && (sub != "") ){
      par(mar = c(5.2, 2, 3, 1))  # enable subtitle at bottom (line 5)
    } else { # default:
      par(mar = c(3, 2, 3, 1))    # mar default is c(5, 4, 4, 2) + 0.1       
    }
    
    # Set bg color:
    par(bg = col_bg)
    
    # Create empty plot:
    plot(x = 0, 
         type = "n", 
         xlim = xlim, ylim = c(-1, 2),
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = main,
         sub = sub, 
         bty = "n", 
         ...  # other graphical parameters
    )  
    
    # Text elements:
    txt_pos <- seq(0.5, length(pal_tmp) - 0.5)
    
    # y positions: 
    y_names <- 1.50
    y_circ  <- 1.20 
    y_rect  <- 0.60
    y_rgb   <- c(-.50, -.65, -.80)
    
    # Grid:
    if (grid) {
      
      abline(# h = c(c(0.6, 1.2, 1.6, -0.1), c(y_rgb, -0.95) + 0.07),
        # h = c(-.88, -.43, -.10, y_rect, y_circ),
        h = c(-1, -.05, y_rect, y_circ),
        # v = txt_pos,
        col = grey(.5, .5),
        lwd = .3)
      
      xpos <- txt_pos
      if ( length(xpos) > 10 ) xpos <- xpos[xpos %% 5 == 0.5]  # steps of five.
      
      segments(
        x0 = xpos,
        y0 = 2, y1 = -0.2,
        col = grey(.5, .5),
        lwd = .3
      )
      
    } # if (grid) etc. 
    
    # Find cex so that it is as large as possible:
    cex_min <- .65  # lower limit for cex
    
    # Determine whether to display hex values:
    cex_hex <- .95  # was par("cex")
    
    placeholder <- ifelse(is.na(alpha), " #FFFFFF", " #FFFFFFFF")
    wdth_hex <- strwidth(placeholder, cex = cex_hex) * max_ncol  # + strwidth("Hex: ", cex = cex_hex)  # width of HEX strings
    
    while ((wdth_hex > (xlim[2] + 1/2)) & (cex_hex > cex_min)) {
      
      cex_hex  <- (cex_hex - .01)  # reduce size
      wdth_hex <- strwidth(placeholder, cex = cex_hex) * max_ncol  # + strwidth("Hex: ", cex = cex_hex)  # is width small enough?
      
    }
    
    # If hex is NULL (as per default), determine hex based on width and max cex:
    if ( is.null(hex) ) { # Can/should hex be displayed?
      
      # hex <- ifelse((wdth_hex > (xlim[2] + 1) | (cex_hex < cex_min)), FALSE, TRUE)  # conservative
      
      hex <- ifelse((wdth_hex > (3/2 * xlim[2])), FALSE, TRUE)  # relaxed (given 3 HEX options below)
      
    } # otherwise: use the hex value provided.
    
    # Determine, whether to display RGB values:
    cex_rgb <- 0.95
    wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol
    
    while ((wdth_rgb > xlim[2]) & (cex_rgb > cex_min)) {
      
      cex_rgb  <- (cex_rgb - .02)  # reduce size
      wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol  # is width small enough?
      
    }
    
    # If rgb is NULL (as per default), determine rgb based on width and max cex:
    if ( is.null(rgb) ) {
      
      rgb <- ifelse(wdth_rgb > xlim[2] | cex_rgb < cex_min, FALSE, TRUE)
      
    } # otherwise: use the rgb value provided.
    
    
    # Plot rectangles: ----
    
    # if (is.null(lwd_brd)) { lwd_brd <- 1 } # set default lwd_brd
    
    plot_col(x = pal_tmp, ypos = y_rect, shape = "rect", ylen = 0.5, plot.new = FALSE, col_brd = col_brd, lwd = lwd_brd#,
             # ...  # other graphical parameters
    )
    
    # Plot circles: ---- 
    circle_len <- ifelse(((xlim[2] / 10) < .70), (xlim[2] / 10), .70)
    
    plot_col(x = pal_tmp, ypos = y_circ, shape = "circle", xlen = circle_len, plot.new = FALSE, col_brd = col_brd, lwd = lwd_brd#,
             # ...  # other graphical parameters
    )
    
    
    # Color names: ----
    
    if ((!any(is.na(pal_names))) &                # pal_names were provided
        (length(pal_names) == length(pal_tmp))){  # and of appropriate length:  
      
      col_names <- pal_names  # use custom pal_names. 
      
    } else { # default color names:
      
      col_names <- names(pal_tmp)      
      
    }
    
    y_names <- y_circ + (circle_len * 4 / max_ncol)  # determine y_names based on circle position and size.
    
    text(x = txt_pos, y = y_names, labels = col_names, # pos = 3, 
         srt = 45, xpd = TRUE, offset = 1, cex = 0.8, 
         adj = c(0, 0))
    
    # Spacing of indices:
    txt_ind <- paste0("[", 1:length(pal_tmp), "]")
    cex_ind <- par("cex")
    wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))
    pos_ind <- txt_pos
    
    while (wdth_ind > xlim[2]) {
      
      txt_ind <- txt_ind[seq(1, length(txt_ind), by = 2)]  # only show every second index.
      pos_ind <- pos_ind[seq(1, length(pos_ind), by = 2)]
      wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))  # is the width small enough?
      
    }
    
    # Color indices:
    cex_ixs <- .80
    text(x = pos_ind, y = 0, labels = txt_ind, pos = 3, xpd = TRUE,
         cex = cex_ixs, col = grey(0, 2/3))
    
    
    # HEX values: ---- 
    
    if (hex) {
      
      # Convert pal_tmp to hex values (if not already in this format): 
      if (!all(is_hex_col(pal_tmp))) { 
        pal_tmp <- grDevices::rgb(t(col2rgb(pal_tmp)), maxColorValue = 255)
      }
      
      # 3 ways to plot HEX values: 
      wdth_hex   <- strwidth(placeholder, cex = cex_hex) * max_ncol
      wdth_hex_2 <- strwidth(placeholder, cex = max(cex_hex, cex_rgb)) * max_ncol  # using larger font size (on 2 lines)
      
      if ( wdth_hex_2 > ((2.0 * xlim[2])) ){ # (c) too long for 2 lines:
        
        y_hex  <- -0.25  # Hex label height
        
        # (c) rotated HEX values (45 degrees):
        text(x = txt_pos, y = y_hex, labels = pal_tmp, pos = NULL, xpd = TRUE, cex = cex_hex, srt = 45)  
        
      } else if (wdth_hex > (1.0 * xlim[2])){ # (b) too long for 1 line:  
        
        cex_hex <- max(cex_hex, cex_rgb)  # use larger font size (on 2 lines)
        
        y_hex  <- -0.15  # Hex label height
        yshift  <- 0.15  # downward shift
        
        text(x = 0, y = y_hex, labels = "Hex:", font = 2, pos = 2, offset = 0, 
             xpd = TRUE, cex = cex_hex)  # title label
        
        # (b) horizontal HEX values (on 2 lines):
        is_odd <- (1:length(pal_tmp) %% 2 == 1)  # odd elements (as logical) 
        text(x = txt_pos, y = y_hex - (is_odd * yshift), 
             labels = pal_tmp, pos = NULL, xpd = TRUE, cex = cex_hex, srt = 0)
        
        # (b/c) rotate HEX labels:
        # text(x = txt_pos, y = y_hex, labels = pal_tmp, pos = NULL, xpd = TRUE, cex = cex_hex, srt = 45)         
        
        
      } else { # (a) default: horizontal HEX values (on same line):
        
        y_hex  <- -0.25  # Hex label height
        
        text(x = 0, y = y_hex, labels = "Hex:", font = 2, pos = 2, offset = 0, 
             xpd = TRUE, cex = cex_hex)  # title label
        
        # (a) linear HEX values (on 1 line): 
        text(x = txt_pos, y = y_hex, labels = pal_tmp, pos = NULL, xpd = TRUE, cex = cex_hex, srt = 0)        
        
      }
      
    } # if (hex) etc.
    
    
    # RGB values: ----
    
    if (rgb) {
      
      text(x = rep(0, 3),
           y = y_rgb,
           labels = c("R:", "G:", "B:"), font = 2, 
           pos = 2, offset = 0, xpd = TRUE,
           cex = cex_rgb)
      
      text(x = matrix(rep(txt_pos, 3), nrow = 3, byrow = TRUE),
           y = matrix(rep(y_rgb, length(txt_pos) + 1), nrow = 3),
           labels = col2rgb(pal_tmp),
           pos = 2, offset = -.67, xpd = TRUE,
           cex = cex_rgb)
      
    } # if (rgb) etc.
    
  }  # if (length(pal_tmp) > 1) etc. 
  
  
  # Marging note: ----
  
  if (par("col.sub") == "black"){  # if default:
    col_note <- "grey50"           # use "grey50"
  } else {
    col_note <- par("col.sub")     # use current setting.
  }
  
  mtext(mar_note, side = 1, line = 1, adj = 1.0, cex = .90, col = col_note)
  
  
  # Reset plotting parameters: 
  par(op)
  
  # Output: Invisibly return pal_tmp palette(s):
  invisible(pal_tmp)
  
} # seecol().  

## Check:
# library(unikn)
# library(magrittr)
# unikn::usecol(c("black","blue3","white"), n= 8) %>% unikn::seecol(hex = TRUE)
# unikn::usecol(c("black","blue3","white"), n=12) %>% unikn::seecol(hex = TRUE)
# unikn::usecol(c("black","blue3","white"), n=20) %>% unikn::seecol(hex = TRUE)

## Margin notes (and custom colors for titles and note):
# op <- par(no.readonly = TRUE)
# par("col.main" = "blue", "col.sub" = "red")
# seecol(c("black", "white"), n = 5, mar_note = "This is a note.")
# par(op)


# all_colors(): Combine all colors from unikn palettes with default R colors() ------

#' Provide all unikn colors and base R colors 
#' 
#' \code{all_colors} combines the \strong{unikn} color gradients with the 
#' 657 named colors provided by \code{\link{colors}} of \strong{grDevices}. 
#' 
#' The color values returned (as a named character vector) 
#' are either HEX/HTML codes or \strong{base} R color names.
#' 
#' The \code{distinct} option removes colors with duplicate color values or names.
#' 
#' @return A named vector of color values (of type character).
#' 
#' @param distinct Boolean: Return only colors with unique values and names? 
#' Default: \code{distinct = TRUE} (i.e., remove duplicate values and names).
#' 
#' @keywords internal
#' 

all_colors <- function(distinct = TRUE){
  
  out <- NA  # initialize
  
  # 1. All colors (of unikn package): ---- 
  
  # +++ here now +++:
  
  # unikn_pkg_colors <- usecol(c("black", "white",
  #                              # Local uni.kn colors:
  #                              pal_grau, pal_bordeaux, pal_petrol, pal_peach, 
  #                              pal_seeblau, pal_pinky, pal_seegruen, pal_karpfenblau, 
  #                              pal_signal, 
  #                              pal_unikn,  # contains 4 "seegrau" variants of "grey"
  #                              # Added/contributed color palettes:
  #                              caltech_pal_1, caltech_pal_2, caltech_pal_3, 
  #                              eth_pal_1, eth_pal_2, eth_pal_3, 
  #                              fu_pal_0, fu_pal_1, fu_pal_2, fu_pal_3, 
  #                              hu_pal_1, hu_pal_2, 
  #                              lmu_pal_1, lmu_pal_2, lmu_pal_3, 
  #                              mpg_pal, 
  #                              uni_bonn_1, uni_bonn_2, 
  #                              uni_goettingen_1, uni_goettingen_2, uni_goettingen_3, 
  #                              uni_freiburg_0, uni_freiburg_1, uni_freiburg_2, 
  #                              uni_freiburg_br, uni_freiburg_blue, uni_freiburg_info,
  #                              uni_hamburg_1, uni_hamburg_2, 
  #                              uni_jena_1, uni_jena_2, 
  #                              uni_kiel_1, uni_kiel_2, 
  #                              uni_koeln_1, uni_koeln_2, 
  #                              # uni_konstanz_1, uni_konstanz_2,  # duplicates of pal_ (above).
  #                              uni_mannheim_1, uni_mannheim_2, 
  #                              uni_princeton_0, uni_princeton_1, uni_princeton_2,
  #                              uni_regensburg_1, uni_regensburg_2, uni_regensburg_3,
  #                              uni_ulm_1, uni_ulm_2, 
  #                              rpi_pal_1, rpi_pal_2, rpi_pal_3,
  #                              rptu_pal 
  # ), 
  # use_names = TRUE)
  
  unikn_pkg_colors <- usecol(c("black", "white",
                               # Local uni.kn colors:
                               pal_grau, pal_bordeaux, pal_petrol, pal_peach, 
                               pal_seeblau, pal_pinky, pal_seegruen, pal_karpfenblau, 
                               pal_signal, 
                               pal_unikn # contains 4 "seegrau" variants of "grey"
                               # # Added/contributed color palettes:
                               # caltech_pal_1, caltech_pal_2, caltech_pal_3, 
                               # eth_pal_1, eth_pal_2, eth_pal_3, 
                               # fu_pal_0, fu_pal_1, fu_pal_2, fu_pal_3, 
                               # hu_pal_1, hu_pal_2, 
                               # lmu_pal_1, lmu_pal_2, lmu_pal_3, 
                               # mpg_pal, 
                               # uni_bonn_1, uni_bonn_2, 
                               # uni_goettingen_1, uni_goettingen_2, uni_goettingen_3, 
                               # uni_freiburg_0, uni_freiburg_1, uni_freiburg_2, 
                               # uni_freiburg_br, uni_freiburg_blue, uni_freiburg_info,
                               # uni_hamburg_1, uni_hamburg_2, 
                               # uni_jena_1, uni_jena_2, 
                               # uni_kiel_1, uni_kiel_2, 
                               # uni_koeln_1, uni_koeln_2, 
                               # # uni_konstanz_1, uni_konstanz_2,  # duplicates of pal_ (above).
                               # uni_mannheim_1, uni_mannheim_2, 
                               # uni_princeton_0, uni_princeton_1, uni_princeton_2,
                               # uni_regensburg_1, uni_regensburg_2, uni_regensburg_3,
                               # uni_ulm_1, uni_ulm_2, 
                               # rpi_pal_1, rpi_pal_2, rpi_pal_3,
                               # rptu_pal 
  ), 
  use_names = TRUE)
  
  # Sort colors (by name):
  unikn_pkg_colors_s <- unikn_pkg_colors[sort(names(unikn_pkg_colors))]
  
  # 2. Add R colors() (from grDevices): ---- 
  unikn_and_R_colors <- usecol(c(unikn_pkg_colors_s, grDevices::colors()), use_names = TRUE)
  # unikn_and_R_colors[1:10]
  
  if (distinct){ # Remove duplicates (3 ways): ---- 
    
    # col_unique_name <- unikn_and_R_colors[duplicated(names(unikn_and_R_colors)) == FALSE]  # 1. unique names
    # col_unique_value <- col_distinct(col_unique_name)  # 2. unique color values (visually distinct)
    
    # 3. Using col_distinct() helper function: 
    all_unique_colors <- col_distinct(pal = unikn_and_R_colors, 
                                      use_hex = TRUE, 
                                      use_alpha = FALSE, 
                                      use_names = TRUE)
    
    out <- all_unique_colors
    
  } else {
    
    out <- unikn_and_R_colors
    
  }
  
  # Output: ---- 
  
  return(out)
  
} # all_colors().

## Check:
# all_colors()[1:50]

# length(all_colors(distinct = TRUE))   #  756 [on 2023-07-13]
# length(all_colors(distinct = FALSE))  # 1031 [on 2023-07-13]

# length(all_colors(distinct = TRUE))   #  545 [on 2023-08-20]
# length(all_colors(distinct = FALSE))  #  713 [on 2023-08-20]

# grepal("see", all_colors())     # finds unikn colors (and matching colors())
# grepal("gruen", all_colors())   # finds unikn and added colors
# grepal("purple", all_colors())  # finds added and base R colors
# 
# grepal("black", all_colors(), ignore_case = FALSE)  # only 1 "black"
# grepal("black", all_colors(), ignore_case = TRUE)   # 2 variants of "black"
# grepal("signal", all_colors())  # 3 signal colors
# grepal("alice", all_colors())   # 1 base R color
# grepal("red", all_colors())  # finds Caltech's JPL and RPI's primary colors
# grepal("orange", all_colors())  # finds Caltech and Princeton orange colors
# 
# simcol(Petrol, all_colors())



## ToDo: ------

# - seecol(): Compare 
# seecol(unicol::eth_3) # showing only 6-digit HEX values for transparent colors, with 
# seecol(unicol::eth_3[3:7]) # showing full HEX values (8 digits) for transparent colors

# - usecol(): $comment attribute "custom" prevents output from being a vector

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