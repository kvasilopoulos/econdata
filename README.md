
<!-- README.md is generated from README.Rmd. Please edit that file -->

# econdata

<!-- badges: start -->

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

Key

</th>

<th style="text-align:left;">

Authoryear

</th>

<th style="text-align:left;">

Title

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;width: 5em; ">

bq1989

</td>

<td style="text-align:left;width: 14em; ">

Blanchard & Quah (1989)

</td>

<td style="text-align:left;">

The Dynamic Effects of Aggregate Demand and Supply Disturbances

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

gk2015

</td>

<td style="text-align:left;width: 14em; ">

Gertler & Karadi (2015)

</td>

<td style="text-align:left;">

Monetary Policy Surprises, Credit Costs, and Economic Activity

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

psy2015

</td>

<td style="text-align:left;width: 14em; ">

Phillips, Shi & Yu (2015)

</td>

<td style="text-align:left;">

Testing For Multiple Bubbles: \&nbsp; Historical Episodes Of Exuberance
And Collapse In The S\&P 500

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

sw2001

</td>

<td style="text-align:left;width: 14em; ">

Stock & Watson (2001)

</td>

<td style="text-align:left;">

Vector Autoregressions

</td>

</tr>

<tr>

<td style="text-align:left;width: 5em; ">

u2005

</td>

<td style="text-align:left;width: 14em; ">

Uhlig (2005)

</td>

<td style="text-align:left;">

What are the effects of monetary policy on output

</td>

</tr>

</tbody>

</table>

# Miscellaneous (updated)

<table>

<thead>

<tr>

<th style="text-align:left;">

Key

</th>

<th style="text-align:left;">

Description

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

hprice

</td>

<td style="text-align:left;">

Historical Home prices

</td>

</tr>

<tr>

<td style="text-align:left;">

sp500

</td>

<td style="text-align:left;">

SP500 stocke market data

</td>

</tr>

</tbody>

</table>

-----

Please note that the ‘econdata’ project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.
