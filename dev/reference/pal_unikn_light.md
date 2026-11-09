# uni.kn color palette of light colors (10 colors)

`pal_unikn_light` provides an additional uni.kn color palette that
collects 2 light colors of 5 color palettes as a data frame containing
10 colors (in 5 pairs).

## Usage

``` r
pal_unikn_light
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn_dark`](https://hneth.github.io/unikn/dev/reference/pal_unikn_dark.md)
for a darker uni.kn color palette;
[`pal_unikn_pair`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pair.md)
for a pairwise uni.kn color palette;
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
[`pal_unikn_pair`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pair.md),
[`pal_unikn_ppt`](https://hneth.github.io/unikn/dev/reference/pal_unikn_ppt.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/dev/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn_light
#>   seeblau3 seeblau1  peach3  peach1 seegruen3 seegruen1  pinky2  pinky1   grau2
#> 1  #59C7EB  #CCEEF9 #FFB8AC #FEE2DD   #0AA398   #71D1CC #ECA0B2 #F3BFCB #B8BCC1
#>     grau1
#> 1 #E1E2E5
dim(pal_unikn_light)  # 1 10 
#> [1]  1 10

# Access by position:
pal_unikn_light[1]    # color "seeblau3" (as df)
#>   seeblau3
#> 1  #59C7EB
pal_unikn_light[[1]]  # color value "#59C7EB" 
#> [1] "#59C7EB"

# Access by name: 
pal_unikn_light["seeblau3"]   # color "seeblau3" (as df) 
#>   seeblau3
#> 1  #59C7EB
pal_unikn_light[["seeblau3"]] # color value "#59C7EB"  
#> [1] "#59C7EB"

# Viewing/using color palette:
seecol(pal_unikn_light)

demopal(pal_unikn_light, type = "bar", main = "Light colors of Konstanz University")

```
