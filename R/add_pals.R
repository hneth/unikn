## add_pals.R | unikn
## spds | uni.kn |  2022 11 24
## ---------------------------

# Add color palettes of various institutions 
# (and export contributed color palettes).

# Notes: 
# - Many users only want to use, rather than to manipulate color palettes. 
# - For convenience, uni_pals are provided as named vectors (not data frames).


# uni_data: Overview -----

# Institution names and URLs of add_pals:

# add_pals <- c("eth_pal", "eth_pal_light", "eth_pal_grey", 
#               "mpg_pal", 
#               "uni_freiburg_br", "uni_freiburg_blue", "uni_freiburg_grey", "uni_freiburg_info",
#               "uni_goettingen_1", "uni_goettingen_2", "uni_goettingen_3", 
#               "uni_konstanz", "uni_konstanz_pref",
#               "uni_princeton_0", "uni_princeton_1", "uni_princeton_2")

inst <- c(rep("ETH Zurich", 3),
          "Max Planck Society",
          rep("University of Freiburg", 4),
          rep("University of Goettingen", 3),          
          rep("University of Konstanz", 2),
          rep("Princeton University", 3)
)

inst_alt <- c(rep("Eidgen\u00F6ssische Technische Hochschule, Z\u00FCrich", 3),
              "Max-Planck-Gesellschaft",
              rep("Universit\u00E4t Freiburg", 4),
              rep("Universit\u00E4t G\u00F6ttingen", 3),
              rep("Universit\u00E4t Konstanz", 2), 
              rep("Princeton University", 3)
)

url <- c(rep("https://ethz.ch/", 3), 
         "https://www.mpg.de/en",
         rep("https://uni-freiburg.de/", 4), 
         rep("https://uni-goettingen.de/", 3), 
         rep("https://www.uni-konstanz.de/", 2), 
         rep("https://www.princeton.edu/", 3)
)

uni_data <- data.frame(inst = inst, inst_alt = inst_alt, url = url, pal = add_pals)


# Uni Goettingen / Göttingen: ------

# Motto: "In publica commoda" (For the good of all)

# Source: <https://www.uni-goettingen.de/de/589412.html> 
# 2022-11-20

# Die Farben der Universitaet Goettingen:
# 
# Die Universitaet Goettingen verfuegt ueber eine eigene Farbe, das Uni-Blau HKS 41. 
# Diese Farbe findet sich zum Beispiel auf der Webseite oder in der Vierfarb-Variante des Logos. 
# Der hellblaue Farbton,der sich ebenfalls im Logo findet, ist eine aufgerasterte Variante und geht auf das Uni-Blau zurueck.
#
# Bei der Gestaltung von Flyern, Plakaten oder Broschueren wird das Uniblau, also die Farbe HKS 41, 
# nicht durchgehend angewendet, aber auch hier bildet sie ein konsequent wiederkehrendes Erkennungsmerkmal.
#
# Neben der Primaerfarbe des dunklen Blaus stehen als Sekundaerfarben mehrere Blautoene 
# sowie Grau, Schwarz, Weiss und Chamois zur Verfuegung.

# - Primary colors: ----

col_goe_primary <- c("#153268", "#005f9b", "#0091c8", "#50a5d2")
nam_goe_primary <- c("Uniblau", "Logoblau", "Logomittelblau", "Logohellblau")

#' Primary colors of the University of Göttingen.
#'
#' \code{uni_goettingen_1} provides the primary blue colors 
#' of the \href{https://www.uni-goettingen.de/}{University of Göttingen}, Germany.  
#' 
#' The primary dark blue color is defined as Uni-Blau HKS 41. 
#' The palette \code{uni_goettingen_1} adds some derived colors, 
#' while the palette \code{\link{uni_goettingen_2}} provides secondary colors. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-goettingen.de/de/589412.html}. 
#' 
#' @examples
#' uni_goettingen_1
#' seecol(uni_goettingen_1)  # view color palette
#' demopal(uni_goettingen_1, type = 1, main = "Primary colors of the University of Göttingen")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_goettingen_2}} and \code{\link{uni_goettingen_3}} for alternative colors of the University of Goettingen;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_goettingen_1 <- newpal(col = col_goe_primary, 
                           names = nam_goe_primary,
                           as_df = FALSE)

# seecol(uni_goettingen_1)

# - Secondary colors: ----

# Error in definition: 
# Chamois and Altweiss have identical, but non-corresponding RGB and HEX values.
# Error: RGB defines "Chamois", HEX defines "Altweiss"
# 
# goe_chamois <- rgb(red = 234, green = 226, blue = 216, maxColorValue = 255)
# seecol(goe_chamois)     # HEX: "#EAE2D8"
# rgb2hex(234, 226, 216)  # HEX: "#EAE2D8"

col_goe_secondary <- c("#000000", "#FFFFFF", "#EAE2D8", "#f2f0e8", 
                       "#3b3b3a", "#575656", "#878786", "#d9dada")
nam_goe_secondary <- c("Schwarz", "Weiss", "Chamois", "Altweiss",
                       "Grau 90", "Grau 80", "Grau 60", "Grau 20")

#' Secondary colors of the University of Göttingen.
#'
#' \code{uni_goettingen_2} provides the secondary colors 
#' of the \href{https://www.uni-goettingen.de/}{University of Göttingen}, Germany.  
#' 
#' These colors are to be combined with the blue primary colors 
#' provided by palette \code{\link{uni_goettingen_1}}. 
#' 
#' \code{uni_goettingen_2} corrects an error in the color definitions 
#' of \url{https://www.uni-goettingen.de/de/589412.html}, 
#' where "Chamois" and "Altweiss" had identical, 
#' but non-corresponding RGB and HEX values.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-goettingen.de/de/589412.html}. 
#' 
#' @examples
#' uni_goettingen_2
#' seecol(uni_goettingen_2)  # view color palette
#' demopal(uni_goettingen_2, type = 3, main = "Secondary colors of the University of Göttingen")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_goettingen_1}} and \code{\link{uni_goettingen_3}} for alternative colors of the University of Goettingen;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_goettingen_2 <- newpal(col = col_goe_secondary, 
                           names = nam_goe_secondary,
                           as_df = FALSE)

# seecol(uni_goettingen_2)

# - Departments / faculties: ----

# Souce: <https://www.uni-goettingen.de/de/589412.html>
# 2022-11-19

# Fakultaetsfarben:
# 
# Die fuer die Universitaet genutzte Farbpalette wird durch die Farben der dreizehn Fakultaeten der Universitaet, 
# denen jeweils eine eigene Farbe zugeordnet ist, erweitert. 
# Diese Fakultaetsfarben finden auf der Webseite der Fakultaeten durchgehend Anwendung und koennen darueber hinaus 
# von den Fakultaeten auch bei der Gestaltung von Flyern, Plakaten oder Broschueren 
# als Ergaenzung zur Farbwelt der Universitaet genutzt werden.

# Error in definition:
# Theologische Fakultaet: RGB values (68 37 61) do not correspond to HEX code ("#4a203b")
# 
# col_theo <- rgb(red = 68, green = 37, blue = 61, maxColorValue = 255)
# seecol(col_theo)     # HEX: "#44253D"
# rgb2hex(68, 37, 61)  # HEX: "#44253D"
# Correction: Using HEX code corresponding to RGB values.

col_goe_fac <- c("#25795d", "#fd8f4a", "#eeb32a", "#256951", "#ac5b53", "#e07f41", "#fda642", 
                 "#c70d2d", "#b52141", "#2b7ab3", "#45195c", "#44253D", "#153268")

nam_goe_fac <- c("Agrarwissenschaften", "Biologie und Psychologie", "Chemie", "Forstwissenschaften und Walkoekologie", "Geowissenschaften und Geographie", "Mathematik und Informatik", "Physik", 
                 "Jura", "Sozialwissenschaften", "Wirtschaftswissenschaften", "Philosophie", "Theologie", "Medizin")

#' Departmental colors of the University of Göttingen.
#'
#' \code{uni_goettingen_3} provides the 13 departmental colors 
#' (German "Fakultäten") of the \href{https://www.uni-goettingen.de/}{University of Göttingen}, Germany.  
#' 
#' These colors are used in online and print materials of these departments.
#' 
#' \code{uni_goettingen_3} corrects an error in the color definitions 
#' of \url{https://www.uni-goettingen.de/de/589412.html}, 
#' where the color definition for "Theologie" used non-corresponding RGB and HEX values. 
#' We adopted the RGB value \code{68 37 61} and its corresponding HEX value \code{"#44253D"}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-20.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-goettingen.de/de/589412.html}. 
#' 
#' @examples
#' uni_goettingen_3
#' seecol(uni_goettingen_3)  # view color palette
#' demopal(uni_goettingen_3, type = 3, main = "Departmental colors of the University of Göttingen")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_goettingen_1}} and \code{\link{uni_goettingen_2}} for alternative colors of the University of Goettingen;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_goettingen_3 <- newpal(col = col_goe_fac, 
                           names = nam_goe_fac,
                           as_df = FALSE)

# seecol(uni_goettingen_3)


# ETH Zurich / Eidgenössische Technische Hochschule, Zürich, CH: ------

# Source: https://ethz.ch/staffnet/en/service/communication/corporate-design/digital-media/web-colours.html
# Last check: 2022-10-25

# Colour definition:
# Seven corporate design colours form the basis of our colour schemes, interactive elements and design elements. 
# White text should always be used on coloured backgrounds to ensure readability/accessibility.

# - eth_pal: ---- 

# ETH Blue: 
#   RGB 33, 92, 175 
#   "#215CAF"
# 
# ETH Petrol:
#   RGB 0, 120, 148
#   "#007894"
# 
# ETH Green:
#   RGB 98, 115, 19
#   "#627313"
# 
# ETH Bronze:
#   RGB 142, 103, 19
#   "#8E6713"
# 
# ETH Red:
#   RGB 183, 53, 45
#   "#B7352D"
# 
# ETH Purple:
#   RGB 167, 17, 122
#   "#A7117A"
# 
# ETH Grey:
#   RGB 111, 111, 111
#   "#6F6F6F"

col_ETH <- c("#215CAF", "#007894", "#627313", "#8E6713", "#B7352D", "#A7117A", "#6F6F6F")
nam_ETH <- c("ETH Blue", "ETH Petrol", "ETH Green", "ETH Bronze", "ETH Red", "ETH Purple", "ETH Grey")


#' Default colors of the ETH Zurich.
#'
#' \code{eth_pal} provides the default color palette 
#' of the \href{https://ethz.ch/}{ETH Zürich}, Switzerland. 
#' 
#' The Swiss abbreviation "ETH" stands for "Eidgenössische Technische Hochschule".
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://ethz.ch/staffnet/en/service/communication/corporate-design/digital-media/web-colours.html}. 
#' 
#' @examples
#' eth_pal
#' seecol(eth_pal)  # view color palette
#' demopal(eth_pal, type = 3, main = "Default colors of the ETH Zürich")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{eth_pal_light}} and \code{\link{eth_pal_grey}} for alternative colors of the ETH Zurich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

eth_pal <- newpal(col = col_ETH, 
                  names = nam_ETH,
                  as_df = FALSE)


# - eth_pal_light: ---- 

# Lighter shades:
# Light colours are also available and can be used to make certain elements (like text boxes) stand out. 
# Black text must be used on light-coloured backgrounds for accessibility reasons.

# ETH Blau 10%:
#   RGB 233, 239, 247
#   "#E9EFF7"
#   
# ETH Petrol 10%:
#   RGB 321, 244, 247   # Note error in specification: R value should be 231.
#   "#E7F4F7"
# 
# ETH Green 10%:
#   RGB 239, 241, 231
#   "#EFF1E7"
# 
# ETH Bronze 10%:
#   RGB 244, 240, 231
#   "#F4F0E7"
# 
# ETH Red 10%:
#   RGB 248, 235, 234
#   "#F8EBEA"
# 
# ETH Purple 10%:
#   RGB 248, 232, 243
#   "#F8E8F3"	
# 
# ETH Grey 10%:
#   RGB 241, 241, 241
#   "#F1F1F1"

col_ETH_light <- c("#E9EFF7", "#E7F4F7", "#EFF1E7", "#F4F0E7", "#F8EBEA", "#F8E8F3", "#F1F1F1")
nam_ETH_light <- c("ETH Blue 10%", "ETH Petrol 10%", "ETH Green 10%", "ETH Bronze 10%", "ETH Red 10%", "ETH Purple 10%", "ETH Grey 10%")


#' Lighter shades of the ETH Zurich colors.
#'
#' \code{eth_pal_light} provides the lighter shades of the color palette 
#' of the \href{https://ethz.ch/}{ETH Zürich}, Switzerland. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://ethz.ch/staffnet/en/service/communication/corporate-design/digital-media/web-colours.html}. 
#' 
#' @examples
#' eth_pal_light
#' seecol(eth_pal_light)  # view color palette
#' demopal(eth_pal_light, type = 4, main = "Light shades of the ETH Zürich colors")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{eth_pal}} and \code{\link{eth_pal_grey}} for alternative colors of the ETH Zurich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

eth_pal_light <- newpal(col = col_ETH_light, 
                        names = nam_ETH_light,
                        as_df = FALSE)


# - eth_pal_grey: ---- 

# Using black and shades of grey:
# Shades of grey can be used to visually structure content and delineate different elements. 

# The following shades of gray are used on the ETH website:

# - Black: ETH logo, text colour
#   RGB 0, 0, 0,
#   "#00000"

eth_black <- usecol("#000000")

# - Black light: black backgrounds such as meta-navigation and buttons
#   RGB 34, 34, 34
#   "#222222"

eth_black_light <- usecol("#222222")

# - Black, 60% opacity: standard interactive colour
#   RGBA 0, 0, 0, 0.6
#   "#00000" x 60%

eth_black_60 <- usecol("#000000", alpha = .60)

# - Black, 48% opacity, contrast 3:1: icon colour
#   RGBA 34, 34, 34, 0.48
#   "#222222" x 48%

eth_black_48 <- usecol("#222222", alpha = .48)

# - Black, 20% opacity, contrast 1.5:1: line colour
#   RGBA 34, 34, 34, 0.20
#   "#222222" x 20%

eth_black_20 <- usecol("#222222", alpha = .20)

# + ETH Grey 10%:
#   RGB 241, 241, 241
#   "#F1F1F1"

eth_grey_10 <- usecol("#F1F1F1")

# - ETH Grey 5%: standard background colour for flyout menus, related content (navigation), highlight container, table borders, keyword lists, etc.
#   RGB 246, 246, 246
#   "#F6F6F6"

eth_grey_05 <- usecol("#F6F6F6")

# - White: backgrounds, text colour on dark backgrounds
# - Black, 80% opacity: hover colour for links

col_eth_grey <- c(eth_black, eth_black_light, 
                  eth_black_60, eth_black_48, eth_black_20, 
                  eth_grey_10, eth_grey_05)

nam_eth_grey <- c("ETH Black", "ETH Black Light", 
                  "ETH Black 60%", "ETH Black 48%", "ETH Black 20%",
                  "ETH Grey 10%", "ETH Grey 5%")


#' Black and grey colors of the ETH Zurich.
#'
#' \code{eth_pal_grey} provides the shades of black and grey 
#' used by the \href{https://ethz.ch/}{ETH Zürich}, Switzerland. 
#' 
#' These shades of gray can be used to visually structure content 
#' and delineate different elements. 
#' 
#' Note that \code{eth_pal_grey} mixes colors of 
#' varying opacity / transparency levels.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://ethz.ch/staffnet/en/service/communication/corporate-design/digital-media/web-colours.html}. 
#' 
#' @examples
#' eth_pal_grey
#' seecol(eth_pal_grey)  # view color palette
#' demopal(eth_pal_grey, type = 2, main = "Black and grey colors of the ETH Zürich")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{eth_pal}} and \code{\link{eth_pal_light}} for alternative colors of the ETH Zurich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

eth_pal_grey <- newpal(col = col_eth_grey, 
                       names = nam_eth_grey,
                       as_df = FALSE)



# Max Planck Society / Max-Planck-Gesellschaft (MPG): ------

# Source: https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html
# Last check: 2022-10-20

# - mpg_pal: ---- 

#' Default colors of the Max-Planck-Gesellschaft.
#'
#' \code{mpg_pal} provides the default color palette 
#' of the \href{https://www.mpg.de/en}{Max-Planck-Gesellschaft}, Germany. 
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

# Source: https://uni-freiburg.de/universitaet/corporate-design/
# To be updated in 2023-01

frbg_blau <- "#344a9a"
names(frbg_blau) <- "Blau"

frbg_blue <- newpal(col =  ac(col = frbg_blau, alpha = c(1, .80, .60, .40, .20)),
                    names = c("Blau", "Blau_80", "Blau_60", "Blau_40", "Blau_20"),
                    as_df = FALSE)

frbg_gruen <- "#00997d"
names(frbg_gruen) <- "Gruen"

frbg_green <- newpal(col =  ac(col = frbg_gruen, alpha = c(1, .80, .60, .40, .20)),
                     names = c("Gruen", "Gruen_80", "Gruen_60", "Gruen_40", "Gruen_20"),
                     as_df = FALSE)

frbg_braun <- "#8f6b30"
names(frbg_braun) <- "Braun"

frbg_brown <- newpal(col =  ac(col = frbg_braun, alpha = c(1, .80, .60, .40, .20)),
                     names = c("Braun", "Braun_80", "Braun_60", "Braun_40", "Braun_20"),
                     as_df = FALSE)

frbg_gelb <- "#ffe863"
names(frbg_gelb) <- "Gelb"

frbg_yellow <- newpal(col =  ac(col = frbg_gelb, alpha = c(1, .80, .60, .40, .20)),
                      names = c("Gelb", "Gelb_80", "Gelb_60", "Gelb_40", "Gelb_20"),
                      as_df = FALSE)

frbg_rosa <- "#f5c2ed"
names(frbg_rosa) <- "Rosa"

frbg_pink <- newpal(col =  ac(col = frbg_rosa, alpha = c(1, .80, .60, .40, .20)),
                    names = c("Rosa", "Rosa_80", "Rosa_60", "Rosa_40", "Rosa_20"),
                    as_df = FALSE)

uni_freiburg_1 <- newpal(col = c("#000000", frbg_blue, "#FFFFFF"),
                         names = c("Schwarz", "Blau", "Blau_80", "Blau_60", "Blau_40", "Blau_20", "Weiss"))



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
#' Color definitions are based on web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben} on 2022-10-20). 
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
#' Color definitions are based on web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben} on 2022-10-20). 
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
#' Color definitions are based on web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben} on 2022-10-20). 
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
#' Color definitions are based on web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben} on 2022-10-20). 
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
#' doi \doi{10.5281/zenodo.7096191}. 
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
#' doi \doi{10.5281/zenodo.7096191}. 
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


# Uni Regensburg: ------

# Source: <https://www.uni-regensburg.de/verwaltung/corporate-design/index.html>
# Last update: 2022-11-24

# +++ here now +++ 

# Farbwerte für "Glutrot", die Farbe der Fakultät für Informatik und Data Science: 
# RGB 218.60.67
# Web-Farben #DA3C43
# CMYK coated/uncoated 0.96.99.0
# HKS-Wert 13

rb_glutrot <- rgb(218, 60, 67, names = "glutrot", maxColorValue = 255)
# seecol(rb_glutrot)


## ToDo: -------- 

# - Caltech: <https://identity.caltech.edu/colors>
# - Uni Heidelberg: <https://www.uni-heidelberg.de/de/universitaet/das-profil-der-universitaet-heidelberg/corporate-design>
# - Uni Tuebingen:
# - Uni Regensburg: <https://www.uni-regensburg.de/verwaltung/corporate-design/index.html>

## eof. ----------