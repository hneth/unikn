# Use a color or color palette

`usecol` allows using a color or color palette `pal` (e.g., for
plotting).

## Usage

``` r
usecol(
  pal = pal_unikn,
  n = "all",
  alpha = NA,
  distinct = FALSE,
  use_names = FALSE,
  use_col_ramp = FALSE
)
```

## Arguments

- pal:

  A color palette (as a vector of colors or color palettes). Default:
  `pal = `[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md).

- n:

  An integer value specifying the desired number of colors from the
  palette. Default: `n = "all"` (i.e., use all colors of a color
  palette). For the palettes defined by **unikn**, `n` is set to a
  pre-defined selection of colors if the desired number of colors is
  smaller than the available number. For all other palettes and values
  of `n` larger than `length(pal)`, `n` compresses or extends the
  palette using
  [`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html).

- alpha:

  A factor modifying the opacity alpha (as `alpha.f` in
  [`adjustcolor`](https://rdrr.io/r/grDevices/adjustcolor.html)) to a
  value in `[0, 1]`. Default: `alpha = NA` (i.e., no modification of
  opacity).

- distinct:

  Boolean: Return only visually distinct colors? Default:
  `distinct = FALSE` (i.e., include duplicate colors).

- use_names:

  A logical value indicating whether colors should be returned as a
  named vector. Default: `use_names = FALSE`, for compatibility with
  `ggplot`.

- use_col_ramp:

  A logical value specifying whether the default of using pre-selected
  colors should be overridden and
  [`colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html)
  should be used to process `n`. Default: `use_col_ramp = FALSE`.

## Value

A (named) vector of colors (of type character).

## Details

`usecol` also allows modifying and combining color palettes in various
ways.

## See also

[`seecol`](https://hneth.github.io/unikn/dev/reference/seecol.md) for
viewing and comparing color palettes;
[`simcol`](https://hneth.github.io/unikn/dev/reference/simcol.md) for
finding similar colors;
[`newpal`](https://hneth.github.io/unikn/dev/reference/newpal.md) for
defining new color palettes;
[`grepal`](https://hneth.github.io/unikn/dev/reference/grepal.md) for
finding named colors;
[`shades_of`](https://hneth.github.io/unikn/dev/reference/shades_of.md)
to defining shades of a given color;
[`ac`](https://hneth.github.io/unikn/dev/reference/ac.md) for adjusting
color transparency;
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the default uni.kn color palette.

Other color functions:
[`ac()`](https://hneth.github.io/unikn/dev/reference/ac.md),
[`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md),
[`grepal()`](https://hneth.github.io/unikn/dev/reference/grepal.md),
[`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md),
[`plot_cube()`](https://hneth.github.io/unikn/dev/reference/plot_cube.md),
[`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md),
[`shades_of()`](https://hneth.github.io/unikn/dev/reference/shades_of.md),
[`simcol()`](https://hneth.github.io/unikn/dev/reference/simcol.md)

## Examples

``` r
usecol(pal = pal_unikn, n = "all")  # default color palette 
#>  [1] "#008ECE" "#00A9E0" "#59C7EB" "#A6E1F4" "#CCEEF9" "#FFFFFF" "#E5E5E5"
#>  [8] "#CCCCCC" "#999999" "#666666" "#000000"
usecol(pal = pal_unikn, n =  4)     # selecting n dedicated colors
#> [1] "#00A9E0" "#A6E1F4" "#FFFFFF" "#000000"
usecol(pal = pal_unikn, n = 20)     # extending color palette  
#>  [1] "#008ECE" "#009CD7" "#04AAE0" "#33BAE6" "#61C9EB" "#89D7F0" "#ABE3F4"
#>  [8] "#C0E9F7" "#D6F1FA" "#F1FAFD" "#F8F8F8" "#EAEAEA" "#DDDDDD" "#CFCFCF"
#> [15] "#B9B9B9" "#9E9E9E" "#838383" "#686868" "#353535" "#000000"

# Mixing a new color palette: 
pal_1 <- usecol(pal = c(rev(pal_seeblau), "white", pal_pinky))  
seecol(pal_1)


# Mixing and extending a color palette: 
pal_2 <- usecol(pal = c(rev(pal_seegruen), "white", pal_bordeaux), n = 20)  
seecol(pal_2)


# Defining and using a custom color palette:
pal_princeton_1 <- c("#E77500", "white", "black")
names(pal_princeton_1) <- c("orange_w", "white", "black")

pal_3 <- usecol(pal_princeton_1, n = 7)
seecol(pal_3)


# Removing visual duplicates:
usecol(c("black", "#000000", "gray", "grey", "red", "red1"), distinct = TRUE)
#> [1] "black" "gray"  "red"  
seecol(usecol(c(pal_unikn, pal_seeblau), distinct = TRUE), title = "Using distinct colors")

```
