
# unikn 0.4.0

This release of **unikn** (v0.4.0) adds new functionality, tweaks some aesthetics, and fixes a bug. [2021-03-25]  

Changes since last release: 

## Major changes 

- Added a `grepal()` function to conveniently search `colors()` or color palettes by name. [2020-12-18]

- Changed color sequence of `pal_unikn_pref` to increase contrast between adjacent colors. [2020-09-04] 

<!-- Add blank line.  --> 


## Minor changes

- Added `mar_note` argument to `seecol()` for margin note option. [2021-01-05] 

- Added two new vignettes (on "Color recipes" and "Institutional colors"). [2020-12-18] 

- Fine-tuned aesthetics of `theme_unikn()` and `theme_grau()` for use with **ggplot2**. [2020-08-27]  

- Added [Travis](https://travis-ci.org/) support for [GitHub](https://github.com/) builds. [2020-08-25]  

<!-- Add blank line.  --> 


## Bug fixes 

- Adjust display of HEX codes in `seecol()`:  
Show HEX codes on two alternating lines (or with diagonal labels) when length of codes exceed line length(s). [2020-12-26] 

<!-- Add blank line.  --> 


<!-- unikn 0.4.0.9001+ --> 

The current development version of **unikn** (0.4.0.9001+) is available at <https://github.com/hneth/unikn/>. 

<!-- Add blank line.  --> 

---------- 

# unikn 0.3.0

This release of **unikn** (v0.3.0) adds functionality and fixes some bugs. [2020-08-24]  

Changes since last release:  

## Major changes 

- Added `theme_grau()` to provide an alternative **ggplot2** theme. [2020-08-24]  

## Minor changes

- Added `pal_names` argument to `seecol()` function to allow re-labeling color palettes and colors. [2020-08-22]  

## Bug fixes 

- Bug fix: Use `seecol()` to flexibly plot color palettes provided by name or incomplete names. [2020-08-20]  

- Revise documentation of `seecol()` and `usecol()` functions.  

- Clean up and update online documentation.  

<!-- Add blank line.  --> 

---------- 

# unikn 0.2.0

This version of **unikn** (v0.2.0) is a maintenance release, adding some functionality, but primarily fixing bugs. [2019-09-25]

Changes since last release: 

## Major changes 

New functionality: 

- Added a `newpal()` function for defining new color palettes (as a named vector or data frame). [2019-07-05]

- Added a `theme_unikn()` function to provide a basic **ggplot2** theme. [2019-06-20]


## Minor changes

Changes in existing functionality: 

- Added a `col_bg` argument to the `seecol()` function to allow setting background color. [2019-09-24]

- Added a `title` argument to the `seecol()` function to allow overwriting the default title (created when `title = NA`). [2019-07-17]

- Added `lwd_brd` argument to the `seecol()` function to allow setting the linewidth of shapes (and setting sensible defaults in combination with `col_brd`). [2019-07-18]


## Bug fixes 

- Fix an error in `seecol()` and `usecol()` that prevented using functions in other packages (by requiring list of palettes). [2019-09-18]

- Removed packages not needed for running **unikn** from list of suggested packages. [2019-07-20] 

- Prevent showing duplicate color names in `seecol()`, due to searching both the current set of color palettes and **base** R `colors`. 
Different names for the same color are now separated by a forward slash (/), duplicates are removed before naming. [2019-06-27] 

- Fix an error in `isHexCol()` which failed to recognize hexadecimal color values starting with lowercase letters. [2019-06-27] 


<!-- Add blank line.  --> 

---------- 

# unikn 0.1.0

- Initial release of **unikn** (v0.1.0) on CRAN: <https://CRAN.R-project.org/package=unikn>. [2019-06-15] 

<!-- Add blank line.  --> 

---------- 

[File `NEWS.md` updated on 2021-03-25.]

<!-- eof. -->