# uni.kn color Grau

`Grau` provides the preferred color of
[`pal_grau`](https://hneth.github.io/unikn/reference/pal_grau.md) (as an
atomic HEX character value) and is defined as
[`pal_grau`](https://hneth.github.io/unikn/reference/pal_grau.md)`[[3]]`.

## Usage

``` r
Grau
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_grau`](https://hneth.github.io/unikn/reference/pal_grau.md) for
the corresponding color palette;
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
[`Karpfenblau`](https://hneth.github.io/unikn/reference/karpfenblau.md),
[`Peach`](https://hneth.github.io/unikn/reference/peach.md),
[`Petrol`](https://hneth.github.io/unikn/reference/Petrol.md),
[`Pinky`](https://hneth.github.io/unikn/reference/pinky.md),
[`Seeblau`](https://hneth.github.io/unikn/reference/seeblau.md),
[`Seegruen`](https://hneth.github.io/unikn/reference/Seegruen.md),
[`Signal`](https://hneth.github.io/unikn/reference/Signal.md)

## Examples

``` r
Grau  # HEX character "#9AA0A7" (as value)
#>      Grau 
#> "#9AA0A7" 
all.equal(Grau, pal_grau[[3]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Grau)  # view color and details

```
