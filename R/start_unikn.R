## start_unikn.R | unikn
## spds | uni.kn |  2022 08 31
## ---------------------------

## Open package guide: -----------------------

#' Opens the unikn package guides
#'
#' @importFrom utils vignette
#' @importFrom utils browseVignettes
#'
#' @export

unikn.guide <- function() {
  
  # utils::vignette(topic = "User Guide", package = "unikn")
  utils::browseVignettes(package = "unikn")
  
} # unikn.guide().


## Initialize package: ------

.onAttach <- function(libname, pkgname) {
  
  ## Welcome message: ------
  
  pkg_version <- utils::packageVersion("unikn", lib.loc = NULL)
  
  # welcome_message <- paste0("Welcome to unikn (v", pkg_version, ")!")
  # packageStartupMessage(in_grau(welcome_message))
  
  packageStartupMessage(in_grau("Welcome to ", in_seeblau("unikn"), " (v", pkg_version, ")!", sep = ""))
  
  
  ## User guidance: ------
  
  ## Roll unikn dice: ------
  dice <- sample(1:6, 1)
  
  if (dice == -66){
    
    packageStartupMessage(crayon::black(in_bordeaux("bordeaux"), 
                                        in_grau("grau"),
                                        in_karpfenblau("karpfenblau"), 
                                        in_peach("peach"), 
                                        in_petrol("petrol"), 
                                        in_pinky("pinky"), 
                                        in_seeblau("seeblau"), 
                                        in_seegruen("seegruen"), 
                                        sep = " | ")
    )
  }
  
  if (dice == -77) {
    
    pkg_message <- paste0("Running unikn (v", pkg_version, ")...")
    
    packageStartupMessage(" ")
    packageStartupMessage(pkg_message)
    packageStartupMessage(" ")
  }
  
  if (dice == -88) {
    
    packageStartupMessage(" ")
    packageStartupMessage("citation('unikn') provides citation info.")
    packageStartupMessage(" ")
  }
  
  # all cases:
  packageStartupMessage(in_grau(in_pinky("unikn.guide()"), "opens user guides."))
  
  
} # .onAttach(). 


## Done: ------

## - etc.

## ToDo: ------

## - etc.

## eof. ----------
