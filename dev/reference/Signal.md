# uni.kn color Signal or alert

`Signal` provides the alert color of
[`pal_signal`](https://hneth.github.io/unikn/dev/reference/pal_signal.md)
(as an atomic HEX character value) and is defined as
[`pal_signal`](https://hneth.github.io/unikn/dev/reference/pal_signal.md)`[2]`.

## Usage

``` r
Signal
```

## Details

The official specification of
[`pal_signal`](https://hneth.github.io/unikn/dev/reference/pal_signal.md)
does not identify a preferred color. We provide `Signal` as a dedicated
color as it is suited for creating color gradients (see
[`usecol`](https://hneth.github.io/unikn/dev/reference/usecol.md)).

See
<https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/>
for details.

## See also

[`pal_signal`](https://hneth.github.io/unikn/dev/reference/pal_signal.md)
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
[`Bordeaux`](https://hneth.github.io/unikn/dev/reference/Bordeaux.md),
[`Grau`](https://hneth.github.io/unikn/dev/reference/grau.md),
[`Karpfenblau`](https://hneth.github.io/unikn/dev/reference/karpfenblau.md),
[`Peach`](https://hneth.github.io/unikn/dev/reference/peach.md),
[`Petrol`](https://hneth.github.io/unikn/dev/reference/Petrol.md),
[`Pinky`](https://hneth.github.io/unikn/dev/reference/pinky.md),
[`Seeblau`](https://hneth.github.io/unikn/dev/reference/seeblau.md),
[`Seegruen`](https://hneth.github.io/unikn/dev/reference/Seegruen.md)

## Examples

``` r
Signal  # HEX character "#EFDC60" (as value)
#>    Signal 
#> "#EFDC60" 
all.equal(Signal, pal_signal[[2]])  # TRUE (same HEX values)
#> [1] "names for target but not for current"

seecol(Signal)  # view color and details

```
