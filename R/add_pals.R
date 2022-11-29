## add_pals.R | unikn
## spds | uni.kn |  2022 11 29
## ---------------------------

# Add color palettes of various institutions 
# (and export contributed color palettes).

# Note:
# - Many users only want to use, rather than create or manipulate color palettes. 
# - For convenience, uni_pals are provided as named vectors (not data frames).


# uni_data: Overview -----

# Institution names and URLs of add_pals:

# add_pals <- c("caltech_pal_1", "caltech_pal_2", "caltech_pal_3", 
#               "eth_pal", "eth_pal_light", "eth_pal_grey",
#               "mpg_pal",
#               "uni_freiburg_br", "uni_freiburg_blue", "uni_freiburg_grey", "uni_freiburg_info",
#               "uni_goettingen_1", "uni_goettingen_2", "uni_goettingen_3",
#               "uni_konstanz", "uni_konstanz_pref",
#               "uni_princeton_0", "uni_princeton_1", "uni_princeton_2",
#               "uni_regensburg_1", "uni_regensburg_2", "uni_regensburg_3"
# )

inst <- c(rep("Caltech", 3), 
          rep("ETH Zurich", 3),
          "Max Planck Society",
          rep("University of Freiburg", 4),
          rep("University of Goettingen", 3),          
          rep("University of Konstanz", 2),
          rep("Princeton University", 3),
          rep("University of Regensburg", 3)
)


inst_alt <- c(rep("California Institute of Technology", 3), 
              rep("Eidgen\u00F6ssische Technische Hochschule, Z\u00FCrich", 3),
              "Max-Planck-Gesellschaft",
              rep("Universit\u00E4t Freiburg", 4),
              rep("Universit\u00E4t G\u00F6ttingen", 3),
              rep("Universit\u00E4t Konstanz", 2), 
              rep("Princeton University", 3), 
              rep("Universit\u00E4t Regensburg", 3)
)

url <- c(rep("https://www.caltech.edu/", 3), 
         rep("https://ethz.ch/", 3), 
         "https://www.mpg.de/en",
         rep("https://uni-freiburg.de/", 4), 
         rep("https://uni-goettingen.de/", 3), 
         rep("https://www.uni-konstanz.de/", 2), 
         rep("https://www.princeton.edu/", 3),
         rep("https://www.uni-regensburg.de/", 3)
)

uni_data <- data.frame(inst = inst, inst_alt = inst_alt, url = url, pal = add_pals)



# Caltech: ------ 

# Source: <https://identity.caltech.edu/colors>
# 2022-11-28

# Caltech's official color system is made up of four palettes: 
# a primary color, a neutral palette, a deep palette, and a bright palette.


# Primary Color
#
# Caltech's primary color is Pantone MS 1585c Orange for coated and matte print jobs. 
# Use PMS 151 for uncoated print jobs. It is recommended that you reserve this color 
# for smaller highlights rather than large swatches.

# PMS 1585c
# c:0 m:68 y:98 k:0
# r:255 g:108 b:12
# HEX #FF6C0C

col_caltech_p <- "#FF6C0C"


# Neutral Colors
#
# Caltech's neutral color palette complements the Caltech orange and 
# should be used for projects with a more traditional, serious tone.

# PMS Cool Gray 9
# c:0 m:0 y:0 k:65
# r:118 g:119 b:123
# HEX #76777B

col_caltech_n1 <- "#76777B"

# PMS Cool Grey 3c
# c:0 m:0 y:0 k:24
# r:202 g:200 b:200
# HEX #C8C8C8

col_caltech_n2 <- "#C8C8C8"  # Note: RGB values differ!

# PMS 414
# c:35 m:28 y:35 k:0
# r:170 g:169 b:159
# HEX #AAA99F

col_caltech_n3 <- "#AAA99F"

# PMS 5497c
# c:51 m:32 y:39 k:2
# r:133 g:152 b:148
# HEX #849895

col_caltech_n4 <- "#849895"  # Note: RGB values differ!
# col_caltech_n4 <- rgb(133, 152, 148, maxColorValue = 255)  # Note: HEX values differ!

# PMS 7494c
# c:41 m:21 y:53 k:0
# r:157 g:174 b:136
# HEX #9DAE88

col_caltech_n5 <- "#9DAE88"

# PMS 451c
# c:38 m:35 y:73 k:6
# r:159 g:146 b:94
# HEX #C7B784

col_caltech_n6 <- "#C7B784"  # Note: RGB values differ WIDELY!
# col_caltech_n6 <- rgb(159, 146, 94, maxColorValue = 255)  # Note: HEX values differ WIDELY!

# PMS 7403c
# c:5 m:15 y:57 k:0
# r:242 g:211 b:131
# HEX #F1D384

col_caltech_n7 <- "#F1D384"  # Note: RGB values differ!
# col_caltech_n7 <- rgb(242, 211, 131, maxColorValue = 255)  # Note: HEX values differ!

# - caltech_pal_1: Primary and neutral colors: ----

#' Primary and neutral colors of Caltech
#'
#' \code{caltech_pal_1} provides the primary and 7 neutral colors 
#' of the \href{https://www.caltech.edu/}{California Institute of Technology}, CA, USA. 
#' 
#' Caltech's primary orange color is defined as Pantone MS 1585c 
#' (for coated and matte print jobs, PMS 151 for uncoated print jobs). 
#' Use this color for small highlights, rather than large areas. 
#' 
#' Caltech's 7 neutral colors complement the primary Caltech orange 
#' and allow to convey a serious, sober, and traditional impression.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-28.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://identity.caltech.edu/colors}. 
#' 
#' @examples
#' caltech_pal_1
#' seecol(caltech_pal_1)  # view color palette
#' demopal(caltech_pal_1, type = 4, seed = 1,  
#'         main = "Primary and neutral colors of Caltech")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{caltech_pal_2}} for Caltech's primary and deep colors; 
#' \code{\link{caltech_pal_3}} for Caltech's bright colors; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

caltech_pal_1 <- newpal(col = c(col_caltech_p,  col_caltech_n1, col_caltech_n2, col_caltech_n3,
                                col_caltech_n4, col_caltech_n5, col_caltech_n6, col_caltech_n7),
                        names = c("PMS 1585c (Caltech primary orange)", "PMS cool gray 9", "PMS cool grey 3c", "PMS 414",
                                  "PMS 5497c", "PMS 7494c", "PMS 451c", "PMS 7403c"), 
                        as_df = FALSE)

# Deep Colors 
# 
# Caltech's deep color palette adds contrast to the Caltech orange as well as the neutral palette, 
# and may be used to provide more depth and texture to communications materials.

# PMS 548c
# c:100 m:64 y:51 k:43
# r:0 g:59 b:76
# HEX #003B4C

col_caltech_d1 <- "#003B4C"

# PMS 3292c
# c:100 m:41 y:67 k:33
# r:0 g:88 b:80
# HEX #005851

col_caltech_d2 <- "#005851"  # Note: RGB values differ!
# col_caltech_d2 <- rgb(0, 88, 80, maxColorValue = 255)  # Note: HEX values differ!

# PMS 668c
# c:69 m78 y:28 k:11
# r100 g:75 b:120
# HEX #644B78

col_caltech_d3 <- "#644B78"

# PMS 195c
# c:36 m:87 y:61 k:33
# r:123 g:48 b:62
# HEX #7A303F

col_caltech_d4 <- "#7A303F"  # Note: RGB values differ!
# col_caltech_d4 <- rgb(123, 48, 62, maxColorValue = 255)  # Note: HEX values differ!

# - caltech_pal_2: Primary and deep colors: ----

#' Primary and deep colors of Caltech
#'
#' \code{caltech_pal_2} provides the primary and 4 deep colors 
#' of the \href{https://www.caltech.edu/}{California Institute of Technology}, CA, USA. 
#' 
#' Caltech's primary orange color is defined as Pantone MS 1585c 
#' (for coated and matte print jobs, PMS 151 for uncoated print jobs). 
#' Use this color for small highlights, rather than large areas. 
#' 
#' Caltech's 4 deep colors add contrast to the primary Caltech orange 
#' as well as the neutral colors (of \code{\link{caltech_pal_1}}), 
#' and are used to provide depth and texture to communications materials. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-28.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://identity.caltech.edu/colors}. 
#' 
#' @examples
#' caltech_pal_2
#' seecol(caltech_pal_2)  # view color palette
#' demopal(caltech_pal_2, type = 3, seed = 1,  
#'         main = "Primary and deep colors of Caltech")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{caltech_pal_1}} for Caltech's primary and neutral colors; 
#' \code{\link{caltech_pal_3}} for Caltech's bright colors; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

caltech_pal_2 <- newpal(col = c(col_caltech_p,  
                                col_caltech_d1, col_caltech_d2, 
                                col_caltech_d3, col_caltech_d4),
                        names = c("PMS 1585c (Caltech primary orange)", 
                                  "PMS 548c", "PMS 3292c", 
                                  "PMS 668c", "PMS 195c"), 
                        as_df = FALSE)

# Bright Colors
#
# Caltech's bright color palette provides an opportunity to adjust the temper of a piece from subtle to bold. 
# These colors should be used as accents to the primary, neutral, and deep colors, 
# and carefully selected based on what is appropriate to the tone of the piece.

# PMS 186c (red JPL official color)
# c:0 m:100 y:81 k:4
# r:227 g:25 b:55
# HEX #e41937

col_caltech_b1 <- "#E41937"
# col_caltech_b1 <- rgb(227, 25, 55, maxColorValue = 255)  # Note: HEX values differ!

# PMS 299c
# c:80 m:18 y:0 k:0
# r:0 g:161 b:223
# HEX #00A1DF

col_caltech_b2 <- "#00A1DF"

# PMS 7473c
# c:80 m:19 y:52 k:2
# r:30 g:152 b:138
# HEX #1E988A

col_caltech_b3 <- "#1E988A"

# PMS 7489c
# c:61 m:14 y:92 k:1
# r:115 g:169 b:80
# HEX #73A950

col_caltech_b4 <- "#73A950"

# PMS 7408c
# c:2 m:26 y:100 k:0
# r:249 g:190 b:0
# HEX #F9BE00

col_caltech_b5 <- "#F9BE00"

# PMS 605c
# c:15 m:13 y:100 k:0
# r:226 g:204 b:0
# HEX #E2CC00

col_caltech_b6 <- "#E2CC00"

# PMS 1915c
# c:0 m:85 y:24 k:0
# r:246 g:77 b:128
# HEX #F54D80

col_caltech_b7 <- "#F54D80"  # Note: RGB values differ!
# col_caltech_b7 <- rgb(246, 77, 128, maxColorValue = 255)  # Note: HEX values differ!


# - caltech_pal_3: Primary and bright colors: ----

#' Primary and bright colors of Caltech
#'
#' \code{caltech_pal_3} provides the primary and 7 bright colors 
#' of the \href{https://www.caltech.edu/}{California Institute of Technology}, CA, USA. 
#' 
#' Caltech's primary orange color is defined as Pantone MS 1585c 
#' (for coated and matte print jobs, PMS 151 for uncoated print jobs). 
#' Use this color for small highlights, rather than large areas. 
#' 
#' Caltech's 7 bright colors provide an opportunity to adjust the temper 
#' of communication materials from subtle to bold. 
#' These colors should be used as carefully selected accents 
#' to the primary, neutral, and deep colors 
#' (of \code{\link{caltech_pal_1}} and \code{\link{caltech_pal_2}}). 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-10-28.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://identity.caltech.edu/colors}. 
#' 
#' @examples
#' caltech_pal_3
#' seecol(caltech_pal_3)  # view color palette
#' demopal(caltech_pal_3, type = 3, seed = 1,  
#'         main = "Primary and bright colors of Caltech")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{caltech_pal_1}} for Caltech's primary and neutral colors; 
#' \code{\link{caltech_pal_2}} for Caltech's primary and deep colors; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

caltech_pal_3 <- newpal(col = c(col_caltech_p,  col_caltech_b1, col_caltech_b2, col_caltech_b3, 
                                col_caltech_b4, col_caltech_b5, col_caltech_b6, col_caltech_b7),
                        names = c("PMS 1585c (Caltech primary orange)", "PMS 186c (red JPL color)", "PMS 299c", "PMS 7473c", 
                                  "PMS 7489c", "PMS 7408c", "PMS 605c", "PMS 1915c"), 
                        as_df = FALSE)



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

# - uni_goettingen_1: Primary colors: ----

col_goe_primary <- c("#153268", "#005f9b", "#0091c8", "#50a5d2")
nam_goe_primary <- c("Uniblau", "Logoblau", "Logomittelblau", "Logohellblau")

#' Primary colors of the University of Göttingen
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

# - uni_goettingen_2: Secondary colors: ----

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

#' Secondary colors of the University of Göttingen
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

# - uni_goettingen_3: Departments / faculties: ----

# Souce: <https://www.uni-goettingen.de/de/589412.html>
# 2022-11-19

# Fakultaetsfarben
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


#' Departmental colors of the University of Göttingen 
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


#' Default colors of the ETH Zurich 
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


#' Lighter shades of the ETH Zurich colors 
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


#' Black and grey colors of the ETH Zurich 
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

#' Default colors of the Max-Planck-Gesellschaft 
#'
#' \code{mpg_pal} provides the default color palette 
#' of the \href{https://www.mpg.de/en}{Max Planck Society}, Germany. 
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
                  names = c("MPG green", "white", "MPG grey"),
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

#' Default colors of the University of Freiburg 
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

#' Blue colors of the University of Freiburg 
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

#' Grey colors of the University of Freiburg 
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

#' Info colors of the University of Freiburg 
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

#' Default colors of the University of Konstanz 
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

#' Preferred colors of the University of Konstanz 
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

#' Basic colors of Princeton University 
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
                          names = c("Princeton basic orange", "black"),
                          as_df = FALSE)


# - uni_princeton_1: ----

#' Colors of Princeton University (on white backgrounds) 
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
                          names = c("Princeton orange (on white)", "white", "black"),
                          as_df = FALSE)


# - uni_princeton_2: ----

#' Colors of Princeton University (on black backgrounds) 
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
                          names = c("Princeton orange (on black)", "black", "white"),
                          as_df = FALSE)



# Uni Regensburg / UR: ------

# Source: <https://www.uni-regensburg.de/verwaltung/corporate-design/index.html>
# Last update: 2022-11-25

# 142.142.141 : Neutralgrau : UR-Hausfarbe / Logo 

# # Service-Einrichtungen: 
# 
# 29.63.75 : Blaugrau : Leitung, Organe und Verwaltung (LOV) [Ausnahme: Referate I/3, I/4, I/5, I/6]
# 95.0.47 : Schwarzrot : Chancengleichheit und Familie [Familien-Service, Frauenbeauftragte, Frauenförderung, Gleichstellung]
# 61.65.0 : Schilfgrün : Service-Einrichtungen der Verwaltung für Studierende [Akademisches Auslandsamt, Studentenkanzlei, Zentrales Prüfungssekretariat, Zentrale Studienberatung, Senatsbeauftragter für Behinderte und chronisch Kranke]
# 164.102.116 : Dianthusrot : Universitätsbibliothek (UB)
# 3.35.82 : Saphirblau : Rechenzentrum (RZ)
# 65.98.36 : Farngrün : Zentrum für Weiterbildung
# 
# # Fakultätsübergreifende Einrichtungen: 
# 114.75.81 : Rotbraun : Zentrum für Sprache und Kommunikation (ZSK)
# 86.78.111 : Perlviolett : Europaeum (Ost-West-Zentrum)
# 59.0.65 : Violettrot : Zentrum für Hochschul- und Wissenschaftsdidaktik (ZHW)
# 134.104.0 : Grünbraun : Regensburger Universitätszentrum für Lehrerbildung (RUL)
# 0.129.123 : Wasserblau : Sportzentrum (SZ)
# 
# # Fakultäten: 
# 
# 205.211.15 : Urangelb : Rechtswissenschaft
# 174.167.0 : Lärchennadelgrün : Wirtschaftswissenschaften
# 236.188.0 : Vatikangelb : Katholische Theologie
# 236.98.0 : Orangerot : Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
# 191.0.42 : Heucherarot : Humanwissenschaften
# 156.0.75 : Heidenelkenrot : Sprach-, Literatur- und Kulturwissenschaften
# 79.184.0 : Blattgrün : Biologie und Vorklinische Medizin
# 0.155.119 : Türkisgrün : Mathematik
# 0.137.147 : Eisvogelblau : Physik
# 0.135.178 : Spektralblau : Chemie und Pharmazie
# 0.85.106 :  Capriblau : Medizin
# 
# Fakultät für Informatik und Data Science: "Glutrot" 
# RGB 218.60.67
# Web-Farben #DA3C43
# CMYK coated/uncoated 0.96.99.0
# HKS-Wert 13

# Colors: 
UR_neutralgrau <- rgb(142, 142, 141, names = "neutralgrau",    maxColorValue = 255) # UR-Hausfarbe, Logo

UR_blaugrau <-    rgb( 29,  63,  75, names = "blaugrau",    maxColorValue = 255) # Leitung, Organe und Verwaltung (LOV) 
UR_schwarzrot <-  rgb( 95,   0,  47, names = "schwarzrot",  maxColorValue = 255) # Chancengleichheit und Familie
UR_schilfgruen <- rgb( 61,  65,   0, names = "schilfgruen", maxColorValue = 255) # Service-Einrichtungen der Verwaltung für Studierende
UR_dianthusrot <- rgb(164, 102, 116, names = "dianthusrot", maxColorValue = 255) # Universitätsbibliothek (UB)
UR_saphirblau <-  rgb(  3,  35,  82, names = "saphirblau",  maxColorValue = 255) # Rechenzentrum (RZ)
UR_farngruen <-   rgb( 65,  98,  36, names = "farngruen",   maxColorValue = 255) # Zentrum für Weiterbildung

UR_rotbraun <-    rgb(114,  75,  81, names = "rotbraun", maxColorValue = 255)    # Zentrum für Sprache und Kommunikation (ZSK)
UR_perlviolett <- rgb( 86,  78, 111, names = "perlviolett", maxColorValue = 255) # Europaeum (Ost-West-Zentrum)
UR_violettrot <-  rgb( 59,   0,  65, names = "violettrot", maxColorValue = 255)  # Zentrum für Hochschul- und Wissenschaftsdidaktik (ZHW)
UR_gruenbraun <-  rgb(134, 104,   0, names = "gruenbraun", maxColorValue = 255)  # Regensburger Universitätszentrum für Lehrerbildung (RUL)
UR_wasserblau <-  rgb(  0, 129, 123, names = "wasserblau", maxColorValue = 255)  # Sportzentrum (SZ)

UR_urangelb <-           rgb(205, 211,  15, names = "urangelb", maxColorValue = 255) # Rechtswissenschaft
UR_laerchennadelgruen <- rgb(174, 167,   0, names = "laerchennadelgruen", maxColorValue = 255) # Wirtschaftswissenschaften
UR_vatikangelb <-        rgb(236, 188,   0,  names = "vatikangelb", maxColorValue = 255) # Katholische Theologie
UR_orangerot <-          rgb(236,  98,   0,  names = "orangerot",   maxColorValue = 255) # Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
UR_heucherarot <-        rgb(191,   0,  42,  names = "heucherarot", maxColorValue = 255) # Humanwissenschaften
UR_heidenelkenrot <-     rgb(156,   0,  75,  names = "heidenelkenrot", maxColorValue = 255) # Sprach-, Literatur- und Kulturwissenschaften
UR_blattgruen <-         rgb( 79, 184,   0,  names = "blattgruen",   maxColorValue = 255) # Biologie und Vorklinische Medizin
UR_tuerkisgruen <-       rgb(  0, 155, 119,  names = "tuerkisgruen", maxColorValue = 255) # Mathematik
UR_eisvogelblau <-       rgb(  0, 137, 147,  names = "eisvogelblau", maxColorValue = 255) # Physik
UR_spektralblau <-       rgb(  0, 135, 178,  names = "spektralblau", maxColorValue = 255) # Chemie und Pharmazie
UR_capriblau <-          rgb(  0,  85, 106,  names = "capriblau",    maxColorValue = 255) # Medizin
UR_glutrot <-            rgb(218,  60,  67,  names = "glutrot",      maxColorValue = 255) # Informatik und Data Science

# Web colors / Flaechenfarbe / area colors:
UR_urangelb_a <-           "#CDD30F" # Rechtswissenschaft
UR_laerchennadelgruen_a <- "#AEA700" # Wirtschaftswissenschaften
UR_vatikangelb_a <-        "#ECBC00" # Katholische Theologie
UR_orangerot_a <-          "#EC6200" # Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
UR_heucherarot_a <-        "#BF002A" # Humanwissenschaften
UR_heidenelkenrot_a <-     "#9C004B" # Sprach-, Literatur- und Kulturwissenschaften
UR_blattgruen_a <-         "#4FB800" # Biologie und Vorklinische Medizin
UR_tuerkisgruen_a <-       "#009B77" # Mathematik
UR_eisvogelblau_a <-       "#008993" # Physik
UR_spektralblau_a <-       "#0087B2" # Chemie und Pharmazie
UR_capriblau_a <-          "#00556A" # Medizin
UR_glutrot_a <-            "#DA3C43" # Informatik und Data Science

# Schriftfarbe / font colors: 
UR_urangelb_f <-           "#A4A90C" # Rechtswissenschaft
UR_laerchennadelgruen_f <- "#8B8600" # Wirtschaftswissenschaften
UR_vatikangelb_f <-        "#BD9600" # Katholische Theologie
UR_orangerot_f <-          "#BD4E00" # Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
UR_heucherarot_f <-        "#990022" # Humanwissenschaften
UR_heidenelkenrot_f <-     "#7D003C" # Sprach-, Literatur- und Kulturwissenschaften
UR_blattgruen_f <-         "#3F9300" # Biologie und Vorklinische Medizin
UR_tuerkisgruen_f <-       "#007C5F" # Mathematik
UR_eisvogelblau_f <-       "#006E76" # Physik
UR_spektralblau_f <-       "#006C8E" # Chemie und Pharmazie
UR_capriblau_f <-          "#004455" # Medizin
UR_glutrot_f <-            "#DA3C43" # Informatik und Data Science (TODO: Same as area color?)


# Palettes:

# - uni_regensburg_1: General / Service und fakultätsübergreifende Einrichtungen: ---- 

#' General colors of the University of Regensburg 
#'
#' \code{uni_regensburg_1} provides the general (administrative and service-oriented) colors 
#' of the \href{https://www.uni-regensburg.de/}{University of Regensburg}, Germany. 
#' 
#' Named colors of \code{uni_regensburg_1} correspond to the following services:
#' 
#' \enumerate{
#' \item neutralgrau: UR-Hausfarbe, Logo 
#' \item blaugrau: Leitung, Organe und Verwaltung (LOV, Ausnahme: Referate I/3, I/4, I/5, I/6)
#' \item schwarzrot: Chancengleichheit und Familie (Familien-Service, Frauenbeauftragte, Frauenfoerderung, Gleichstellung)
#' \item schilfgruen: Service-Einrichtungen der Verwaltung für Studierende (Akademisches Auslandsamt, Studentenkanzlei, Zentrales Pruefungssekretariat, Zentrale Studienberatung, Senatsbeauftragter für Behinderte und chronisch Kranke) 
#' \item dianthusrot: Universitaetsbibliothek (UB)
#' \item saphirblau: Rechenzentrum (RZ)
#' \item farngruen: Zentrum fuer Weiterbildung
#' \item rotbraun: Zentrum fuer Sprache und Kommunikation (ZSK)
#' \item perlviolett: Europaeum (Ost-West-Zentrum)
#' \item violettrot: Zentrum fuer Hochschul- und Wissenschaftsdidaktik (ZHW)
#' \item gruenbraun: Regensburger Universitätszentrum fuer Lehrerbildung (RUL)
#' \item wasserblau: Sportzentrum (SZ)
#' }
#' 
#' When coloring large areas, named colors can be used in shades of 70%.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-regensburg.de/verwaltung/corporate-design/index.html}. 
#' 
#' @examples
#' uni_regensburg_1
#' seecol(uni_regensburg_1)  # view color palette
#' demopal(uni_regensburg_1, alpha = .70, type = 2, 
#'         main = "General colors of the University of Regensburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_regensburg_2}} and \code{\link{uni_regensburg_3}} for the faculty colors of the University of Regensburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_regensburg_1 <- newpal(col = c(UR_neutralgrau, 
                                   UR_blaugrau, UR_schwarzrot, UR_schilfgruen, 
                                   UR_dianthusrot, UR_saphirblau, UR_farngruen,
                                   UR_rotbraun, UR_perlviolett, UR_violettrot, 
                                   UR_gruenbraun, UR_wasserblau), as_df = FALSE)

# - uni_regensburg_2: Departmental / faculty / web area colors: ---- 

#' Departmental colors of the University of Regensburg (for areas) 
#'
#' \code{uni_regensburg_2} provides the departmental (faculty) colors 
#' for coloring print or web areas 
#' at the \href{https://www.uni-regensburg.de/}{University of Regensburg}, Germany. 
#' 
#' Named colors of \code{uni_regensburg_2} correspond to the following faculties:
#' 
#' \enumerate{
#' \item urangelb: Rechtswissenschaft
#' \item laerchennadelgruen: Wirtschaftswissenschaften
#' \item vatikangelb: Katholische Theologie
#' \item orangerot: Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
#' \item heucherarot: Humanwissenschaften
#' \item heidenelkenrot: Sprach-, Literatur- und Kulturwissenschaften
#' \item blattgruen: Biologie und Vorklinische Medizin
#' \item tuerkisgruen: Mathematik
#' \item eisvogelblau: Physik
#' \item spektralblau: Chemie und Pharmazie
#' \item capriblau: Medizin
#' \item glutrot: Informatik und Data Science
#' }
#' 
#' When coloring large areas, named colors can be used in shades of 70%.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-regensburg.de/verwaltung/corporate-design/index.html}. 
#' 
#' @examples
#' uni_regensburg_2
#' seecol(uni_regensburg_2)  # view color palette
#' demopal(uni_regensburg_2, type = 3, 
#'         main = "Department colors at the University of Regensburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_regensburg_1}} and \code{\link{uni_regensburg_3}} for alternative colors of the University of Regensburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_regensburg_2 <- newpal(col = c(UR_urangelb, UR_laerchennadelgruen, UR_vatikangelb, 
                                   UR_orangerot, UR_heucherarot, UR_heidenelkenrot, 
                                   UR_blattgruen, UR_tuerkisgruen, UR_eisvogelblau, 
                                   UR_spektralblau, UR_capriblau, UR_glutrot), as_df = FALSE)

uni_regensburg_2_a <- newpal(col = c(UR_urangelb_a, UR_laerchennadelgruen_a, UR_vatikangelb_a,
                                     UR_orangerot_a, UR_heucherarot_a, UR_heidenelkenrot_a,
                                     UR_blattgruen_a, UR_tuerkisgruen_a, UR_eisvogelblau_a,
                                     UR_spektralblau_a, UR_capriblau_a, UR_glutrot_a), 
                             names = names(uni_regensburg_2), 
                             as_df = FALSE)

all.equal(uni_regensburg_2, uni_regensburg_2_a)  # RGB values correspond to web colors for areas.

# - uni_regensburg_3: Departmental / faculty / web font colors: ---- 

#' Departmental colors of the University of Regensburg (for fonts) 
#'
#' \code{uni_regensburg_3} provides the departmental (faculty) colors 
#' for web fonts 
#' at the \href{https://www.uni-regensburg.de/}{University of Regensburg}, Germany. 
#' 
#' Named colors of \code{uni_regensburg_3} correspond to the following faculties:
#' 
#' \enumerate{
#' \item urangelb: Rechtswissenschaft
#' \item laerchennadelgruen: Wirtschaftswissenschaften
#' \item vatikangelb: Katholische Theologie
#' \item orangerot: Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
#' \item heucherarot: Humanwissenschaften
#' \item heidenelkenrot: Sprach-, Literatur- und Kulturwissenschaften
#' \item blattgruen: Biologie und Vorklinische Medizin
#' \item tuerkisgruen: Mathematik
#' \item eisvogelblau: Physik
#' \item spektralblau: Chemie und Pharmazie
#' \item capriblau: Medizin
#' \item glutrot: Informatik und Data Science
#' }
#' 
#' Note that the font color glutrot is currently identical to the area color of \code{\link{uni_regensburg_2}}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' Hansjoerg Neth, 2022-11-25.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-regensburg.de/verwaltung/corporate-design/index.html}. 
#' 
#' @examples
#' uni_regensburg_3
#' seecol(uni_regensburg_3)  # view color palette
#' demopal(uni_regensburg_3, type = 4, seed = 13, 
#'         main = "Department colors at the University of Regensburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_regensburg_1}} and \code{\link{uni_regensburg_2}} for alternative colors of the University of Regensburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_regensburg_3 <- newpal(col = c(UR_urangelb_f, UR_laerchennadelgruen_f, UR_vatikangelb_f,
                                   UR_orangerot_f, UR_heucherarot_f, UR_heidenelkenrot_f,
                                   UR_blattgruen_f, UR_tuerkisgruen_f, UR_eisvogelblau_f,
                                   UR_spektralblau_f, UR_capriblau_f, UR_glutrot_f), 
                           names = names(uni_regensburg_2), 
                           as_df = FALSE)


## ToDo: -------- 

# - Caltech: <https://identity.caltech.edu/colors>
# - Uni Heidelberg: <https://www.uni-heidelberg.de/de/universitaet/das-profil-der-universitaet-heidelberg/corporate-design>
# - Uni Tuebingen:

## eof. ----------