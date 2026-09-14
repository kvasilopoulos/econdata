# econdata

Curated datasets from influential empirical macroeconomics papers, served as an R package and as plain CSV files.
Every table below is downloadable at `data/<key>.csv`; the machine-readable index is [`data/index.json`](data/index.json).

```r
# R (no package needed)
sw2001 <- read.csv("https://kvasilopoulos.github.io/econdata/data/sw2001.csv")

# or install the package
pak::pak("kvasilopoulos/econdata"); library(econdata); catalog
```
```python
pd.read_csv("https://kvasilopoulos.github.io/econdata/data/gk2015.csv", parse_dates=["date"])
```
```stata
import delimited "https://kvasilopoulos.github.io/econdata/data/rz2018.csv", clear
```

## Datasets

### Monetary policy

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `bbe2005` | [csv](data/bbe2005.csv) | Bernanke, Boivin and Eliasz (2005) FAVAR panel | [Bernanke, Boivin, and Eliasz (2005)](https://academic.oup.com/qje/article/120/1/387/1931468) | monthly | 1959-01 to 2001-07 | 511 x 121 | monetary-policy favar factor-model var large-panel us |
| `gk2015` | [csv](data/gk2015.csv) | Gertler and Karadi (2015) monetary VAR with high-frequency instruments | [Gertler and Karadi (2015)](https://www.aeaweb.org/articles?id=10.1257/mac.20130329) | monthly | 1979-07 to 2012-06 | 396 x 13 | monetary-policy proxy-svar high-frequency credit-spread us |
| `sw2001` | [csv](data/sw2001.csv) | Stock and Watson (2001) three-variable VAR | [Stock and Watson (2001)](https://www.aeaweb.org/articles?id=10.1257/jep.15.4.101) | quarterly | 1960-01 to 2000-10 | 164 x 4 | var textbook inflation unemployment fed-funds us |
| `u2005` | [csv](data/u2005.csv) | Uhlig (2005) sign-restriction monetary VAR | [Uhlig (2005)](https://doi.org/10.1016/j.jmoneco.2004.05.007) | monthly | 1965-01 to 2003-12 | 468 x 7 | monetary-policy sign-restrictions svar reserves us |
| `kl2017` | [csv](data/kl2017.csv) | Kilian and Lutkepohl (2017) textbook monetary VAR | [Kilian and Lütkepohl (2017)](https://sites.google.com/site/lkilian2019/textbook) | quarterly | 1954-10 to 2007-10 | 213 x 4 | var textbook inflation fed-funds gdp-growth us |
| `r2016_monetary` | [csv](data/r2016_monetary.csv) | Ramey (2016) monetary shocks panel | [Ramey (2016)](https://econweb.ucsd.edu/~vramey/research.html) | monthly | 1959-01 to 2015-12 | 684 x 42 | monetary-policy shocks romer-romer gertler-karadi high-frequency narrative local-projections us |

### Fiscal policy

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `r2016_govt` | [csv](data/r2016_govt.csv) | Ramey (2016) government spending panel | [Ramey (2016)](https://econweb.ucsd.edu/~vramey/research.html) | quarterly | 1947-01 to 2015-07 | 275 x 36 | fiscal-policy government-spending military-news multipliers nipa us |
| `r2016_tax` | [csv](data/r2016_tax.csv) | Ramey (2016) tax shocks panel | [Ramey (2016)](https://econweb.ucsd.edu/~vramey/research.html) | quarterly | 1945-01 to 2015-07 | 283 x 32 | fiscal-policy tax narrative romer-romer mertens-ravn us |
| `rz2018` | [csv](data/rz2018.csv) | Ramey and Zubairy (2018) US historical fiscal data | [Ramey and Zubairy (2018)](https://econweb.ucsd.edu/~vramey/research.html) | quarterly | 1875-01 to 2015-10 | 564 x 28 | fiscal-policy multipliers military-news local-projections state-dependence historical us |

### Business cycles

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `bq1989` | [csv](data/bq1989.csv) | Blanchard and Quah (1989) output growth and unemployment | [Blanchard and Quah (1989)](https://www.jstor.org/stable/1827924) | quarterly | 1948-04 to 1987-10 | 159 x 3 | svar long-run-restrictions demand-supply-shocks us |
| `nber_rec` | [csv](data/nber_rec.csv) | NBER business cycle reference dates |  | irregular | 1854-12 to 2020-04 | 35 x 3 | recessions nber reference-dates us |

### Financial conditions

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `gz2012` | [csv](data/gz2012.csv) | Gilchrist and Zakrajsek (2012) credit spread and excess bond premium | [Gilchrist and Zakrajšek (2012)](https://www.federalreserve.gov/econres/notes/feds-notes/updating-the-recession-risk-and-the-excess-bond-premium-20161006.html) | monthly | 1973-01 to 2026-07 | 643 x 4 | credit-spread excess-bond-premium financial recession-probability us |

### Productivity

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `r2016_tech` | [csv](data/r2016_tech.csv) | Ramey (2016) technology shocks panel | [Ramey (2016)](https://econweb.ucsd.edu/~vramey/research.html) | quarterly | 1947-01 to 2015-07 | 275 x 46 | technology-shocks tfp news-shocks fernald productivity us |

### Asset prices

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `psy2015` | [csv](data/psy2015.csv) | Phillips, Shi and Yu (2015) S&P 500 price-dividend ratio | [Phillips, Shi, and Yu (2015)](http://www.econ.yale.edu/~shiller/data.htm) | monthly | 1973-01 to 2018-07 | 547 x 5 | bubbles explosive-roots gsadf stock-market dividends us |

### Oil and energy

| dataset | csv | title | paper | frequency | sample | dim | tags |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `oil` | [csv](data/oil.csv) | Kilian and Lutkepohl (2017) textbook oil VAR | [Kilian and Lütkepohl (2017)](https://sites.google.com/site/lkilian2019/textbook) | quarterly | 1973-01 to 2013-04 | 162 x 4 | var textbook oil inflation gdp-growth us |

Column definitions for the wide panels (`bbe2005`, `r2016_*`, `rz2018`) are on the [variables](variables.html) page
and in [`data/variables.csv`](data/variables.csv).

## Static API

| File | Contents |
| --- | --- |
| [`data/index.json`](data/index.json) | this catalog as JSON, tags as arrays, with csv URLs |
| [`data/catalog.csv`](data/catalog.csv) | same as CSV |
| [`data/papers.csv`](data/papers.csv), [`data/papers.bib`](data/papers.bib) | bibliography |
| [`data/variables.csv`](data/variables.csv) | variable dictionary |
| [`data/sources.csv`](data/sources.csv) | external replication data sources (below) |
| `data/<key>.csv` | one file per dataset |

## Replications

* [Stock and Watson (2001)](articles/replication-sw2001.html)
* [Bernanke, Boivin and Eliasz (2005)](articles/replication-bbe2005.html)

## Papers

* `bbe2005` &mdash; B. S. Bernanke, J. Boivin, and P. Eliasz. "Measuring the Effects of Monetary Policy: A Factor-Augmented Vector Autoregressive (FAVAR) Approach". In: _The Quarterly Journal of Economics_ 120.1 (Feb. 2005), pp. 387-422. DOI: 10.1162/0033553053327452. <https://doi.org/10.1162%2F0033553053327452>
* `gk2015` &mdash; M. Gertler and P. Karadi. "Monetary Policy Surprises, Credit Costs, and Economic Activity". In: _American Economic Journal: Macroeconomics_ 7.1 (Jan. 2015), pp. 44-76. DOI: 10.1257/mac.20130329. <https://doi.org/10.1257%2Fmac.20130329>
* `sw2001` &mdash; J. H. Stock and M. W. Watson. "Vector Autoregressions". In: _Journal of Economic Perspectives_ 15.4 (Nov. 2001), pp. 101-115. DOI: 10.1257/jep.15.4.101. <https://doi.org/10.1257%2Fjep.15.4.101>
* `psy2015` &mdash; P. C. Phillips, S. Shi, and J. Yu. "Testing for multiple bubbles: Historical episodes of exuberance and collapse in the S&P 500". In: _International Economic Review_ 56.4 (2015), pp. 1043-1078. DOI: 10.1111/iere.12132. <https://doi.org/10.1111%2Fiere.12132>
* `u2005` &mdash; H. Uhlig. "What are the effects of monetary policy on output? Results from an agnostic identification procedure". In: _Journal of Monetary Economics_ 52.2 (Mar. 2005), pp. 381-419. DOI: 10.1016/j.jmoneco.2004.05.007. <https://doi.org/10.1016%2Fj.jmoneco.2004.05.007>
* `bq1989` &mdash; O. J. Blanchard and D. Quah. "The Dynamic Effects of Aggregate Demand and Supply Disturbances". In: _The American Economic Review_ 79.4 (1989), pp. 655-673.
* `kl2017` &mdash; L. Kilian and H. Lütkepohl. _Structural Vector Autoregressive Analysis_. Themes in Modern Econometrics. Cambridge: Cambridge University Press, 2017. DOI: 10.1017/9781108164818. <https://doi.org/10.1017/9781108164818>.
* `r2016` &mdash; V. A. Ramey. "Macroeconomic Shocks and Their Propagation". In: _Handbook of Macroeconomics_. Ed. by J. B. Taylor and H. Uhlig. Vol. 2. Elsevier, 2016, pp. 71-162. DOI: 10.1016/bs.hesmac.2016.03.003. <https://doi.org/10.1016/bs.hesmac.2016.03.003>.
* `rz2018` &mdash; V. A. Ramey and S. Zubairy. "Government Spending Multipliers in Good Times and in Bad: Evidence from US Historical Data". In: _Journal of Political Economy_ 126.2 (2018), pp. 850-901. DOI: 10.1086/696277. <https://doi.org/10.1086/696277>.
* `gz2012` &mdash; S. Gilchrist and E. Zakrajšek. "Credit Spreads and Business Cycle Fluctuations". In: _American Economic Review_ 102.4 (2012), pp. 1692-1720. DOI: 10.1257/aer.102.4.1692. <https://doi.org/10.1257/aer.102.4.1692>.

## Finding other replication data

Freely available datasets behind commonly replicated papers, not bundled here (too large, updated regularly, or restrictively licensed).
Author websites are still the best source for shock series because authors keep extending them; AEA journals since 2019 have
replication packages on [openICPSR](https://www.openicpsr.org/openicpsr/aea); top-5 journals deposit on [Harvard Dataverse](https://dataverse.harvard.edu/).

### Macro shocks

* **[Ramey (2016) Handbook of Macroeconomics data](https://econweb.ucsd.edu/~vramey/research.html)** &mdash; Single zip with monetary, fiscal, technology and uncertainty shock series plus the Stata/Matlab code used in the Handbook chapter. Also hosts Ramey-Zubairy (2018) military news shocks.<br><small>Used in: Ramey (2016); Romer and Romer (2004); Christiano, Eichenbaum and Evans (1999); Coibion (2012); Ramey (2011). monthly/quarterly, 1889-2015.</small>

### Monetary policy

* **[Romer and Romer (2004) monetary policy shocks](https://www.aeaweb.org/articles?id=10.1257/0002828042002651)** &mdash; Narrative shocks from Greenbook forecasts. Updated series to 2007 (Coibion et al. 2017) and 2019 (Wieland and Yang) circulate; the Ramey zip bundles one.<br><small>Used in: Romer and Romer (2004); Coibion (2012); Ramey (2016). monthly, 1969-1996.</small>
* **[Gertler and Karadi (2015) high-frequency surprises](https://www.aeaweb.org/articles?id=10.1257/mac.20130329)** &mdash; Replication package on the AEA site. Extended surprise series are maintained by Jarocinski and Karadi (2020) and by Bauer and Swanson (2023).<br><small>Used in: Gertler and Karadi (2015); Ramey (2016); Jarocinski and Karadi (2020). monthly, 1990-2012.</small>
* **[Jarocinski and Karadi (2020) monetary and information shocks](https://www.aeaweb.org/articles?id=10.1257/mac.20180090)** &mdash; Poor man's sign restrictions split of high-frequency surprises. AEA replication package.<br><small>Used in: Jarocinski and Karadi (2020). monthly, 1990-2019.</small>
* **[Bauer and Swanson (2023) monetary policy surprises](https://www.michaeldbauer.com/research/)** &mdash; Orthogonalised FOMC announcement surprises; updated on the author's site.<br><small>Used in: Bauer and Swanson (2023). monthly, 1988-2023.</small>
* **[Miranda-Agrippino and Ricco (2021) informationally-robust shocks](http://silviamirandaagrippino.com/code-data)** &mdash; Monetary policy shock series purged of central bank information effects.<br><small>Used in: Miranda-Agrippino and Ricco (2021). monthly, 1991-2009.</small>
* **[Wu and Xia (2016) shadow federal funds rate](https://sites.google.com/view/jingcynthiawu/shadow-rates)** &mdash; Drop-in policy rate for VARs spanning the zero lower bound.<br><small>Used in: Wu and Xia (2016). monthly, 1990-present.</small>

### Oil and energy

* **[Kilian (2009) oil market VAR data](https://www.aeaweb.org/articles?id=10.1257/aer.99.3.1053)** &mdash; World oil production, global real activity index, real oil price. The activity index is maintained by the Dallas Fed (IGREA).<br><small>Used in: Kilian (2009); Kilian and Murphy (2014); Baumeister and Hamilton (2019). monthly, 1973-2007.</small>
* **[Kilian global real economic activity index](https://www.dallasfed.org/research/igrea)** &mdash; Corrected and updated by the Dallas Fed; download as xlsx.<br><small>Used in: Kilian (2009); Kilian and Zhou (2018). monthly, 1968-present.</small>

### Macro panel

* **[FRED-MD / FRED-QD](https://www.stlouisfed.org/research/economists/mccracken/fred-databases)** &mdash; Drop-in replacement for the Stock-Watson large panels (e.g. the 120 series in bbe2005). Monthly vintages are archived so results can be pinned to a date.<br><small>Used in: McCracken and Ng (2016); Stock and Watson (2016); Bernanke, Boivin and Eliasz (2005) updates. monthly/quarterly, 1959-present.</small>

### Financial conditions

* **[Gilchrist and Zakrajsek (2012) excess bond premium](https://www.federalreserve.gov/econres/notes/feds-notes/updating-the-recession-risk-and-the-excess-bond-premium-20161006.html)** &mdash; Updated monthly by the Fed Board (ebp_csv.csv). This is the `ebp` column in gk2015.<br><small>Used in: Gilchrist and Zakrajsek (2012); Gertler and Karadi (2015). monthly, 1973-present.</small>

### Fiscal policy

* **[Mertens and Ravn (2013) narrative tax shocks](https://karelmertens.com/research/)** &mdash; Personal and corporate income tax narrative measures used as external instruments.<br><small>Used in: Mertens and Ravn (2013); Mertens and Ravn (2014). quarterly, 1950-2006.</small>
* **[Auerbach and Gorodnichenko (2012) fiscal multipliers](https://www.aeaweb.org/articles?id=10.1257/pol.4.2.1)** &mdash; AEA replication package with forecasts from SPF and Greenbook.<br><small>Used in: Auerbach and Gorodnichenko (2012). quarterly, 1947-2008.</small>

### Productivity

* **[Fernald utilization-adjusted TFP](https://www.frbsf.org/research-and-insights/data-and-indicators/total-factor-productivity-tfp/)** &mdash; Updated quarterly by the San Francisco Fed.<br><small>Used in: Fernald (2014); Basu, Fernald and Kimball (2006); Gali (1999) updates. quarterly, 1947-present.</small>

### Uncertainty

* **[Jurado, Ludvigson and Ng (2015) uncertainty indexes](https://www.sydneyludvigson.com/macro-and-financial-uncertainty-indexes)** &mdash; Macro, real and financial uncertainty at 1, 3 and 12 month horizons; updated regularly.<br><small>Used in: Jurado, Ludvigson and Ng (2015); Ludvigson, Ma and Ng (2021). monthly, 1960-present.</small>
* **[Economic Policy Uncertainty index](https://www.policyuncertainty.com/)** &mdash; US and country-level indexes plus categorical sub-indexes.<br><small>Used in: Baker, Bloom and Davis (2016). monthly/daily, 1985-present.</small>

### Asset prices

* **[Shiller online data (S&P, CAPE, house prices)](http://www.econ.yale.edu/~shiller/data.htm)** &mdash; The long S&P price/dividend/earnings series behind psy2015 and most bubble tests.<br><small>Used in: Shiller (1981); Campbell and Shiller (1988); Phillips, Shi and Yu (2015); Case and Shiller (2003). monthly/annual, 1871-present.</small>

### Macro-financial panel

* **[Jorda-Schularick-Taylor Macrohistory Database](https://www.macrohistory.net/database/)** &mdash; 18 advanced economies, 1870 onwards. CC BY-NC-SA licence; download as xlsx or dta.<br><small>Used in: Schularick and Taylor (2012); Jorda, Schularick and Taylor (2017); Jorda et al. (2019). annual, 1870-present.</small>

### Crises

* **[Reinhart and Rogoff crisis chronologies](https://www.reinhartandrogoff.com/data/)** &mdash; Country-level crisis dates and debt series.<br><small>Used in: Reinhart and Rogoff (2009); Reinhart and Rogoff (2011). annual, 1800-present.</small>
* **[Laeven and Valencia systemic banking crises database](https://www.imf.org/en/Publications/WP/Issues/2018/09/14/Systemic-Banking-Crises-Revisited-46232)** &mdash; IMF WP 18/206 with the database as an appendix xlsx.<br><small>Used in: Laeven and Valencia (2013); Laeven and Valencia (2020). annual, 1970-2017.</small>

### Growth panel

* **[Penn World Table](https://www.rug.nl/ggdc/productivity/pwt/)** &mdash; Also on CRAN as the `pwt10` package.<br><small>Used in: Mankiw, Romer and Weil (1992); Hall and Jones (1999); Feenstra, Inklaar and Timmer (2015). annual, 1950-present.</small>
* **[Maddison Project Database](https://www.rug.nl/ggdc/historicaldevelopment/maddison/)** &mdash; Long-run GDP per capita. CRAN: `maddison` package.<br><small>Used in: Bolt and van Zanden (2020). annual, 1-2018.</small>
* **[Barro-Lee educational attainment](http://www.barrolee.com/)** &mdash; Download as csv or dta from the project site.<br><small>Used in: Barro and Lee (2013). 5-yearly, 1950-2015.</small>

### Institutions

* **[Acemoglu, Johnson and Robinson (2001) settler mortality](https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive)** &mdash; Data archive on Acemoglu's MIT page covers most of his published papers.<br><small>Used in: Acemoglu, Johnson and Robinson (2001); Albouy (2012). cross-section, 1995.</small>

### Unit roots

* **[Nelson and Plosser (1982) US macro series](https://cran.r-project.org/package=tseries)** &mdash; Bundled in R: `tseries::NelPlo`. Extended to 1988 by Schotman and van Dijk (1991).<br><small>Used in: Nelson and Plosser (1982); Perron (1989); Zivot and Andrews (1992). annual, 1860-1970.</small>

### Textbook

* **[Lutkepohl (2005) and JMulTi textbook datasets](https://cran.r-project.org/package=vars)** &mdash; Bundled in R: `vars::Canada`; e1-e6 datasets ship with JMulTi and `urca`.<br><small>Used in: Lutkepohl (2005); Pfaff (2008). quarterly, 1960-2000.</small>
* **[Kilian and Lutkepohl (2017) textbook datasets](https://sites.google.com/site/lkilian2019/textbook)** &mdash; The `kl2017` and `oil` datasets in this package come from here; the site has the full chapter-by-chapter data and Matlab code.<br><small>Used in: Kilian and Lutkepohl (2017). quarterly, 1954-2013.</small>

### Repository

* **[AEA Data and Code Repository (openICPSR)](https://www.openicpsr.org/openicpsr/aea)** &mdash; Mandatory replication packages for all AEA journals. Search by DOI.<br><small>Used in: Any AER, AEJ, JEP or JEL paper since 2019. various, various.</small>
* **[Journal of Applied Econometrics Data Archive](http://qed.econ.queensu.ca/jae/)** &mdash; Long-running archive; most classic applied time-series papers (Hamilton, Perron, Pesaran...) have entries.<br><small>Used in: Any JAE paper since 1988. various, various.</small>
* **[Harvard Dataverse](https://dataverse.harvard.edu/)** &mdash; Many top-5 journals deposit replication packages here; search by paper title.<br><small>Used in: QJE, ReStud, JPE, Econometrica replication packages. various, various.</small>
* **[Federal Reserve Economic Data (FRED)](https://fred.stlouisfed.org/)** &mdash; R access via `fredr` or `quantmod::getSymbols(src = 'FRED')`. ALFRED holds real-time vintages.<br><small>Used in: Nearly every US macro paper. various, various.</small>

## Contributing

Missing a dataset or a source? Open an [issue](https://github.com/kvasilopoulos/econdata/issues) or edit
[`data-raw/catalog.csv`](https://github.com/kvasilopoulos/econdata/blob/master/data-raw/catalog.csv) /
[`data-raw/sources.csv`](https://github.com/kvasilopoulos/econdata/blob/master/data-raw/sources.csv) and send a pull request.

