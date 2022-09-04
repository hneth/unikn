## start_unikn.R | unikn
## spds | uni.kn |  2022 09 02
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
  
  # Welcome message: ------
  
  pkg_version <- utils::packageVersion("unikn", lib.loc = NULL)
  
  # welcome_message <- paste0("Welcome to unikn (v", pkg_version, ")!")
  # packageStartupMessage(in_grau(welcome_message))
  
  packageStartupMessage(in_grau("Welcome to ", in_seeblau("unikn"), " (v", pkg_version, ")!", sep = ""))
  
  
  # User guidance: ------
  
  # 1. Probabilistic: ----
  
  dice <- sample(1:10, 1)
  pens <- c("in_bordeaux", "in_karpfenblau", "in_pinky")
  pen1 <- sample(pens, size = 1)

  if (dice == 1){
    
    packageStartupMessage(in_grau(sapply("seecol()", FUN = pen1), " shows colors or color palettes.", sep = ""))
    
  } else if (dice == 2){
    
    packageStartupMessage(in_grau(sapply("usecol()", FUN = pen1), " allows changing and using colors.", sep = ""))
    
  } else if (dice == 3) {
    
    packageStartupMessage(in_grau(sapply("simcol()", FUN = pen1), " searches for similar colors.", sep = ""))
    
  } else if (dice == 4) {
    
    packageStartupMessage(in_grau(sapply("grepal()", FUN = pen1), " searches for color names.", sep = ""))
    
  } else if (dice == 5) {
    
    packageStartupMessage(in_grau(sapply("shades_of()", FUN = pen1), " yields color gradients.", sep = ""))
    
  } else if (dice == 6) {
    
    packageStartupMessage(in_grau(sapply("citation('unikn')", FUN = pen1), " provides citation information.", sep = ""))
    
  } else if (dice == 7) {
    
    pen2 <- sample(pens[pens != pen1], size = 1)
    
    packageStartupMessage(in_grau(sapply("seecol()", FUN = pen1), " shows ", 
                                  sapply("shades_of(5, 'grey0')", FUN = pen2), ".", sep = ""))
    
  } else if (dice == 8) {    
    
    packageStartupMessage(crayon::black(# "Colors:", 
                                        in_bordeaux("bordeaux"), 
                                        in_grau("grau"),
                                        in_karpfenblau("karpfenblau"), 
                                        in_peach("peach"), 
                                        in_petrol("petrol"), 
                                        in_pinky("pinky"), 
                                        in_seeblau("seeblau"), 
                                        in_seegruen("seegruen"), 
                                        sep = " | "))  
    
  } else if (dice == 9) {
    
  # Stroop task:
  packageStartupMessage(crayon::black("Try naming the colors of these words:"), sep = "")
  packageStartupMessage(in_pinky("black", in_karpfenblau("red"), in_bordeaux("green"), in_seegruen("blue"), in_peach("snow"), in_seeblau("yellow"), sep = "  "))
                        
  } else { # 10: rest:
    
  packageStartupMessage(in_grau(sapply("unikn.guide()", FUN = pen1), " opens user guides.", sep = ""))
    
  }
  
  
  # 2. Predictable: ----
  
  # packageStartupMessage(in_grau(in_pinky("unikn.guide()"), " opens user guides.", sep = ""))
  
  
} # .onAttach(). 



## Done: ------

# - Enabled colored startup messages (using crayon styles).


## ToDo: ------

# - Consider adding probabilistic startup messages (e.g., color-related slogans). 

## eof. ----------
