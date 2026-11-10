# Plot color palettes (to see their colors)

`seecol` provides an interface to plotting (or "seeing") the colors of a
palette or comparing multiple color palettes.

## Usage

``` r
seecol(
  pal = "unikn_all",
  n = "all",
  alpha = NA,
  hex = NULL,
  rgb = NULL,
  col_bg = NULL,
  col_brd = NULL,
  lwd_brd = NULL,
  grid = TRUE,
  scale_x = FALSE,
  main = NA,
  sub = NULL,
  title = NULL,
  mar_note = NA,
  pal_names = NA,
  cube = FALSE,
  ...
)
```

## Arguments

- pal:

  A single color palette (as a vector of colors), multiple color
  palettes (as a list), or a recognized keyword (as a character string).
  Default: `pal = "unikn_all"` (i.e., plot all color palettes provided
  by the **unikn** package).

  Recognized keywords are:

  1.  `"all"`: All color palettes of the **unikn** package.

  2.  `"all_unikn"` or `"unikn_all"`: All uni.kn color palettes (of the
      [University of Konstanz](https://www.uni-konstanz.de/)).

  3.  `"unikn_basic"`: All basic uni.kn palettes.

  4.  `"grad_all"`: All uni.kn palettes with color gradients.

  5.  `"pair_all"`: All uni.kn palettes with pairwise colors.

  6.  `"pref_all"`: All preferred uni.kn colors and their gradients.

  7.  `"add"`: Additional/contributed color palettes (deprecated, as
      additional color palettes were migrated to the **unicol** R
      package).

  `seecol` does also recognize keywords (e.g., `"all_unikn"`) or
  keywords without `"unikn"` (e.g., `"basic"`).

- n:

  Number of colors to show or use. If `n` is lower or higher than the
  length of the current color palette `pal`, the color palette is
  reduced or extrapolated (using
  [`grDevices::colorRampPalette`](https://rdrr.io/r/grDevices/colorRamp.html)).
  Default: `n = "all"` (i.e., show all colors in palette).

- alpha:

  A factor modifying the opacity alpha (as `alpha.f` in
  [`adjustcolor`](https://rdrr.io/r/grDevices/adjustcolor.html)) to a
  value in `[0, 1]`. Default: `alpha = NA` (i.e., no modification of
  opacity).

- hex:

  Should HEX color values be shown? Default: `hex = NULL` (i.e., show
  HEX color values when there is sufficient space to print them).

- rgb:

  Should RGB color values be shown? Default: `rgb = NULL` (i.e., show
  RGB color values when there is sufficient space to print them).

- col_bg:

  Color of plot background. Default: `col_bg = NULL`.

- col_brd:

  Color of shape borders (if shown). Default: `col_brd = NULL`.

- lwd_brd:

  Line width of shape borders (if shown). Default: `lwd_brd = NULL`.

- grid:

  Show a reference grid in the color plot? In the standard (swatch)
  view, this shows a background grid; in the cube view (see `cube`), it
  is passed to
  [`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)
  as its `grid` switch (so `grid = TRUE` shows both the face and inner
  grids at their mid-points). Default: `grid = TRUE`.

- scale_x:

  Scale color shapes (when comparing multiple palettes) to a fixed total
  width? Default: `scale_x = FALSE`.

- main:

  Main plot title (as a character string). Default: `main = NA` creates
  a default title.

- sub:

  Optional subtitle (as a character string). Default: `sub = NULL`
  (i.e., no subtitle).

- title:

  Deprecated plot title. Use `main` instead.

- mar_note:

  Optional margin note (on bottom right). Default: `mar_note = NA`
  (i.e., no margin note).

- pal_names:

  Names of color palettes or colors (as a character vector). Default:
  `pal_names = NA` (for default names).

- cube:

  Render a *single* color palette as points in a 3D RGB color cube (via
  [`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md))?
  Either a logical value/Boolean, or a list of arguments passed to
  [`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md):

  - `cube = FALSE`: Show the standard (swatch) view (default);

  - `cube = TRUE`: Show the color cube, using `main` as its title and
    deriving point labels from the current `hex` and `rgb` settings
    (color names are always shown; `hex` and/or `rgb` values are added
    when set to `TRUE`);

  - `cube = list(...)`: show the color cube, passing the named list
    entries on to
    [`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)
    (overriding the derived defaults, e.g.,
    `cube = list(type = "b", shadows = "all")`).

  The cube also inherits the current `grid` setting (passed to
  [`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)),
  unless the `cube` list specifies a grid (via `grid`, `grid_faces`, or
  `grid_inner`). When multiple palettes are provided, the cube view is
  skipped (with a message) and the standard comparison view is shown.
  Default: `cube = FALSE`.

- ...:

  Other graphical parameters (passed to `plot`).

## Details

`seecol` has two main modes, based on the contents of its `pal`
argument:

1.  if `pal` is set to a *specific* color palette (or a vector of
    multiple colors or color palettes):

    Plot the current color palette and optional details on its colors.

2.  if `pal = "unikn_all"` or a list of *multiple* color palettes:

    Plot visual vectors of all current color palettes for comparing
    them.

Specifying `distinct = TRUE` removes visual duplicate colors (based on
HEX values, ignoring transparency), but only when showing an individual
color palette `pal`.

Various title options (i.e., `main`, `sub`, and `mar_note`) and a
`pal_names` argument add control over plotted text labels. However, the
length of a character vector provided to `pal_names` must correspond to
the number of (custom) color palettes or colors.

## See also

[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md) for
using color palettes;
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
[`plot_cube`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)
for viewing colors in a 3D RGB color cube;
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the default uni.kn color palette.

Other color functions:
[`ac()`](https://hneth.github.io/unikn/dev/reference/ac.md),
[`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md),
[`grepal()`](https://hneth.github.io/unikn/dev/reference/grepal.md),
[`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md),
[`plot_cube()`](https://hneth.github.io/unikn/dev/reference/plot_cube.md),
[`shades_of()`](https://hneth.github.io/unikn/dev/reference/shades_of.md),
[`simcol()`](https://hneth.github.io/unikn/dev/reference/simcol.md),
[`usecol()`](https://hneth.github.io/unikn/dev/reference/usecol.md)

## Examples

``` r
# See multiple color palettes: 
seecol()  # default: seecol(pal = "all") 


# See details of one color palette: 
seecol(pal_unikn)  # see a specific color palette


# Combining colors or color palettes: 
seecol(c(rev(pal_seeblau), pal_seegruen))        # combine color palettes

seecol(c(rev(pal_seeblau), "white", pal_pinky))  # combine color palettes and color names

seecol(c("black", "firebrick", "gold"))          # combine color names


# Scale a set of color palettes to a fixed width:
seecol(scale_x = TRUE)


# Using n to reduce or extend color palettes:
seecol(n =  3)  # viewing reduced ranges of all palettes

seecol(n = 12)  # viewing extended ranges of all palettes


seecol(pal_unikn, n = 5, 
       main = "Reduced version of pal_unikn (n = 5)")  # reducing pal_unikn

seecol(pal_seeblau, n = 8, 
       main = "Extended version of pal_seeblau (n = 8)")  # extending pal_seeblau


# Combining and extending color palettes: 
seecol(c(rev(pal_seeblau), "white", pal_bordeaux), n = 17, 
       main = "Diverging custom color palette (with 17 colors)")


# Defining custom color palettes:
pal_mpg <- c("#007367", "white", "#D0D3D4")  # mixing hex values and color names
names(pal_mpg) <- c("mpg green", "mpg white", "mpg grey")  # color names

pal_bdg <- usecol(c(Bordeaux, "gold"), n = 5)  # using usecol

# Viewing extended color palette: 
seecol(pal_mpg, n = 9, main = "Custom color palette of the Max Planck Society")


# Comparing (and labeling) custom color palettes: 
seecol(list(pal_mpg, pal_bdg, pal_unikn), scale_x = TRUE,
       pal_names = c("Max Planck", "Bordeaux-Gold", "Uni Konstanz"), 
       main = "Comparing and labeling custom color palettes")


# Viewing a single palette in a 3D RGB color cube (using plot_cube()):
seecol(pal_unikn, cube = TRUE)                    # default cube view (with color names)

seecol(pal_unikn_pref, cube = TRUE, hex = TRUE)   # add HEX labels to points

seecol(pal_pinky, grid = FALSE,                   # pass arguments to plot_cube()    
       cube = list(type = "b", theta = -35, line_connect = "path", shadows = "all"))  


## Viewing palettes from other color packages:
# library(RColorBrewer)
# seecol(brewer.pal(name = "RdBu", n = 9))               # view color palette
# seecol(brewer.pal(name = "RdBu", n = 9), cube = TRUE)  # view in 3D color cube
# seecol(brewer.pal(name = "RdBu", n = 9), n = 15)       # extend to 15 colors

```
