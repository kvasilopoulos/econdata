# Dataset catalog

Every dataset in the package is also published as a plain CSV, so you
can use it from any language without installing the package:

``` r
# R
sw2001 <- read.csv("https://kvasilopoulos.github.io/econdata/data/sw2001.csv")

# Python
import pandas as pd
sw2001 = pd.read_csv("https://kvasilopoulos.github.io/econdata/data/sw2001.csv", parse_dates=["date"])

# Stata
import delimited "https://kvasilopoulos.github.io/econdata/data/sw2001.csv", clear
```

Machine-readable index:
[`data/index.json`](https://kvasilopoulos.github.io/econdata/data/index.json)
(same fields as this table, with tags as arrays),
[`data/catalog.csv`](https://kvasilopoulos.github.io/econdata/data/catalog.csv),
[`data/papers.csv`](https://kvasilopoulos.github.io/econdata/data/papers.csv)
and the
[`data/papers.bib`](https://kvasilopoulos.github.io/econdata/data/papers.bib)
bibliography.

## Datasets

Type in the search box to filter by tag, category or variable name.

Column definitions for the 120-series panel in `bbe2005` are in
[`data/bbe2005-variables.csv`](https://kvasilopoulos.github.io/econdata/data/bbe2005-variables.csv).

## Tags

`us` (9), `var` (4), `inflation` (3), `monetary-policy` (3), `textbook`
(3), `fed-funds` (2), `gdp-growth` (2), `svar` (2), `bubbles` (1),
`credit-spread` (1), `demand-supply-shocks` (1), `dividends` (1),
`explosive-roots` (1), `factor-model` (1), `favar` (1), `gsadf` (1),
`high-frequency` (1), `large-panel` (1), `long-run-restrictions` (1),
`nber` (1), `oil` (1), `proxy-svar` (1), `recessions` (1),
`reference-dates` (1), `reserves` (1), `sign-restrictions` (1),
`stock-market` (1), `unemployment` (1)
