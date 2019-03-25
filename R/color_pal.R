## color_pal.R  |  unikn
## ng/hn | uni.kn | 2019 03 22
## ---------------------------

## Main functions to access and plot color palettes. 


## mixcol: Provide a color gradient based on given colors or color palettes: -------- 

# - Documentation: ---- 

#' Provide a color gradient scale. 
#'
#' \code{mixcol} provides a color gradient 
#' based on a vector of input colors or color palettes 
#' defined by \code{pal}.
#' 
#' \code{mixcol} uses \code{grDevices::colorRampPalette} to  
#' provide a function that takes an integer argument 
#' (the required number of colors) to  
#' return a character vector of (rgb) colors 
#' interpolating color sequence provided by \code{col}.
#' 
#' For best results, consider combining existing color palettes 
#' with base color "white" (see Examples).
#' 
#' @param pal A color palette (as a vector of colors or color palettes). 
#' Default: \code{pal = \link{pal_unikn}}. 
#' 
#' @param n Number of desired colors. 
#' Default: \code{n = length(col)}. 
#' 
#' @param ... Additional parameters 
#' (passed to \code{grDevices::colorRampPalette}). 
#'
#' @examples
#' ## Creating color gradients: ------ 
#' 
#' # Gradients extending 1 color palette:
#' mixcol(n = 5)  # 5 colors of default scale pal_unikn
#' mixcol(pal_petrol, n = 10)  # 10 colors of pal_petrol
#' 
#' # Gradients over 2+ colors:
#' mixcol(c(Seeblau, Peach), n = 10)
#' mixcol(c(Signal, Petrol), n = 10)  
#' mixcol(c(Seeblau, "white", Pinky), n = 10)
#' mixcol(c(Karpfenblau, Seeblau, "gold"), n = 10)  # "gold" shines brighter than signal
#' 
#' # Gradients over 2+ color palettes:
#' mixcol(c(pal_seeblau, pal_peach), n = 10)
#' mixcol(c(pal_seeblau, pal_karpfenblau), n = 10)
#' mixcol(c(pal_seeblau, pal_grau, pal_petrol), n = 10)
#' 
#' # Gradients over 3+ color palettes and colors:
#' mixcol(c(rev(pal_seeblau), "white", pal_pinky), n = 11)
#' mixcol(c(rev(pal_seeblau), "white", pal_petrol), n = 11)
#' mixcol(c(rev(pal_karpfenblau), "white", pal_bordeaux), n = 11) 
#' 
#' ## Creating and plotting color gradients: ------ 
#' 
#' # (1) Extending color palettes: ----
#' seecol(mixcol(n = 20))
#' seecol(mixcol(pal_seeblau, n = 10))
#' seecol(mixcol(pal_bordeaux, n = 10))
#'
#' # (2) Combining colors or palettes: ---- 
#' 
#' # Combining 2+ colors to create new palettes:
#' seecol(mixcol(c(Seeblau, Signal), n = 10))
#' seecol(mixcol(c(Signal, Petrol), n = 10))
#' seecol(mixcol(c(Seeblau, "white", Pinky), n = 10))
#' seecol(mixcol(c(Karpfenblau, Seeblau, "white"), n = 10))
#' seecol(mixcol(c(Bordeaux, "white", Petrol), n = 10))
#' seecol(mixcol(c(Seeblau, "white", Petrol), n = 10))
#' seecol(mixcol(c(Karpfenblau, Seeblau, "gold"), n = 10))  # "gold" shines brighter than signal
#'   
#' # Combining 2+ color palettes into new palettes:
#' seecol(mixcol(c(rev(pal_seeblau), pal_petrol), n = 10))
#' seecol(mixcol(c(rev(pal_seeblau), pal_peach), n = 10))
#' seecol(mixcol(c(rev(pal_karpfenblau), pal_bordeaux), n = 10))
#' seecol(mixcol(c(rev(pal_seegruen), pal_pinky), n = 10))
#' seecol(mixcol(c(rev(pal_petrol), pal_bordeaux), n = 10))
#' 
#' #' # Combining 2 palettes and mid-color "white" to new palettes:
#' seecol(mixcol(c(rev(pal_seeblau), "white", pal_pinky), n = 11))
#' seecol(mixcol(c(rev(pal_seeblau), "white", pal_petrol), n = 11))
#' seecol(mixcol(c(rev(pal_karpfenblau), "white", pal_bordeaux), n = 11))
#' seecol(mixcol(c(rev(pal_seegruen), "white", pal_peach), n = 11))
#' seecol(mixcol(c(rev(pal_petrol), "white", pal_bordeaux), n = 11))
#' 
#' @family color palettes
#' @family color functions 
#'
#' @seealso
#' \code{\link{seecol}} to plot color palettes; 
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @import grDevices 
#'
#' @export

# - Definition: ---- 

# TODO: A wrapper for a function everyone has is not too useful;
# Suggestion: Integrate the n-parameter to output a scale instead of a function? (implemented below)

mixcol <- function(pal = pal_unikn, n = length(pal), ...){
  
  out_gradient <- grDevices::colorRampPalette(colors = pal, ...)(n)
  
  return(out_gradient)
  
}

## Check:

# # Gradients over 1 color palette:
# mixcol(n = 5)  # 5 colors of default scale pal_unikn
# mixcol(pal_petrol, n = 12)  # 12 colors of pal_petrol
# 
# # Gradients over 2 colors:
# mixcol(c(Seeblau, Peach), n = 10)
# mixcol(c(Seegruen, Petrol), n = 10)
# 
# # Gradients over 2 color palettes:
# mixcol(c(pal_seeblau, pal_peach), n = 10)
# mixcol(c(pal_seeblau, pal_karpfenblau), n = 10)
# 
# # Gradients over 3+ colors:
# seecol(mixcol(c("black", Seeblau, Seegruen, "white"), n = 10))
# 
## Gradients over 3+ color palettes:
# seecol(mixcol(c(rev(pal_seeblau), pal_grau, pal_pinky), n = 12))





## seecol: Main interface to color palettes: ---------- 

# - Documentation: ---- 

#' Show and use color palettes.
#'
#' \code{seecol} provides an interface to seeing colors 
#' or color palettes. 
#' 
#' \code{seecol} has 2 main modes, based on the contents of its \code{pal} argument:
#' 
#' \enumerate{
#'
#'   \item \code{pal} is "all" (or another list of multiple color palettes): 
#'
#'   Plot vectors of all current color palettes for comparing them. 
#'
#'   \item \code{pal} is one specific color palette (or a vector of multiple colors or color palettes):
#'
#'   Plot the current color palette and optional details on its colors.
#'
#' }
#' 
#' @param pal A color palette (as a list of colors) or 
#' the character string \code{"all"} (for showing all 
#' color palettes in the current environment). 
#' Default: \code{pal = "all"}. 
#' 
#' @param n Number of colors to show or use. 
#' If \code{n} is lower or higher than the length of the current 
#' color palette \code{pal}, the color palette is reduced or extrapolated 
#' (using \code{grDevices::colorRampPalette}). 
#' Default: \code{n = "all"}. 
#' 
#' @param hex Should HEX color values be shown?
#' Default: \code{hex = NULL} (i.e., show HEX color values 
#' when there is sufficient space to print them). 
#' 
#' @param rgb Should RGB color values be shown?
#' Default: \code{rgb = NULL} (i.e., show RGB color values 
#' when there is sufficient space to print them). 
#' 
#' @param col_brd Color of box borders (if shown). 
#' Default: \code{col_brd = NULL}. 
#' 
#' @param grid Show grid?  
#' Default: \code{grid = TRUE}. 
#' 
#' @param ... Other graphical parameters 
#' (passed to \code{plot_col}). 
#' 
#' @examples
#' # See all color palettes: 
#' seecol()  # same as seecol(pal = "all") 
#' 
#' # See details of a color palette: 
#' seecol(pal_unikn_plus)  # see a specific color palette
#' 
#' # Combining colors or color palettes: 
#' seecol(c("black", "firebrick", "gold"))
#' seecol(c(rev(pal_seeblau), pal_seegruen))
#' seecol(c(rev(pal_seeblau), "white", pal_pinky))
#' 
#' # Using n to reduce or extend color palettes:
#' seecol(n =  3)  
#' seecol(n = 12)
#' 
#' seecol(pal_unikn_plus, n = 5)
#' seecol(pal_seeblau, n = 10)
#' 
#' # Combining and extending color palettes: 
#' seecol(c(pal_seeblau, "white", pal_bordeaux), n = 21)
#' 
#' @family color palettes
#' 
#' @aliases seepal 
#'
#' @seealso 
#' \code{\link{mixcol}} to mix and extend color palettes (by creating gradients);  
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import graphics 
#' @import grDevices 
#' @import utils
#' 
#' @export

# - Definition: ------- 

# How does color ramp work?
# pal_tst <- grey(c(0.1, 0.2, 0.3, 0.4, 0.9), 1)
# seecol(pal_tst)
# 
# pal_tst[2] <- "red"
# 
# rmp <- colorRampPalette(pal_tst)
# 
# 
# seecol(pal_tst)
# seecol(rmp(10))  # the original color poles appear to be always included!
# seecol(rmp(3))
# # 
# # # TODO: Use a two-step procedure to retain all original colors?
# # 
# rmp2 <- colorRampPalette(pal_unikn_pair)
# seecol(pal_unikn_pair, hex = TRUE)
# rmp2(5) %in% pal_unikn_pair

# TODO:

# - allow selective output of color groups --> Are groups fine?
# Examples: 
# seecol("unikn_all")
# seecol("grad_all")
# - handle n > length(pal) > n
# seecol(pal_bordeaux, n = 2)
# seecol(pal_bordeaux, n = 10)
# seecol(n = 20)  # all color palettes extended to 20 colors.

seecol <- function(pal = "all",     # which palette to output?
                   n = "all",
                   hex = NULL,      # determine by crowdedness, whether hex values should be shown in detail view.
                   rgb = NULL,      # determine, whether rgb values should be shown in detail view (defaults to TRUE)
                   col_brd = NULL,  # border color of the boxes. 
                   grid = TRUE,     # show grid? 
                   ...              # additional arguments to plot.default().
) {
  
  ## 0. Preparations: ----- 
  
  op <- par(no.readonly = TRUE)  # save original plotting settings.
  keys <- c("all", "unikn_all", "all_unikn", "grad_all", "all_grad") # keywords to return multiple palettes. 
  
  # Robustify inputs: 
  ## Palette:
  ## Test, whether the palette exists:
  dep_pal <- deparse(substitute(pal))   # deparse palette to check for existence.
  
  # ----
  if ( !exists(dep_pal) ) {  # does the deparsed pal argument exist?
    
    # print("Nonexistent")
    
    ## If the deparsed argument does not exist, add a pal prefix and test again.
    
    dep_pal_exists <- tryCatch(
      
      {
        exists(paste0("pal_", dep_pal))
        # print("here")
        # print(exists(paste0("pal_", dep_pal)))
      },
      
      # If exists(dep_pal) raises an error:
      error = function(e) {
        
        tryCatch(
          {exists(pal)},   # test whether the input exists.
          
          error = function(e) {
            
            stop(paste0("No matching color palette found for input", dep_pal))
            
          })
      }
    )
    
    # print(dep_pal_exists)
    
    ## If the palette has been found to exist:
    # TODO: Here the function stumbles over multiple keywords!
    
    if ( dep_pal_exists ) {  # if the deparsed argument exists after parsing:
      
      pal <- paste0("pal_", dep_pal)
      
      # print(pal)
      # print(names(pal))
      
    }  else {  # if it does not exist:
      
      pal_exists <- tryCatch(
        {
          exists(pal)  # evaluates to TRUE for vector of palette names.
        },
        error = function(e) {
          return(FALSE)
        }
      )
      
      if ( !pal_exists ) {  # does also the input not exist?
        
        # TODO: Here it stumbles with more than one palette.
        
        if ( exists(paste0("pal_", pal)) ) {  # does it exist but was specified without prefix?
          
          pal <- paste0("pal_", pal)
          
        } else {  # if the palette name is not defined:
          
          # TODO: Account for multiple palettes/colors (e.g., are components defined?)!
          
          # print("Undefined")
          
          are_colors <- all(pal %in% colors() | isHexCol(pal))  # are all inputs colors?
          is_key <- all(pal %in% keys)  # are the inputs (the input) a keyword?
          # print(are_colors)
          
          ## TODO: Handle naming and multiple palettes
          
          if ( !are_colors & !is_key) {
            stop(paste0("The color palette ", pal, " you specified appears not to be defined in the current namespace."))
          }
          
        } # else 2.
      } # if ( !pal_exists ).
    } # else 1. 
  } # existence check.
  
  
  ## Plotting parameters: ----
  if ( !(is.null(hex) | is.logical(hex)) ) stop("Please specify a valid value for 'hex'.")
  if ( !(is.null(rgb) | is.logical(rgb)) ) stop("Please specify a valid value for 'rgb'.")
  
  ## Get palette:
  pal_tmp <- get_col(pal = pal, n = n)
  # print(pal_tmp)
  
  if ( all(pal %in% keys )) {
    
    if ( pal == "all") title <- "See all unikn color palettes"
    if ( pal %in% c("unikn_all", "all_unikn")) title <- "See all basic unikn color palettes"
    if ( pal %in% c("grad_all", "all_grad")) title <- "See all unikn color gradients"
    
  } else {
    
    # nm <- names(pal_tmp)
    nm <- ifelse(is.character(pal) & length(pal) == 1, pal, noquote(dep_pal))  # get name elsewhere!
    pl <- ifelse(length(unlist(pal_tmp)) == 1, "", "palette ")  # classify as palette or not.
    title <- paste0("See color ", pl, nm)
    
  }
  
  if (n != "all") {
    title <- paste0(title, " (n = ", n, ")")
  }
  
  ## 2. Plotting parameters: ------ 
  
  ## Plotting preparations: 
  distance <- 0   # set distance of boxes?
  xlen <- 1       # set x length of color boxes.
  # TODO: Allow user to set these inputs? 
  
  # Get maximum number of colors:
  max_ncol <- max(unlist(lapply(pal_tmp, FUN = length)))
  
  # Determine xlim based on distance, maximum number of colors, and box length:
  xlim <- c(0 - distance, (1 + distance) * xlen) * max_ncol * xlen
  # print(paste0("xlim = ", xlim))
  
  # Determine ylim as number of colors in the palette:
  ylim <- c(0, length(pal_tmp) + 0.2)   
  # print(paste0("ylim = ", ylim))
  
  # Bind palette(s) to their color index:
  pal_mat <- cbind(pal_tmp, length(pal_tmp):1)  # TODO: Note, that a single palette needs to be a list of length 1!
  
  
  ## 3. Plotting: ------ 
  
  ## 3.1 Plot an overview for a list of palettes: 
  ## TODO: How to handle inputs of multiple palettes?  Merge them or display them for comparison.
  ## Possible solution: (a) 1 list entry --> details; (b) more than 1 list entry --> comparison:
  if ( length(pal_tmp) > 1 ) {
    
    # Set margins:
    par(mar = c(3, 6, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = ylim,
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")  
    
    # Grid:
    # grid <- TRUE  # 4debugging
    
    if (grid) {
      
      x_vals <- 0:max(ylim)
      y_vals <- 1:max_ncol
      y_vals <- y_vals[(y_vals %% 5) == 0]  # steps of 5
      y_vals <- y_vals - xlen/2
      
      abline(h = x_vals,
             v = y_vals,
             col = grey(.50, .50),
             lwd = .5)
      
    } # if (grid) etc. 
    
    # Add the color vectors:
    apply(pal_mat, MARGIN = 1, FUN = function(row) {
      # print(row[[2]])
      plot_col(x = row[[1]], ypos = row[2], plot.new = FALSE, ylen = 0.8, col_brd = col_brd, lwd = 0)
    })
    # TODO: Can I allow to plot the matrix in a vectorized way (unlisting somewhere)?
    
    # Add color names and indices:
    cex_lbl <- .90
    
    pal_nm <- names(pal_tmp)  # get palette names.
    # print(paste0("pal_nm = ", pal_nm))  # 4debugging
    
    text(x = 0, y = 1:length(pal_tmp), labels = rev(pal_nm), 
         cex = cex_lbl, pos = 2, xpd = TRUE,
         offset = 1  # 1 character.
    )
    
    txt_ind <- paste0("[", 1:max_ncol, "]")
    cex_ind <- par("cex")
    wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))
    pos_ind <- seq(0.5, (max_ncol - 0.5), by = 1)
    while (wdth_ind > xlim[2]) {
      
      txt_ind <- txt_ind[seq(1, length(txt_ind), by = 2)]  # only show every second index.
      pos_ind <- pos_ind[seq(1, length(pos_ind), by = 2)]
      wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))  # is the width small enough?
      
    }
    
    # Color indices:
    text(x = pos_ind, y = -1, labels = txt_ind, pos = 3, xpd = TRUE,
         cex = 0.9)
    # text(x = seq(0.5, (max_ncol - 0.5), by = 1), y = -1, 
    #      labels = paste0("[", 1:max_ncol, "]"), pos = 3, xpd = TRUE,
    #      cex = (cex_lbl - .10))
    
  } else {  # if length(pal_tmp) list is NOT > 1:
    
    
    # 3.2 Detailed view of 1 palette: ------ 
    
    names(pal_tmp) <- NULL  # remove first order names! 
    
    pal_tmp <- unlist(pal_tmp)  # HERE!
    # TODO: This essentially changes the length of the color vector.  Find better solution!
    
    # Set margins:
    par(mar = c(3, 2, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = c(-1, 2),
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")
    
    # Text elements:
    txt_pos <- seq(0.5, length(pal_tmp) - 0.5)
    
    # y positions: 
    y_names <- 1.6
    y_circ  <- 1.2 
    y_rect  <- 0.6
    y_rgb   <- c(-0.50, -0.65, -0.80)
    
    # Grid:
    # grid <- TRUE  # 4debugging
    
    if (grid) {
      
      abline(# h = c(c(0.6, 1.2, 1.6, -0.1), c(y_rgb, -0.95) + 0.07),
        # h = c(-.88, -.43, -.10, y_rect, y_circ),
        h = c(-1, -.05, y_rect, y_circ),
        # v = txt_pos,
        col = grey(.3, .8),
        lwd = .3)
      
      xpos <- txt_pos
      # print(xpos)
      if ( length(xpos) > 10 ) xpos <- xpos[xpos %% 5 == 0.5]  # steps of five.
      
      segments(
        x0 = xpos,
        y0 = 2, y1 = -0.2,
        col = grey(.3, .8),
        lwd = .3
      )
      
    } # if (grid) etc. 
    
    # Find cex so that it is as large as possible:
    cex_lim <- 0.7  # lower limit for cex. 
    
    # Determine whether to display hex values:
    cex_hex <- 0.9  # was par("cex")
    wdth_hex <- strwidth(" #XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex: ")  # is the width small enough?
    
    while (wdth_hex > xlim[2]) {
      
      cex_hex <- cex_hex - 0.1
      wdth_hex <- strwidth(" #XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex: ")  # is the width small enough?
      
    }
    
    # print(cex_hex)  # 4debugging
    
    # If hex is NULL, determine based on width and max cex.
    # Otherwise use the provided value: 
    if ( is.null(hex) ) {
      
      hex <- ifelse(wdth_hex > xlim[2] | cex_hex < cex_lim, FALSE, TRUE)  # test, whether hex can be displayed.
      
    } 
    
    # Determine, whether to display rgb values:
    cex_rgb <- 0.9
    wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol
    while (wdth_rgb > xlim[2]) {
      
      cex_rgb <- cex_rgb - 0.1
      wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol  # is the width small enough?
      
    }
    
    # If rgb is NULL, determine based on width and max cex.
    # Otherwise use the provided value: 
    if ( is.null(rgb) ) {
      rgb <- ifelse(wdth_rgb > xlim[2] | cex_rgb < cex_lim, FALSE, TRUE)
    }
    
    # Plot rectangles:
    plot_col(x = pal_tmp, ypos = y_rect, plot.new = FALSE, ylen = 0.5, col_brd = col_brd, lwd = 1,
             ...
    )
    
    # Plot circles:
    # TODO: Dynamically determine xlen:
    circle_len <- ifelse(((xlim[2] / 10) < 0.7), (xlim[2] / 10), .70)
    
    # print(paste0("circle_len = ", circle_len))
    
    plot_col(x = pal_tmp, ypos = y_circ, plot.new = FALSE, xlen = circle_len, shape = "circle",
             ...
    )
    
    # Color names:
    
    # TODO: How to include the names of colors specified by their name (like "white")?
    # print(paste0("pal_tmp = ", pal_tmp))  # 4debugging
    col_names <- names(pal_tmp)
    # print(paste0("col_names = ", col_names))  # 4debugging
    # col_names[is.null(col_names)] <- as.character(col_names[is.null(col_names)]) 
    # print(paste0("col_names = ", col_names))  # 4debugging
    
    text(x = txt_pos, y = y_names, labels = col_names, # pos = 3, 
         srt = 45, xpd = TRUE, offset = 1,
         adj = c(0, 0))
    
    # TODO: Spacing of indices:
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
    text(x = pos_ind, y = 0, labels = txt_ind, pos = 3, xpd = TRUE,
         cex = 1)
    
    # Hex values:
    if (hex) {
      
      ## Convert to hex if not already given in this format: 
      if (!all(isHexCol(pal_tmp))) { 
        pal_tmp <- rgb(t(col2rgb(pal_tmp)), maxColorValue = 255)
      }
      
      yhex <- -0.25
      
      # Plot the values: 
      text(x = 0, y = yhex, labels = "Hex:", font = 2, pos = 2, offset = 0, xpd = TRUE, 
           cex = cex_hex)
      
      text(x = txt_pos, y = yhex, labels = pal_tmp, pos = NULL, xpd = TRUE,
           cex = cex_hex, srt = 0)
      
    } # if (hex) etc.
    
    # RGB values:
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
  
  # Reset plotting parameters: 
  par(op)
  
  # Invisibly return pal_tmp palette(s):
  invisible(pal_tmp)
  
}


# - Check: ------- 

## (a) Multiple palettes: 

# seecol("all")
# seecol("all", col_brd = grey(0, .25), lwd = .1)
# seecol("unikn_all")  # all basic palettes. 
# seecol("grad_all")  # all gradients. 

## Return a subset or extended set of colors:
# seecol(pal = "all", n = 2)  
# seecol(pal_bordeaux, n = 2)
# seecol(rev(pal_bordeaux), n = 10)
# seecol(pal = "unikn_all", n = 20)  # all basic palettes extended to 20 colors.

## Critical calls: 
# seecol("all", n =  4)  
# seecol("all", n = 12) 

## 2 palettes: 
# seecol(c(rev(pal_unikn_light), pal_unikn_dark), hex = TRUE)

# ToDo: 
# - group in 2 sets: "unikn" vs. "others"
# - allow grep for name components (e.g., "see", or "unikn")? 
# - allow grep for palette properties (e.g., > 5 colors)? 
# - default/random palette?

## (b) 1 palette: 

# seecol(pal_unikn)  # allow both, palette objects and 
# seecol("pal_unikn")  # palette names;
# seecol(unikn_pair)  # allow also abbreviated palette objects w/o pal_ prefix. 
# seecol(pal_unikn_plus, hex = TRUE)
# seecol(c("blue", "green"))  # allow any color vector. 

# seecol(pal = "seblau")  # raise error.

## Return a subset of colors:
# seecol(pal = pal_petrol, n = 3)
# seecol(pal = pal_unikn_light, n = 3)

## Critical calls:
# seecol(pal_unikn, n =  4)  # works (4 selected)
# seecol(pal_unikn, n = 20)  # fails (max n = 11 of pal_unikn_plus selected)

# seecol(pal_bordeaux, n =  3)  # works (3 selected)
# seecol(pal_bordeaux, n = 10)  # fails (max n = 5 returned)

# seecol(pal_unikn_light, n = 3)   # mostly works (first 3 chosen)
# seecol(pal_unikn_light, n = 10)  # mostly fails (max n = 10 returned)


## (c) Creating new palettes: 

# see colorRampPalette() to extend/stretch color palettes
# ?: What happens when only subsets are selected
#    (a) averages between min and max color?
#    (b) choose existing colors for as long as possible

## Color gradients: 
# gradient <- mixcol(c(rev(pal_seeblau), "white", pal_peach))
# seecol(gradient(50))

## ToDo: 2 main cases: 
# - n < available colors in palettes: Select some from available colors (rather than generating new ones)
# - n > available colors in palettes: Extend/stretch color palettes (rather than individual colors)

## Currently to be commented out for building (probably no palettes loaded before the function is executed):
# a <- seecol(pal = "all")  # return all palettes.
# a

# b <- seecol(pal = pal_unikn_pair)  # return one long palette (hex not displayed by default.)
# seecol(pal = pal_unikn_pair, hex = TRUE)  # display hex independent of fontsize.
# seecol(pal = pal_unikn_pair)  

# c <- seecol(pal = pal_bordeaux, hex = TRUE)


# rmp <- colorRampPalette(c(pal_seeblau, "white", pal_grau, pal_peach))

# seecol(rmp(.5))
# seecol(c("black", "yellow", "green"))




## usecol: Use a color palette (as is): ---------  

#' Use a color palette. 
#'
#' \code{usecol} allows using a color palette \code{pal}.
#' 
#' @param pal A color palette (as a vector of colors or color palettes). 
#' Default: \code{pal = \link{pal_unikn}}. 
#' 
#' @family color palettes
#' @family color functions 
#'
#' @seealso
#' \code{\link{seecol}} to plot color palettes. 
#'
#' @export

usecol <- function(pal = pal_unikn){
  
  out_col <- NA
  
  out_col <- mixcol(pal = pal)
  
  return(out_col)
  
}



## ToDo: ------

# - Naming: Remove "pal_" from names? (Currently, pal_n uses full names...)


## eof. ----------


