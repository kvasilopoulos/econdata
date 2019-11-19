
<!-- README.md is generated from README.Rmd. Please edit that file -->

# econdata

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/econdata)](https://CRAN.R-project.org/package=econdata)
<!-- badges: end -->

In Economics authors have collected their own research data or used
external datasets. The goal of {econodata} is to provide a curated list
of datasets that are used in the most influential economic papers.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("kvasilopoulos/econdata")
```

# Usage

All data are stored as objects in unquoted name format.

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

# Papers

<table>

<thead>

<tr>

<th style="text-align:left;">

BIBTEXKEY

</th>

<th style="text-align:left;">

AUTHORYEAR

</th>

<th style="text-align:left;">

TITLE

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;width: 5em; ">

bbe2005

</td>

<td style="text-align:left;width: 20em; ">

Bernanke, Boivin, and Eliasz (2005)

</td>

<td style="text-align:left;">

Measuring the Effects of Monetary Policy: A Factor-Augmented Vector
Autoregressive ({FAVAR}) Approach

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

gk2015

</td>

<td style="text-align:left;width: 20em; ">

Gertler and Karadi (2015)

</td>

<td style="text-align:left;">

Monetary Policy Surprises, Credit Costs, and Economic Activity

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

sw2001

</td>

<td style="text-align:left;width: 20em; ">

Stock and Watson (2001)

</td>

<td style="text-align:left;">

Vector Autoregressions

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

psy2015

</td>

<td style="text-align:left;width: 20em; ">

Phillips, Shi, and Yu (2015)

</td>

<td style="text-align:left;">

Testing for multiple bubbles: Historical episodes of exuberance and
collapse in the S\&amp;P 500

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

u2005

</td>

<td style="text-align:left;width: 20em; ">

Uhlig (2005)

</td>

<td style="text-align:left;">

What are the effects of monetary policy on output? Results from an
agnostic identification procedure

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

bq1989

</td>

<td style="text-align:left;width: 20em; ">

Blanchard and Quah (1989)

</td>

<td style="text-align:left;">

The Dynamic Effects of Aggregate Demand and Supply Disturbances

</td>

</tr>

</tbody>

</table>

### Contributing to the Package

If you want to contribute to the package:

  - We follow the [tidyverse principles](.github/CONTRIBUTING.md)
  - Specific instructions to contribute to the package can be found
    [here](.github/PKG_CONTRIBUTING.md).

-----

Please note that the ‘econdata’ project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.
