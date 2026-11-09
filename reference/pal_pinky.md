# uni.kn color palette pinky

`pal_pinky` provides an additional uni.kn color palette as a data frame
containing 5 colors (shades of
[`Pinky`](https://hneth.github.io/unikn/reference/pinky.md) or pink).

## Usage

``` r
pal_pinky
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md);
[`pal_peach`](https://hneth.github.io/unikn/reference/pal_peach.md) and
[`pal_bordeaux`](https://hneth.github.io/unikn/reference/pal_bordeaux.md)
for alternative redish uni.kn color palettes;
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
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
pal_pinky
#>    pinky1  pinky2  pinky3  pinky4  pinky5
#> 1 #F3BFCB #ECA0B2 #E68098 #E0607E #CA4A68
dim(pal_pinky)  # 1 5
#> [1] 1 5
pal_pinky[4]    # preferred (named) color "pinky4"
#>    pinky4
#> 1 #E0607E
pal_pinky[[4]]  # preferred color "pinky4" OR "#E0607E"
#> [1] "#E0607E"

# Plotting palette:
seecol(pal_pinky)

```
