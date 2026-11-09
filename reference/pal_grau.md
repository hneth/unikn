# uni.kn color palette grau

`pal_grau` provides an additional uni.kn color palette as a data frame
containing 5 colors (shades of
[`Grau`](https://hneth.github.io/unikn/reference/grau.md) or grey).

## Usage

``` r
pal_grau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md);
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/reference/usecol.md) for using
color palettes.

Other color palettes:
[`pal_bordeaux`](https://hneth.github.io/unikn/reference/pal_bordeaux.md),
[`pal_karpfenblau`](https://hneth.github.io/unikn/reference/pal_karpfenblau.md),
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
pal_grau
#>     grau1   grau2   grau3   grau4   grau5
#> 1 #E1E2E5 #B8BCC1 #9AA0A7 #73787E #4D5054
dim(pal_grau)  # 1 5
#> [1] 1 5
pal_grau[3]    # preferred (named) color "grau3"
#>     grau3
#> 1 #9AA0A7
pal_grau[[3]]  # preferred color "grau3" OR "#9AA0A7"
#> [1] "#9AA0A7"

# Plotting palette:
seecol(pal_grau)

```
