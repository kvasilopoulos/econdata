
<!-- README.md is generated from README.Rmd. Please edit that file -->

# econdata

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Curated datasets used in influential empirical macroeconomics papers,
with a catalog of categories and tags, pointers to external replication
data, and CSV copies served from the package website so you can use them
from any language.

## Installation

``` r
# install.packages("pak")
pak::pak("kvasilopoulos/econdata")
```

## Usage

Each dataset is an object named after the paper it comes from:

``` r
library(econdata)

sw2001 # Stock and Watson (2001)
#> # A tibble: 164 × 4
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
#> # ℹ 154 more rows
```

The `catalog` lists everything with categories, tags and sample ranges:

``` r
catalog[, c("key", "category", "frequency", "start", "end", "nrow", "ncol")]
#> # A tibble: 15 × 7
#>    key                category       frequency start      end         nrow  ncol
#>    <chr>              <chr>          <chr>     <date>     <date>     <int> <int>
#>  1 bbe2005            Monetary poli… monthly   1959-01-01 2001-07-01   511   121
#>  2 bq1989             Business cycl… quarterly 1948-04-01 1987-10-01   159     3
#>  3 gk2015             Monetary poli… monthly   1979-07-01 2012-06-01   396    13
#>  4 sw2001             Monetary poli… quarterly 1960-01-01 2000-10-01   164     4
#>  5 u2005              Monetary poli… monthly   1965-01-01 2003-12-01   468     7
#>  6 psy2015            Asset prices   monthly   1973-01-31 2018-07-31   547     5
#>  7 kl2017             Monetary poli… quarterly 1954-10-01 2007-10-01   213     4
#>  8 oil                Oil and energy quarterly 1973-01-01 2013-04-01   162     4
#>  9 nber_rec           Business cycl… irregular 1854-12-01 2020-04-01    35     3
#> 10 ramey2016_monetary Monetary poli… monthly   1959-01-01 2015-12-01   684    42
#> 11 ramey2016_govt     Fiscal policy  quarterly 1947-01-01 2015-07-01   275    36
#> 12 ramey2016_tech     Productivity   quarterly 1947-01-01 2015-07-01   275    46
#> 13 ramey2016_tax      Fiscal policy  quarterly 1945-01-01 2015-07-01   283    32
#> 14 rz2018             Fiscal policy  quarterly 1875-01-01 2015-10-01   564    28
#> 15 gz2012             Financial con… monthly   1973-01-01 2026-07-01   643     4

# Datasets tagged "var"
catalog$key[sapply(strsplit(catalog$tags, "|", fixed = TRUE), function(t) "var" %in% t)]
#> [1] "bbe2005" "sw2001"  "kl2017"  "oil"
```

## Static CSV API

Every dataset is also published as CSV at
`https://kvasilopoulos.github.io/econdata/data/<key>.csv`, with a JSON
index at
[`data/index.json`](https://kvasilopoulos.github.io/econdata/data/index.json).
No R required:

``` r
read.csv("https://kvasilopoulos.github.io/econdata/data/sw2001.csv")
```

``` python
pd.read_csv("https://kvasilopoulos.github.io/econdata/data/gk2015.csv", parse_dates=["date"])
```

## Finding other replication data

`sources` (and the
[site](https://kvasilopoulos.github.io/econdata/#finding-other-replication-data))
lists freely available datasets behind commonly replicated papers:
FRED-MD, Kilian’s oil data, Shiller’s stock data, the Macrohistory
database, uncertainty and shadow-rate series and more.

``` r
sources[grepl("monetary-policy", sources$tags), c("name", "coverage")]
#> # A tibble: 8 × 2
#>   name                                                             coverage    
#>   <chr>                                                            <chr>       
#> 1 Ramey (2016) Handbook of Macroeconomics data                     1889-2015   
#> 2 Romer and Romer (2004) monetary policy shocks                    1969-1996   
#> 3 Gertler and Karadi (2015) high-frequency surprises               1990-2012   
#> 4 Jarocinski and Karadi (2020) monetary and information shocks     1990-2019   
#> 5 Bauer and Swanson (2023) monetary policy surprises               1988-2023   
#> 6 Miranda-Agrippino and Ricco (2021) informationally-robust shocks 1991-2009   
#> 7 Wu and Xia (2016) shadow federal funds rate                      1990-present
#> 8 Kilian and Lutkepohl (2017) textbook datasets                    1954-2013
```

Column definitions for the wide panels (`bbe2005`, `ramey2016_*`,
`rz2018`):

``` r
subset(variables, dataset == "rz2018")[1:5, ]
#> # A tibble: 5 × 3
#>   dataset variable  description                                      
#>   <chr>   <chr>     <chr>                                            
#> 1 rz2018  ngov      nominal government purchases                     
#> 2 rz2018  ngdp      nominal GDP                                      
#> 3 rz2018  pgdp      GDP implicit price deflator                      
#> 4 rz2018  pop       total population, including armed forces overseas
#> 5 rz2018  recession recession indicator
```

## Datasets

| key | title | category | frequency |
|:---|:---|:---|:---|
| bbe2005 | Bernanke, Boivin and Eliasz (2005) FAVAR panel | Monetary policy | monthly |
| bq1989 | Blanchard and Quah (1989) output growth and unemployment | Business cycles | quarterly |
| gk2015 | Gertler and Karadi (2015) monetary VAR with high-frequency instruments | Monetary policy | monthly |
| sw2001 | Stock and Watson (2001) three-variable VAR | Monetary policy | quarterly |
| u2005 | Uhlig (2005) sign-restriction monetary VAR | Monetary policy | monthly |
| psy2015 | Phillips, Shi and Yu (2015) S&P 500 price-dividend ratio | Asset prices | monthly |
| kl2017 | Kilian and Lutkepohl (2017) textbook monetary VAR | Monetary policy | quarterly |
| oil | Kilian and Lutkepohl (2017) textbook oil VAR | Oil and energy | quarterly |
| nber_rec | NBER business cycle reference dates | Business cycles | irregular |
| ramey2016_monetary | Ramey (2016) monetary shocks panel | Monetary policy | monthly |
| ramey2016_govt | Ramey (2016) government spending panel | Fiscal policy | quarterly |
| ramey2016_tech | Ramey (2016) technology shocks panel | Productivity | quarterly |
| ramey2016_tax | Ramey (2016) tax shocks panel | Fiscal policy | quarterly |
| rz2018 | Ramey and Zubairy (2018) US historical fiscal data | Fiscal policy | quarterly |
| gz2012 | Gilchrist and Zakrajsek (2012) credit spread and excess bond premium | Financial conditions | monthly |

Replication notebooks: [Stock and Watson
(2001)](https://kvasilopoulos.github.io/econdata/articles/replication-sw2001.html),
[Bernanke, Boivin and Eliasz
(2005)](https://kvasilopoulos.github.io/econdata/articles/replication-bbe2005.html).

## Contributing

- Add a dataset: put the raw file under `data-raw/<key>/`, add a block
  to `data-raw/DATASETS.R`, a bib entry to `data-raw/bib/papers.bib`,
  and a row to `data-raw/catalog.csv`. Then run
  `data-raw/bib/create_papers.R`, `data-raw/catalog.R` and
  `data-raw/site.R` (rebuilds `docs/`).
- Add an external source: a row in `data-raw/sources.csv`.
- We follow the [tidyverse principles](.github/CONTRIBUTING.md); see
  also [PKG_CONTRIBUTING.md](.github/PKG_CONTRIBUTING.md).

Please note that the ‘econdata’ project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.
