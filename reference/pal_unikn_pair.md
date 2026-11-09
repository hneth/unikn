# uni.kn color palette of pairwise colors (16 colors)

`pal_unikn_pair` provides an additional uni.kn color palette that
collects 16 paired colors of 8 color palettes as a data frame containing
16 colors (in 8 pairs).

## Usage

``` r
pal_unikn_pair
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md)
for a lighter uni.kn color palette;
[`pal_unikn_dark`](https://hneth.github.io/unikn/reference/pal_unikn_dark.md)
for a darker uni.kn color palette;
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
[`pal_unikn_dark`](https://hneth.github.io/unikn/reference/pal_unikn_dark.md),
[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md),
[`pal_unikn_ppt`](https://hneth.github.io/unikn/reference/pal_unikn_ppt.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn_pair
#>   karpfenblau4 karpfenblau2 seeblau5 seeblau3 petrol4 petrol2 seegruen4
#> 1      #3E5496      #8290BB  #008ECE  #59C7EB #077187 #6AAAB7   #0A9086
#>   seegruen2 bordeaux4 bordeaux2  pinky4  pinky2  peach4  peach2   grau2   grau1
#> 1   #54BFB7   #8E2043   #BC7A8F #E0607E #ECA0B2 #FEA090 #FECFC7 #B8BCC1 #E1E2E5
dim(pal_unikn_pair)  # 1 16
#> [1]  1 16
pal_unikn_pair[1]    # color "karpfenblau4" by position
#>   karpfenblau4
#> 1      #3E5496
pal_unikn_pair[[1]]  # color value by position: #3E5496"
#> [1] "#3E5496"
pal_unikn_pair["karpfenblau4"]  # color value by name
#>   karpfenblau4
#> 1      #3E5496

# Viewing/using color palette:
seecol(pal_unikn_pair)

demopal(pal_unikn_pair, type = "polygon", main = "A pair-wise color palette")

```
