
# Current version 

The current development version of **unikn** (0.1.0.9001+) is available at <https://github.com/hneth/unikn/>. 

Changes since last release: 


## Major changes 

New functionality: 

- Added `newpal()` function for defining new color palettes (as a named vector or data frame). [2019-07-05]

- Added `theme_unikn()` function to provide a basic **ggplot2** theme. [2019-06-20]


## Minor changes

Changes in existing functionality: 

- Added a `title` argument to `seecol()` function to allow overwriting the default title (created when `title = NA`). [2019-07-17]


## Bug fixes 

- Prevent showing duplicate color names in `seecol`, due to searching both the current set of color palettes and **base** R `colors`. Different names for the same color are now separated by a forward slash (/), duplicates are removed before naming. [2019-06-27]

- Fix an error in `isHexCol` which failed to recognize hexadecimal color values starting with lowercase letters.  [2019-06-27]

---------- 

# unikn 0.1.0

- Initial release of **unikn** (0.1.0) on CRAN: <https://CRAN.R-project.org/package=unikn> [2019-06-15] 

<!-- eof -->