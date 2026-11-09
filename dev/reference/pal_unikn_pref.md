# uni.kn color palette of preferred colors (9 colors)

`pal_unikn_pref` provides an additional uni.kn color palette that
collects the preferred color of each palette as a data frame containing
9 (or 8 + 1) colors.

## Usage

``` r
pal_unikn_pref
```

## Details

The colors are arranged in a sequence that provides high contrasts
between adjacent colors.

Note that the (alert) color
[`Signal`](https://hneth.github.io/unikn/dev/reference/Signal.md) is not
a preferred color according to the official color definition.

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the default uni.kn color palette;
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
[`pal_unikn_ppt`](https://hneth.github.io/unikn/dev/reference/pal_unikn_ppt.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/dev/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn_pref
#>   Seeblau   Pinky Seegruen   Peach Karpfenblau  Signal Bordeaux    Grau  Petrol
#> 1 #59C7EB #E0607E  #0A9086 #FEA090     #3E5496 #EFDC60  #8E2043 #9AA0A7 #077187
dim(pal_unikn_pref)  # 1 9
#> [1] 1 9

# Access by position:
pal_unikn_pref[1]    # color Seeblau (as df)
#>   Seeblau
#> 1 #59C7EB
pal_unikn_pref[[1]]  # color value "#59C7EB" 
#> [1] "#59C7EB"

# Access by name: 
pal_unikn_pref["Seeblau"]   # color "seeblau3" (as df) 
#>   Seeblau
#> 1 #59C7EB
pal_unikn_pref[["Seeblau"]] # color value "#59C7EB" 
#> [1] "#59C7EB"

# Viewing/using color palette:
seecol(pal_unikn_pref)

demopal(pal_unikn_pref, type = "mosaic", main = "Preferred colors of Konstanz University")

```
