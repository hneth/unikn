# Basic unikn theme (for ggplot2)

`theme_unikn` provides a basic **unikn** theme to use in **ggplot2**
commands.

## Usage

``` r
theme_unikn(
  col_title = pal_seeblau[[4]],
  col_line = grey(0.05, 1),
  base_size = 11,
  base_family = "sans",
  base_line_size = base_size/22,
  base_rect_size = base_size/22,
  axis_ticks_mm = 2
)
```

## Arguments

- col_title:

  Color of the plot title (optional). Default:
  `col_title = pal_seeblau[[4]]`. Consider using `col_title = "black"`
  when data does not use `Seeblau` colors.

- col_line:

  Color of line elements used for axis lines and ticks, strip and panel
  border. Default: `col_line = grey(.05, 1)` (i.e., dark grey).

- base_size:

  Base font size (optional, numeric). Default: `base_size = 11`.

- base_family:

  Base font family (optional, character). Default:
  `base_family = "sans"`. Options include `"mono"`, `"sans"` (default),
  and "serif".

- base_line_size:

  Base line size (optional, numeric). Default:
  `base_line_size = base_size/22`.

- base_rect_size:

  Base rectangle size (optional, numeric). Default:
  `base_rect_size = base_size/22`.

- axis_ticks_mm:

  Length of axis ticks (in mm). Default: `axis_ticks_mm = 2`.

## Details

The theme is lightweight and no-nonsense, but somewhat opinionated
(e.g., in using mostly grey scales to allow emphasizing data points with
color accents).

## See also

[`theme_grau`](https://hneth.github.io/unikn/reference/theme_grau.md)
for a grey theme;
[`theme_bwkn`](https://hneth.github.io/unikn/reference/theme_bwkn.md)
for a bw theme;
[`theme_minikn`](https://hneth.github.io/unikn/reference/theme_minikn.md)
for a minimal theme.

Other plot functions:
[`slide()`](https://hneth.github.io/unikn/reference/slide.md),
[`theme_bwkn()`](https://hneth.github.io/unikn/reference/theme_bwkn.md),
[`theme_grau()`](https://hneth.github.io/unikn/reference/theme_grau.md),
[`theme_minikn()`](https://hneth.github.io/unikn/reference/theme_minikn.md),
[`xbox()`](https://hneth.github.io/unikn/reference/xbox.md)

## Examples

``` r

# \donttest{
  # Plotting iris dataset (using ggplot2, theme_unikn, and unikn colors):
  
  library('ggplot2')  # theme_unikn requires ggplot2 
  
  ggplot(datasets::iris) +
    geom_jitter(aes(x = Petal.Length, y = Petal.Width, color = Species), size = 3, alpha = 2/3) +
    facet_wrap(~Species) +
    scale_color_manual(values = usecol(pal = c(Pinky, Seeblau, Seegruen))) +
    labs(tag = "A", title = "Iris petals by species (using theme_unikn)",
         caption = "Data from datasets::iris") + 
    theme_unikn()

# }
```
