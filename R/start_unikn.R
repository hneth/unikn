## start_unikn.R | unikn
## spds | uni.kn |  2022 12 31
## ---------------------------

## Starting unikn: ------


# - unikn.guide: Open package guide ----

#' Open the unikn package guides 
#'
#' @importFrom utils vignette
#' @importFrom utils browseVignettes
#'
#' @export

unikn.guide <- function() {
  
  # utils::vignette(topic = "User Guide", package = "unikn")
  utils::browseVignettes(package = "unikn")
  
} # unikn.guide().


# - .onAttach: Initialize package ----

.onAttach <- function(libname, pkgname) {
  
  # Welcome message: ------
  
  pkg_version <- utils::packageVersion("unikn", lib.loc = NULL)
  
  # welcome_message <- paste0("Welcome to unikn (v", pkg_version, ")!")
  # packageStartupMessage(in_grau(welcome_message))
  
  packageStartupMessage(in_grau("Welcome to ", in_seeblau("unikn"), " (v", pkg_version, ")!", sep = ""))
  
  
  # User guidance: ------
  
  pens <- sample(c("in_bordeaux", "in_karpfenblau", "in_petrol", "in_pinky"))  # sample() permutes order
  
  # 1. Probabilistic: ----
  
  dice <- sample(1:12, 1)
  
  switch(dice,
         
         # 01-08:
         packageStartupMessage(in_grau(sapply("seecol()", FUN = pens[1]), " shows colors or color palettes.", sep = "")),
         packageStartupMessage(in_grau(sapply("usecol()", FUN = pens[1]), " allows changing and using color palettes.", sep = "")),
         packageStartupMessage(in_grau(sapply("simcol()", FUN = pens[1]), " searches for similar colors.", sep = "")), 
         packageStartupMessage(in_grau(sapply("grepal()", FUN = pens[1]), " searches for color names.", sep = "")),
         packageStartupMessage(in_grau(sapply("demopal()", FUN = pens[1]), " demonstrates a color palette.", sep = "")),
         packageStartupMessage(in_grau(sapply("ac()", FUN = pens[1]), " adjusts color transparency.", sep = "")),
         packageStartupMessage(in_grau(sapply("shades_of()", FUN = pens[1]), " creates color gradients.", sep = "")),
         packageStartupMessage(in_grau(sapply("citation('unikn')", FUN = pens[1]), " provides citation information.", sep = "")),
         
         # 09:
         {
           packageStartupMessage(in_grau(
             "Roses are ", sapply("red", FUN = pens[1]), ", ", 
             "violets are ", sapply("blue", FUN = pens[2]), " ", 
             # "\u2014 what color are ", sapply("you", FUN = pens[3]), "?", sep = "")),
             "\u2014 what about ", sapply("you", FUN = pens[3]), "?", sep = ""))
         },
         
         # 10:
         {
           packageStartupMessage(  
             cli::col_black(# "unikn colors: ", 
               paste(in_bordeaux("bordeaux"), 
                     in_grau("grau"),
                     in_karpfenblau("karpfenblau"), 
                     in_peach("peach"), 
                     in_petrol("petrol"), 
                     in_pinky("pinky"), 
                     in_seeblau("seeblau"), 
                     in_seegruen("seegruen"), 
                     sep = " | ")
             )
           )
         },
         
         # 11: Stroop task:
         {
           packageStartupMessage(cli::col_black("Try naming the colors of these words:", sep = "")) 
           packageStartupMessage(
             paste(
               sapply("black", FUN = pens[1]), 
               sapply("red", FUN = pens[2]), 
               sapply("green", FUN = pens[3]), 
               sapply("blue", FUN = pens[4]), 
               in_peach("snow"), 
               in_seeblau("yellow"), sep = "  ")
           ) 
         },
         
         # 12:
         packageStartupMessage(in_grau(sapply("unikn.guide()", FUN = pens[1]), " opens user guides.", sep = "")),
         
         # 99 (unused):
         {
           packageStartupMessage(in_grau(sapply("seecol()", FUN = pens[1]), " shows ", 
                                         sapply("shades_of(5, 'grey0')", FUN = pens[2]), ".", sep = ""))
         }
  )
  
  
  # 2. Predictable: ----
  
  # packageStartupMessage(in_grau(in_pinky("unikn.guide()"), " opens user guides.", sep = ""))
  
  
} # .onAttach(). 



## Done: ------

# - Enabled colored startup messages (using crayon styles).


## ToDo: ------

# - Consider adding probabilistic startup messages (e.g., color-related slogans). 

## eof. ----------
