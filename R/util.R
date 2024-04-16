## util.R | unikn
## spds | uni.kn |  2024 04 16
## ---------------------------

# General utility functions (mostly for internal use and not exported).


# Generic utility functions: --------  


# - add_quotes: Add single quotes around string elements ------

add_quotes <- function(x) {
  
  toString(sQuote(x))
  
} # add_quotes().



# - monotonic: Check if a vector is monotonically increasing ------ 

monotonic <- function(v) {
  
  mono <- NA
  
  mono_increasing <- all(v == cummax(v))
  mono_decreasing <- all(v == cummin(v))
  
  mono <- (mono_increasing | mono_decreasing)
  
  return(mono)
  
} # monotonic().

## Check:
# monotonic(c(1, 2, 2, 3))
# monotonic(rev(c(1, 2, 2, 3)))
# monotonic(c(1, 2, 2, 1))



# - set_seed: Set seed or randomize ------ 

set_seed <- function(seed = NULL){
  
  if (is.null(seed) || is.na(seed)){
    seed <- sample(1:99999, size = 1)  # randomize
  }
  
  set.seed(seed)
  
  return(invisible(seed))
  
} # set_seed().



# - url_unikn: Format an URL the uni.kn way ------ 

#' \code{url_unikn} formats an URL the uni.kn way 
#' 
#' \code{url_unikn} removes various patterns (e.g., 
#' \code{"http", "https", "://", "www."}) from the 
#' front of a given URL and returns the remaining character string 
#' with an n-dash (Unicode \code{\\u2013}) prefix, 
#' rather than the former figure dash (\code{\\u2012}) prefix 
#' (as the latter created issues on Fedora Linux systems). 
#' 
#' @param url The url to be written (as copied from a web browser).
#' 
#' @examples 
#' url_unikn("https://www.uni-konstanz.de/")
#' 
#' @family text functions
#' 
#' @seealso 
#' \code{\link{xbox}} to create a new xbox (without text).  
#'      
#' @export 

url_unikn <- function(url = "https://www.uni-konstanz.de/"){
  
  # initialize:
  out <- url  
  
  # list all elements to remove (from front to middle):
  remove <- c("https", "http", "://", "www.")
  
  # loop through remove:
  for (i in 1:length(remove)) {
    
    pattern <- remove[i]
    
    # remove pattern (from front):
    out <- gsub(paste0("^", pattern), "", x = out)    
    
  }
  
  # Remove any final "/":
  out <- gsub("/$", "", x = out)
  
  # Unicode for dashes:
  # "\u2011": (non-breaking) hyphen
  # "\u2012": figure-dash
  # "\u2013": n-dash
  # "\u2014": m-dash  
  # "\u2212": minus 
  
  # Add dash to front:
  prefix <- "\u2013" # WAS: "\u2012"
  out <- paste0(prefix, " ", out)  # prefix + 1 space  
  
  return(out)
  
} # url_unikn().

## Check:
# url_unikn()
# url_unikn("https://www.spds.uni-konstanz.de/")
# url_unikn("https://www.uni-konstanz.de/www/https/http/_test_//")




# - kill_all: Clean/empty current environment ------

kill_all <- function(){
  
  rm(list = ls())  # kill all (WITHOUT warning)
  
} # kill_all().

## Check: 
# kill_all()



## ToDo: ------

# - etc.

## eof. ----------