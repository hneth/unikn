## add_pals.R | unikn
## spds | uni.kn |  2022 12 29
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
#               "fu_pal_0", "fu_pal_1", "fu_pal_2", "fu_pal_3",
#               "hu_pal_1", "hu_pal_2",
#               "lmu_pal_1", "lmu_pal_2", "lmu_pal_3",
#               "mpg_pal",
#               "uni_bonn_1", "uni_bonn_2",
#               "uni_freiburg_0", "uni_freiburg_1", "uni_freiburg_2",
#               "uni_freiburg_br", "uni_freiburg_blue", "uni_freiburg_grey", "uni_freiburg_info",
#               "uni_goettingen_1", "uni_goettingen_2", "uni_goettingen_3",
#               "uni_hamburg_1", "uni_hamburg_2",
#               "uni_koeln_1", "uni_koeln_2",
#               "uni_konstanz_1", "uni_konstanz_2",
#               "uni_mannheim_1", "uni_mannheim_2",
#               "uni_princeton_0", "uni_princeton_1", "uni_princeton_2",
#               "uni_regensburg_1", "uni_regensburg_2", "uni_regensburg_3",
#               "uni_ulm_1", "uni_ulm_2", 
#               "rpi_pal_1", "rpi_pal_2", "rpi_pal_3"
# )

inst <- c(rep("Caltech", 3), 
          rep("ETH Zurich", 3),
          rep("Free University Berlin", 4),
          rep("Humboldt University Berlin", 2),
          rep("LMU Munich", 3),
          "Max Planck Society",
          rep("University of Bonn", 2), 
          rep("University of Freiburg", 7),
          rep("University of Goettingen", 3),
          rep("University of Hamburg", 2),
          rep("University of Koeln", 2),
          rep("University of Konstanz", 2),
          rep("University of Mannheim", 2),          
          rep("Princeton University", 3),
          rep("University of Regensburg", 3),
          rep("University of Ulm", 2),          
          rep("RPI", 3)
)

inst_alt <- c(rep("California Institute of Technology", 3),
              rep("Eidgen\u00F6ssische Technische Hochschule, Z\u00FCrich", 3),
              rep("Freie Universit\u00E4t Berlin", 4),
              rep("Humboldt Universit\u00E4t zu Berlin", 2),
              rep("Ludwig-Maximilians-Universit\u00E4t M\u00FCnchen", 3),
              "Max-Planck-Gesellschaft",
              rep("Universit\u00E4t Bonn", 2),
              rep("Universit\u00E4t Freiburg", 7),
              rep("Universit\u00E4t G\u00F6ttingen", 3),
              rep("Universit\u00E4t Hamburg", 2),
              rep("Universit\u00E4t zu K\u00F6ln", 2),
              rep("Universit\u00E4t Konstanz", 2),
              rep("Universit\u00E4t Mannheim", 2),
              rep("Princeton University", 3),
              rep("Universit\u00E4t Regensburg", 3),
              rep("Universit\u00E4t Ulm", 2),
              rep("Rensselaer Polytechnic Institute", 3)
)

url <- c(rep("https://www.caltech.edu/", 3), 
         rep("https://ethz.ch/", 3),
         rep("https://www.fu-berlin.de/en/index.html", 4),
         rep("https://www.hu-berlin.de/en", 2),
         rep("https://www.lmu.de/en/index.html", 3),
         "https://www.mpg.de/en",
         rep("https://www.uni-bonn.de/en", 2),
         rep("https://uni-freiburg.de/", 7),
         rep("https://uni-goettingen.de/", 3),
         rep("https://www.uni-hamburg.de/", 2),
         rep("https://www.uni-koeln.de/", 2),
         rep("https://www.uni-konstanz.de/", 2),
         rep("https://www.uni-mannheim.de/", 2),
         rep("https://www.princeton.edu/", 3),
         rep("https://www.uni-regensburg.de/", 3),
         rep("https://www.uni-ulm.de/", 2),
         rep("https://www.rpi.edu/", 3)
)

uni_data <- data.frame(inst = inst, inst_alt = inst_alt, url = url, pal = add_pals)
# uni_data



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

# - caltech_pal_1: Primary and neutral colors ----

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
#' \strong{unikn}, 2022-10-28.
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
                        names = c("Caltech orange (PMS 1585c)", "PMS cool gray 9", "PMS cool grey 3c", "PMS 414",
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

# - caltech_pal_2: Primary and deep colors ----

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
#' \strong{unikn}, 2022-10-28.
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
                        names = c("Caltech orange (PMS 1585c)", 
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

col_caltech_b1 <- "#E41937"  # Note: RGB values differ!
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


# - caltech_pal_3: Primary and bright colors ----

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
#' \strong{unikn}, 2022-10-28.
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
                        names = c("Caltech orange (PMS 1585c)", "JPL red (PMS 186c)", "PMS 299c", "PMS 7473c", 
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

# - uni_goettingen_1: Primary colors ----

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
#' \strong{unikn}, 2022-11-20.
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

# - uni_goettingen_2: Secondary colors ----

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
#' \strong{unikn}, 2022-11-20.
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

# - uni_goettingen_3: Departments / faculties ----

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

nam_goe_fac <- c("Agrarwissenschaften", "Biologie und Psychologie", "Chemie", "Forstwissenschaften und Waldoekologie", "Geowissenschaften und Geographie", "Mathematik und Informatik", "Physik", 
                 "Jura", "Sozialwissenschaften", "Wirtschaftswissenschaften", "Philosophie", "Theologie", "Medizin")
nam_goe_fac <- paste0("UG ", nam_goe_fac)

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
#' \strong{unikn}, 2022-11-20.
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
#' \strong{unikn}, 2022-10-25.
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
#' \strong{unikn}, 2022-10-25.
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
#' \strong{unikn}, 2022-10-25.
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





# FU Berlin / Freie Universitaet Berlin: ------

# Source: <https://www.fu-berlin.de/sites/corporate-design/grundlagen/farben/index.html>
# 2022-12-03

# Hausfarben
#
# Die im Corporate Design verwendeten Farben bestimmen maßgeblich das Erscheinungsbild der Freien Universität Berlin. 
# Um einen modernen, klaren und seriösen Eindruck zu erwecken und die Wiedererkennbarkeit zu gewährleisten, ist die Palette der verwendbaren Farben begrenzt. 
# Jedoch sollen in jeder Publikation beide Hausfarben verwendet werden, denn sie wirken nur durch ihr Zusammenspiel.

# Farbwirkung und Symbolik
#
# Das dunkle Blau steht für Beständigkeit, Seriosität, Tradition und Respekt. Es weckt Vertrauen, wirkt kompetent und zuverlässig. 
# Das helle Grün bildet einen frischen Kontrast zur ruhigen und seriösen Wirkung der dunkelblauen Farbe. 
# Es steht für Erneuerung, Bewegung und Modernität.

# Die beiden Hauptfarben des Corporate Design stehen damit für die Werte, die die Freie Universität Berlin seit ihrer Gründung im Jahre 1948 bis heute prägen: 
# Tradition, Qualität und Erfahrung in Wissenschaft, Forschung und Lehre auf der einen, 
# Dynamik, ständige Erneuerung und Modernität auf der anderen Seite. 

# Hausfarben (Hauptfarben)
# 
# PRINT 	                WEB
# CMYK 	        Pantone 	Hexadezimal 	RGB
# 100-72-0-18,5 	280C 	  #003366 	    0-51-102
# 18,5-0-91-0 	  381C 	  #99CC00 	    153-204-0

fu_blue  <- "#003366"
fu_green <- "#99CC00"

fu_col_1 <- newpal(col = c(fu_blue, fu_green),
                   names = c("FU blue", "FU green"),
                   as_df = FALSE)

# seecol(fu_col_1, main = "Primary colors of FU Berlin")

# - fu_pal_0: Primary colors ----

#' Primary colors of the Free University Berlin 
#'
#' \code{fu_pal_0} provides the two primary colors 
#' of the \href{https://www.fu-berlin.de/en/index.html}{Free University Berlin}, Germany. 
#' 
#' The dark \code{"FU blue"} implies consistency, seriosity and respect. 
#' It is defined as Pantone 280C 
#' and approximated by CMYK 100/72/0/18.5, RGB 0/51/102, and HEX #003366.
#' 
#' The bright \code{"FU green"} implies renewal and mobility. 
#' It is is defined as Pantone 381C 
#' and approximated by CMYK 18.5/0/91/0, RGB 153/204/0, and HEX #99CC00. 
#' 
#' See \code{\link{fu_pal_1}} for a corresponding color gradient.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-03.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.fu-berlin.de/sites/corporate-design/grundlagen/farben/index.html}. 
#' 
#' @examples
#' fu_pal_0
#' seecol(fu_pal_0, main = "Primary colors of the FU Berlin")
#' demopal(fu_pal_0, type = 1, main = "Primary colors of the FU Berlin")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{fu_pal_1}} for a corresponding color gradient of the FU Berlin;
#' \code{\link{fu_pal_2}} for secondary colors of the FU Berlin; 
#' \code{\link{fu_pal_3}} for a blue color gradient of the FU Berlin;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

fu_pal_0 <- fu_col_1


# Sekundärfarben
#
# Als Sekundärfarben stehen für Auszeichnungen Rot und Orange zur Verfügung. 
# Diese können das Farbklima ergänzen, dürfen aber nicht dominieren. 
# Insbesondere farbige Schriftzüge sollten sparsam und lediglich zum Setzen von Akzenten verwendet werden.

# Sekundärfarben (Auszeichnungsfarben)
# 
# PRINT 	              WEB
# CMYK 	      Pantone 	Hexadezimal 	RGB
# 0-34-91-0 	137C 	    #FF9900 	    255-153-0
# 0-94-100-0 	1795C 	  #CC0000 	    204-0-0
# - 	        - 	      #0066cc     	0-102-204

fu_accent <- newpal(col = c("#FF9900", "#CC0000", "#0066CC"),
                    names = c("FU accent orange", "FU accent red", "FU accent blue"),
                    as_df = FALSE)

# seecol(fu_accent, main = "Secondary/accent colors of the FU Berlin")


# Grautöne
# 
# PRINT 	        WEB
# CMYK 	Pantone 	Hexadezimal 	RGB
# -* 	  - 	      #333333 	    51-51-51
# -* 	  - 	      #666666 	    102-102-102
# -* 	  - 	      #999999 	    153-153-153
# -* 	  - 	      #CCCCCC 	    204-204-204
# -* 	  - 	      #DDDDDD 	    221-221-221
# -* 	  - 	      #EEEEEE 	    238-238-238
# -* 	  - 	      #F1F1F1 	    241-241-241

# Note positions in:
# seecol(usecol(c("black", "white"), n = 20))

fu_greys <- newpal(col = c("#333333", "#666666", "#999999", "#CCCCCC",
                           "#DDDDDD", "#EEEEEE", "#F1F1F1"),
                   names = c("FU grey 1", "FU grey 2", "FU grey 3", "FU grey 4",
                             "FU grey 5", "FU grey 6", "FU grey 7"),
                   as_df = FALSE)

# seecol(fu_greys, main = "Shades of grey colors of FU Berlin")


# - fu_pal_2: Secondary and grey colors ----

#' Secondary and grey colors of the Free University Berlin 
#'
#' \code{fu_pal_2} provides the three accent colors and seven grey colors  
#' of the \href{https://www.fu-berlin.de/en/index.html}{Free University Berlin}, Germany. 
#' 
#' The three accent colors support the two primary colors of \code{\link{fu_pal_0}} 
#' but should not dominate the overall impression. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-03.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.fu-berlin.de/sites/corporate-design/grundlagen/farben/index.html}. 
#' 
#' @examples
#' fu_pal_2
#' seecol(fu_pal_2, main = "Secondary colors of the FU Berlin")
#' demopal(fu_pal_2, type = 5, main = "Accent and grey colors of the FU Berlin")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{fu_pal_0}} for primary colors of the FU Berlin; 
#' \code{\link{fu_pal_1}} for a corresponding color gradient of the FU Berlin;
#' \code{\link{fu_pal_3}} for a blue color gradient of the FU Berlin;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

fu_pal_2 <- c(fu_accent, fu_greys)


# Abstufungen der Hauptfarbe Blau
# 
# PRINT 	        WEB
# CMYK 	Pantone 	Hexadezimal 	RGB
# 90% 	- 	      #164574 	    22-69-116
# 80% 	- 	      #2C5682 	    44-86-130
# 70% 	- 	      #426890 	    66-104-144
# 60% 	- 	      #587A9E 	    99-122-158    # Note: HEX and RGB values differ! Error: RGB should be R = 88. 
# 50% 	- 	      #6D8BAC 	    109-139-172
# 40% 	- 	      #839DBA 	    131-157-186
# 30% 	- 	      #99AFC8 	    153-175-200
# 20% 	- 	      #AFC0D6 	    175-192-214
# 10% 	- 	      #C5D2E4 	    197-210-228

# Note differences to:
# seecol(usecol(c(fu_blue, "white"), n = 11))

fu_blues <- newpal(col = c(fu_blue, "#164574", "#2C5682", "#426890", "#587A9E",
                           "#6D8BAC", "#839DBA", "#99AFC8", "#AFC0D6", "#C5D2E4"),
                   names = c("FU blue", "FU blue 90%", "FU blue 80%", "FU blue 70%", "FU blue 60%", 
                             "FU blue 50%", "FU blue 40%", "FU blue 30%", "FU blue 20%", "FU blue 10%"),
                   as_df = FALSE)

# seecol(fu_blues, main = "Shades of blue colors of FU Berlin")


# - fu_pal_3: Blue color gradient ----

#' Blue color gradient of the Free University Berlin 
#'
#' \code{fu_pal_3} provides a gradient of the blue primary color  
#' of the \href{https://www.fu-berlin.de/en/index.html}{Free University Berlin}, Germany. 
#' 
#' See \code{\link{fu_pal_0}} for the two primary colors and 
#' the \code{\link{ac}} and \code{\link{usecol}} functions for creating 
#' alternative color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-03.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.fu-berlin.de/sites/corporate-design/grundlagen/farben/index.html}. 
#' 
#' @examples
#' fu_pal_3
#' seecol(fu_pal_3, main = "Blue color gradient of the FU Berlin")
#' demopal(fu_pal_3, type = 3, main = "Blue color gradient of the FU Berlin")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{fu_pal_0}} for primary colors of the FU Berlin;
#' \code{\link{fu_pal_1}} for primary color gradient of the FU Berlin; 
#' \code{\link{fu_pal_2}} for secondary colors of the FU Berlin; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

fu_pal_3 <- fu_blues


# Abmischungen der Hauptfarben Blau und Grün
# 
# PRINT 	          WEB
# CMYK 	Pantone 	  Hexadezimal 	RGB
# 100-60-40-35 	- 	#0F425B 	    15-66-91
# 80-40-50-40 	- 	#1E5151 	    30-81-81
# 80-40-70-30 	- 	#2D6047 	    45-96-71
# 70-30-80-15 	- 	#3D703D 	    61-112-61
# 70-25-100-10 	- 	#4C7F33 	    76-127-51
# 70-20-100-10 	- 	#5B8E28 	    91-142-40
# 60-15-100-0 	- 	#6B9E1E 	    107-158-30
# 50-5-100-0 	  - 	#7AAD14 	    122-173-20
# 40-0-90-0 	  - 	#89BC0A 	    137-188-10

# Note correspondence to:
# seecol(usecol(c(fu_blue, fu_green), n = 11)[c(2:10)])

# fu_blue_green <- usecol(c(fu_blue, fu_green), n = 11, use_col_ramp = TRUE)
# seecol(fu_blue_green, main = "Gradient from blue to green colors of FU Berlin")


# - fu_pal_1: Primary color gradient ----

#' Primary color gradient of the Free University Berlin 
#'
#' \code{fu_pal_1} provides a gradient of the two primary colors 
#' of the \href{https://www.fu-berlin.de/en/index.html}{Free University Berlin}, Germany. 
#' 
#' See \code{\link{fu_pal_0}} for the two primary colors and 
#' the \code{\link{ac}} or \code{\link{usecol}} functions for creating 
#' alternative color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-03.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.fu-berlin.de/sites/corporate-design/grundlagen/farben/index.html}. 
#' 
#' @examples
#' fu_pal_1
#' seecol(fu_pal_1, main = "Primary color gradient of the FU Berlin")
#' demopal(fu_pal_1, type = 4, seed = 2, main = "Primary color gradient of the FU Berlin")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{fu_pal_0}} for primary colors of the FU Berlin;
#' \code{\link{fu_pal_2}} for secondary colors of the FU Berlin; 
#' \code{\link{fu_pal_3}} for a blue color gradient of the FU Berlin;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

fu_pal_1 <- newpal(col = c("#003366",  # = fu_blue
                           "#0F425B", "#1E5151", "#2D6047", 
                           "#3D703D", "#4C7F33", "#5B8E28", 
                           "#6B9E1E", "#7AAD14", "#89BC0A", 
                           "#99CC00"), # = fu_green
                   names = c("FU blue", paste0("FU bg ", 1:9), "FU green"),
                   as_df = FALSE)

# seecol(fu_pal_1, main = "Blue/green color gradient of the FU Berlin")


# HU Berlin / Humboldt Universitaet Berlin: ------

# Source: <https://www.hu-berlin.de/de/service/design/basiselemente/farbe>
# Last check: 2022-11-30

# Hausfarben der Humboldt-Universität
#
# Die primären Hausfarben der Humboldt-Universität zu Berlin sind Pantone 294, Schwarz und Weiß.

# Pantone 294 nur im Druck mit Sonderfarben zur Anwendung kommen kann, wird sie für andere Vervielfältigungstechniken 
# in die Euroskala-Werte CMYK 100/60/0/20 umgewandelt. 
# Für reine Bildschirm-Anwendungen, die nicht auf Papier ausgegeben werden, gelten die Werte RGB 0/55/108.
# In der eingeschränkten Farbauswahl für das Internet kann dieser Wert in RGB 0/51/102 umgewandelt werden.
# Für lackierte farbige Flächen oder Tafeln empfiehlt sich der Farbton RAL 270 3040.

HU_0 <- rgb(0, 55, 108, names = "HU blau", maxColorValue = 255)  # RGB of Pantone 294
# "in der eingeschränkten Farbauswahl für das Internet":
HU_0_web <- rgb(0, 51, 102, names = "HU blau web", maxColorValue = 255)  

# seecol(rev(shades_of(21, HU_0))[-1], main = "20 shades of HU blau")


# - hu_pal_1: Primary colors ---- 

#' Primary colors of the Humboldt University Berlin 
#'
#' \code{hu_pal_1} provides the three primary colors 
#' of the \href{https://www.hu-berlin.de/en}{Humboldt University Berlin}, Germany. 
#' 
#' The color \code{"HU blue"} is defined as Pantone 294 and only approximated by RGB 0/55/108.
#' Other approximations include CMYK 100/60/0/20, RGB 0/51/102 (reduced web scale), and RAL 270 3040.
#' 
#' See the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-30.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.hu-berlin.de/de/service/design/basiselemente/farbe}. 
#' 
#' @examples
#' hu_pal_1
#' seecol(hu_pal_1, n = 5, main = "5 shades of HU Berlin")
#' demopal(hu_pal_1, type = 1, main = "HU Berlin colors")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{hu_pal_2}} for secondary colors of the HU Berlin;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

hu_pal_1 <- newpal(col = c(HU_0, "white", "black"),
                   names = c("HU blau", "weiss", "schwarz"), 
                   as_df = FALSE)

# seecol(hu_pal_1, n = 3)


# Farbklima
# 
# Um Publikationen der Humboldt-Universität abwechslungsreich und unterscheidbar gestalten zu können, 
# werden der Hausfarbe korrespondiernde Farben zugeordnet.
# Die Farben des Farbklimas enthalten einen ähnlichen Schwarzanteil 
# und erzeugen mit der Hausfarbe einen harmonischen Farbklang.
# Die Farbangaben für den RGB-Modus beziehen sich auf das ganze am Bildschirm mögliche Farbspektrum.

# Rot
# CMYK 0/90/80/40
# RGB 138/15/20
# RGB (eingeschränkte Farbauswahl) 153/0/0

HU_1 <- rgb(138,  15,  20, names = "rot", maxColorValue = 255)

# Grün
# CMYK 90/10/80/40
# RGB 0/87/44
# RGB (eingeschränkte Farbauswahl) 0/102/51

HU_2 <- rgb(  0,  87,  44, names = "gruen", maxColorValue = 255)

# Sand
# CMYK 0/5/50/20
# RGB 210/192/103
# RGB (eingeschränkte Farbauswahl) 204/204/102

HU_3 <- rgb(210, 192, 103, names = "sand", maxColorValue = 255)

# Graugrün
# CMYK 0/0/10/20
# RGB 209/209/194
# RGB (eingeschränkte Farbauswahl) 204/204/204 (identisch mit Blaugrau)

HU_4 <- rgb(209, 209, 194, names = "graugruen", maxColorValue = 255)

# Blaugrau
# CMYK 10/0/0/20
# RGB 189/202/211
# RGB (eingeschränkte Farbauswahl) 204/204/204 (identisch mit Graugrün)

HU_5 <- rgb(189, 202, 211, names = "blaugrau", maxColorValue = 255)


# - hu_pal_2: Secondary colors ---- 

#' Secondary colors of the Humboldt University Berlin 
#'
#' \code{hu_pal_2} provides the primary (blue) color with five corresponding colors 
#' of the \href{https://www.hu-berlin.de/en}{Humboldt University Berlin}, Germany. 
#' 
#' The primary color \code{"HU blue"} is defined as Pantone 294 and only approximated by RGB 0/55/108.
#' Other approximations include CMYK 100/60/0/20, RGB 0/51/102 (reduced web scale), and RAL 270 3040.
#' 
#' See the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-30.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.hu-berlin.de/de/service/design/basiselemente/farbe}. 
#' 
#' @examples
#' hu_pal_2
#' seecol(hu_pal_2, main = "The colors of HU Berlin")
#' demopal(hu_pal_2, type = 3, main = "Colors of HU Berlin")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{hu_pal_1}} for primary colors of the HU Berlin;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

hu_pal_2 <- newpal(col = c(HU_0, HU_1, HU_2, HU_3, HU_4, HU_5),
                   names = paste0("HU ", c("blau", "rot", "gruen", "sand", "graugruen", "blaugrau")), 
                   as_df = FALSE)

# seecol(hu_pal_2)




# LMU / Ludwig-Maximilians-Universität München / LMU Munich: ------ 

# Source: https://www.lmu.de/de/die-lmu/struktur/zentrale-universitaetsverwaltung/kommunikation-und-presse/lmu-brand-guide/designgrundsaetze/farben/index.html
# 2022-12-02

# Primärfarben
# 
# Die drei Primärfarben der LMU München, LMU-Grün, Schwarz und Weiß (als wichtigste Oberflächenfarbe) 
# sorgen für ein wiedererkennbares Erscheinungsbild. Der Einsatz der Primärfarben ist Ihnen frei überlassen. 
# Ausschließlich diese Farben werden für die Darstellung des LMU-Logos verwendet.

# Farbe	  LMU Grün	  Schwarz	    Weiß
# HEX	    #00883A	    #232323	    #FFF
# RGB	    0.136.58	  35.35.35	  255.255.255
# CMYK	  100/0/95/15	0/0/0/100	  0/0/0/0
# Pantone	348 C/U	  -	        -
# HKS	    HKS 57

# - lmu_pal_1: Primary colors ---- 

#' Primary colors of the LMU Munich 
#'
#' \code{lmu_pal_1} provides the three primary colors 
#' of the \href{https://www.lmu.de/en/index.html}{Ludwig-Maximilians-Universität München}, Germany. 
#' 
#' The color \code{"LMU gruen"} is defined as Pantone	348 C/U, RGB 0.136.58, or HEX	\code{#00883A}.
#' Other approximations include CMYK 100/0/95/15 or HKS 57. 
#' 
#' # Combining primary and secondary LMU colors:
#' lmu_pal_bipolor <- c(lmu_pal_1[-2], rev(lmu_pal_2), lmu_pal_1[2])
#' demopal(lmu_pal_bipolor, type = "mosaic", main = "Bipolar colors of LMU")
#' 
#' lmu_pal_linear <- c(lmu_pal_1[-3], lmu_pal_2, lmu_pal_1[3])
#' demopal(lmu_pal_linear, type = "polygon", seed = 2, main = "Linear colors of LMU")
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-02.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.lmu.de/de/die-lmu/struktur/zentrale-universitaetsverwaltung/kommunikation-und-presse/lmu-brand-guide/designgrundsaetze/farben/index.html}{LMU brand guide}. 
#' 
#' @examples
#' lmu_pal_1
#' seecol(lmu_pal_1, main = "The primary colors of LMU Munich")
#' demopal(lmu_pal_1, type = 3, main = "Primary colors of LMU Munich")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{lmu_pal_2}} for secondary colors of the LMU Munich; 
#' \code{\link{lmu_pal_3}} for accent colors of the LMU Munich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

lmu_pal_1 <- newpal(col = c("#00883A", "#232323", "#FFFFFF"),
                    names = c("LMU gruen", "LMU schwarz", "weiss"),
                    as_df = FALSE)

# seecol(lmu_pal_1, main = "Primary colors of LMU")


# - lmu_pal_2: Secondary colors ---- 

# Sekundärfarben
#
# Vier Grautöne bilden die Sekundärfarbpalette und können zur Unterstützung der Primärfarben in der Gestaltungverwendet werden. 
# Sie finden häufige Anwendung in Layoutelementen, Grafiken und Untergrundflächen.

# Farbe	  Dunkelgrau	Mittelgrau	Hellgrau	  Lichtgrau
# HEX	    #626468	    #C0C1C3	    #E6E6E7	    #F5F5F5
# RGB	    98.100.104	192.193.195	230.230.231	245.245.245
# CMYK	  0/0/0/85	  0/0/0/50	  0/0/0/25	  0/0/0/6

#' Secondary colors of the LMU Munich 
#'
#' \code{lmu_pal_2} provides four secondary colors 
#' of the \href{https://www.lmu.de/en/index.html}{Ludwig-Maximilians-Universität München}, Germany. 
#' 
#' The secondary colors of \code{lmu_pal_2} are used to support the primary colors of \code{\link{lmu_pal_1}}. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-02.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.lmu.de/de/die-lmu/struktur/zentrale-universitaetsverwaltung/kommunikation-und-presse/lmu-brand-guide/designgrundsaetze/farben/index.html}{LMU brand guide}. 
#' 
#' @examples
#' lmu_pal_2
#' seecol(lmu_pal_2, main = "The secondary/grey colors of LMU Munich")
#' demopal(lmu_pal_2, type = 5, main = "Secondary/grey colors of LMU Munich")
#'
#' # Combining primary and secondary LMU colors:
#' lmu_pal_bipolor <- c(lmu_pal_1[-2], rev(lmu_pal_2), lmu_pal_1[2])
#' demopal(lmu_pal_bipolor, type = "mosaic", main = "Bipolar colors of LMU")
#' 
#' lmu_pal_linear <- c(lmu_pal_1[-3], lmu_pal_2, lmu_pal_1[3])
#' demopal(lmu_pal_linear, type = "polygon", seed = 2, main = "Linear colors of LMU")
#' 
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{lmu_pal_1}} for primary colors of the LMU Munich; 
#' \code{\link{lmu_pal_3}} for accent colors of the LMU Munich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

lmu_pal_2 <- newpal(col = c("#626468", "#C0C1C3", "#E6E6E7", "#F5F5F5"),
                    names = c("dunkelgrau", "mittelgrau", "hellgrau", "lichtgrau"),
                    as_df = FALSE)

# seecol(lmu_pal_2, main = "Secondary colors of LMU")

# Combinations:
# 
# lmu_pal_bipolor <- c(lmu_pal_1[-2], rev(lmu_pal_2), lmu_pal_1[2])
# demopal(lmu_pal_bipolor, type = "mosaic", main = "Bipolar colors of LMU")
# 
# lmu_pal_linear <- c(lmu_pal_1[-3], lmu_pal_2, lmu_pal_1[3])
# demopal(lmu_pal_linear, type = "polygon", seed = 2, main = "Linear colors of LMU")


# Akzentfarben
# 
# Zusätzlich zu den Primär- und Sekundärfarben können Sie auch Akzentfarben verwenden – bitte jedoch möglichst sparsam. 
# Hierzu können Sie die Abstufungen 80 %, 60 %, 40 %, 20 % aus LMU-Grün, aber auch andere Farben nutzen. 
# Bitte verwenden Sie unsere Farbempfehlungen, die harmonisierend an das LMU-Grün angepasst wurden.

# Besonderheiten von lmu.de
#
# Auf lmu.de werden aus Gründen der Barrierefreiheit und Usability als Akzentfarben ausschließlich die Abstufungen 
# des LMU-Grüns sowie die Farben Rot für Störmeldungen und Blau für Social Media (jeweils in 100%) verwendet.

# Farbe	Blau	    Cyan	      Violett	    Rot	      Orange
# HEX	  #0F1987	  #009FE3	    #8C4091	    #D71919	  #F18700
# RGB	  15.25.135	100.59.227	140.64.145	215.25.25	241.135.0
# CMYK	100/75/0/20	100/0/0/0	55/85/0/0	5/100/100/0	0/55/100/0

# - lmu_pal_3: Accent colors ---- 

#' Accent colors of the LMU Munich 
#'
#' \code{lmu_pal_3} provides five accent colors 
#' of the \href{https://www.lmu.de/en/index.html}{Ludwig-Maximilians-Universität München}, Germany. 
#' 
#' The accent colors of \code{lmu_pal_3} are used sparsely in combination with 
#' the primary colors of \code{\link{lmu_pal_1}} and 
#' the secondary colors of \code{\link{lmu_pal_2}}. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-02.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.lmu.de/de/die-lmu/struktur/zentrale-universitaetsverwaltung/kommunikation-und-presse/lmu-brand-guide/designgrundsaetze/farben/index.html}{LMU brand guide}. 
#' 
#' @examples
#' lmu_pal_3
#' seecol(lmu_pal_3, main = "The accent colors of LMU Munich")
#' demopal(lmu_pal_3, type = 3, main = "Accent colors of LMU Munich")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{lmu_pal_1}} for primary colors of the LMU Munich; 
#' \code{\link{lmu_pal_2}} for secondary colors of the LMU Munich;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

lmu_pal_3 <- newpal(col = c("#0F1987", "#009FE3", "#8C4091", "#D71919", "#F18700"),
                    names = c("blau", "cyan", "violett", "rot", "orange"),
                    as_df = FALSE)

# seecol(lmu_pal_3, main = "Accent colors of LMU")


# Max Planck Society / Max-Planck-Gesellschaft (MPG): ------

# Source: https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html
# Last check: 2022-12-11

# MPG green:
# Pantone 328
# cmyk 100 - 0 - 57 - 30
# rgb 17 - 102 - 86

# MPG grey:
# Pantone 427
# cmyk 0 - 0 - 6 - 15
# rgb 221 - 222 - 214

mpg_green <- rgb( 17, 102,  86, maxColorValue = 255)
mpg_grey  <- rgb(221, 222, 214, maxColorValue = 255)

# 100% and 50% variants:
mpg_green_2 <- usecol(c(mpg_green, "white"), n = 3)[1:2] 
mpg_grey_2  <- usecol(c(mpg_grey,  "white"), n = 3)[1:2]

# seecol(c(mpg_green_2, "white", rev(mpg_grey_2)))

# - mpg_pal: ---- 

#' Default colors of the Max-Planck-Gesellschaft 
#'
#' \code{mpg_pal} provides the default color palette 
#' of the \href{https://www.mpg.de/en}{Max Planck Society}, Germany. 
#' 
#' The two primary colors are at the extreme positions of \code{mpg_pal}: 
#' \enumerate{
#' \item \code{MPG green} (at \code{mpg_pal[1]}): Defined as \code{Pantone 328}, \code{CMYK 100/0/57/30}, or \code{RGB 17/102/86}.
#' \item \code{MPG grey} (at \code{mpg_pal[5]}): Defined as \code{Pantone 427}, \code{CMYK 0/0/6/15}, or \code{RGB 221/222/214}.
#' }
#' 
#' At \code{mpg_pal[3]}, the color \code{"white"} was added to enable symmetrical color gradients. 
#' See examples and the \code{\link{ac}} and \code{\link{usecol}} functions 
#' for creating color gradients. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-11.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html}. 
#' 
#' @examples
#' mpg_pal
#' seecol(mpg_pal, main = "Colors of the Max Planck Society")
#' demopal(mpg_pal, type = 1, main = "Using the MPG colors")
#' 
#' # Extended version:
#' mpg_pal_11 <- usecol(c(mpg_pal, "black"), n = 11)
#' demopal(mpg_pal_11, type = 4, seed = 1, main = "An extended MPG palette")
#' 
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

mpg_pal <- newpal(col = c(mpg_green_2, "white", rev(mpg_grey_2)), 
                  names = c("MPG green", "MPG green 50%", "white", "MPG grey 50%", "MPG grey"),
                  as_df = FALSE)


# Uni Bonn: ------

# Source: <https://www.uni-bonn.de/de/universitaet/presse-kommunikation/corporate-design>
# Page 14 of PDF manual at 
# <https://www.uni-bonn.de/de/universitaet/medien-universitaet/medien-presse-kommunikation/medien-corporate-design/ubo_manual_extern_6_2022.pdf>
# Last check: 2022-12-10

# 3.1 Die Hausfarbe
# 
# Die Hausfarbe der Universität Bonn ist Blau („Uni-Blau“). 
# Die Farbe Uni Blau wird im Druck wie folgt definiert: CMYK 100/70/0/0. 
# 
# 3.1.1 Zulässige Tonwerte 
# Zusätzlich zum Vollton (100%) kann die Hausfarbe auch mit den Werten 75%, 50% und 25% aufgerastert werden. 
# 
# 3.1.2 Andere Farbsysteme 
# Für reine Bildschirm-Anwendungen, die nicht auf Papier ausgegeben werden, 
# gelten die Werte RGB 0/78/159 (#004e9f). 
# An Stelle von CMYK (100/70/0/0) kann auch Pantone 286 verwendet werden. 
# Für lackierte Flächen oder Tafeln wird der Farbton RAL 5005 empfohlen.

# main color:
ub_blau <- "#004E9F"  


# 3.2 Die Schmuckfarben
# 
# Zusätzlich zur Hausfarbe kommen zwei weitere Schmuckfarben zum Einsatz. 
# Uni Gelb und Uni Grau
#
# 3.2.1 Zulässige Tonwerte
# Auch die Schmuckfarben können mit den Werten 75%, 50% und 25% aufgerastert werden. 
#
# 3.2.2 Andere Farbsysteme
# Die Definition für Uni Gelb lautet: CMYK 0/30/100/0.
# Alternativ können RGB 252/186/0 (#fcba00), Pantone 1235 und RAL 1028 genutzt werden.
# Für Uni Grau gilt die Definition: CMYK 0/0/15/55 (Dach im Logo) und 65% K („UNIVERSITÄT“).
# Alternativ: RGB 144/144/133 (#909085), Pantone 415 oder RAL 7030.
#
# Bei Schriftgrößen unter 18 pt sollte an Stelle von Uni Grau die Definition 70% Schwarz (K) gewählt werden.
# Dies gilt auch für Beschriftungen im Aussenbereich z.B. auf Alu- oder Plexiglas-Platten.

# 2 decorative colors:
ub_gelb <- "#FCBA00"
ub_grau <- "#909085"

# Color gradients (100% and 75%, 50%, 25%):
ub_blau_4 <- usecol(c(ub_blau, "white"), n = 5)[1:4]
ub_gelb_4 <- usecol(c(ub_gelb, "white"), n = 5)[1:4]
ub_grau_4 <- usecol(c(ub_grau, "white"), n = 5)[1:4]


# - uni_bonn_1: Primary colors ----

#' Primary colors of the University of Bonn
#'
#' \code{uni_bonn_1} provides the three primary colors 
#' (i.e., one main and two decorative colors) 
#' of the \href{https://www.uni-bonn.de/en}{University of Bonn}, Germany. 
#' 
#' The main color \code{uni blau} is defined as \code{CMYK 100/70/0/0}  
#' and approximated by \code{Pantone 286}, \code{RGB 0/78/159}, \code{HEX #004e9f}, 
#' and \code{RAL 5005}. 
#' 
#' The decorative color \code{uni gelb} is defined as \code{CMYK 0/30/100/0}  
#' and approximated by \code{Pantone 1235}, \code{RGB 252/186/0}, \code{HEX #fcba00}, 
#' and \code{RAL 1028}. 
#' 
#' The decorative color \code{uni grau} is defined as \code{CMYK 0/0/15/55}  
#' and approximated by \code{Pantone 415}, \code{RGB 144/144/133}, \code{HEX #909085}, 
#' and \code{RAL 7030}. 
#' 
#' Colors shades of 75%, 50%, and 25% may be used in diagrams or visualizations. 
#' See examples and the \code{\link{ac}} and \code{\link{usecol}} functions 
#' for creating color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-10.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.uni-bonn.de/de/universitaet/presse-kommunikation/corporate-design}{CD manual}. 
#' 
#' @examples
#' uni_bonn_1
#' seecol(uni_bonn_1, main = "Primary colors of the University of Bonn")
#' 
#' # Color gradient:
#' uni_bonn_blau_gelb <- usecol(c(uni_bonn_1[1], "white", uni_bonn_1[2]), n = 9)
#' # seecol(uni_bonn_blau_gelb, main = "Divergent color gradient of Uni Bonn")
#' demopal(uni_bonn_blau_gelb, type = "polygon", seed = 9, main = "Color gradient of Uni Bonn")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_bonn_2}} for gradient colors of the University of Bonn;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_bonn_1 <- newpal(col = c(ub_blau, ub_gelb, ub_grau),
                     names = c("uni blau", "uni gelb", "uni grau"),
                     as_df = FALSE)

# seecol(uni_bonn_1, main = "Primary colors of Uni Bonn")


# - uni_bonn_2: Gradients ----

#' Gradient colors of the University of Bonn
#'
#' \code{uni_bonn_2} provides 4 shades (of 100%, 75%, 50%, and 25%) 
#' for each of the 3 primary colors 
#' of the \href{https://www.uni-bonn.de/en}{University of Bonn}, Germany. 
#' 
#' See \code{\link{uni_bonn_1}} for the definitions of the three primary colors 
#' and the \code{\link{ac}} and \code{\link{usecol}} functions 
#' for creating color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-10.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.uni-bonn.de/de/universitaet/presse-kommunikation/corporate-design}{CD manual}. 
#' 
#' @examples
#' uni_bonn_2
#' seecol(uni_bonn_2, main = "Gradient colors of the University of Bonn")
#' demopal(uni_bonn_2, type = 3, main = "Color shades of the University of Bonn")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_bonn_1}} for primary colors of the University of Bonn;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_bonn_2 <- newpal(col = c(ub_blau_4, ub_gelb_4, ub_grau_4),
                     names = c("uni blau", "uni blau 75%", "uni blau 50%", "uni blau 25%", 
                               "uni gelb", "uni gelb 75%", "uni gelb 50%", "uni gelb 25%", 
                               "uni grau", "uni grau 75%", "uni grau 50%", "uni grau 25%"),
                     as_df = FALSE)

# seecol(uni_bonn_2, main = "Color gradients of Uni Bonn")


# Uni Freiburg: ------

# Source: https://uni-freiburg.de/universitaet/corporate-design/
# Last check: 2022-12-27  +++ here now +++ 

# 1 primary color: 

frbg_blau <- "#344A9A"  # RGB 52/74/154; HEX #344a9a; Pantone 7687C; CMYK 90/75/0/0.
names(frbg_blau) <- "Blau"

frbg_blau_gradient <- usecol(c(frbg_blau, "white"), n = 6)[1:5]  # mix with "white"
# frbg_blau_transparent <- ac(col = frbg_blau, alpha = c(1, .80, .60, .40, .20))

frbg_blues <- newpal(col =  frbg_blau_gradient,
                     names = c("Blau", "Blau_80", "Blau_60", "Blau_40", "Blau_20"),
                     as_df = FALSE)

# 4 secondary colors: 

frbg_gruen <- "#00997D"  # "#00997d"
names(frbg_gruen) <- "Gruen"

# frbg_gruen_gradient <- usecol(c(frbg_gruen, "white"), n = 6)[1:5]  # mix with "white"
# 
# frbg_green <- newpal(col =  frbg_gruen_gradient, 
#                      names = c("Gruen", "Gruen_80", "Gruen_60", "Gruen_40", "Gruen_20"),
#                      as_df = FALSE)

frbg_braun <- "#8F6B30" # "#8f6b30"
names(frbg_braun) <- "Braun"

# frbg_braun_gradient <- usecol(c(frbg_braun, "white"), n = 6)[1:5]  # mix with "white"
# 
# frbg_brown <- newpal(col =  frbg_braun_gradient, 
#                      names = c("Braun", "Braun_80", "Braun_60", "Braun_40", "Braun_20"),
#                      as_df = FALSE)

frbg_gelb <- "#FFE863"  # "#ffe863" 
names(frbg_gelb) <- "Gelb"

# frbg_gelb_gradient <- usecol(c(frbg_gelb, "white"), n = 6)[1:5]  # mix with "white"
# 
# frbg_yellow <- newpal(col =  frbg_gelb_gradient, 
#                       names = c("Gelb", "Gelb_80", "Gelb_60", "Gelb_40", "Gelb_20"),
#                       as_df = FALSE)

frbg_rosa <- "#F5C2ED" # "#f5c2ed"
names(frbg_rosa) <- "Rosa"

# frbg_rosa_gradient <- usecol(c(frbg_rosa, "white"), n = 6)[1:5]  # mix with "white"
# 
# frbg_pink <- newpal(col =  frbg_rosa_gradient, 
#                     names = c("Rosa", "Rosa_80", "Rosa_60", "Rosa_40", "Rosa_20"),
#                     as_df = FALSE)

# # Note: To create gradients, mix with "white":
# col_gradient <- usecol(c(uni_freiburg_2[1], "white"), n = 6)[1:5]  # mix with "white"
# # seecol(col_gradient, main = "Five shades")
# # to get transparent colors:
# col_transparent <- ac(col = uni_freiburg_2[1], alpha = c(1, .80, .60, .40, .20))
# # seecol(col_transparent, main = "Five transparent shades")


# - uni_freiburg_0: ----

# Basic colors only: black + Primary blue + white

#' Basic colors of the University of Freiburg 
#'
#' \code{uni_freiburg_0} provides the three basic colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' The primary color \code{Blau} (here: \code{uni_freiburg_0[2]}) is alternatively defined as 
#' \code{Pantone 7687C}, \code{RGB 52/74/154}, \code{HEX #344a9a}, or \code{CMYK 90/75/0/0}.
#' 
#' See \code{\link{uni_freiburg_1}} for a primary palette with a \code{Blau} color gradient
#' and the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2023-01-01.
#' 
#' @source 
#' Color definitions are based on the new web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{https://uni-freiburg.de/universitaet/corporate-design/} on 2023-01-01). 
#' 
#' @examples
#' uni_freiburg_0
#' seecol(uni_freiburg_0, main = "Basic colors of the University of Freiburg")
#' demopal(uni_freiburg_0, type = 5, main = "Basic colors of Freiburg University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_1}} for a primary palette of the University of Freiburg;
#' \code{\link{uni_freiburg_2}} for the secondary colors of the University of Freiburg;
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_0 <- newpal(col = c("#000000", frbg_blau, "#FFFFFF"),
                         names = c("Schwarz", "Blau", "Weiss"), 
                         as_df = FALSE)


# - uni_freiburg_1: ---- 

# Primary colors (with primary blue color gradient):

#' Primary colors of the University of Freiburg 
#'
#' \code{uni_freiburg_1} provides a primary color palette 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' The primary color \code{Blau} (here: \code{uni_freiburg_1[2]}) is alternatively defined as 
#' \code{Pantone 7687C}, \code{RGB 52/74/154}, \code{HEX #344a9a}, or \code{CMYK 90/75/0/0}.
#' 
#' The gradient of \code{Blau} was created by mixing 
#' the primary color \code{uni_freiburg_0[2]} with \code{"white"}, 
#' as in \code{usecol(c(uni_freiburg_0[2], "white"), n = 6)[1:5]}. 
#' 
#' See \code{\link{uni_freiburg_0}} for the basic colors (without the \code{Blau} color gradient) 
#' and the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2023-01-01.
#' 
#' @source 
#' Color definitions are based on the new web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{https://uni-freiburg.de/universitaet/corporate-design/} on 2023-01-01). 
#' 
#' @examples
#' uni_freiburg_1
#' seecol(uni_freiburg_1, main = "Primary color gradient of the University of Freiburg")
#' demopal(uni_freiburg_1, type = 1, main = "Primary color gradient of Freiburg University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_0}} for the basic colors of the University of Freiburg;
#' \code{\link{uni_freiburg_2}} for the secondary colors of the University of Freiburg;
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_1 <- newpal(col = c("#000000", frbg_blues, "#FFFFFF"),
                         names = c("Schwarz", "Blau", "Blau_80", "Blau_60", "Blau_40", "Blau_20", "Weiss"), 
                         as_df = FALSE)


# - uni_freiburg_2: ----

# 4 secondary colors:

#' Secondary colors of the University of Freiburg 
#'
#' \code{uni_freiburg_2} provides the four secondary colors  
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' The primary color \code{Blau} (here: \code{uni_freiburg_1[2]}) is alternatively defined as 
#' \code{Pantone 7687C}, \code{RGB 52/74/154}, \code{HEX #344a9a}, or \code{CMYK 90/75/0/0}.
#' 
#' The gradient of \code{Blau} was created by mixing 
#' the primary color \code{uni_freiburg_0[2]} with \code{"white"}, 
#' as in \code{usecol(c(uni_freiburg_0[2], "white"), n = 6)[1:5]}. 
#' 
#' See \code{\link{uni_freiburg_0}} for the basic colors without the \code{Blau} color gradient
#' and the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2023-01-01.
#' 
#' @source 
#' Color definitions are based on the new web style guide at 
#' \url{https://uni-freiburg.de/} 
#' (at \code{https://uni-freiburg.de/universitaet/corporate-design/} on 2023-01-01). 
#' 
#' @examples
#' uni_freiburg_2
#' seecol(uni_freiburg_2, main = "Secondary colors of the University of Freiburg")
#' demopal(uni_freiburg_2, type = 2, main = "Secondary colors of Freiburg University")
#'
#' # Color gradients:
#' col_gradient <- usecol(c(uni_freiburg_2[1], "white"), n = 6)[1:5]  # mix with "white"
#' col_transparent <- ac(col = uni_freiburg_2[1], alpha = c(1, .80, .60, .40, .20))
#' 
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_freiburg_0}} for the basic colors of the University of Freiburg;
#' \code{\link{uni_freiburg_1}} for a primary palette of the University of Freiburg; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_freiburg_2 <- newpal(col = c(frbg_gruen, frbg_braun, frbg_gelb, frbg_rosa),
                         names = c("Gruen", "Braun", "Gelb", "Rosa"), 
                         as_df = FALSE)



# Uni Freiburg (up to 2022-12-31): ------ 

# Source: http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben
# Last check: 2022-10-20

# - uni_freiburg_br: ----

#' Default colors of the University of Freiburg (2022)
#'
#' \code{uni_freiburg_br} provides the two default colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' The \code{_br} denotes "blue/red" or "Breisgau". 
#' 
#' \strong{Please note}: 
#' See \code{\link{uni_freiburg_0}} and \code{\link{uni_freiburg_1}} 
#' for the corresponding colors of the new corporate design (as of 2023). 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on the web style guide at 
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

#' Blue colors of the University of Freiburg (2022)
#'
#' \code{uni_freiburg_blue} provides the blue colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' \strong{Please note}: 
#' See \code{\link{uni_freiburg_1}} 
#' for the corresponding colors of the new corporate design (as of 2023). 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on the web style guide at 
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

#' Grey colors of the University of Freiburg (2022)
#'
#' \code{uni_freiburg_grey} provides the grey colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' \strong{Please note}: 
#' See \code{\link{uni_freiburg_0}} and \code{\link{uni_freiburg_1}}  
#' for the corresponding colors of the new corporate design (as of 2023). 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on the web style guide at 
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

#' Info colors of the University of Freiburg (2022)
#'
#' \code{uni_freiburg_info} provides the info colors 
#' of the \href{https://uni-freiburg.de/}{University of Freiburg}, Germany. 
#' 
#' \strong{Please note}: 
#' See \code{\link{uni_freiburg_1}} and \code{\link{uni_freiburg_2}}  
#' for the corresponding colors of the new corporate design (as of 2023). 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-10-20.
#' 
#' @source 
#' Color definitions are based on the web style guide at 
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







# Uni Hamburg: ------

# Source: PDF of Corporate Manual („Master Styleguide“) at   
# <https://www.kus.uni-hamburg.de/themen/oeffentlichkeitsarbeit/corporate-design/corporate-manual.html>
# Last check: 2022-12-06

# GESTALTUNGSKONZEPT (p. 18 of PDF manual)
# 
# Die Hauptfarben des Corporate Designs der Universität Hamburg sind 
# Rot (CMYK 0/100/100/0) und Blau (CMYK 87/49/0/0) – barrierefreier Blauton. 
# Diese leiten sich zum einen vom Rot des Uni-Logos ab, zum anderen soll das Blau 
# die Nähe der Stadt Hamburg und damit die Nähe zum Wasser symbolisieren. 
# Das Blau transportiert ebenso Raum und Perspektive. 
# Schwarz wird für den Fließtext verwendet. 
# Als Alternative kann das Steingrau verwendet werden. 
# Für Tabellen/Diagramme und Organigramme dürfen auch Abstufungen von 
# Rot, Blau und Steingrau verwendet werden (siehe Seite 25). 
# 
# Wichtig:
# - Blau und Rot sollen subtil eingesetzt werden, nicht zu bunt: 
#   eher Designelemente wie Linien einfärben, keine ganzen Textpassagen.
# - Gewichtung der beiden Farben muss gleich sein
# 
# Rot       CMYK 0/100/100/0  RGB: 226/0/26   #e2001a  HKS: 14  Pantone: 485C
# Blau      CMYK 87/49/0/0    RGB: 2/113/187  #0271bb
# Schwarz   CMYK 0/0/0/100    RGB: 0/0/0      #000000
# Steingrau CMYK 45/11/11/73  RGB: 59/81/91   #3b515b           Pantone: 432U

# - uni_hamburg_1: Primary colors ----

#' Primary colors of the University of Hamburg
#'
#' \code{uni_hamburg_1} provides the four primary colors 
#' of the \href{https://www.uni-hamburg.de/}{University of Hamburg}, Germany. 
#' 
#' The two main colors are \code{"rot"} (also defined as Pantone 485C or CMYK 0/100/100/0) 
#' and \code{"blau"} (also defined as CMYK 87/49/0/0). 
#' These colors should be weighted equally and in a subtle fashion 
#' (i.e., as color accents, not large areas or entire texts).
#' 
#' The auxiliary colors \code{"black"} and 
#' \code{"steingrau"} (also defined as Pantone 432U or CMYK 45/11/11/73) 
#' are used for text.
#' 
#' Colors shades may be used in diagrams or visualizations. 
#' See examples and the \code{\link{ac}} and \code{\link{usecol}} functions 
#' for creating color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-06.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.kus.uni-hamburg.de/themen/oeffentlichkeitsarbeit/corporate-design/corporate-manual.html}{CD manual}. 
#' 
#' @examples
#' uni_hamburg_1
#' seecol(uni_hamburg_1, main = "Primary colors of the University of Hamburg")
#' demopal(uni_hamburg_1, type = 3, main = "Primary colors of the Uni Hamburg")
#' 
#' # Color gradients:
#' seecol(usecol(c(uni_hamburg_1[1], uni_hamburg_1[2]), n = 6), main = "HHU rot to blau")
#' seecol(usecol(c(uni_hamburg_1[1], "white", uni_hamburg_1[2]), n = 7), main = "Divergent HHU")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_hamburg_2}} for visualization colors of the University of Hamburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_hamburg_1 <- newpal(col = c("#E2001A", "#0271BB",  "#000000", "#3B515B"),
                        names = c("rot", "blau",  "schwarz", "steingrau"),
                        as_df = FALSE)

# seecol(uni_hamburg_1, main = "Primary colors of Uni Hamburg")

# # See gradients:
# seecol(usecol(c(uni_hamburg_1[1], uni_hamburg_1[2]), n = 7))
# seecol(usecol(c(uni_hamburg_1[1], "white", uni_hamburg_1[2]), n = 7))


# Schaubilder (p. 25 of PDF manual)
#
# Rot CMYK 0/100/100/0 RGB: 226/0/26
# Rot (mit 50% Deckkraft) CMYK 0/61/35/0 RGB: 240/130/136
# 
# Blau CMYK 87/49/0/0 RGB: 2/113/187 
# Blau (mit 50% Deckkraft) CMYK 53/15/7/0 RGB: 128/184/219
# 
# Steingrau CMYK 45/11/11/73 RGB: 59/81/91 
# Steingrau (mit 40% Deckkraft) CMYK 34/21/22/3 RGB: 178/186/189
# 
# Achten Sie unbedingt auch auf einen ausreichenden Kontrast, wenn Sie z.B. 
# Text auf einer Farbfläche platzieren, um die Barrierefreiheit zu gewährleisten. 
# Weitere Infos dazu: https://www.leserlich.info

rot_50pc       <- rgb(240, 130, 136, maxColorValue = 255)
blau_50pc      <- rgb(128, 184, 219, maxColorValue = 255)
steingrau_40pc <- rgb(178, 186, 189, maxColorValue = 255)


# - uni_hamburg_2: Pair-wise colors / for visualizations ----

#' Secondary colors of the University of Hamburg
#'
#' \code{uni_hamburg_2} provides three primary colors 
#' of the \href{https://www.uni-hamburg.de/}{University of Hamburg}, Germany, 
#' in combination with two pair-wise variants of them. 
#' 
#' \code{uni_hamburg_2} is to be used in visualizations. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-06.
#' 
#' @source 
#' Color definitions are based on the 
#' \href{https://www.kus.uni-hamburg.de/themen/oeffentlichkeitsarbeit/corporate-design/corporate-manual.html}{CD manual}. 
#' 
#' @examples
#' uni_hamburg_2
#' seecol(uni_hamburg_2, main = "Visualization colors of the University of Hamburg")
#' demopal(uni_hamburg_2, type = 1, main = "Secondary colors of the Uni Hamburg")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_hamburg_1}} for primary colors of the University of Hamburg;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_hamburg_2 <- newpal(col = c("#E2001A", rot_50pc, "#0271BB", blau_50pc, "#3B515B", steingrau_40pc),
                        names = c("rot", "rot 50%", "blau", "blau 50%", "steingrau", "steingrau 40%"),
                        as_df = FALSE)

# seecol(uni_hamburg_2, main = "Pair-wise colors of Uni Hamburg")



# Uni Koeln: ------

# Source: PDF handbook at 
# <https://kommunikation-marketing.uni-koeln.de/marketing/corporate_design/index_ger.html>
# <https://www.designtagebuch.de/cd-manuals/uni-koeln-corporate-design-handbuch.pdf>
# Last check: 2022-12-04

# Hausfarben:

# # Blaugrau: 
# R 227 / G 232 / B 235 : heller Fond (50%)  Note Error: "font"? 
# R 200 / G 209 / B 219 : Blaugrau hell 
# R 165 / G 182 / B 199 : Blaugrau mittel
# R 122 / G 147 / B 171 : Blaugrau 
# R  74 / G 101 / B 125 : Blaugrau dunkel
# R  50 / G  71 / B  91 : Blauschwarz

koeln_bg_1 <- rgb(227, 232, 235, maxColorValue = 255)
koeln_bg_2 <- rgb(200, 209, 219, maxColorValue = 255)
koeln_bg_3 <- rgb(165, 182, 199, maxColorValue = 255)
koeln_bg_4 <- rgb(122, 147, 171, maxColorValue = 255)
koeln_bg_5 <- rgb( 74, 101, 125, maxColorValue = 255)
koeln_bg_6 <- rgb( 50,  71,  91, maxColorValue = 255)

# # Signalfarbe Rot:
# R 175 / G 17 / B 29

koeln_si_1 <- rgb(175, 17, 29, maxColorValue = 255)


# - uni_koeln_1: Shades of blaugrau und red signal color ----

#' Primary colors of the University of Koeln (Cologne) 
#'
#' \code{uni_koeln_1} provides the primary colors 
#' of the \href{https://www.uni-koeln.de/}{Universitaet zu Koeln}, Germany. 
#' 
#' The first 6 colors are variants of the main color \code{blaugrau} 
#' (defined as R122.G147.B171, see \code{uni_koeln_1[4]}). 
#' 
#' The 7th color is the accent color \code{signal rot} 
#' (defined as Pantone Red 032 C or R175.G17.B29, see \code{uni_koeln_1[7]}). 
#' The accent color may also be used in lighter shades of 80%, 60%, or 40%.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-05.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://kommunikation-marketing.uni-koeln.de/marketing/corporate_design/index_ger.html}. 
#' 
#' @examples
#' uni_koeln_1
#' seecol(uni_koeln_1, main = "Primary colors of Uni Koeln")  # view palette
#' demopal(uni_koeln_1, type = 4, 
#'         main = "Primary colors at the University of Cologne")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_koeln_2}} for departmental colors of the University of Koeln;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_koeln_1 <- newpal(col = c(koeln_bg_1, koeln_bg_2, koeln_bg_3, koeln_bg_4, koeln_bg_5, koeln_bg_6, koeln_si_1),
                      names = c("heller font", "blaugrau hell", "blaugrau mittel", "blaugrau", "blaugrau dunkel", "blauschwarz", "signal rot"),
                      as_df = FALSE)

# seecol(uni_koeln_1, main = "Primary colors of Uni Cologne")

# Codierfarben
# 
# Jede Fakultät sowie die Universitätsverwaltung verfügen über einen eigenen definierten Farbton. 
# Diese eignen sich hervorragend für die Gestaltung von Informationsschriften und verbinden Individualität mit Tradition.

# # RGB (ECI-RGB.ICC): 
# R 131 / G 175 / B  35 : Grün :  Wirtschafts-/Sozialwissenschaftliche Fakultät
# R 125 / G  50 / B  29 : Bordeaux : Rechtswissenschaftliche Fakultät 
# R 175 / G  17 / B  29 : Rot : Medizinische Fakultät
# R  89 / G  15 / B 104 : Violett : Philosophische Fakultät
# R   0 / G 130 / B 198 : Blau : Mathematisch-Naturwissenschaftliche Fakultät
# R 219 / G 166 / B  25 : Orange: Humanwissenschaftlicheschaftliche Fakultät 
# R 145 / G 196 / B 234 : Hellblau: Verwaltung 

koeln_fa_1 <- rgb(131, 175,  35, maxColorValue = 255)
koeln_fa_2 <- rgb(125,  50,  29, maxColorValue = 255)
koeln_fa_3 <- rgb(175,  17,  29, maxColorValue = 255)
koeln_fa_4 <- rgb( 89,  15, 104, maxColorValue = 255)
koeln_fa_5 <- rgb(  0, 130, 198, maxColorValue = 255)
koeln_fa_6 <- rgb(219, 166,  25, maxColorValue = 255)
koeln_fa_7 <- rgb(145, 196, 234, maxColorValue = 255)


# - uni_koeln_2: Codierfarben / Departmental colors ----

#' Departmental colors of the University of Koeln (Cologne) 
#'
#' \code{uni_koeln_2} provides the departmental (faculty) colors 
#' of the \href{https://www.uni-koeln.de/}{Universitaet zu Koeln}, Germany. 
#' 
#' The named colors of \code{uni_koeln_2} correspond to the following departments:
#' 
#' \enumerate{
#' \item \code{gruen}: Wirtschafts-/Sozialwissenschaftliche Fakultaet
#' \item \code{bordeaux}: Rechtswissenschaftliche Fakultaet 
#' \item \code{rot}: Medizinische Fakultaet
#' \item \code{violett}: Philosophische Fakultaet
#' \item \code{blau}: Mathematisch-Naturwissenschaftliche Fakultaet
#' \item \code{orange}: Humanwissenschaftlicheschaftliche Fakultaet 
#' \item \code{hellblau}: Verwaltung 
#' }
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-05.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://kommunikation-marketing.uni-koeln.de/marketing/corporate_design/index_ger.html}. 
#' 
#' @examples
#' uni_koeln_2
#' seecol(uni_koeln_2, main = "Departmental colors of Uni Koeln")  # view palette
#' demopal(uni_koeln_2, type = 3, 
#'         main = "Department colors at the University of Cologne")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_koeln_1}} for primary colors of the University of Koeln;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_koeln_2 <- newpal(col = c(koeln_fa_1, koeln_fa_2, koeln_fa_3, koeln_fa_4, koeln_fa_5, koeln_fa_6, koeln_fa_7),
                      names = c("gruen", "bordeaux", "rot", "violett", "blau", "orange", "hellblau"),
                      as_df = FALSE)

# seecol(uni_koeln_2, main = "Departmental colors of Uni Cologne")


# Uni Konstanz: ------

# Sources: 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/ 
# Last check: 2022-10-20


# - uni_konstanz_1: ---- 

#' Default colors of the University of Konstanz 
#'
#' \code{uni_konstanz_1} provides the default color palette 
#' of the \href{https://www.uni-konstanz.de/}{University of Konstanz}, Germany. 
#' 
#' The \strong{unikn} package provides many additional color palettes for 
#' the \href{https://www.uni-konstanz.de/}{University of Konstanz}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-30.
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
#' uni_konstanz_1
#' seecol(uni_konstanz_1, main = "Default colors of the University of Konstanz")
#' demopal(uni_konstanz_1, type = 4, main = "Using Uni Konstanz colors", seed = 1)
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_konstanz_2}} for the preferred colors of the University of Konstanz;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_konstanz_1 <- newpal(col = pal_unikn,
                         names = names(pal_unikn),
                         as_df = FALSE)


# - uni_konstanz_2: ---- 

#' Preferred colors of the University of Konstanz 
#'
#' \code{uni_konstanz_2} provides the palette of preferred colors  
#' of the \href{https://www.uni-konstanz.de/}{University of Konstanz}, Germany.
#' 
#' The \strong{unikn} package provides many additional color palettes for 
#' the \href{https://www.uni-konstanz.de/}{University of Konstanz}. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character). 
#' 
#' @author 
#' \strong{unikn}, 2022-10-20.
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
#' uni_konstanz_2
#' seecol(uni_konstanz_2, main = "Preferred colors of the University of Konstanz")  
#' demopal(uni_konstanz_2, type = 3, main = "Preferred colors of the Uni Konstanz")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_konstanz_1}} for the default colors of the University of Konstanz;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_konstanz_2 <- newpal(col = pal_unikn_pref,
                         names = names(pal_unikn_pref),
                         as_df = FALSE)



# Uni Mannheim: ------ 

# Source: https://www.uni-mannheim.de/cd/marke/farben/
# 2022-12-28

# Grundfarbe "blau":
# RGB 0/48/86 / Pantone 654 / CMYK 100/60/10/60 / RAL 5011

UM_blau <- rgb(0, 48, 86, maxColorValue = 255)

# Gradient: 100% + 6 shades of 85 70 55 40 25 10:
UM_blau_10 <- usecol(c(UM_blau, "white"), n = 11)[10]
UM_blau_gr <- usecol(c(UM_blau, UM_blau_10), 7)

# Akzentfarbe "silber":
# RGB 179/182/185 / Pantone 887 / CMYK 35/25/25/0 / RAL 9006
UM_silber <- rgb(179, 182, 185, maxColorValue = 255)

# Fakultät für Rechtswissenschaft und Volkswirtschaftslehre: Akzentfarbe Graublau 
UM_graublau <- rgb(131, 153, 176, maxColorValue = 255)

# Fakultät für Betriebswirtschaftslehre: Akzentfarbe Grün
UM_gruen <- rgb(148, 177, 102, maxColorValue = 255)

# Fakultät für Sozialwissenschaften: Akzentfarbe Orange
UM_orange <- rgb(223, 126, 80, maxColorValue = 255)

# Philosophische Fakultät: Akzentfarbe Rot
UM_rot <- rgb(195, 46, 55, maxColorValue = 255)

# Fakultät für Wirtschaftsinformatik und Wirtschaftsmathematik: Akzentfarbe Petrol
UM_petrol <- rgb(65, 137, 134, maxColorValue = 255)


# - uni_mannheim_0: 
#
# # Main color + accent color: 
# 
# uni_mannheim_0 <- newpal(col = c(UM_blau, UM_silber), 
#                          names = c("blau", "silber"),
#                          as_df = FALSE)
# 
# # seecol(uni_mannheim_0, main = "Main colors of Uni Mannheim")


# - uni_mannheim_1: ----

#' Main color gradient of the University of Mannheim 
#'
#' \code{uni_mannheim_1} provides a color gradient of 
#' the primary \code{blau} color and six lighter shades 
#' of the \href{https://www.uni-mannheim.de/}{University of Mannheim}, Germany. 
#' 
#' The primary color \code{blau} is alternatively defined as 
#' \code{RGB 0/48/86}, \code{HEX #003056}, \code{Pantone 654}, \code{CMYK 100/60/10/60}, or \code{RAL 5011}. 
#' 
#' The six lighter shades were created by mixing the primary \code{blau} with \code{"white"}.  
#' See the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#'  
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-28.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-mannheim.de/cd/marke/farben/}. 
#' 
#' @examples
#' uni_mannheim_1
#' seecol(uni_mannheim_1, main = "Main color gradient of the University of Mannheim")
#' demopal(uni_mannheim_1, type = 1, 
#'         main = "Main color gradient of Mannheim University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_mannheim_2}} provides the primary and accent colors of the University of Mannheim;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_mannheim_1 <- newpal(col = UM_blau_gr,
                         names = c("blau", "blau_85", "blau_70", "blau_55", "blau_40", "blau_25", "blau_10"),
                         as_df = FALSE)

# seecol(uni_mannheim_1, main = "Main 'blau' color gradient of Uni Mannheim")


# - uni_mannheim_2: ----

#' Primary and departmental accent colors of the University of Mannheim
#'
#' \code{uni_mannheim_2} provides the primary color \code{blau}, 
#' the main accent color \code{silber}, and 
#' five departmental accent colors (\code{graublau}, \code{gruen}, \code{orange}, \code{rot}, and \code{petrol})
#' of the the \href{https://www.uni-mannheim.de/}{University of Mannheim}, Germany. 
#' 
#' \code{uni_mannheim_2} contains the following colors:
#' 
#' \enumerate{
#' 
#' \item \code{blau}: The primary color is alternatively defined as 
#'       \code{RGB 0/48/86}, \code{HEX #003056}, \code{Pantone 654}, \code{CMYK 100/60/10/60}, or \code{RAL 5011}. 
#' 
#' \item \code{silber}: The main accent color is alternatively defined as 
#'       \code{RGB 179/182/185}, \code{HEX #B3B6B9}, \code{Pantone 887}, \code{CMYK 35/25/25/0}, or \code{RAL 9006}. 
#' 
#' \item \code{graublau}: Accent color for 'Rechtswissenschaft und Volkswirtschaftslehre'
#' 
#' \item \code{gruen}: Accent color for 'Betriebswirtschaftslehre' 
#' 
#' \item \code{orange}: Accent color for 'Sozialwissenschaften'
#' 
#' \item \code{rot}: Accent color for 'Philosophie'  
#' 
#' \item \code{petrol}: Accent color for 'Wirtschaftsinformatik und Wirtschaftsmathematik'
#' 
#' }
#' 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-28.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-mannheim.de/cd/marke/farben/}. 
#' 
#' @examples
#' uni_mannheim_2
#' seecol(uni_mannheim_2, main = "Main and accent colors of the University of Mannheim")
#' demopal(uni_mannheim_2, type = 4, seed = 7, 
#'         main = "Main and department accent colors of Mannheim University")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_mannheim_1}} provides a primary color gradient for the University of Mannheim;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_mannheim_2 <- newpal(col = c(UM_blau, UM_silber, UM_graublau, UM_gruen, UM_orange, UM_rot, UM_petrol),
                         names = c("blau", "silber", "graublau", "gruen", "orange", "rot", "petrol"),
                         as_df = FALSE)

# seecol(uni_mannheim_2, main = "Main + accent colors of Uni Mannheim")


# Uni Princeton: ------

# Source: https://communications.princeton.edu/guides-tools/logo-graphic-identity
# Last check: 2022-11-28

# 3 shades of orange: 
orange_basic <- "#E87722"  # Pantone 158 C
orange_white <- "#E77500"  # orange on white background (see <https://en.wikipedia.org/wiki/Shades_of_orange#Princeton_orange>)
orange_black <- "#F58025"  # orange on black background

# - uni_princeton_0: ----

#' Basic colors of Princeton University 
#'
#' \code{uni_princeton_0} provides the two basic colors 
#' of \href{https://www.princeton.edu/}{Princeton University}, NJ, USA. 
#' 
#' Note that 
#' \href{https://en.wikipedia.org/wiki/Shades_of_orange#Princeton_orange}{Wikipedia: Shades of orange} 
#' defines \code{uni_princeton_2[1]} as "Princeton orange". 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-28.
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
                          names = c("Princeton orange", "black"),
                          as_df = FALSE)


# - uni_princeton_1: ----

#' Colors of Princeton University (on white backgrounds) 
#'
#' \code{uni_princeton_1} provides the two basic colors 
#' of \href{https://www.princeton.edu/}{Princeton University}, NJ, USA, 
#' for use on white backgrounds. 
#' 
#' Note that 
#' \href{https://en.wikipedia.org/wiki/Shades_of_orange#Princeton_orange}{Wikipedia: Shades of orange} 
#' defines \code{uni_princeton_2[1]} as "Princeton orange". 
#' 
#' The color \code{"white"} was added to enable symmetrical color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-28.
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
#' Note that 
#' \href{https://en.wikipedia.org/wiki/Shades_of_orange#Princeton_orange}{Wikipedia: Shades of orange} 
#' defines \code{uni_princeton_2[1]} as "Princeton orange". 
#' 
#' The color \code{"black"} was added to enable symmetrical color gradients.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-28.
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

UR_rotbraun <-    rgb(114,  75,  81, names = "rotbraun",    maxColorValue = 255) # Zentrum für Sprache und Kommunikation (ZSK)
UR_perlviolett <- rgb( 86,  78, 111, names = "perlviolett", maxColorValue = 255) # Europaeum (Ost-West-Zentrum)
UR_violettrot <-  rgb( 59,   0,  65, names = "violettrot",  maxColorValue = 255) # Zentrum für Hochschul- und Wissenschaftsdidaktik (ZHW)
UR_gruenbraun <-  rgb(134, 104,   0, names = "gruenbraun",  maxColorValue = 255) # Regensburger Universitätszentrum für Lehrerbildung (RUL)
UR_wasserblau <-  rgb(  0, 129, 123, names = "wasserblau",  maxColorValue = 255) # Sportzentrum (SZ)

UR_urangelb <-           rgb(205, 211,  15, names = "urangelb",    maxColorValue = 255) # Rechtswissenschaft
UR_laerchennadelgruen <- rgb(174, 167,   0, names = "laerchennadelgruen", maxColorValue = 255) # Wirtschaftswissenschaften
UR_vatikangelb <-        rgb(236, 188,   0, names = "vatikangelb", maxColorValue = 255) # Katholische Theologie
UR_orangerot <-          rgb(236,  98,   0, names = "orangerot",   maxColorValue = 255) # Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
UR_heucherarot <-        rgb(191,   0,  42, names = "heucherarot", maxColorValue = 255) # Humanwissenschaften
UR_heidenelkenrot <-     rgb(156,   0,  75, names = "heidenelkenrot", maxColorValue = 255) # Sprach-, Literatur- und Kulturwissenschaften
UR_blattgruen <-         rgb( 79, 184,   0, names = "blattgruen",   maxColorValue = 255) # Biologie und Vorklinische Medizin
UR_tuerkisgruen <-       rgb(  0, 155, 119, names = "tuerkisgruen", maxColorValue = 255) # Mathematik
UR_eisvogelblau <-       rgb(  0, 137, 147, names = "eisvogelblau", maxColorValue = 255) # Physik
UR_spektralblau <-       rgb(  0, 135, 178, names = "spektralblau", maxColorValue = 255) # Chemie und Pharmazie
UR_capriblau <-          rgb(  0,  85, 106, names = "capriblau",    maxColorValue = 255) # Medizin
UR_glutrot <-            rgb(218,  60,  67, names = "glutrot",      maxColorValue = 255) # Informatik und Data Science

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
#' Named colors of \code{uni_regensburg_1} correspond to the following UR services:
#' 
#' \enumerate{
#' \item \code{neutralgrau}: Main color (UR-Hausfarbe, Logo)  
#' \item \code{blaugrau}: Leitung, Organe und Verwaltung (LOV, Ausnahme: Referate I/3, I/4, I/5, I/6)
#' \item \code{schwarzrot}: Chancengleichheit und Familie (Familien-Service, Frauenbeauftragte, Frauenfoerderung, Gleichstellung)
#' \item \code{schilfgruen}: Service-Einrichtungen der Verwaltung für Studierende (Akademisches Auslandsamt, Studentenkanzlei, Zentrales Pruefungssekretariat, Zentrale Studienberatung, Senatsbeauftragter für Behinderte und chronisch Kranke) 
#' \item \code{dianthusrot}: Universitaetsbibliothek (UB)
#' \item \code{saphirblau}: Rechenzentrum (RZ)
#' \item \code{farngruen}: Zentrum fuer Weiterbildung
#' \item \code{rotbraun}: Zentrum fuer Sprache und Kommunikation (ZSK)
#' \item \code{perlviolett}: Europaeum (Ost-West-Zentrum)
#' \item \code{violettrot}: Zentrum fuer Hochschul- und Wissenschaftsdidaktik (ZHW)
#' \item \code{gruenbraun}: Regensburger Universitätszentrum fuer Lehrerbildung (RUL)
#' \item \code{wasserblau}: Sportzentrum (SZ)
#' }
#' 
#' When coloring large areas, named colors may be used in shades of 70%.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-25.
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
#' Named colors of \code{uni_regensburg_2} correspond to the following UR faculties:
#' 
#' \enumerate{
#' \item \code{urangelb}: Rechtswissenschaft
#' \item \code{laerchennadelgruen}: Wirtschaftswissenschaften
#' \item \code{vatikangelb}: Katholische Theologie
#' \item \code{orangerot}: Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
#' \item \code{heucherarot}: Humanwissenschaften
#' \item \code{heidenelkenrot}: Sprach-, Literatur- und Kulturwissenschaften
#' \item \code{blattgruen}: Biologie und Vorklinische Medizin
#' \item \code{tuerkisgruen}: Mathematik
#' \item \code{eisvogelblau}: Physik
#' \item \code{spektralblau}: Chemie und Pharmazie
#' \item \code{capriblau}: Medizin
#' \item \code{glutrot}: Informatik und Data Science
#' }
#' 
#' When coloring large areas, named colors can be used in shades of 70%.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-30.
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
                                   UR_spektralblau, UR_capriblau, UR_glutrot), 
                           as_df = FALSE)

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
#' Named colors of \code{uni_regensburg_3} correspond to the following UR faculties:
#' 
#' \enumerate{
#' \item \code{urangelb}: Rechtswissenschaft
#' \item \code{laerchennadelgruen}: Wirtschaftswissenschaften
#' \item \code{vatikangelb}: Katholische Theologie
#' \item \code{orangerot}: Philosophie, Kunst-, Geschichts- und Gesellschaftswissenschaften
#' \item \code{heucherarot}: Humanwissenschaften
#' \item \code{heidenelkenrot}: Sprach-, Literatur- und Kulturwissenschaften
#' \item \code{blattgruen}: Biologie und Vorklinische Medizin
#' \item \code{tuerkisgruen}: Mathematik
#' \item \code{eisvogelblau}: Physik
#' \item \code{spektralblau}: Chemie und Pharmazie
#' \item \code{capriblau}: Medizin
#' \item \code{glutrot}: Informatik und Data Science
#' }
#' 
#' Note that the font color glutrot is currently identical to the area color of \code{\link{uni_regensburg_2}}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-11-30.
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


# Uni Ulm: ------

# Motto: "Sciendo, Docendo, Curando"

# Source: <https://www.uni-ulm.de/misc/corporate-design/#c875952>
# Last check: 2022-12-29

# Das Basis-Farbklima der Universität Ulm beruht auf den Farben Schwarz, Dunkelgrau, Hellblau und Weiß.
# Dieses wird jeweils um die Fakultätsfarben und ihre Abstufungen erweitert.
# Die Akzentfarbe kann als untergeordnete Schmuckfarbe eingesetzt werden.

# Hausfarben erster Ordnung: 
# 1. schwarz: "black"
# 2. dunkelgrau: Pantone 431C / CMYK 0/0/0/80
UU_dunkelgrau <- rgb(87, 87, 86, maxColorValue = 255)
# 3. hellblau: Pantone 5425C / CMYK 30/0/0/35 
UU_hellblau <- rgb(125, 154, 170, maxColorValue = 255)
# 4. weiss: "white"
#
# +: UU Akzent:
UU_akzent <- rgb(169, 162, 141, maxColorValue = 255)

# Fakultätsfarben:
# 1. Medizin:
UU_blau <- rgb(38, 84, 124, maxColorValue = 255)
# 2. Ingenieurwissenschaften, Informatik und Psychologie:
UU_rot <- rgb(163, 38, 56, maxColorValue = 255)
# 3. Mathematik und Wirtschaftswissenschaften:
UU_gruen <- rgb(86, 170, 28, maxColorValue = 255)  # Note: ERROR in HEX definition (same as for "rot"). 
# 4. Naturwissenschaften:
UU_orange <- rgb(223, 109, 7, maxColorValue = 255)


# - uni_ulm_1: ---- 

#' Main colors of the University of Ulm  
#'
#' \code{uni_ulm_1} provides the basic or main colors 
#' of the \href{https://www.uni-ulm.de/}{University of Ulm}, Germany. 
#' 
#' The color \code{hellblau} is alternatively defined as 
#' \code{RGB 125/154/170}, \code{HEX #7D9AAA}, \code{Pantone 5425 C}, or \code{CMYK 30/0/0/35}. 
#'
#' The color \code{dunkelgrau} is alternatively defined as 
#' \code{RGB 87/87/86}, \code{HEX #575756}, \code{Pantone 431 C}, or \code{CMYK 0/0/0/80}. 
#' 
#' The auxiliary color \code{akzent} is used for decorative elements. 
#' It is alternatively defined as 
#' \code{RGB 169/162/141}, \code{HEX #A9A28D}, \code{Pantone 7536 C}, or \code{CMYK 0/0/28/38}. 
#'
#' See the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#'  
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-29.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-ulm.de/misc/corporate-design/#c875952}. 
#' 
#' @examples
#' uni_ulm_1
#' seecol(uni_ulm_1, main = "Main colors of the University of Ulm")
#' demopal(uni_ulm_1, type = 1, 
#'         main = "Main colors of Ulm University")
#'         
#' # 5-color gradient:
#' uni_ulm_5 <- usecol(c(uni_ulm_1["hellblau"], "white"), n = 6)[1:5]
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_ulm_2}} for the departmental accent colors of the University of Ulm;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_ulm_1 <- newpal(col = c("black", UU_dunkelgrau, UU_hellblau, "white", UU_akzent),
                    names = c("schwarz", "dunkelgrau", "hellblau", "weiss", "akzent"),
                    as_df = FALSE)

# seecol(uni_ulm_1, main = "Main colors of the University of Ulm")


# - uni_ulm_2: ---- 

#' Departmental colors of the University of Ulm  
#'
#' \code{uni_ulm_2} provides the four departmental colors 
#' of the \href{https://www.uni-ulm.de/}{University of Ulm}, Germany. 
#' 
#' The named colors of \code{uni_ulm_2} correspond to the following departments:
#' 
#' \enumerate{
#' \item \code{blau}: Medizin
#' \item \code{rot}: Ingenieurwissenschaften, Informatik und Psychologie
#' \item \code{gruen}: Mathematik und Wirtschaftswissenschaften
#' \item \code{orange}: Naturwissenschaften 
#' }
#' 
#' See the \code{\link{ac}} and \code{\link{usecol}} functions for creating color gradients. 
#'  
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-29.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://www.uni-ulm.de/misc/corporate-design/#c875952}. 
#' 
#' @examples
#' uni_ulm_2
#' seecol(uni_ulm_2, main = "Department colors of the University of Ulm")
#' demopal(uni_ulm_2, type = 2, seed = 123,
#'         main = "Departmental colors of Ulm University")
#'         
#' # 5-color gradient:
#' uni_ulm_5 <- usecol(c(uni_ulm_2["rot"], "white"), n = 6)[1:5]
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{uni_ulm_1}} for the main colors of the University of Ulm;  
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

uni_ulm_2 <- newpal(col = c(UU_blau, UU_rot, UU_gruen, UU_orange),
                    names = c("blau", "rot", "gruen", "orange"),
                    as_df = FALSE)

# seecol(uni_ulm_2, main = "Departmental colors of the University of Ulm")



# RPI: Rensselaer Polytechnic Institute: ------ 

# Source: <https://scer.rpi.edu/brand-in-action/colors>
# 2022-12-01

# - rpi_pal_1: Primary use colors of RPI ---- 

# Primary Use Colors
#
# Primary Colors: The primary colors for the Rensselaer identity system are Primary Red, 
# Light Gray, Dark Gray, Black, and White. Formulas for use and printing are provided below. 
# These colors represent the core colors and should provide the foundation for the palette used. 
# Their usage should be dominant to secondary colors.

# Primary Red
# C0 M97 Y100 K3
# R214 G0 B28
# #d6001c
# PMS: 2035

rpi_0 <- "#d6001c"

# Light Gray
# C19 M12 Y13 K34
# R158 G162 B162
# #9ea2a2
# PMS: 422

rpi_1 <- "#9ea2a2"

# Dark Gray
# C48 M29 Y26 K76
# R84 G88 B90
# #54585a
# PMS: 425

rpi_2 <- "#54585a"

# Black
# C0 M0 Y0 K100
# R0 G0 B0
# #000000
# 
# White
# C0 M0 Y0 K0
# R255 G255 B255
# #fffff

#' Primary colors of RPI 
#'
#' \code{rpi_pal_1} provides the primary colors of the 
#' \href{https://www.rpi.edu/}{Rensselaer Polytechnic Institute} (RPI), Troy, NY.
#' 
#' These colors represent the core colors and should provide the foundation for the palette used. 
#' Their usage should dominate the use of the secondary colors of \code{\link{rpi_pal_2}} 
#' and their tint variants of \code{\link{rpi_pal_3}}.
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-01.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://scer.rpi.edu/brand-in-action/colors}. 
#' 
#' @examples
#' rpi_pal_1
#' seecol(rpi_pal_1, main = "The primary colors of RPI")  # view color palette
#' demopal(rpi_pal_1, type = 3, main = "Primary colors of RPI")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{rpi_pal_2}} for secondary colors of RPI; 
#' \code{\link{rpi_pal_3}} for tint colors of RPI; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

rpi_pal_1 <- newpal(col = c(rpi_0, rpi_1, rpi_2, "black", "white"), 
                    names = c("RPI primary red", "RPI light gray", "RPI dark gray", "black", "white"), 
                    as_df = FALSE)

# seecol(rpi_pal_1, main = "Primary Use Colors of RPI")


# - rpi_pal_2: Secondary use colors of RPI ---- 

# Secondary Use Colors
#
# Secondary Colors: The secondary colors should be used as accent colors alongside the primary colors. 
# This brings more color to our branded print, digital assets, and websites.

# Dark Red, C0 M98 Y91 K30, R171 G35 B40, #ab2328, PMS: 7621
# Dark Blue, C100 M85 Y5 K36, R0 G32 B91, #00205b, PMS: 281
# Light Blue, C47 M4 Y16 K16, R127 G169 B174, #7fa9ae, PMS: 5493

#' Secondary colors of RPI 
#'
#' \code{rpi_pal_2} provides the secondary use colors of the 
#' \href{https://www.rpi.edu/}{Rensselaer Polytechnic Institute} (RPI), Troy, NY.
#' 
#' The colors of \code{rpi_pal_2} should be used in combination with  
#' the primary colors of \code{\link{rpi_pal_1}} to add color accents 
#' to digital and print materials. 
#' 
#' \code{\link{rpi_pal_3}} provides tint variants of these colors. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-01.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://scer.rpi.edu/brand-in-action/colors}. 
#' 
#' @examples
#' rpi_pal_2
#' seecol(rpi_pal_2, main = "The secondary colors of RPI")  # view color palette
#' demopal(rpi_pal_2, type = 5, main = "Secondary colors of RPI")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{rpi_pal_1}} for primary colors of RPI; 
#' \code{\link{rpi_pal_3}} for tint colors of RPI; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

rpi_pal_2 <- newpal(col = c("#ab2328", "#00205b", "#7fa9ae"), 
                    names = c("RPI dark red", "RPI dark blue", "RPI light blue"), 
                    as_df = FALSE)

# seecol(rpi_pal_2, main = "Secondary Use Colors of RPI")


# - rpi_pal_3: Tint use colors of RPI ---- 

# Tint Colors

# Dark Red
# Tint: 75%, HEX: #c35442
# Tint: 50%, HEX: #d58570
# Tint: 25%, HEX: #eabcad
# 
# Dark Blue
# Tint: 75%, HEX: #2b517f
# Tint: 50%, HEX: #667ba2
# Tint: 25%, HEX: #a5b0cb
# 
# Light Blue
# Tint: 75%, HEX: #94c0c6
# Tint: 50%, HEX: #b3d3d5
# Tint: 25%, HEX: #d4e6e8

#' Tint colors of RPI 
#'
#' \code{rpi_pal_3} provides the tint colors of the 
#' \href{https://www.rpi.edu/}{Rensselaer Polytechnic Institute} (RPI), Troy, NY.
#' 
#' As variants of the secondary use colors of \code{\link{rpi_pal_2}}, 
#' the tint colors of \code{rpi_pal_3} should be used in combination with  
#' the primary colors of \code{\link{rpi_pal_1}} to add color accents 
#' to digital and print materials. 
#' 
#' @return 
#' A named vector of colors (HEX/HTML codes of type character).
#' 
#' @author 
#' \strong{unikn}, 2022-12-01.
#' 
#' @source 
#' Color definitions are based on 
#' \url{https://scer.rpi.edu/brand-in-action/colors}. 
#' 
#' @examples
#' rpi_pal_3
#' seecol(rpi_pal_3, main = "Tint colors of RPI")  # view color palette
#' demopal(rpi_pal_3, type = 4, seed = 2, main = "Tint colors of RPI")
#'
#' @family contributed color palettes
#'
#' @seealso 
#' \code{\link{rpi_pal_1}} for primary colors of RPI; 
#' \code{\link{rpi_pal_2}} for secondary colors of RPI; 
#' \code{\link{seecol}} for viewing and comparing color palettes; 
#' \code{\link{usecol}} for using color palettes; 
#' \code{\link{simcol}} for finding similar colors; 
#' \code{\link{newpal}} for defining new color palettes; 
#' \code{\link{grepal}} for finding named colors. 
#' 
#' @export

rpi_pal_3 <- newpal(col = c("#ab2328", "#c35442", "#d58570", "#eabcad",
                            "#00205b", "#2b517f", "#667ba2", "#a5b0cb",
                            "#7fa9ae", "#94c0c6", "#b3d3d5", "#d4e6e8"), 
                    names = c("RPI dark red", "dark red 75%", "dark red 50%", "dark red 25%", 
                              "RPI dark blue", "dark blue 75%", "dark blue 50%", "dark blue 25%", 
                              "RPI light blue", "light blue 75%", "light blue 50%", "light blue 25%"), 
                    as_df = FALSE)

# seecol(rpi_pal_3, main = "Tint Colors of RPI")


# Willamette University: -----

# Source: <https://willamette.edu/offices/comm/brand-guidelines/brand-colors/index.html>
# Last check: 2022-12-05

# Primary Colors:
#
# Cardinal
# PANTONE 200 C
# PROCESS: 0/100/76/13
# RGB: 186/12/47
# HEX: BA0C2F
# 
# Gold
# PANTONE 466 C
# PROCESS: 13/25/52/6
# RGB: 198/170/118
# HEX: C6AA76

# Secondary Colors:
#
# Midnight Breakfast
# PANTONE 302 C
# PROCESS: 100/32/0/68
# RGB: 0/59/92
# HEX: 003B5C
# 
# Waller Brick
# PANTONE 202 C
# PROCESS: 1/98/58/44
# RGB: 156/2/33
# HEX: 9C0221
# 
# Zena Field
# PANTONE 4009 C
# PROCESS: 0/42/76/0
# RGB: 241/156/73
# HEX: F19C49
# 
# Salem Sky
# PANTONE 3105
# PROCESS: 49/0/7/0
# RGB: 103/210/223
# HEX: 67D2DF

willamette_pal <- newpal(col = c("#BA0C2F", "#C6AA76", 
                                 "#003B5C", "#9C0221", "#F19C49", "#67D2DF"),
                         names = c("Cardinal", "Gold", 
                                   "Midnight breakfast", "Waller brick", "Zena field", "Salem sky"),
                         as_df = FALSE)

# seecol(willamette_pal, main = "Primary and secondary colors of Willamette University")


## ToDo: -------- 

# Public:
# - RPTU: <https://www.startklar2023.de/brand-portal-rptu>

# Intranet:
# - Uni Heidelberg: <https://www.uni-heidelberg.de/de/universitaet/das-profil-der-universitaet-heidelberg/corporate-design>
# - Uni Tuebingen: <https://uni-tuebingen.de/einrichtungen/verwaltung/stabsstellen/hochschulkommunikation/service-fuer-beschaeftigte/corporate-design/basiselemente/farben/>


## eof. ----------