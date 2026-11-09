# `url_unikn` formats an URL the uni.kn way

`url_unikn` removes various patterns (e.g.,
`"http", "https", "://", "www."`) from the front of a given URL and
returns the remaining character string with an n-dash (Unicode `\u2013`)
prefix, rather than the former figure dash (`\u2012`) prefix (as the
latter created issues on Fedora Linux systems).

## Usage

``` r
url_unikn(url = "https://www.uni-konstanz.de/")
```

## Arguments

- url:

  The url to be written (as copied from a web browser).

## See also

[`xbox`](https://hneth.github.io/unikn/reference/xbox.md) to create a
new xbox (without text).

Other text functions:
[`mark()`](https://hneth.github.io/unikn/reference/mark.md),
[`post()`](https://hneth.github.io/unikn/reference/post.md),
[`uline()`](https://hneth.github.io/unikn/reference/uline.md)

## Examples

``` r
url_unikn("https://www.uni-konstanz.de/")
#> [1] "– uni-konstanz.de"
```
