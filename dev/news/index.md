# Changelog

## unikn 1.1.0.9001

This is the development version of **unikn**, available at
<https://github.com/hneth/unikn/>.

Changes since last release:

### Major changes

- none yet

### Minor changes

- none yet

### Details

- Remove duplicate URL in DESCRIPTION

------------------------------------------------------------------------

## unikn 1.1.0

CRAN release: 2026-11-11

This release of **unikn** (v1.1.0) adds functionality and fixes some
bugs. \[2026-11-11\]

Changes since last release:

### Major changes

- Add `cube = TRUE` option to
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md) to
  view a color palette in a 3D RGB color cube (using
  [`plot_cube()`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)).
- Add
  [`plot_cube()`](https://hneth.github.io/unikn/dev/reference/plot_cube.md)
  for illustrating colors and color palettes as points, lines, and
  planes in a 3D RGB color cube.
- Add
  [`theme_bwkn()`](https://hneth.github.io/unikn/dev/reference/theme_bwkn.md)
  and
  [`theme_minikn()`](https://hneth.github.io/unikn/dev/reference/theme_minikn.md)
  as clean, light, and subtle **ggplot2** themes.

### Minor changes

- Tweak
  [`theme_unikn()`](https://hneth.github.io/unikn/dev/reference/theme_unikn.md)
  and
  [`theme_grau()`](https://hneth.github.io/unikn/dev/reference/theme_grau.md)
  for consistency with new **ggplot2** themes.
- Fix some bugs in themes for recent versions of **ggplot2** (e.g.,
  replacing `size` by `linewidth` arguments).

### Details

- Package maintenance:
  - Add DOI
    [10.5281/zenodo.7096191](https://doi.org/10.5281/zenodo.7096191) to
    citation info  
  - Update references to
    **[unicol](https://CRAN.R-project.org/package=unicol)** R package

The current development version of **unikn** is available at
<https://github.com/hneth/unikn/>.

------------------------------------------------------------------------

## unikn 1.0.0

CRAN release: 2024-04-16

This release of **unikn** (v1.0.0) mostly acknowledges the package’s
stable state. \[2024-04-16\]

Changes since last release:

### Major changes

- When
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  compares a list of color palettes:
  - Add a `scale_x` option to scale palettes to a fixed total width;
  - Use list element names of the `pal` argument as default names.

### Minor changes

- [`url_unikn()`](https://hneth.github.io/unikn/dev/reference/url_unikn.md)
  prints an en-dash, rather than a figure dash (as the latter created
  issues on Fedora Linux systems).  
- [`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md)
  provides `pattern` and `replacement` arguments (to allow for REGEX
  operations on color `names`).

### Details

- Add a new hexagon logo.
- Deprecate `pal = "add"` keyword for
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md).
- Reduce number of examples and image sizes.
- Update **[unicol](https://CRAN.R-project.org/package=unicol)**
  references [from GitHub](https://github.com/hneth/unicol/) [to
  CRAN](https://CRAN.R-project.org/package=unicol).

------------------------------------------------------------------------

## unikn 0.9.0

CRAN release: 2023-08-10

This release of **unikn** (v0.9.0) reduces its functionality by
migrating some color palettes to a new R package
**[unicol](https://CRAN.R-project.org/package=unicol)**. \[2023-08-09\]

Changes since last release:

### Major changes

- Migrated all color palettes from other institutions to a dedicated
  R package **[unicol](https://CRAN.R-project.org/package=unicol)**.

### Minor changes

- Add user feedback when
  [`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md)
  uses `col` and `names` of different lengths.

- Add `is_col_pal()` utility function.

### Details

- Update status badges in `README`.

The current development version of **unikn** is available at
<https://github.com/hneth/unikn/>.

------------------------------------------------------------------------

## unikn 0.8.0

CRAN release: 2023-01-06

This release of **unikn** (v0.8.0) extends its functionality to
additional color palettes. \[2023-01-06\]

Changes since last release:

### Major changes

- Add color palettes of many academic institutions (migrated to
  R package **[unicol](https://CRAN.R-project.org/package=unicol)**).

### Minor changes

- Updated color palettes (migrated to R package
  **[unicol](https://CRAN.R-project.org/package=unicol)**).

### Details

- Replace use of **crayon** package by use of **cli** package.  
- Add utility functions `col_asif_alpha()` and `v_col_asif_alpha()`.
- Revise vignettes.
- Fix some bugs.

------------------------------------------------------------------------

## unikn 0.7.0

CRAN release: 2022-11-10

This release of **unikn** (v0.7.0) adds and improves functionality and
fixes some bugs. \[2022-11-10\]

Changes since last release:

### Major changes

- Add color palettes of additional institutions (evaluate
  `seecol("add")` for palettes).
- Add a `type = 'curve'` option to
  [`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md)
  for evaluating transparent color palettes.

### Minor changes

- Improve
  [`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md)
  function:
  - Align point colors for `type = "scatter"` to those of other options.
  - Increase robustness by allowing alternative `type` inputs.
  - Pass `...` to auxiliary functions.
- Improve
  [`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md)
  function:
  - Enforce return of vectors when `as_df = FALSE`.
  - Revise `names` to enable automatic naming and non-named palettes.
- Bug fixes:
  - Handle `length(pal) == 1` case for all types of
    [`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md).
  - Handle `alpha = NA` case in
    [`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md).
  - Handle `pal = NA` case in
    [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
    and
    [`usecol()`](https://hneth.github.io/unikn/dev/reference/usecol.md).

### Details

- Call for contributions of user-generated color palettes from other
  institutions (see [GitHub
  issue](https://github.com/hneth/unikn/issues/11)).
- Fine-tune parameters of plotting HEX values with
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md).
- Reorganize files of utility functions.
- Add Zenodo doi
  [10.5281/zenodo.7096191](https://doi.org/10.5281/zenodo.7096191) for
  citations.
- Revise and update vignettes.

------------------------------------------------------------------------

## unikn 0.6.0

CRAN release: 2022-09-20

This release of **unikn** (v0.6.0) adds and revises functionality and
fixes some bugs. \[2022-09-20\]

Changes since last release:

### Major changes

- Add a
  [`demopal()`](https://hneth.github.io/unikn/dev/reference/demopal.md)
  function for illustrating color palettes.
- In [`xbox()`](https://hneth.github.io/unikn/dev/reference/xbox.md):
  Add a `use_x` argument for hiding or showing a cross in upper right
  corner (default `use_x = TRUE`).
- In
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md):
  Deprecate the `title` argument and replace by standard `main` and
  `sub` arguments.

### Minor changes

- Enable probabilistic welcoming messages.
- Enable **crayon** styles for console text.

### Details

- Add options to internal `col_distinct()` function.
- Fix a bug in
  [`grepal()`](https://hneth.github.io/unikn/dev/reference/grepal.md)
  that caused an error when no color is found.
- Maintenance:
  - Rename utility functions `isCol()` and `isHexCol()` to `is_col()`
    and `is_hex_col()`.
  - Distribute color functions into separate files.

------------------------------------------------------------------------

## unikn 0.5.0

CRAN release: 2022-08-15

This release of **unikn** (v0.5.0) adds new functionality and fixes some
bugs. \[2022-08-15\]

Changes since last release:

### Major changes

- Add a
  [`simcol()`](https://hneth.github.io/unikn/dev/reference/simcol.md)
  function to find similar colors.
- Add an [`ac()`](https://hneth.github.io/unikn/dev/reference/ac.md)
  function as a flexible wrapper of
  [`grDevices::adjustcolor()`](https://rdrr.io/r/grDevices/adjustcolor.html).
- Add a
  [`shades_of()`](https://hneth.github.io/unikn/dev/reference/shades_of.md)
  function to conveniently get `n` shades of a color.

### Minor changes

- Add a `plot` argument to
  [`grepal()`](https://hneth.github.io/unikn/dev/reference/grepal.md)
  and
  [`simcol()`](https://hneth.github.io/unikn/dev/reference/simcol.md) to
  visualize results.
- Add a `distinct` argument to
  [`usecol()`](https://hneth.github.io/unikn/dev/reference/usecol.md)
  and
  [`simcol()`](https://hneth.github.io/unikn/dev/reference/simcol.md) to
  remove visual duplicates.
- Add utility functions for obtaining color transparency values
  (`get_alpha()`), quantifying color distance (`col_distance()`), and
  detecting and filtering visual duplicates (`col_distinct()`).
- Add an `x_layout` argument to control horizontal positions of text
  labels (e.g., by numeric increments, centering, right-adjusted).

### Details

- Fix some bugs in README and vignettes.
- [`slide()`](https://hneth.github.io/unikn/dev/reference/slide.md) now
  uses the `dim` argument.

------------------------------------------------------------------------

## unikn 0.4.0

CRAN release: 2021-03-27

This release of **unikn** (v0.4.0) adds new functionality, tweaks
aesthetics, and fixes a bug. \[2021-03-27\]

Changes since last release:

### Major changes

- Add a
  [`grepal()`](https://hneth.github.io/unikn/dev/reference/grepal.md)
  function to match patterns in the names of
  [`colors()`](https://rdrr.io/r/grDevices/colors.html) or color
  palettes.
- Change color sequence of `pal_unikn_pref` to increase contrast between
  adjacent colors.

### Minor changes

- Add `mar_note` argument to
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  for margin note option.
- Add two new vignettes (on “Color recipes” and “Institutional colors”).
- Fine-tune aesthetics of
  [`theme_unikn()`](https://hneth.github.io/unikn/dev/reference/theme_unikn.md)
  and
  [`theme_grau()`](https://hneth.github.io/unikn/dev/reference/theme_grau.md)
  for use with **ggplot2**.
- Add [Travis](https://www.travis-ci.com/) support for
  [GitHub](https://github.com/) builds.

### Details

- Adjust display of HEX codes in
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md):  
  Show HEX codes on two alternating lines (or with diagonal labels) when
  length of codes exceed line length(s).

------------------------------------------------------------------------

## unikn 0.3.0

CRAN release: 2020-08-24

This release of **unikn** (v0.3.0) adds functionality and fixes some
bugs. \[2020-08-24\]

Changes since last release:

### Major changes

- Add
  [`theme_grau()`](https://hneth.github.io/unikn/dev/reference/theme_grau.md)
  to provide an alternative **ggplot2** theme.

### Minor changes

- Add `pal_names` argument to
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  function to allow re-labeling color palettes and colors.

### Details

- Bug fix: Use
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md) to
  flexibly plot color palettes provided by name or incomplete names.
- Revise documentation of
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  and
  [`usecol()`](https://hneth.github.io/unikn/dev/reference/usecol.md)
  functions.  
- Clean up and update online documentation.

------------------------------------------------------------------------

## unikn 0.2.0

CRAN release: 2019-09-25

This version of **unikn** (v0.2.0) is a maintenance release, adding some
functionality, but primarily fixing bugs. \[2019-09-25\]

Changes since last release:

### Major changes

New functionality:

- Add a
  [`newpal()`](https://hneth.github.io/unikn/dev/reference/newpal.md)
  function for defining new color palettes (as a named vector or data
  frame).
- Add a
  [`theme_unikn()`](https://hneth.github.io/unikn/dev/reference/theme_unikn.md)
  function to provide a basic **ggplot2** theme.

### Minor changes

Changes in existing functionality:

- Add a `col_bg` argument to the
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  function to allow setting background color.
- Add a `title` argument to the
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  function to allow overwriting the default title (created when
  `title = NA`).
- Add `lwd_brd` argument to the
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  function to allow setting the linewidth of shapes (and setting
  sensible defaults in combination with `col_brd`).

### Details

- Bug fix: Correct an error in
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md)
  and
  [`usecol()`](https://hneth.github.io/unikn/dev/reference/usecol.md)
  that prevented use in other packages (by requiring list of palettes).
- Bug fix: Prevent showing duplicate color names in
  [`seecol()`](https://hneth.github.io/unikn/dev/reference/seecol.md),
  due to searching both the current set of color palettes and **base** R
  [`colors()`](https://rdrr.io/r/grDevices/colors.html). Different names
  for the same color are now separated by a forward slash (/),
  duplicates are removed before naming.
- Bug fix: Allow `isHexCol()` to recognize hexadecimal color values
  starting with lowercase letters.
- Cleanup: Remove packages not needed from list of suggested packages.

------------------------------------------------------------------------

## unikn 0.1.0

CRAN release: 2019-06-15

- Initial release of **unikn** (v0.1.0) on CRAN:
  <https://CRAN.R-project.org/package=unikn>. \[2019-06-15\]

------------------------------------------------------------------------

\[File `NEWS.md` updated on 2026-11-12.\]
