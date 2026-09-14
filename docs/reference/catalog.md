# Catalog of the bundled datasets

One row per dataset in the package with its category, tags, frequency,
sample range and the paper it comes from. Every dataset is also served
as CSV from `https://kvasilopoulos.github.io/econdata/data/<key>.csv`
(index at `data/index.json`).

## Usage

``` r
catalog
```

## Format

A tibble with one row per dataset:

- key:

  Object name in the package, e.g. `"sw2001"`.

- title:

  Short description.

- paper:

  `BIBTEXKEY` of the source paper in
  [papers](https://kvasilopoulos.github.io/econdata/reference/papers.md),
  or `NA`.

- category:

  Broad topic: Monetary policy, Business cycles, Asset prices, Oil and
  energy.

- tags:

  `|`-separated keywords.

- frequency, country:

  Sampling frequency and country.

- start, end:

  First and last date in the data.

- nrow, ncol:

  Dimensions.

- variables:

  Comma-separated column names.

- source_url:

  Where the original data were obtained.

- notes:

  Free text.

## Examples

``` r
catalog[, c("key", "category", "frequency", "start", "end")]
#> # A tibble: 9 × 5
#>   key      category        frequency start      end       
#>   <chr>    <chr>           <chr>     <date>     <date>    
#> 1 bbe2005  Monetary policy monthly   1959-01-01 2001-07-01
#> 2 bq1989   Business cycles quarterly 1948-04-01 1987-10-01
#> 3 gk2015   Monetary policy monthly   1979-07-01 2012-06-01
#> 4 sw2001   Monetary policy quarterly 1960-01-01 2000-10-01
#> 5 u2005    Monetary policy monthly   1965-01-01 2003-12-01
#> 6 psy2015  Asset prices    monthly   1973-01-31 2018-07-31
#> 7 kl2017   Monetary policy quarterly 1954-10-01 2007-10-01
#> 8 oil      Oil and energy  quarterly 1973-01-01 2013-04-01
#> 9 nber_rec Business cycles irregular 1854-12-01 2020-04-01
subset(catalog, grepl("var", tags))$key
#> [1] "bbe2005" "bq1989"  "gk2015"  "sw2001"  "u2005"   "kl2017"  "oil"    
```
