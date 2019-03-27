## deprecated_color_functions.R  |  unikn
## ng | uni.kn |  2019 03 27
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