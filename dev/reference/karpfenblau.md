# uni.kn color Karpfenblau

`Karpfenblau` provides the preferred color of
[`pal_karpfenblau`](https://hneth.github.io/unikn/dev/reference/pal_karpfenblau.md)
(as an atomic HEX character value) and is defined as
[`pal_karpfenblau`](https://hneth.github.io/unikn/dev/reference/pal_karpfenblau.md)`[[4]]`.

## Usage

``` r
Karpfenblau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_karpfenblau`](https://hneth.github.io/unikn/dev/reference/pal_karpfenblau.md)
for the corresponding color palette;
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the default uni.kn color palette;
[`seecol`](https://hneth.github.io/unikn/dev/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md) for
using color palettes.

Other preferred colors:
[`Bordeaux`](https://hneth.github.io/unikn/dev/reference/Bordeaux.md),
[`Grau`](https://hneth.github.io/unikn/dev/reference/grau.md),
[`Peach`](https://hneth.github.io/unikn/dev/reference/peach.md),
[`Petrol`](https://hneth.github.io/unikn/dev/reference/Petrol.md),
[`Pinky`](https://hneth.github.io/unikn/dev/reference/pinky.md),
[`Seeblau`](https://hneth.github.io/unikn/dev/reference/seeblau.md),
[`Seegruen`](https://hneth.github.io/unikn/dev/reference/Seegruen.md),
[`Signal`](https://hneth.github.io/unikn/dev/reference/Signal.md)

## Examples

``` r
Karpfenblau  # HEX character "#3E5496" (as value)
#> Karpfenblau 
#>   "#3E5496" 
all.equal(Karpfenblau, pal_karpfenblau[[4]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Karpfenblau)  # view color and details

```
