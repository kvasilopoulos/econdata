# External replication data sources

Curated pointers to freely available datasets that are widely used in
empirical macroeconomics but are not bundled with the package (too
large, updated regularly, or restrictively licensed). Use it to find the
data behind a paper you want to reproduce.

## Usage

``` r
sources
```

## Format

A tibble with one row per source: `name`, `used_in` (papers that use
it), `category`, `tags` (`|`-separated), `frequency`, `coverage`, `url`
and `notes`.

## Examples

``` r
sources[grepl("monetary-policy", sources$tags), c("name", "url")]
#> # A tibble: 8 × 2
#>   name                                                             url          
#>   <chr>                                                            <chr>        
#> 1 Ramey (2016) Handbook of Macroeconomics data                     https://econ…
#> 2 Romer and Romer (2004) monetary policy shocks                    https://www.…
#> 3 Gertler and Karadi (2015) high-frequency surprises               https://www.…
#> 4 Jarocinski and Karadi (2020) monetary and information shocks     https://www.…
#> 5 Bauer and Swanson (2023) monetary policy surprises               https://www.…
#> 6 Miranda-Agrippino and Ricco (2021) informationally-robust shocks http://silvi…
#> 7 Wu and Xia (2016) shadow federal funds rate                      https://site…
#> 8 Kilian and Lutkepohl (2017) textbook datasets                    https://site…
```
