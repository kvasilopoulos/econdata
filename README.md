
<!-- README.md is generated from README.Rmd. Please edit that file -->

# econdata

<!-- badges: start -->

<!-- badges: end -->

The goal of econdata is to provide data from economics papers.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("kvasilopoulos/econdata")
```

# Usage

``` r
library(econdata)
# Stock and Watson (2001) dataset
sw2001
#> # A tibble: 164 x 4
#>    date        infl    un    ff
#>    <date>     <dbl> <dbl> <dbl>
#>  1 1960-01-01 0.908  5.13  3.93
#>  2 1960-04-01 1.81   5.23  3.70
#>  3 1960-07-01 1.62   5.53  2.94
#>  4 1960-10-01 1.80   6.27  2.30
#>  5 1961-01-01 0.537  6.8   2.00
#>  6 1961-04-01 0.715  7     1.73
#>  7 1961-07-01 0.892  6.77  1.68
#>  8 1961-10-01 1.07   6.2   2.4 
#>  9 1962-01-01 2.30   5.63  2.46
#> 10 1962-04-01 1.23   5.53  2.61
#> # ... with 154 more rows
```

# List of datasets

| Dataset Name | Description                                                                               |
| ------------ | ----------------------------------------------------------------------------------------- |
| sw2001       | Stock & Watson (2001). “Vector Autoregressions,”                                          |
| bq1989       | Blanchard & Quah (1989) “The Dynamic Effects of Aggregate Demand and Supply Disturbances” |
| u2005        | Uhlig (2005) “What are the effects of monetary policy on output?”                         |

-----

Please note that the ‘econdata’ project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.
