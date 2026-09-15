
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
#> # A tibble: 67 × 7
#>    key            category        frequency start      end         nrow  ncol
#>    <chr>          <chr>           <chr>     <date>     <date>     <int> <int>
#>  1 bbe2005        Monetary policy monthly   1959-01-01 2001-07-01   511   121
#>  2 bq1989         Business cycles quarterly 1948-04-01 1987-10-01   159     3
#>  3 gk2015         Monetary policy monthly   1979-07-01 2012-06-01   396    13
#>  4 sw2001         Monetary policy quarterly 1960-01-01 2000-10-01   164     4
#>  5 u2005          Monetary policy monthly   1965-01-01 2003-12-01   468     7
#>  6 psy2015        Asset prices    monthly   1973-01-31 2018-07-31   547     5
#>  7 kl2017         Monetary policy quarterly 1954-10-01 2007-10-01   213     4
#>  8 oil            Oil and energy  quarterly 1973-01-01 2013-04-01   162     4
#>  9 nber_rec       Business cycles irregular 1854-12-01 2020-04-01    35     3
#> 10 r2016_monetary Monetary policy monthly   1959-01-01 2015-12-01   684    42
#> # ℹ 57 more rows

# Datasets tagged "var"
catalog$key[sapply(strsplit(catalog$tags, "|", fixed = TRUE), function(t) "var" %in% t)]
#> [1] "bbe2005" "sw2001"  "kl2017"  "oil"     "glp2015" "k2021"
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

Column definitions for the wide panels (`bbe2005`, `r2016_*`, `rz2018`):

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
| r2016_monetary | Ramey (2016) monetary shocks panel | Monetary policy | monthly |
| r2016_govt | Ramey (2016) government spending panel | Fiscal policy | quarterly |
| r2016_tech | Ramey (2016) technology shocks panel | Productivity | quarterly |
| r2016_tax | Ramey (2016) tax shocks panel | Fiscal policy | quarterly |
| rz2018 | Ramey and Zubairy (2018) US historical fiscal data | Fiscal policy | quarterly |
| gz2012 | Gilchrist and Zakrajsek (2012) credit spread and excess bond premium | Financial conditions | monthly |
| wx2016 | Wu and Xia (2016) shadow federal funds rate | Monetary policy | monthly |
| f2014 | Fernald (2014) utilization-adjusted TFP | Productivity | quarterly |
| bbd2016 | Baker, Bloom and Davis (2016) US economic policy uncertainty | Uncertainty | monthly |
| k2009 | Kilian (2009) global real economic activity index | Oil and energy | monthly |
| jln2015 | Jurado, Ludvigson and Ng (2015) macro, financial and real uncertainty | Uncertainty | monthly |
| jk2020 | Jarocinski and Karadi (2020) monetary policy and information shocks | Monetary policy | monthly |
| mr2013 | Mertens and Ravn (2013) narrative tax shocks | Fiscal policy | quarterly |
| ci2022 | Caldara and Iacoviello (2022) geopolitical risk index | Uncertainty | monthly |
| s2015 | Shiller (2015) Irrational Exuberance online data | Asset prices | monthly |
| r2011 | Ramey (2011) government spending shocks | Fiscal policy | quarterly |
| jk2020_ecb | Jarocinski and Karadi (2020) ECB monetary policy and information shocks | Monetary policy | monthly |
| mr2014 | Mertens and Ravn (2014) SVAR vs narrative tax multipliers | Fiscal policy | quarterly |
| mmo2018 | Mertens and Montiel Olea (2018) marginal tax rates and income | Fiscal policy | annual |
| gss2005 | Gurkaynak, Sack and Swanson (2005) target and path factors | Monetary policy | irregular |
| gss2005_surprises | Gurkaynak, Sack and Swanson (2005) raw FOMC-day asset price surprises | Monetary policy | irregular |
| bw2016 | Blinder and Watson (2016) presidents and the US economy | Business cycles | quarterly |
| glp2015 | Giannone, Lenza and Primiceri (2015) seven-variable US VAR data | Monetary policy | quarterly |
| rr2017 | Romer and Romer (2017) financial distress measure | Crises | semiannual |
| hkm2017_quarterly | He, Kelly and Manela (2017) intermediary capital ratio and risk factor (quarterly) | Financial conditions | quarterly |
| hkm2017_monthly | He, Kelly and Manela (2017) intermediary capital ratio and risk factor (monthly) | Financial conditions | monthly |
| bw2006 | Baker and Wurgler (2006) investor sentiment index | Asset prices | monthly |
| gwz2024_monthly | Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (monthly) | Asset prices | monthly |
| gwz2024_quarterly | Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (quarterly) | Asset prices | quarterly |
| gwz2024_annual | Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (annual) | Asset prices | annual |
| rr2009 | Reinhart and Rogoff public debt and growth panel (Herndon-Ash-Pollin 2014 replication columns) | Crises | annual |
| rf2009 | Ramey and Francis (2009) a century of work and leisure | Labour | annual |
| fr2009 | Francis and Ramey (2009) hours per capita and technology shocks | Business cycles | quarterly |
| nr2020 | Nekarda and Ramey (2020) cyclical markups | Business cycles | quarterly |
| ck1994 | Card and Krueger (1994) New Jersey-Pennsylvania fast-food survey | Labour | panel (2 waves) |
| al1999 | Angrist and Lavy (1999) Israel class size (Maimonides’ rule) | Education | cross-section |
| a1990_a | Angrist (1990) Vietnam draft lottery, FICA earnings cells 1964-1977 | Labour | annual panel |
| a1990_b | Angrist (1990) Vietnam draft lottery, FICA and W-2 earnings cells 1978-1984 | Labour | annual panel |
| aai2002 | Abadie, Angrist and Imbens (2002) JTPA training experiment | Labour | cross-section |
| al2009 | Angrist and Lavy (2009) high school achievement awards RCT | Education | annual panel |
| alo2009 | Angrist, Lang and Oreopoulos (2009) Canadian STAR incentives RCT | Education | cross-section |
| abk2006 | Angrist, Bettinger and Kremer (2006) Colombia voucher long-run follow-up | Education | cross-section |
| abbkk2002 | Angrist, Bettinger, Bloom, King and Kremer (2002) Colombia PACES voucher lottery | Education | cross-section |
| adh2013 | Autor, Dorn and Hanson (2013) China trade shock, commuting zones | Labour | 10-year panel |
| duflo2001 | Duflo (2001) Indonesia INPRES school construction, regency-level variables | Education | cross-section |
| ns2018 | Nakamura and Steinsson (2018) monetary policy news shock | Monetary policy | irregular |
| ns2018_1995 | Nakamura and Steinsson (2018) monetary policy news shock, extended sample | Monetary policy | irregular |
| s2021 | Swanson (2021) FFR, forward guidance and LSAP factors | Monetary policy | irregular |
| bs2023 | Bauer and Swanson (2023) monetary policy surprises, monthly | Monetary policy | monthly |
| bs2023_fomc | Bauer and Swanson (2023) monetary policy surprises, FOMC-announcement level | Monetary policy | irregular |
| mar2021 | Miranda-Agrippino and Ricco (2021) informationally-robust monetary policy instrument | Monetary policy | irregular |
| eampd | Altavilla et al. (2019) Euro Area Monetary Policy Event-Study Database, monetary event window | Monetary policy | irregular |
| eampd_pr | Altavilla et al. (2019) EA-MPD, press release window | Monetary policy | irregular |
| eampd_pc | Altavilla et al. (2019) EA-MPD, press conference window | Monetary policy | irregular |
| hlw2017 | Holston, Laubach and Williams (2017) r\* estimates | Monetary policy | quarterly |
| k2021 | Kanzig (2021) oil supply news shocks | Oil and energy | monthly |
| bh2019 | Baumeister and Hamilton (2019) structural oil supply and demand shocks | Oil and energy | monthly |
| ll2001 | Lettau and Ludvigson (2001) consumption-wealth ratio (cay) | Asset prices | quarterly |

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
