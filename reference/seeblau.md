# uni.kn color Seeblau

`Seeblau` provides the preferred color of
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)
(as an atomic HEX character value) and is defined as
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)`[[3]]`.

## Usage

``` r
Seeblau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md)
for the corresponding color palette;
[`pal_unikn`](https://hneth.github.io/unikn/reference/pal_unikn.md) for
the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/reference/pal_seeblau.md);
[`pal_unikn_pref`](https://hneth.github.io/unikn/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/reference/usecol.md) for using
color palettes.

Other preferred colors:
[`Bordeaux`](https://hneth.github.io/unikn/reference/Bordeaux.md),
[`Grau`](https://hneth.github.io/unikn/reference/grau.md),
[`Karpfenblau`](https://hneth.github.io/unikn/reference/karpfenblau.md),
[`Peach`](https://hneth.github.io/unikn/reference/peach.md),
[`Petrol`](https://hneth.github.io/unikn/reference/Petrol.md),
[`Pinky`](https://hneth.github.io/unikn/reference/pinky.md),
[`Seegruen`](https://hneth.github.io/unikn/reference/Seegruen.md),
[`Signal`](https://hneth.github.io/unikn/reference/Signal.md)

## Examples

``` r
Seeblau  # HEX character "#59C7EB" (as value)
#>   Seeblau 
#> "#59C7EB" 
all.equal(Seeblau, pal_seeblau[[3]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Seeblau)  # view color and details

```
