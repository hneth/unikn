
# unikn 0.7.0

This release of **unikn** (v0.7.0) adds and improves functionality and fixes some bugs. [2022-11-10] 

<!-- Log of changes: --> 

Changes since last release: 

## Major changes 

- Add color palettes of additional institutions (evaluate `seecol("add")` for palettes). 
- Add a `type = 'curve'` option to `demopal()` for evaluating transparent color palettes. 

<!-- Blank line.  --> 


## Minor changes 

- Improve `demopal()` function: 
    - Align point colors for `type = "scatter"` to those of other options. 
    - Increase robustness by allowing alternative `type` inputs. 
    - Pass `...` to auxiliary functions. 

- Improve `newpal()` function: 
    - Enforce return of vectors when `as_df = FALSE`. 
    - Revise `names` to enable automatic naming and non-named palettes. 
    
- Bug fixes:
    - Handle `length(pal) == 1` case for all types of `demopal()`. 
    - Handle `alpha = NA` case in `demopal()`. 
    - Handle `pal = NA` case in `seecol()` and `usecol()`. 

<!-- Blank line.  --> 


## Details 

- Call for contributions of user-generated color palettes from other institutions (see [GitHub issue](https://github.com/hneth/unikn/issues/11)). 
- Fine-tune parameters of plotting HEX values with `seecol()`. 
- Reorganize files of utility functions. 
- Add Zenodo doi [10.5281/zenodo.7096191](https://doi.org/10.5281/zenodo.7096191) for citations. 
- Revise and update vignettes.


<!-- Development version:  --> 

The current development version of **unikn** is available at <https://github.com/hneth/unikn/>. 


<!-- Previous versions: -->  

---------- 

# unikn 0.6.0

This release of **unikn** (v0.6.0) adds and revises functionality and fixes some bugs. [2022-09-20]  

Changes since last release: 

<!-- Blank line.  --> 


## Major changes 

- Add a `demopal()` function for illustrating color palettes. 
- In `xbox()`: Add a `use_x` argument for hiding or showing a cross in upper right corner (default `use_x = TRUE`). 
- In `seecol()`: Deprecate the `title` argument and replace by standard `main` and `sub` arguments. 

<!-- Blank line.  --> 


## Minor changes

- Enable probabilistic welcoming messages. 
- Enable **crayon** styles for console text. 

<!-- Blank line.  --> 


## Details 

- Add options to internal `col_distinct()` function. 
- Fix a bug in `grepal()` that caused an error when no color is found. 
- Maintenance: 
    - Rename utility functions `isCol()` and `isHexCol()` to `is_col()` and `is_hex_col()`. 
    - Distribute color functions into separate files. 


<!-- Previous versions: -->  

---------- 

# unikn 0.5.0

This release of **unikn** (v0.5.0) adds new functionality and fixes some bugs. [2022-08-15]  

Changes since last release: 

<!-- Blank line.  --> 

## Major changes 

- Add a `simcol()` function to find similar colors. 
- Add an `ac()` function as a flexible wrapper of `grDevices::adjustcolor()`. 
- Add a `shades_of()` function to conveniently get `n`\ shades of a color. 

<!-- Blank line.  --> 

## Minor changes

- Add a `plot` argument to `grepal()` and `simcol()` to visualize results.
- Add a `distinct` argument to `usecol()` and `simcol()` to remove visual duplicates. 
- Add utility functions for obtaining color transparency values (`get_alpha()`), 
quantifying color distance (`col_distance()`), and 
detecting and filtering visual duplicates (`col_distinct()`). 
- Add an `x_layout` argument to control horizontal positions of text labels (e.g., by numeric increments, centering, right-adjusted). 

<!-- Blank line.  --> 

## Details

- Fix some bugs in README and vignettes. 
- `slide()` now uses the `dim` argument. 


<!-- Previous version: --> 

---------- 

# unikn 0.4.0

This release of **unikn** (v0.4.0) adds new functionality, tweaks aesthetics, and fixes a bug. [2021-03-27]  

Changes since last release: 


## Major changes 

- Add a `grepal()` function to match patterns in the names of `colors()` or color palettes. 
- Change color sequence of `pal_unikn_pref` to increase contrast between adjacent colors. 

<!-- Blank line.  --> 


## Minor changes

- Add `mar_note` argument to `seecol()` for margin note option. 
- Add two new vignettes (on "Color recipes" and "Institutional colors"). 
- Fine-tune aesthetics of `theme_unikn()` and `theme_grau()` for use with **ggplot2**. 
- Add [Travis](https://www.travis-ci.com/) support for [GitHub](https://github.com/) builds. 

<!-- Blank line.  --> 


## Details 

- Adjust display of HEX codes in `seecol()`:  
Show HEX codes on two alternating lines (or with diagonal labels) when length of codes exceed line length(s). 


<!-- Previous version: --> 

---------- 

# unikn 0.3.0

This release of **unikn** (v0.3.0) adds functionality and fixes some bugs. [2020-08-24]  

Changes since last release:  

## Major changes 

- Add `theme_grau()` to provide an alternative **ggplot2** theme. 

## Minor changes

- Add `pal_names` argument to `seecol()` function to allow re-labeling color palettes and colors. 

## Details

- Bug fix: Use `seecol()` to flexibly plot color palettes provided by name or incomplete names. 
- Revise documentation of `seecol()` and `usecol()` functions.  
- Clean up and update online documentation.  


<!-- Previous version: --> 

---------- 

# unikn 0.2.0

This version of **unikn** (v0.2.0) is a maintenance release, adding some functionality, but primarily fixing bugs. [2019-09-25]

Changes since last release: 

## Major changes 

New functionality: 

- Add a `newpal()` function for defining new color palettes (as a named vector or data frame). 
- Add a `theme_unikn()` function to provide a basic **ggplot2** theme. 


## Minor changes

Changes in existing functionality: 

- Add a `col_bg` argument to the `seecol()` function to allow setting background color. 
- Add a `title` argument to the `seecol()` function to allow overwriting the default title (created when `title = NA`). 
- Add `lwd_brd` argument to the `seecol()` function to allow setting the linewidth of shapes (and setting sensible defaults in combination with `col_brd`). 


## Details 

- Bug fix: Correct an error in `seecol()` and `usecol()` that prohibited use in other packages (by requiring list of palettes). 
- Bug fix: Prevent showing duplicate color names in `seecol()`, due to searching both the current set of color palettes and **base** R `colors()`. Different names for the same color are now separated by a forward slash (/), duplicates are removed before naming. 
- Bug fix: Allow `isHexCol()` to recognize hexadecimal color values starting with lowercase letters. 
- Cleanup: Remove packages not needed from list of suggested packages. 


<!-- Previous version: --> 

---------- 

# unikn 0.1.0

- Initial release of **unikn** (v0.1.0) on CRAN: <https://CRAN.R-project.org/package=unikn>. [2019-06-15] 


<!-- Footer:  --> 

---------- 

[File `NEWS.md` updated on 2022-11-10.] 

<!-- eof. -->
