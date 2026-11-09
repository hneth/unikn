# Plot a box (with x)

`xbox` plots a box with a cross (x) in its top-right corner.

## Usage

``` r
xbox(col = Seeblau, dim = c(1, 1), use_x = TRUE)
```

## Arguments

- col:

  The color to fill the box with (i.e., its background color). Default:
  `col = Seeblau`.

- dim:

  The x- and y-dimensions of the box (as numeric). Default:
  `dim = c(1, 1)` (i.e., a unit square).

- use_x:

  Plot a cross in upper right corner (as logical)? Default:
  `use_x = TRUE`.

## Details

The cross (x) appears rectangular when viewing the plot at the correct
aspect ratio (as defined by `dim`).

## See also

[`post`](https://hneth.github.io/unikn/reference/post.md) to add text to
an xbox; [`slide`](https://hneth.github.io/unikn/reference/slide.md) to
plot a new slide (or frame).

Other plot functions:
[`slide()`](https://hneth.github.io/unikn/reference/slide.md),
[`theme_bwkn()`](https://hneth.github.io/unikn/reference/theme_bwkn.md),
[`theme_grau()`](https://hneth.github.io/unikn/reference/theme_grau.md),
[`theme_minikn()`](https://hneth.github.io/unikn/reference/theme_minikn.md),
[`theme_unikn()`](https://hneth.github.io/unikn/reference/theme_unikn.md)

## Examples

``` r
xbox()  # default box


# Options:
xbox(col = Bordeaux)

xbox(dim = c(2, 1)) # 2:1 dimension (wider than high)

```
