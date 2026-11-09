# uni.kn color palette seegruen

`pal_seegruen` provides an additional uni.kn color palette as a data
frame containing 5 colors (shades of
[`Seegruen`](https://hneth.github.io/unikn/dev/reference/Seegruen.md)).

## Usage

``` r
pal_seegruen
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md);
[`pal_petrol`](https://hneth.github.io/unikn/dev/reference/pal_petrol.md)
for an alternative green uni.kn color palette;
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
pal_seegruen
#>   seegruen1 seegruen2 seegruen3 seegruen4 seegruen5
#> 1   #71D1CC   #54BFB7   #0AA398   #0A9086   #067E79
dim(pal_seegruen)  # 1 5
#> [1] 1 5
pal_seegruen[4]    # preferred (named) color "seegruen4"
#>   seegruen4
#> 1   #0A9086
pal_seegruen[[4]]  # preferred color "seegruen4" OR "#0A9086"
#> [1] "#0A9086"

# Plotting palette:
seecol(pal_seegruen)

```
