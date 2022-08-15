
# unikn 0.5.0.9001+

The current development version of **unikn** (0.5.0.9001+) is available at <https://github.com/hneth/unikn/>. 

Changes since last release: 

<!-- Blank line.  --> 

## Major changes 

- none yet. 

<!-- Blank line.  --> 

## Minor changes

- none yet. 

<!-- Blank line.  --> 

## Bug fixes

- none yet. 

<!-- Older versions:  --> 

---------- 

# unikn 0.5.0

This release of **unikn** (v0.5.0) adds new functionality and fixes some bugs. [2022-08-15]  

Changes since last release: 

<!-- Blank line.  --> 

## Major changes 

- Add a `simcol()` function to find similar colors. [2022-08-10] 
- Add an `ac()` function as a flexible wrapper of `grDevices::adjustcolor()`. [2022-01-02] 
- Add a `shades_of()` function to conveniently get `n`\ shades of a color. [2021-04-06] 

<!-- Blank line.  --> 

## Minor changes

- Add a `plot` argument to `grepal()` and `simcol()` to visualize results. [2022-08-12]
- Add a `distinct` argument to `usecol()` and `simcol()` to remove visual duplicates. [2022-08-11]
- Add utility functions for obtaining color transparency values (`get_alpha()`), 
quantifying color distance (`col_distance()`), and 
detecting and filtering visual duplicates (`col_distinct()`). [2022-08-11]
- Add an `x_layout` argument to control horizontal positions of text labels (e.g., by numeric increments, centering, right-adjusted). [2021-04-24] 

<!-- Blank line.  --> 

## Bug fixes

- Fix some bugs in README and vignettes. [2021-04-29]
- `slide()` now uses the `dim` argument. [2021-04-24]

<!-- Blank line.  --> 

---------- 

# unikn 0.4.0

This release of **unikn** (v0.4.0) adds new functionality, tweaks aesthetics, and fixes a bug. [2021-03-27]  

Changes since last release: 


## Major changes 

- Add a `grepal()` function to match patterns in the names of `colors()` or color palettes. [2020-12-18]

- Change color sequence of `pal_unikn_pref` to increase contrast between adjacent colors. [2020-09-04] 

<!-- Blank line.  --> 


## Minor changes

- Add `mar_note` argument to `seecol()` for margin note option. [2021-01-05] 

- Add two new vignettes (on "Color recipes" and "Institutional colors"). [2020-12-18] 

- Fine-tune aesthetics of `theme_unikn()` and `theme_grau()` for use with **ggplot2**. [2020-08-27]  

- Add [Travis](https://www.travis-ci.com/) support for [GitHub](https://github.com/) builds. [2020-08-25]  

<!-- Blank line.  --> 


## Bug fixes 

- Adjust display of HEX codes in `seecol()`:  
Show HEX codes on two alternating lines (or with diagonal labels) when length of codes exceed line length(s). [2020-12-26] 

<!-- Blank line.  --> 

---------- 

# unikn 0.3.0

This release of **unikn** (v0.3.0) adds functionality and fixes some bugs. [2020-08-24]  

Changes since last release:  

## Major changes 

- Add `theme_grau()` to provide an alternative **ggplot2** theme. [2020-08-24]  

## Minor changes

- Add `pal_names` argument to `seecol()` function to allow re-labeling color palettes and colors. [2020-08-22]  

## Bug fixes 

- Bug fix: Use `seecol()` to flexibly plot color palettes provided by name or incomplete names. [2020-08-20]  

- Revise documentation of `seecol()` and `usecol()` functions.  

- Clean up and update online documentation.  

<!-- Blank line.  --> 

---------- 

# unikn 0.2.0

This version of **unikn** (v0.2.0) is a maintenance release, adding some functionality, but primarily fixing bugs. [2019-09-25]

Changes since last release: 

## Major changes 

New functionality: 

- Add a `newpal()` function for defining new color palettes (as a named vector or data frame). [2019-07-05]

- Add a `theme_unikn()` function to provide a basic **ggplot2** theme. [2019-06-20]


## Minor changes

Changes in existing functionality: 

- Add a `col_bg` argument to the `seecol()` function to allow setting background color. [2019-09-24]

- Add a `title` argument to the `seecol()` function to allow overwriting the default title (created when `title = NA`). [2019-07-17]

- Add `lwd_brd` argument to the `seecol()` function to allow setting the linewidth of shapes (and setting sensible defaults in combination with `col_brd`). [2019-07-18]


## Bug fixes 

- Fix an error in `seecol()` and `usecol()` that prevented using functions in other packages (by requiring list of palettes). [2019-09-18]

- Remove packages not needed for running **unikn** from list of suggested packages. [2019-07-20] 

- Prevent showing duplicate color names in `seecol()`, due to searching both the current set of color palettes and **base** R `colors`. 
Different names for the same color are now separated by a forward slash (/), duplicates are removed before naming. [2019-06-27] 

- Fix an error in `isHexCol()` which failed to recognize hexadecimal color values starting with lowercase letters. [2019-06-27] 


<!-- Blank line.  --> 

---------- 

# unikn 0.1.0

- Initial release of **unikn** (v0.1.0) on CRAN: <https://CRAN.R-project.org/package=unikn>. [2019-06-15] 

<!-- Blank line.  --> 

---------- 

[File `NEWS.md` updated on 2022-08-15.]

<!-- eof. -->
