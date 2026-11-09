# uni.kn color Petrol

`Petrol` provides the preferred color of
[`pal_petrol`](https://hneth.github.io/unikn/reference/pal_petrol.md)
(as an atomic HEX character value) and is defined as
[`pal_petrol`](https://hneth.github.io/unikn/reference/pal_petrol.md)`[[4]]`.

## Usage

``` r
Petrol
```

## Details

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_petrol`](https://hneth.github.io/unikn/reference/pal_petrol.md)
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
[`Pinky`](https://hneth.github.io/unikn/reference/pinky.md),
[`Seeblau`](https://hneth.github.io/unikn/reference/seeblau.md),
[`Seegruen`](https://hneth.github.io/unikn/reference/Seegruen.md),
[`Signal`](https://hneth.github.io/unikn/reference/Signal.md)

## Examples

``` r
Petrol  # HEX character "#077187" (as value)
#>    Petrol 
#> "#077187" 
all.equal(Petrol, pal_petrol[[4]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Petrol)  # view color and details

```
