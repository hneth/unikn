# uni.kn color palette petrol

`pal_petrol` provides an additional uni.kn color palette as a data frame
containing 5 colors (shades of
[`Petrol`](https://hneth.github.io/unikn/dev/reference/Petrol.md) or
grue).

## Usage

``` r
pal_petrol
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details, and <https://en.wikipedia.org/wiki/New_riddle_of_induction>
for the portmanteau "grue".

## See also

[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md);
[`pal_seegruen`](https://hneth.github.io/unikn/dev/reference/pal_seegruen.md)
for an alternative green/grue uni.kn color palette;
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
pal_petrol
#>   petrol1 petrol2 petrol3 petrol4 petrol5
#> 1 #9CC6CF #6AAAB7 #398D9F #077187 #035F72
dim(pal_petrol)  # 1 5
#> [1] 1 5
pal_petrol[4]    # preferred (named) color "petrol4"
#>   petrol4
#> 1 #077187
pal_petrol[[4]]  # preferred color "petrol4" OR "#077187"
#> [1] "#077187"

# Plotting palette:
seecol(pal_petrol)

```
