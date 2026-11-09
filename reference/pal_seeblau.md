# uni.kn color palette seeblau

`pal_seeblau` provides an additional uni.kn color palette as a data
frame containing 5 colors (shades of
[`Seeblau`](https://hneth.github.io/unikn/reference/seeblau.md)).

## Usage

``` r
pal_seeblau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the unikn default color palette with all 5 colors of `pal_seeblau`;
[`pal_karpfenblau`](https://hneth.github.io/unikn/reference/pal_karpfenblau.md)
for an alternative blue uni.kn color palette;
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
[`pal_pinky`](https://hneth.github.io/unikn/reference/pal_pinky.md),
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
pal_seeblau
#>   seeblau1 seeblau2 seeblau3 seeblau4 seeblau5
#> 1  #CCEEF9  #A6E1F4  #59C7EB  #00A9E0  #008ECE
dim(pal_seeblau)  # 1 5
#> [1] 1 5

# Preferred color:
pal_seeblau[3]    # preferred (named) color "seeblau3" (as df)
#>   seeblau3
#> 1  #59C7EB
pal_seeblau[[3]]  # preferred color value "#59C7EB"
#> [1] "#59C7EB"

# Access by position:
pal_seeblau[3]    # named color "seeblau3" (as df)
#>   seeblau3
#> 1  #59C7EB
pal_seeblau[[3]]  # color value "#59C7EB"
#> [1] "#59C7EB"

# Access by name: 
pal_unikn["seeblau3"]    # color "seeblau3" (as df) 
#>   seeblau3
#> 1  #59C7EB
pal_unikn[["seeblau3"]]  # color value "#59C7EB"
#> [1] "#59C7EB"

# Plotting palette:
seecol(pal_seeblau)

```
