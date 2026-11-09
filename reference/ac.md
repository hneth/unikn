# Adjust color transparency

`ac` adjusts the transparency of a color or color palette `col` to an
opacity level `alpha` (in `[0, 1]`).

## Usage

``` r
ac(col, alpha = 0.5, use_names = TRUE)
```

## Arguments

- col:

  A (required) color or color palette (as a vector).

- alpha:

  A factor modifying the opacity alpha (as `alpha.f` in
  [`adjustcolor`](https://rdrr.io/r/grDevices/adjustcolor.html)) to a
  value in `[0, 1]`. Default: `alpha = .50` (i.e., medium opacity).

- use_names:

  A logical value indicating whether color names should be adjusted to
  include the values of `alpha`. Default: `use_names = TRUE`.

## Value

A color vector of the same length as `col`, transformed by
[`adjustcolor`](https://rdrr.io/r/grDevices/adjustcolor.html).

## Details

`ac` is mostly a wrapper for
[`adjustcolor`](https://rdrr.io/r/grDevices/adjustcolor.html) of the
**grDevices** package, but allows for more flexible combinations of
(multiple) `col` and `alpha` values.

The name `ac` is an abbreviation of "adjust color", but is also a
mnemonic aid for providing "air conditioning".

## See also

[`seecol`](https://hneth.github.io/unikn/reference/seecol.md) for
plotting/seeing color palettes;
[`usecol`](https://hneth.github.io/unikn/reference/usecol.md) for using
color palettes;
[`simcol`](https://hneth.github.io/unikn/reference/simcol.md) for
finding similar colors;
[`newpal`](https://hneth.github.io/unikn/reference/newpal.md) for
defining new color palettes;
[`grepal`](https://hneth.github.io/unikn/reference/grepal.md) for
finding named colors.

Other color functions:
[`demopal()`](https://hneth.github.io/unikn/reference/demopal.md),
[`grepal()`](https://hneth.github.io/unikn/reference/grepal.md),
[`newpal()`](https://hneth.github.io/unikn/reference/newpal.md),
[`plot_cube()`](https://hneth.github.io/unikn/reference/plot_cube.md),
[`seecol()`](https://hneth.github.io/unikn/reference/seecol.md),
[`shades_of()`](https://hneth.github.io/unikn/reference/shades_of.md),
[`simcol()`](https://hneth.github.io/unikn/reference/simcol.md),
[`usecol()`](https://hneth.github.io/unikn/reference/usecol.md)

## Examples

``` r
ac("black")  # using alpha = .5 by default
#>   black_0.5 
#> "#00000080" 

# multiple colors:
cols <- ac(c("black", "gold", "deepskyblue"), alpha = .50)
seecol(cols, main = "Transparent colors")


# multiple alphas:
blacks <- ac("black", alpha = 5:0/5)
seecol(blacks, main = "One col several alpha values")


bgc <- ac(c("black", "gold"), alpha = 1:6/6)
seecol(bgc, main = "More alpha values than cols")


# Using a color palette:
seecol(ac(pal_unikn_pref, 2/3), main = "Adding color transparency by ac()")


# Color names:
seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = TRUE))

seecol(ac(col = pal_unikn_pref, alpha = c(1/5, 4/5), use_names = FALSE))

```
