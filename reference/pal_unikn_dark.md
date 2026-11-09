# uni.kn color palette of dark colors (10 colors)

`pal_unikn_dark` provides an additional uni.kn color palette that
collects 2 dark colors of 5 color palettes as a data frame containing 10
colors (in 5 pairs).

## Usage

``` r
pal_unikn_dark
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md)
for a lighter uni.kn color palette;
[`pal_unikn_pair`](https://hneth.github.io/unikn/reference/pal_unikn_pair.md)
for a pairwise uni.kn color palette;
[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the default uni.kn color palette;
[`seecol`](https://hneth.github.io/unikn/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/reference/usecol.md) for using
color palettes.

Other color palettes:
[`pal_bordeaux`](https://hneth.github.io/unikn/reference/pal_bordeaux.md),
[`pal_grau`](https://hneth.github.io/unikn/reference/pal_grau.md),
[`pal_karpfenblau`](https://hneth.github.io/unikn/reference/pal_karpfenblau.md),
[`pal_peach`](https://hneth.github.io/unikn/reference/pal_peach.md),
[`pal_petrol`](https://hneth.github.io/unikn/reference/pal_petrol.md),
[`pal_pinky`](https://hneth.github.io/unikn/reference/pal_pinky.md),
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md),
[`pal_seegruen`](https://hneth.github.io/unikn/reference/pal_seegruen.md),
[`pal_signal`](https://hneth.github.io/unikn/reference/pal_signal.md),
[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md),
[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md),
[`pal_unikn_pair`](https://hneth.github.io/unikn/reference/pal_unikn_pair.md),
[`pal_unikn_ppt`](https://hneth.github.io/unikn/reference/pal_unikn_ppt.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn_dark
#>   karpfenblau5 karpfenblau3 bordeaux5 bordeaux3 petrol5 petrol3  pinky5  pinky3
#> 1      #324376      #586BA4   #771434   #A54D69 #035F72 #398D9F #CA4A68 #E68098
#>     grau5   grau3
#> 1 #4D5054 #9AA0A7
dim(pal_unikn_dark)  # 1 8 
#> [1]  1 10
pal_unikn_dark[1]    # color "karpfenblau5" by position
#>   karpfenblau5
#> 1      #324376
pal_unikn_dark[[1]]  # color value by position: #324376"
#> [1] "#324376"
pal_unikn_dark["karpfenblau5"]  # color value by name
#>   karpfenblau5
#> 1      #324376

# Viewing/using color palette:
seecol(pal_unikn_dark)

demopal(pal_unikn_dark, type = "points", main = "Dark colors of Konstanz University")

```
