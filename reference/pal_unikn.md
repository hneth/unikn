# uni.kn default color palette (11 colors)

`pal_unikn` combines the 5 shades of blue colors from color palette
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)
with the 6 non-blue colors of
[`pal_unikn_web`](https://hneth.github.io/unikn/reference/pal_unikn_web.md)
to a divergent palette of 11 colors.

## Usage

``` r
pal_unikn
```

## Details

Adding seeblau5 (i.e., `pal_seeblau[1]`) to the default color palette
`pal_unikn` also puts `white` at the central (middle) position of a
color palette with 11 values:

`pal_unikn[[6]]` is `white` or `"#FFFFFF"`.

A divergent palette is useful for creating color gradients.

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

`pal_unikn` for the default uni.kn color palette;
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)
for the uni.kn seeblau color palette;
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
[`pal_unikn_dark`](https://hneth.github.io/unikn/reference/pal_unikn_dark.md),
[`pal_unikn_light`](https://hneth.github.io/unikn/reference/pal_unikn_light.md),
[`pal_unikn_pair`](https://hneth.github.io/unikn/reference/pal_unikn_pair.md),
[`pal_unikn_ppt`](https://hneth.github.io/unikn/reference/pal_unikn_ppt.md),
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md),
[`pal_unikn_web`](https://hneth.github.io/unikn/reference/pal_unikn_web.md)

## Examples

``` r
pal_unikn
#>   seeblau5 seeblau4 seeblau3 seeblau2 seeblau1   white seegrau1 seegrau2
#> 1  #008ECE  #00A9E0  #59C7EB  #A6E1F4  #CCEEF9 #FFFFFF  #E5E5E5  #CCCCCC
#>   seegrau3 seegrau4   black
#> 1  #999999  #666666 #000000
dim(pal_unikn)  # 1 11
#> [1]  1 11

# Access by position:
pal_unikn[1]    # new color "seeblau5" (as df)
#>   seeblau5
#> 1  #008ECE
pal_unikn[[1]]  # new color value "#008ECE"
#> [1] "#008ECE"

# Access by name: 
pal_unikn["seeblau5"]   # new color "seeblau5" (as df) 
#>   seeblau5
#> 1  #008ECE
pal_unikn[["seeblau5"]] # new color value "#008ECE"
#> [1] "#008ECE"

# Viewing/using color palette:
seecol(pal_unikn)

demopal(pal_unikn, type = "curve", main = "Default colors of Konstanz University")


# Note:
pal_unikn[6] # "white" or "#FFFFFF" as central of 11 colors
#>     white
#> 1 #FFFFFF
```
