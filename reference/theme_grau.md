# An alternative grey theme (for ggplot2)

`theme_grau` provides an alternative grey theme for use in **ggplot2**
and **unikn** contexts.

## Usage

``` r
theme_grau(
  col_title = grey(0, 1),
  col_line = pal_grau[[3]],
  base_size = 11,
  base_family = "sans",
  base_line_size = base_size/22,
  base_rect_size = base_size/22,
  axis_ticks_mm = 2
)
```

## Arguments

- col_title:

  Color of title elements (optional). Default: `col_title = grey(0, 1)`
  (i.e., "black"). Consider using `col_title = unikn::pal_seeblau[[4]]`.

- col_line:

  Color of line elements used for axis ticks (optional). Default:
  `col_line = pal_grau[[3]]` (i.e., medium grau).

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

`theme_grau` is no-nonsense, but fills panel backgrounds in "grau"
(specifically, pal_seeggrau\[\[1\]\]).

This theme works well for dark colors and bright color accents, but is
of limited use with transparent colors.

## See also

[`theme_unikn`](https://hneth.github.io/unikn/reference/theme_unikn.md)
for default theme;
[`theme_bwkn`](https://hneth.github.io/unikn/reference/theme_bwkn.md)
for a bw theme;
[`theme_minikn`](https://hneth.github.io/unikn/reference/theme_minikn.md)
for a minimal theme.

Other plot functions:
[`slide()`](https://hneth.github.io/unikn/reference/slide.md),
[`theme_bwkn()`](https://hneth.github.io/unikn/reference/theme_bwkn.md),
[`theme_minikn()`](https://hneth.github.io/unikn/reference/theme_minikn.md),
[`theme_unikn()`](https://hneth.github.io/unikn/reference/theme_unikn.md),
[`xbox()`](https://hneth.github.io/unikn/reference/xbox.md)

## Examples

``` r

# \donttest{
# Plotting iris dataset (using ggplot2, theme_grau, and unikn colors):
  
library('ggplot2')  # theme_grau requires ggplot2 
   
ggplot(datasets::iris) +
  geom_jitter(aes(x = Sepal.Length, y = Sepal.Width, color = Species), size = 3, alpha = 2/3) +
  facet_wrap(~Species) +
  scale_color_manual(values = usecol(pal = c(Pinky, Seeblau, Seegruen))) +
  labs(tag = "B",
       title = "Iris sepals by species (using theme_grau)",
       caption = "Data from datasets::iris") + 
  coord_fixed(ratio = 3/2) + 
  theme_grau()


# }
```
