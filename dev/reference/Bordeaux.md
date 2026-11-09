# uni.kn color Bordeaux

`Bordeaux` provides the preferred color of
[`pal_bordeaux`](https://hneth.github.io/unikn/dev/reference/pal_bordeaux.md)
(as an atomic HEX character value) and is defined as
[`pal_bordeaux`](https://hneth.github.io/unikn/dev/reference/pal_bordeaux.md)`[[4]]`.

## Usage

``` r
Bordeaux
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_bordeaux`](https://hneth.github.io/unikn/dev/reference/pal_bordeaux.md)
for the corresponding color palette;
[`pal_unikn`](https://hneth.github.io/unikn/dev/reference/pal_unikn.md)
for the unikn default color palette with all 5 colors of
[`pal_seeblau`](https://hneth.github.io/unikn/dev/reference/pal_seeblau.md);
[`pal_unikn_pref`](https://hneth.github.io/unikn/dev/reference/pal_unikn_pref.md)
for a uni.kn color palette with all preferred colors;
[`seecol`](https://hneth.github.io/unikn/dev/reference/seecol.md) for
viewing and comparing color palettes;
[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md) for
using color palettes.

Other preferred colors:
[`Grau`](https://hneth.github.io/unikn/dev/reference/grau.md),
[`Karpfenblau`](https://hneth.github.io/unikn/dev/reference/karpfenblau.md),
[`Peach`](https://hneth.github.io/unikn/dev/reference/peach.md),
[`Petrol`](https://hneth.github.io/unikn/dev/reference/Petrol.md),
[`Pinky`](https://hneth.github.io/unikn/dev/reference/pinky.md),
[`Seeblau`](https://hneth.github.io/unikn/dev/reference/seeblau.md),
[`Seegruen`](https://hneth.github.io/unikn/dev/reference/Seegruen.md),
[`Signal`](https://hneth.github.io/unikn/dev/reference/Signal.md)

## Examples

``` r
Bordeaux  # HEX character "#8E2043" (as value)
#>  Bordeaux 
#> "#8E2043" 
all.equal(Bordeaux, pal_bordeaux[[4]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Bordeaux)  # view color and details

```
