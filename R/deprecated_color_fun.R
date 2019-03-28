## deprecated_color_fun.R  |  unikn
## ng | uni.kn |  2019 03 28
## ---------------------------

## Functions from color_functions and color_pal I suggest for retirement.
## Only the files color_utils and color functions are to be retained.

## Functions: ------

# pal_which: Get some [which] specific colors of a palette [pal]: ------ 

# - Documentation: ---- 

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
#' @family color functions
#'
#' @seealso
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @export

# - Definition: ---- 

# TODO: Necessary?  Simple indexing works as well... 

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


## mixcol: Provide a color gradient based on given colors or color palettes: -------- 

# Relatively redundant with usecol; only retain the latter.

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


# pal_n_sq: Get n^2 (n x n) specific colors of a palette [pal]: ------ 

# - Documentation: ---- 

#' Get n^2 dedicated colors of a color palette.
#'
#' \code{pal_n_sq} returns \code{n^2} dedicated colors of a color palette \code{pal} 
#' (up to a maximum of \code{n + 1} colors). 
#' 
#' Note that \code{pal_n_sq} was created for \code{pal = \link{pal_unikn}} 
#' for small values of \code{n} (\code{n = 1, 2, 3}) and 
#' returns the 11 colors of \code{\link{pal_unikn_plus}} for any \code{n > 3}. 
#' 
#' Use the more specialized function \code{use_pal_n} for choosing 
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
#' # pal_n_sq(1) #  1 color: seeblau3
#' # pal_n_sq(2) #  4 colors
#' # pal_n_sq(3) #  9 colors (5: white)
#' # pal_n_sq(4) # 11 colors of pal_unikn_plus (6: white)
#' 
#' @family color palettes
#'
#' @seealso
#' \code{\link{seecol}} to plot color palettes; 
#' \code{\link{col_scale}} to create color scales (gradients);  
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#' 
#' 

# - Definition: ---- 

# TODO: See use_pal_n; can be retained but then should be exported.

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

# - Documentation: ---- 

#' Plot a color palette.
#'
#' \code{plot_pal} plots information on a color palette \code{pal}.
#' 
#' \code{plot_pal} is now replaced by \code{\link{seecol}}. 
#'
#' @param pal A color palette (as a data frame). 
#' Default: \code{pal = \link{pal_unikn}}. 
#'
#' @examples
#' # plot_pal()  # plots default color palette 
#' # plot_pal(pal_unikn_plus) 
#' 
#' ## Not run: 
#' 
#' ## Plotting palettes from other packages: ------ 
#' 
#' ## RColorBrewer palettes: 
#' # plot_pal(RColorBrewer::brewer.pal(n = "all", name = "Set1"))
#' # plot_pal(RColorBrewer::brewer.pal(n = 5, name = "Blues"))
#' 
#' ## viridisLite palettes: 
#' # plot_pal(viridisLite::viridis(20))
#' # plot_pal(viridisLite::inferno(25)) 
#' # plot_pal(viridisLite::magma(25))
#' # plot_pal(viridisLite::plasma(25))
#'   
#' ## yarrr palettes: 
#' # plot_pal(yarrr::piratepal(palette = "appletv"))
#' # plot_pal(yarrr::piratepal(palette = "google"))
#' 
#' ## End(Not run)
#'
#' @family color palettes
#' @family color functions 
#'
#' @seealso 
#' \code{\link{col_scale}} to extend color palettes (by creating gradients);  
#' \code{\link{pal_which}} to get specific colors of a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import ggplot2
#' @import grDevices 
#'
#'

# - Definition: ---- 

plot_pal <- function(pal = pal_unikn) {
  
  stopifnot(length(pal) > 0)
  
  n <- 1:length(pal)
  
  name <- names(pal)
  
  # if pal contained no names:  
  if (is.null(name)) {name <- paste0("[", 1:length(pal), "]")}
  
  pal_name <- deparse(substitute(pal)) # name of pal (as df)
  
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
          plot.title = element_text(family = "sans", face = "bold"), 
          panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(linetype = 1, size = .25), 
          panel.grid.major.y = element_line(linetype = 1, size = .25))
  
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

# ## Demo: 
# n <- 10
# col_gradient(n)
# plot(rep(1, n), col = (col_gradient(n)), pch = 19, cex = 10)
# 
# plot(rep(1, n), col = (col_gradient(n)), pch = 15, cex = 3)
# text(x = 10, y = 1.2, labels = col_gradient(n)[10])

## Use example code to create a function col_scale:


# col_scale: Provide a color gradient based on given colors or color palettes: -------- 

# - Documentation: ---- 

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
#' col_scale(n = 5)  # 5 colors of default scale pal_unikn
#' col_scale(pal_petrol, n = 10)  # 10 colors of pal_petrol
#' 
#' # Gradients over 2+ colors:
#' col_scale(c(Seeblau, Peach), n = 10)
#' col_scale(c(Signal, Petrol), n = 10)  
#' col_scale(c(Seeblau, "white", Pinky), n = 10)
#' col_scale(c(Karpfenblau, Seeblau, "gold"), n = 10)  # "gold" shines brighter than signal
#' 
#' # Gradients over 2+ color palettes:
#' col_scale(c(pal_seeblau, pal_peach), n = 10)
#' col_scale(c(pal_seeblau, pal_karpfenblau), n = 10)
#' col_scale(c(pal_seeblau, pal_grau, pal_petrol), n = 10)
#' 
#' # Gradients over 3+ color palettes and colors:
#' col_scale(c(rev(pal_seeblau), "white", pal_pinky), n = 11)
#' col_scale(c(rev(pal_seeblau), "white", pal_petrol), n = 11)
#' col_scale(c(rev(pal_karpfenblau), "white", pal_bordeaux), n = 11) 
#' 
#' ## Creating and plotting color gradients: ------ 
#' 
#' # (1) Extending color palettes: ----
#' seecol(col_scale(, n = 20))
#' seecol(col_scale(pal_seeblau, n = 10))
#' seecol(col_scale(pal_bordeaux, n = 10))
#'
#' # (2) Combining colors or palettes: ---- 
#' 
#' # Combining 2+ colors to create new palettes:
#' seecol(col_scale(c(Seeblau, Signal), n = 10))
#' seecol(col_scale(c(Signal, Petrol), n = 10))
#' seecol(col_scale(c(Seeblau, "white", Pinky), n = 10))
#' seecol(col_scale(c(Karpfenblau, Seeblau, "white"), n = 10))
#' seecol(col_scale(c(Bordeaux, "white", Petrol), n = 10))
#' seecol(col_scale(c(Seeblau, "white", Petrol), n = 10))
#' seecol(col_scale(c(Karpfenblau, Seeblau, "gold"), n = 10))  # "gold" shines brighter than signal
#'   
#' # Combining 2+ color palettes into new palettes:
#' seecol(col_scale(c(rev(pal_seeblau), pal_petrol), n = 10))
#' seecol(col_scale(c(rev(pal_seeblau), pal_peach), n = 10))
#' seecol(col_scale(c(rev(pal_karpfenblau), pal_bordeaux), n = 10))
#' seecol(col_scale(c(rev(pal_seegruen), pal_pinky), n = 10))
#' seecol(col_scale(c(rev(pal_petrol), pal_bordeaux), n = 10))
#' 
#' #' # Combining 2 palettes and mid-color "white" to new palettes:
#' seecol(col_scale(c(rev(pal_seeblau), "white", pal_pinky), n = 11))
#' seecol(col_scale(c(rev(pal_seeblau), "white", pal_petrol), n = 11))
#' seecol(col_scale(c(rev(pal_karpfenblau), "white", pal_bordeaux), n = 11))
#' seecol(col_scale(c(rev(pal_seegruen), "white", pal_peach), n = 11))
#' seecol(col_scale(c(rev(pal_petrol), "white", pal_bordeaux), n = 11))
#' 
#' @family color palettes
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

col_scale <- function(col = pal_unikn, n = length(col), ...){
  
  out_gradient <- colorRampPalette(colors = col, ...)(n)
  
  return(out_gradient)
  
}

## Check:

# # Gradients over 1 color palette:
# col_scale(n = 5)  # 5 colors of default scale pal_unikn
# col_scale(pal_petrol, n = 12)  # 12 colors of pal_petrol
# 
# # Gradients over 2 colors:
# col_scale(c(Seeblau, Peach), n = 10)
# col_scale(c(Seegruen, Petrol), n = 10)
# 
# # Gradients over 2 color palettes:
# col_scale(c(pal_seeblau, pal_peach), n = 10)
# col_scale(c(pal_seeblau, pal_karpfenblau), n = 10)
# 
# # Gradients over 3+ colors:
# seecol(col_scale(c("black", Seeblau, Seegruen, "white"), n = 10))
# 
## Gradients over 3+ color palettes:
# seecol(col_scale(c(rev(pal_seeblau), pal_grau, pal_pinky), n = 12))

## ToDo: ------

# - etc.

## eof. ----------