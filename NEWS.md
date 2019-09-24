
# unikn 0.2.0.9001+

The current development version of **unikn** (0.2.0.9001+) is available at <https://github.com/hneth/unikn/>. 

---------- 

# unikn 0.2.0

This is a maintenance release, adding some functionality, but primarily fixing a few bugs. 

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

- Fix an error in `isHexCol()` which failed to recognize hexadecimal color values starting with lowercase letters.  [2019-06-27] 


---------- 

# unikn 0.1.0

- Initial release of **unikn** (0.1.0) on CRAN: <https://CRAN.R-project.org/package=unikn> [2019-06-15] 

<!-- eof -->