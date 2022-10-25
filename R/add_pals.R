## add_pals.R | unikn
## spds | uni.kn |  2022 10 25
## ---------------------------

# Export color palettes of various institutions 
# (and contributed color palettes).

# Notes: 
# - Many users only want to use, rather than to manipulate color palettes. 
# - For convencience, uni_pals are provided as named vectors (not data frames).


# Max Planck Society / Max-Planck-Gesellschaft (MPG): ------

# Source: https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html
# Last check: 2022-10-20

# - mpg_pal: ---- 

#' Default colors of the Max-Planck-Gesellschaft.
#'
#' \code{mpg_pal} provides the default color palette 
#' of the \href{https://www.mpg.de/}{Max-Planck-Gesellschaft}, Germany. 
#' 
#' The color \code{"white"} was added to enable symmetrical color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html}. 
#' 
#' @examples
#' mpg_pal
#' seecol(mpg_pal)  # view color palette
#' demopal(mpg_pal, type = 1, main = "Using MPG colors")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_konstanz_pref}} for preferred colors of the University of Konstanz;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

mpg_pal <- newpal(col = c("#007367", "white", "#D0D3D4"), 
                  names = c("mpg green", "white", "mpg grey"),
                  as_df = FALSE)


# Uni Freiburg: ------

# Source: http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben
# Last check: 2022-10-20

# - uni_freiburg_br: ----

#' Default colors of the University of Freiburg.
#'
#' \code{uni_freiburg_br} provides the two default colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' The \code{_br} represents "blue/red" or "Breisgau". 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben}. 
#' 
#' @examples
#' uni_freiburg_br
#' seecol(uni_freiburg_br)  # view color palette
#' demopal(uni_freiburg_br, type = 2, main = "Colors of the University of Freiburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_info}} for the info colors of the University of Freiburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_br <- newpal(col = c("#004a99", "#c1002a"),
                          names = c("uni-blau", "uni-rot"),
                          as_df = FALSE)


# - uni_freiburg_blue: ---- 

#' Blue colors of the University of Freiburg.
#'
#' \code{uni_freiburg_blue} provides the blue colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben}. 
#' 
#' @examples
#' uni_freiburg_blue
#' seecol(uni_freiburg_blue)  # view color palette
#' demopal(uni_freiburg_blue, type = 3, main = "Blue colors of the University of Freiburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_br}} for the default colors of the University of Freiburg;  
#' \code{\link{uni_freiburg_info}} for the info colors of the University of Freiburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_blue <- newpal(col = c("#004a99", "#2a6ebb", "#6f9ad3"),
                            names = c("blue-1", "blue-2", "blue-3"), 
                            as_df = FALSE)


# - uni_freiburg_grey: ---- 

#' Grey colors of the University of Freiburg.
#'
#' \code{uni_freiburg_grey} provides the grey colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben}. 
#' 
#' @examples
#' uni_freiburg_grey
#' seecol(uni_freiburg_grey)  # view color palette
#' demopal(uni_freiburg_grey, type = 1, main = "Grey colors of the University of Freiburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_br}} for the default colors of the University of Freiburg;  
#' \code{\link{uni_freiburg_info}} for the info colors of the University of Freiburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_grey <- newpal(col = c("#f2f3f1", "#e0e1dd", "#d5d6d2", "#c9cac8", 
                                    "#b2b4b3", "#9a9b9c", "#747678", "#363534"), 
                            names = c("grey-0", "grey-1", "grey-2", "grey-3", 
                                      "grey-5", "grey-7", "grey-9", "grey-font"),
                            as_df = FALSE)


# - uni_freiburg_info: ---- 

#' Info colors of the University of Freiburg.
#'
#' \code{uni_freiburg_info} provides the info colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben}. 
#' 
#' @examples
#' uni_freiburg_info
#' seecol(uni_freiburg_info)  # view color palette
#' demopal(uni_freiburg_info, type = 3, main = "Info colors of the University of Freiburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_br}} for the default colors of the University of Freiburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_info <- newpal(col = c("#2a6ebb", "#a7c1e3", "#7b2927", "#de3831", "#739600", "#92d400", 
                                    "#4d4f53", "#747678", "#b2b4b3", "#d5d6d2", "#e98300", "#efbd47"),
                            names = c("mid-blau", "hell-blau", "dark-red", "hell-red", "mid-green", "hell-green", 
                                      "anthrazit", "dark-grey", "mid-grey", "hell-grey", "orange", "gelb"),
                            as_df = FALSE)


# Uni Konstanz: ------

# Sources: 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 
# Last check: 2022-10-20


# - uni_konstanz: ---- 

#' Default colors of the University of Konstanz.
#'
#' \code{uni_konstanz} provides the default color palette 
#' of the \href{https://www.uni-konstanz.de/}{University of Konstanz}, Germany. 
#' 
#' The \strong{unikn} package provides many additional color palettes for 
#' the \href{https://www.uni-konstanz.de/}{University of Konstanz}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' R package \strong{unikn}, 
#' retrieved from \url{https://CRAN.R-project.org/package=unikn},    
#' doi \href{https://doi.org/10.5281/zenodo.7096191}{10.5281/zenodo.7096191}. 
#' 
#' Color definitions are based on 
#' \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/}  
#' \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/}
#'
#' @examples
#' uni_konstanz
#' seecol(uni_konstanz)  # view color palette
#' demopal(uni_konstanz, type = 4, main = "Using Uni Konstanz colors", seed = 1)
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_konstanz_pref}} for the preferred colors of the University of Konstanz;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_konstanz <- newpal(col = pal_unikn,
                       names = names(pal_unikn),
                       as_df = FALSE)


# - uni_konstanz_pref: ---- 

#' Preferred colors of the University of Konstanz.
#'
#' \code{uni_konstanz_pref} provides the color palette of preferred colors  
#' of the \href{https://www.uni-konstanz.de/}{University of Konstanz}, Germany.
#' 
#' The \strong{unikn} package provides many additional color palettes for 
#' the \href{https://www.uni-konstanz.de/}{University of Konstanz}. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character). 
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' R package \strong{unikn}, 
#' retrieved from \url{https://CRAN.R-project.org/package=unikn},    
#' doi \href{https://doi.org/10.5281/zenodo.7096191}{10.5281/zenodo.7096191}. 
#' 
#' Color definitions are based on 
#' \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/}  
#' \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/}
#'
#' @examples
#' uni_konstanz_pref
#' seecol(uni_konstanz_pref)  # view color palette
#' demopal(uni_konstanz_pref, type = 3, main = "Preferred colors of the Uni Konstanz")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_konstanz}} for the default colors of the University of Konstanz;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_konstanz_pref <- newpal(col = pal_unikn_pref,
                            names = names(pal_unikn_pref),
                            as_df = FALSE)


# Uni Princeton: ------

# Source: https://communications.princeton.edu/guides-tools/logo-graphic-identity
# Last check: 2022-10-20

# 3 shades of orange: 
orange_basic <- "#E87722"  # Pantone 158 C
orange_white <- "#E77500"  # orange on white background
orange_black <- "#F58025"  # orange on black background

# - uni_princeton_0: ----

#' Basic colors of Princeton University.
#'
#' \code{uni_princeton_0} provides the two basic colors 
#' of \href{https://www.princeton.edu/}{Princeton University}, NJ, USA. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://communications.princeton.edu/guides-tools/logo-graphic-identity}. 
#' 
#' @examples
#' uni_princeton_0
#' seecol(uni_princeton_0)  # view color palette
#' demopal(uni_princeton_0, type = 1, main = "Colors of Princeton University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_princeton_1}} for Princeton University colors (on white backgrounds); 
#' \code{\link{uni_princeton_2}} for Princeton University colors (on black backgrounds); 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_princeton_0 <- newpal(col = c(orange_basic, "black"),
                          names = c("orange", "black"),
                          as_df = FALSE)


# - uni_princeton_1: ----

#' Colors of Princeton University (on white backgrounds).
#'
#' \code{uni_princeton_1} provides the two basic colors 
#' of \href{https://www.princeton.edu/}{Princeton University}, NJ, USA, 
#' for use on white backgrounds. 
#' 
#' The color \code{"white"} was added to enable symmetrical color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://communications.princeton.edu/guides-tools/logo-graphic-identity}. 
#' 
#' @examples
#' uni_princeton_1
#' seecol(uni_princeton_1)  # view color palette
#' demopal(uni_princeton_1, type = 4, main = "Colors of Princeton University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_princeton_0}} for basic Princeton University colors; 
#' \code{\link{uni_princeton_2}} for Princeton University colors (on black backgrounds); 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_princeton_1 <- newpal(col = c(orange_white, "white", "black"),
                          names = c("orange_w", "white", "black"),
                          as_df = FALSE)


# - uni_princeton_2: ----

#' Colors of Princeton University (on black backgrounds).
#'
#' \code{uni_princeton_2} provides the two basic colors 
#' of \href{https://www.princeton.edu/}{Princeton University}, NJ, USA, 
#' for use on black backgrounds. 
#' 
#' The color \code{"black"} was added to enable symmetrical color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://communications.princeton.edu/guides-tools/logo-graphic-identity}. 
#' 
#' @examples
#' uni_princeton_2
#' opar <- par(no.readonly = TRUE)
#' par(bg = "black", col.main = "white", col = "grey")
#' seecol(uni_princeton_2, col_brd = "grey", lwd = 2)  # view color palette
#' demopal(uni_princeton_2, type = 3, main = "Colors of Princeton University")
#' par(opar)
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_princeton_0}} for basic Princeton University colors; 
#' \code{\link{uni_princeton_1}} for Princeton University colors (on white backgrounds); 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_princeton_2 <- newpal(col = c(orange_black, "black", "white"), 
                          names = c("orange_b", "black", "white"),
                          as_df = FALSE)


## eof. ----------