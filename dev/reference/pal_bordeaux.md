# uni.kn color palette bordeaux

`pal_bordeaux` provides an additional uni.kn color palette as a data
frame containing 5 colors (shades of
[`Bordeaux`](https://hneth.github.io/unikn/dev/reference/Bordeaux.md)).

## Usage

``` r
pal_bordeaux
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md);
[`pal_peach`](https://hneth.github.io/unikn/dev/reference/pal_peach.md)
and
[`pal_pinky`](https://hneth.github.io/unikn/dev/reference/pal_pinky.md)
for alternative redish uni.kn color palettes;
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/dev/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md) for
using color palettes.

Other color palettes:
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
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/dev/reference/pal_unikn_web.md)

## Examples

``` r
pal_bordeaux
#>   bordeaux1 bordeaux2 bordeaux3 bordeaux4 bordeaux5
#> 1   #D2A6B4   #BC7A8F   #A54D69   #8E2043   #771434
dim(pal_bordeaux)  # 1 5
#> [1] 1 5
pal_bordeaux[4]    # preferred (named) color "bordeaux4"
#>   bordeaux4
#> 1   #8E2043
pal_bordeaux[[4]]  # preferred color "bordeaux4" OR "#8E2043"
#> [1] "#8E2043"

# Plotting palette:
seecol(pal_bordeaux)

```
