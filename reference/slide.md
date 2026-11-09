# Plot a slide (or frame)

`slide` plots an empty slide (or frame) as a colored rectangle.

## Usage

``` r
slide(col = NA, dim = c(4/3, 1), border = grey(0.33, 1), lwd = 1.5)
```

## Arguments

- col:

  The color to fill the slide with (i.e., its background color).
  Default: `col = NA` (i.e., system default for transparency).

- dim:

  The x- and y-dimensions of the slide. Default: `dim = c(4/3, 1)`
  (i.e., unit height, 4/3 wider than high).

- border:

  The color of the slide's border. Setting `border = NA` hides border.
  Default: `border = grey(.33, 1)`.

- lwd:

  The line width of the slide's border. Setting `lwd = 0` or `lwd = NA`
  removes border. Default: `lwd = 1.5`.

## See also

[`heading`](https://hneth.github.io/unikn/reference/heading.md),
[`line`](https://rdrr.io/r/stats/line.html), or
[`mark`](https://hneth.github.io/unikn/reference/mark.md) to add text to
a slide; [`xbox`](https://hneth.github.io/unikn/reference/xbox.md) to
plot a box.

Other plot functions:
[`theme_bwkn()`](https://hneth.github.io/unikn/reference/theme_bwkn.md),
[`theme_grau()`](https://hneth.github.io/unikn/reference/theme_grau.md),
[`theme_minikn()`](https://hneth.github.io/unikn/reference/theme_minikn.md),
[`theme_unikn()`](https://hneth.github.io/unikn/reference/theme_unikn.md),
[`xbox()`](https://hneth.github.io/unikn/reference/xbox.md)

## Examples

``` r
slide()  # default slide (or frame)

slide(lwd = NA)  # borderless slide


# Dimensions: 
slide(dim = c(18, 9))   # larger and 2:1 dimensions

slide(dim = c(1/3, 1))  # smaller and 1:3 dimensions


# Formatting:
slide(col = pal_seeblau[[1]], border = pal_seeblau[[5]], lwd = 2)

```
