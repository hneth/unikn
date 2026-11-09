# uni.kn secondary color palette (ppt version)

`pal_unikn_ppt` provides an alternative uni.kn color palette as a data
frame containing 10 colors.

## Usage

``` r
pal_unikn_ppt
```

## Details

This is a secondary (ppt) variant with more muted colors.

See
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the primary/default (web/sRGB) scale and
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md);
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/dev/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md) for
using color palettes.

Other color palettes:
[`pal_bordeaux`](https://hneth.github.io/unikn/dev/reference/pal_bordeaux.md),
[`pal_grau`](https://hneth.github.io/unikn/dev/reference/pal_grau.md),
[`pal_karpfenblau`](https://hneth.github.io/unikn/dev/reference/pal_karpfenblau.md),
[`pal_peach`](https://hneth.github.io/unikn/dev/reference/pal_peach.md),
[`pal_petrol`](https://hneth.github.io/unikn/dev/reference/pal_petrol.md),
[`pal_pinky`](https://hneth.github.io/unikn/dev/reference/pal_pinky.md),
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md),
[`pal_seegruen`](https://hneth.github.io/unikn/dev/reference/pal_seegruen.md),
[`pal_signal`](https://hneth.github.io/unikn/dev/reference/pal_signal.md),
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md),
[`pal_unikn_dark`](https://hneth.github.io/unikn/dev/reference/pal_unikn_dark.md),
[`pal_unikn_light`](https://hneth.github.io/unikn/dev/reference/pal_unikn_light.md),
[`pal_unikn_pair`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pair.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/dev/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn_ppt
#>   seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2 seegrau3
#> 1  #009AD1  #59B6DC  #A0D3E6  #C8E5EF #FFFFFF  #E5E5E5  #CCCCCC  #999999
#>   seegrau4   black
#> 1  #666666 #000000
dim(pal_unikn_ppt)  # 1 10
#> [1]  1 10

# Access by position:
pal_unikn_ppt[2]    # 2nd named color "seeblau3" (as df)
#>   seeblau3
#> 1  #59B6DC
pal_unikn_ppt[[2]]  # 2nd color value "#59B6DC"
#> [1] "#59B6DC"

# Access by name: 
pal_unikn_ppt["seeblau3"]    # color "seeblau3" (as df)
#>   seeblau3
#> 1  #59B6DC
pal_unikn_ppt[["seeblau3"]]  # color value "#59B6DC"
#> [1] "#59B6DC"

# Plotting palette:
seecol(pal_unikn_ppt)

```
