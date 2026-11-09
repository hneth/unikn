# Provide all unikn colors and base R colors

`all_colors` combines the **unikn** color gradients with the 657 named
colors provided by [`colors`](https://rdrr.io/r/grDevices/colors.html)
of **grDevices**.

## Usage

``` r
all_colors(distinct = TRUE)
```

## Arguments

- distinct:

  Boolean: Return only colors with unique values and names? Default:
  `distinct = TRUE` (i.e., remove duplicate values and names).

## Value

A named vector of color values (of type character).

## Details

The color values returned (as a named character vector) are either
HEX/HTML codes or **base** R color names.

The `distinct` option removes colors with duplicate color values or
names.
