# uni.kn color palette karpfenblau

`pal_karpfenblau` provides an additional uni.kn color palette as a data
frame containing 5 colors (shades of
[`Karpfenblau`](https://hneth.github.io/unikn/reference/karpfenblau.md)
or blue carp).

## Usage

``` r
pal_karpfenblau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md);
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)
for the default seeblau uni.kn color palette;
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/reference/usecol.md) for using
color palettes.

Other color palettes:
[`pal_bordeaux`](https://hneth.github.io/unikn/reference/pal_bordeaux.md),
[`pal_grau`](https://hneth.github.io/unikn/reference/pal_grau.md),
[`pal_peach`](https://hneth.github.io/unikn/reference/pal_peach.md),
[`pal_petrol`](https://hneth.github.io/unikn/reference/pal_petrol.md),
[`pal_pinky`](https://hneth.github.io/unikn/reference/pal_pinky.md),
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md),
[`pal_seegruen`](https://hneth.github.io/unikn/reference/pal_seegruen.md),
[`pal_signal`](https://hneth.github.io/unikn/reference/pal_signal.md),
[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md),
[`pal_unikn_dark`](https://hneth.github.io/unikn/reference/pal_unikn_dark.md),
[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md),
[`pal_unikn_pair`](https://hneth.github.io/unikn/reference/pal_unikn_pair.md),
[`pal_unikn_ppt`](https://hneth.github.io/unikn/reference/pal_unikn_ppt.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/reference/pal_unikn_web.md)

## Examples

``` r
pal_karpfenblau
#>   karpfenblau1 karpfenblau2 karpfenblau3 karpfenblau4 karpfenblau5
#> 1      #B4BCD6      #8290BB      #586BA4      #3E5496      #324376
dim(pal_karpfenblau)  # 1 5
#> [1] 1 5
pal_karpfenblau[4]    # preferred (named) color "karpfenblau4"
#>   karpfenblau4
#> 1      #3E5496
pal_karpfenblau[[4]]  # preferred color "karpfenblau4" OR "#3E5496"
#> [1] "#3E5496"

# Plotting palette:
seecol(pal_karpfenblau)

```
