## start_unikn.R | unikn
## spds | uni.kn |  2019 08 07
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

}

## Initialize package: ------

.onAttach <- function(libname, pkgname) {

  ## Welcome message: ------

  pkg_version <- utils::packageVersion("unikn", lib.loc = NULL)
  # welcome_message <- paste0("Welcome to unikn!")
  welcome_message <- paste0("Welcome to unikn (v", pkg_version, ")!")

  packageStartupMessage(welcome_message)

  ## User guidance: ------

  ## Roll unikn dice: ------
  dice <- sample(1:3, 1)

  if (dice == -77) {
    pkg_version <- utils::packageVersion("unikn", lib.loc = NULL)
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
  packageStartupMessage("unikn.guide() opens user guides.")

}


## Done: ------
## - ...

## ToDo: ------
## - ...

## eof. ----------
