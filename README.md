
<!-- README.md is generated from README.Rmd. Please edit THIS (Rmd) file. -->
unikn
=====

<!-- unikn logo and link: -->
The `unikn` package facilitates the use of some elements of the [University of Konstanz](https://www.uni-konstanz.de/)'s corporate design for users of [R](https://www.r-project.org/).

Motivation
----------

<!-- uni.kn logo and link: -->
<!-- ![](./inst/pix/logo.svg) -->
<a href="https://www.uni.kn/"> <img src = "./inst/pix/logo_min.png" alt = "uni.kn" width = "300px" align = "right" style = "width: 300px; float: right; border:30;"/> </a>

<!-- unikn CD: -->
In 2014, the [University of Konstanz](https://www.uni-konstanz.de/) introduced a highly recognizable corporate design. Its key component is the consistent use of a `seeblau` color and a corresponding color palette that blends various shades of `seeblau` with black-and-white colors and text elements. (See the official [brand information](https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/) and the [Corporate Design Manual (pdf)](https://www.uni-konstanz.de/typo3temp/secure_downloads/57014/0/0143c03b80bd1fa99843c8f8686f806305928078/UKN_CD_Manual_150921.pdf) for details.)

<!-- Goals of unikn pgk: -->
The `unikn` package aims to facilitate the use of some design elements for users of [R](https://www.r-project.org/). While the correct use of default specifications should be simple and straightforward, we also allow some flexibility for expert users (e.g., for the creation of scientific visualizations).

Installation
------------

The current development version can be installed from its [GitHub](https://github.com) repository at <https://github.com/hneth/unikn/>:

``` r
# install.packages('devtools')
devtools::install_github('hneth/unikn')

library(unikn)  # loads package
```

Colors
------

A distinctive and recognizable color scheme is the most obvious element of the [University of Konstanz](https://www.uni-konstanz.de/)'s corporate design.

### Basic color palettes

Basic color palettes are specified according to the **Corporate Design Manual** [(pdf)](https://www.uni-konstanz.de/typo3temp/secure_downloads/57014/0/0143c03b80bd1fa99843c8f8686f806305928078/UKN_CD_Manual_150921.pdf):

-   Primary and default color palette (`pal_unikn`):

``` r
# Default color palette: ----- 
pal_unikn  # 10 default colors (web/sRGB)

# Plot color palette: ----- 
plot_pal(pal_unikn)
```

<img src = "./inst/pix/README-pal_unikn-1.png" align = "center" alt = "pal_unikn" style = "border:10;"/>

-   Secondary color palette (`pal_unikn_ppt`): An alternative color palette with more muted colors (intended for PowerPoint presentations) is provided as `pal_unikn_ppt`.

### Extension

Adding the darkest seeblau color (from `pal_seeblau[5]`) to the front of `pal_unikn` places `white` into the middle of a symmetrical color palette `pal_unikn_plus` (with 11 colors):

``` r
# Extended unikn color palette: ----- 
pal_unikn_plus  # 11 colors (white in middle)

# Plot color palette: ----- 
plot_pal(pal_unikn_plus)
```

<img src = "./inst/pix/README-pal_unikn_plus-1.png" align = "center" alt = "pal_unikn_plus" style = "border:10;"/>

### Additional color palettes

The following dedicated color palettes are defined in an Excel file on [Colours for complex graphics](https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/) and provided here by the following color palettes:

``` r
# 8 mono-tone palettes: ----- 
# Name:          Nr:           Tone:          
pal_seeblau      # 5 shades of seeblau
pal_peach        # 5           peach
pal_grau         # 5           grau
pal_petrol       # 5           petrol
pal_seegruen     # 5           seegruen 
pal_karpfenblau  # 5           karpfenblau
pal_pinky        # 5           pink
pal_Bordeaux     # 5           Bordeaux

# 1 signal (Ampel) palette: ----- 
pal_signal       # 3           Ampel
```

Each color palette contains a preferred color.[1] All preferred colors are contained in a corresponding color palette `pal_unikn_pref`:

``` r
# Using preferred colors: ----- 
pal_unikn_pref             # color palette of preferred colors
pal_unikn_pref[1]          # preferred (named) color 1
pal_unikn_pref[[1]]        # color value 1: #59C7EB"
pal_unikn_pref["seeblau"]  # preferred color by name
```

Additional pre-defined color palettes include:

``` r
# Plot additional color palettes: ----- 
plot_pal(pal_unikn_pref)   # palette of  9 preferred colors
plot_pal(pal_unikn_light)  # palette of  8 light colors (in 4 pairs)
plot_pal(pal_unikn_dark)   # palette of  8 dark colors (in 4 pairs)
plot_pal(pal_unikn_pair)   # palette of 16 paired colors (in 8 pairs)
```

More flexible and complex color palettes can be created by using the `col_scale()` function.

Functions
---------

### Plotting color palettes

The `plot_pal()` function provides a quick overview over the contents of a color palette and allows comparisons between color palettes:

``` r
# Plot a color palette: ----- 
plot_pal(pal_unikn_pref)
```

<img src = "./inst/pix/README-plot_pal-1.png" align = "center" alt = "pal_unikn_pref" style = "border:10;"/>

### Partial color palettes

When only a subset of a color palette are needed, the `pal_n()` function provides a reasonable subset of a known color palette:

``` r
# From pal_unikn (default): ----- 
pal_n(n = 2)
#>   seeblau4 seeblau2
#> 1  #00A9E0  #A6E1F4
pal_n(n = 4)
#>   seeblau4 seeblau2   white   black
#> 1  #00A9E0  #A6E1F4 #FFFFFF #000000

# From pal_seeblau: ----- 
pal_n(n = 1, pal = pal_seeblau)
#>   seeblau3
#> 1  #59C7EB
pal_n(n = 4, pal = pal_seeblau)
#>   seeblau4 seeblau3 seeblau2 seeblau1
#> 1  #00A9E0  #59C7EB  #A6E1F4  #CCEEF9
```

### Extending and creating new color palettes

The `col_scale()` function provides color gradients based on given colors or color palettes. This serves 2 main functions:

1.  Extending existing color palettes (to arbitrary lengths):

``` r
# Extending color palettes: ----- 
plot_pal(col_scale()(20))
plot_pal(col_scale(pal_seeblau)(10))
plot_pal(col_scale(pal_Bordeaux)(10))
```

<img src = "./inst/pix/README-col_scale_1-1.png" align = "center" alt = "col_scale" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_1-2.png" align = "center" alt = "pal_seeblau" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_1-3.png" align = "center" alt = "pal_Bordeaux" style = "border:10;"/>

1.  Combining colors to create new color palettes:

New color palettes of arbitrary length can be created by combining colors (from `unikn` or base R) and the desired resolution of the color gradient (as an integer argument):

``` r
# Combining colors: ----- 
plot_pal(col_scale(c(seeblau, "white", pinky))(10)) 
plot_pal(col_scale(c(signal, petrol))(10))  
plot_pal(col_scale(c(Bordeaux, "white", petrol))(10)) 
plot_pal(col_scale(c(karpfenblau, seeblau, "gold"))(10)) 
```

<img src = "./inst/pix/README-col_scale_2-1.png" align = "center" alt = "col_scale: seeblau white pinky" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_2-2.png" align = "center" alt = "col_scale: signal petrol" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_2-3.png" align = "center" alt = "col_scale: Bordeaux white petrol" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_2-4.png" align = "center" alt = "col_scale: karpfenblau seeblau gold" style = "border:10;"/>

For best results, consider combining existing color palettes and individual colors into new color palettes:

``` r
# Combining color palettes (and colors): ----- 
plot_pal(col_scale(c(rev(pal_seeblau), "white", pal_pinky))(11))
plot_pal(col_scale(c(rev(pal_seeblau), "white", pal_petrol))(11))
plot_pal(col_scale(c(rev(pal_petrol),  "white", pal_Bordeaux))(11))
```

<img src = "./inst/pix/README-col_scale_3-1.png" align = "center" alt = "col_scale: pal_seeblau white pal_pinky" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_3-2.png" align = "center" alt = "col_scale: pal_seeblau white pal_petrol" style = "border:10;"/>

<img src = "./inst/pix/README-col_scale_3-3.png" align = "center" alt = "col_scale: pal_petrol white pal_Bordeaux" style = "border:10;"/>

Note
----

The [University of Konstanz’s Corporate Design](https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/) was created by the [University of Konstanz](http://www.uni-konstanz.de) and [Strichpunkt GmbH](https://www.strichpunkt-design.de/) and introduced in 2014. While we make some graphical elements available to R users (e.g., for creating scientific visualizations), all copyrights remain with the original copyright holders.

We strive for an authentic representation of a highly-specified corporate design. While rigid specifications help to maintain coherence and consistency, they also cause frustration in expert users. As the design has been developed in a flexible way that allows for individual elements to be modified as needed, we enable some liberties, mostly by imposing fewer restrictions. Examples include:

-   allowing finer color gradients and flexible combinations of color palettes (via `col_scale`);
-   providing a designated `signal` color (from `pal_signal`);
-   using the spelling "color" (rather than "colour") throughout the `unikn` package.

References
----------

The copyrights to all design elements remain with their original creators:

-   Universität Konstanz, © 2015, Version 1.6, 21. September 2015, [-uni-konstanz.de](https://www.uni-konstanz.de)

-   Strichpunkt GmbH, [-strichpunkt-design.de](https://www.strichpunkt-design.de/)

Color definitions are based on the following sources:

-   [Corporate Design Manual (pdf)](https://www.uni-konstanz.de/typo3temp/secure_downloads/57014/0/0143c03b80bd1fa99843c8f8686f806305928078/UKN_CD_Manual_150921.pdf)

-   [Colours for complex graphics (xls)](https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/colours-for-complex-graphics/)

<!-- Update: -->
\[Updated 2019-02-18 by [hn](https://neth.de).\]

<!-- eof. -->

[1] Whereas the official definition does not identify a preferred color for the Ampel color palette (`pal_signal`), we provide its alert color (i.e., `pal_signal[2]`) as a designated color `signal`.
