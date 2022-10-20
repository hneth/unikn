## uni_pals.R | unikn
## spds | uni.kn |  2022 10 20
## ---------------------------

# Export color palettes of various institutions 
# (and contributed color palettes).

# Notes: 
# - Many users only want to use, rather than to manipulate color palettes. 
# - For convencience, uni_pals are provided as named vectors (not data frames).


# Max Planck Society / Max-Planck-Gesellschaft (MPG): ------

# Source: https://docplayer.org/2328711-Max-planck-institut-das-erscheinungsbild-der-max-planck-gesellschaft-4-ueberarbeitete-auflage.html
# Last check: 2022-10-20

mpg_pal <- newpal(col = c("#007367", "white", "#D0D3D4"), 
                  names = c("mpg green", "white", "mpg grey"),
                  as_df = FALSE)


# Uni Freiburg: ------

# Source: http://portal.uni-freiburg.de/cmsforum/wsg/webstyleguide/farben
# Last check: 2022-10-20

uni_freiburg_blaurot <- newpal(col = c("#004a99", "#c1002a"),
                               names = c("uni-blau", "uni-rot"),
                               as_df = FALSE)

uni_freiburg_blue <- newpal(col = c("#004a99", "#2a6ebb", "#6f9ad3"),
                            names = c("blue-1", "blue-2", "blue-3"), 
                            as_df = FALSE)

uni_freiburg_grey <- newpal(col = c("#f2f3f1", "#e0e1dd", "#d5d6d2", "#c9cac8", 
                                    "#b2b4b3", "#9a9b9c", "#747678", "#363534"), 
                            names = c("grey-0", "grey-1", "grey-2", "grey-3", 
                                      "grey-5", "grey-7", "grey-9", "grey-font"),
                            as_df = FALSE)

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

uni_konstanz <- newpal(col = pal_unikn,
                       names = names(pal_unikn),
                       as_df = FALSE)

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

# Basic colors:
uni_princeton_0 <- newpal(col = c(orange_basic, "black"),
                          names = c("orange", "black"),
                          as_df = FALSE)

# 1st color palette (on white backgrounds):
uni_princeton_1 <- newpal(col = c(orange_white, "white", "black"),
                          names = c("orange_w", "white", "black"),
                          as_df = FALSE)

# 2nd color palette (on black backgrounds):
uni_princeton_2 <- newpal(col = c(orange_black, "black", "white"), 
                          names = c("orange_b", "black", "white"),
                          as_df = FALSE)


## eof. ----------