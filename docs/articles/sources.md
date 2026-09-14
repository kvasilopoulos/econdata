# Finding replication data

The datasets bundled in `econdata` are small, frozen snapshots. Most
empirical macro papers rely on a handful of series that are maintained
and updated by their authors or by a central bank. This page lists those
sources, which papers use them, and where to download them. The same
table is available as
[`data/sources.csv`](https://kvasilopoulos.github.io/econdata/data/sources.csv)
and as the `sources` object in the package.

A few general rules that save time when reproducing a paper:

- **AEA journals** (AER, AEJ, JEP, P&P) since 2019 require a replication
  package on openICPSR; search by DOI. Older AEA papers usually have a
  “Data Set” zip on the article page.
- **Top-5 journals** (QJE, JPE, Econometrica, ReStud) deposit on Harvard
  Dataverse; search by title.
- **Author websites** are still the best source for shock series (Ramey,
  Mertens, Jarocinski, Bauer, Miranda-Agrippino, Ludvigson) because the
  authors keep extending them past the published sample.
- **FRED-MD/QD** reproduces almost any US large-panel exercise (factor
  models, FAVARs) and ships monthly vintages, so pin the vintage you
  used.

## Macro shocks

**[Ramey (2016) Handbook of Macroeconomics
data](https://econweb.ucsd.edu/~vramey/research.html)** — Single zip
with monetary, fiscal, technology and uncertainty shock series plus the
Stata/Matlab code used in the Handbook chapter. Also hosts Ramey-Zubairy
(2018) military news shocks.\
Used in: Ramey (2016); Romer and Romer (2004); Christiano, Eichenbaum
and Evans (1999); Coibion (2012); Ramey (2011). Frequency:
monthly/quarterly. Coverage: 1889-2015. Tags: monetary-policy,
fiscal-policy, technology, shocks, var, local-projections, us.

## Monetary policy

**[Romer and Romer (2004) monetary policy
shocks](https://www.aeaweb.org/articles?id=10.1257/0002828042002651)** —
Narrative shocks from Greenbook forecasts. Updated series to 2007
(Coibion et al. 2017) and 2019 (Wieland and Yang) circulate; the Ramey
zip bundles one.\
Used in: Romer and Romer (2004); Coibion (2012); Ramey (2016).
Frequency: monthly. Coverage: 1969-1996. Tags: monetary-policy,
narrative, shocks, us.

**[Gertler and Karadi (2015) high-frequency
surprises](https://www.aeaweb.org/articles?id=10.1257/mac.20130329)** —
Replication package on the AEA site. Extended surprise series are
maintained by Jarocinski and Karadi (2020) and by Bauer and Swanson
(2023).\
Used in: Gertler and Karadi (2015); Ramey (2016); Jarocinski and Karadi
(2020). Frequency: monthly. Coverage: 1990-2012. Tags: monetary-policy,
high-frequency, proxy-svar, fed-funds-futures, us.

**[Jarocinski and Karadi (2020) monetary and information
shocks](https://www.aeaweb.org/articles?id=10.1257/mac.20180090)** —
Poor man’s sign restrictions split of high-frequency surprises. AEA
replication package.\
Used in: Jarocinski and Karadi (2020). Frequency: monthly. Coverage:
1990-2019. Tags: monetary-policy, high-frequency, information-effect,
us, euro-area.

**[Bauer and Swanson (2023) monetary policy
surprises](https://www.michaeldbauer.com/research/)** — Orthogonalised
FOMC announcement surprises; updated on the author’s site.\
Used in: Bauer and Swanson (2023). Frequency: monthly. Coverage:
1988-2023. Tags: monetary-policy, high-frequency, orthogonalised, us.

**[Miranda-Agrippino and Ricco (2021) informationally-robust
shocks](http://silviamirandaagrippino.com/code-data)** — Monetary policy
shock series purged of central bank information effects.\
Used in: Miranda-Agrippino and Ricco (2021). Frequency: monthly.
Coverage: 1991-2009. Tags: monetary-policy, high-frequency, bvar, us.

**[Wu and Xia (2016) shadow federal funds
rate](https://sites.google.com/view/jingcynthiawu/shadow-rates)** —
Drop-in policy rate for VARs spanning the zero lower bound.\
Used in: Wu and Xia (2016). Frequency: monthly. Coverage: 1990-present.
Tags: monetary-policy, zlb, shadow-rate, us, euro-area, uk.

## Oil and energy

**[Kilian (2009) oil market VAR
data](https://www.aeaweb.org/articles?id=10.1257/aer.99.3.1053)** —
World oil production, global real activity index, real oil price. The
activity index is maintained by the Dallas Fed (IGREA).\
Used in: Kilian (2009); Kilian and Murphy (2014); Baumeister and
Hamilton (2019). Frequency: monthly. Coverage: 1973-2007. Tags: oil,
svar, global-activity, us.

**[Kilian global real economic activity
index](https://www.dallasfed.org/research/igrea)** — Corrected and
updated by the Dallas Fed; download as xlsx.\
Used in: Kilian (2009); Kilian and Zhou (2018). Frequency: monthly.
Coverage: 1968-present. Tags: oil, global-activity, shipping, index.

## Macro panel

**[FRED-MD /
FRED-QD](https://www.stlouisfed.org/research/economists/mccracken/fred-databases)**
— Drop-in replacement for the Stock-Watson large panels (e.g. the 120
series in bbe2005). Monthly vintages are archived so results can be
pinned to a date.\
Used in: McCracken and Ng (2016); Stock and Watson (2016); Bernanke,
Boivin and Eliasz (2005) updates. Frequency: monthly/quarterly.
Coverage: 1959-present. Tags: factor-model, favar, big-data, us,
vintages.

## Financial conditions

**[Gilchrist and Zakrajsek (2012) excess bond
premium](https://www.federalreserve.gov/econres/notes/feds-notes/updating-the-recession-risk-and-the-excess-bond-premium-20161006.html)**
— Updated monthly by the Fed Board (ebp_csv.csv). This is the `ebp`
column in gk2015.\
Used in: Gilchrist and Zakrajsek (2012); Gertler and Karadi (2015).
Frequency: monthly. Coverage: 1973-present. Tags: credit-spread, ebp,
financial, us.

## Fiscal policy

**[Mertens and Ravn (2013) narrative tax
shocks](https://karelmertens.com/research/)** — Personal and corporate
income tax narrative measures used as external instruments.\
Used in: Mertens and Ravn (2013); Mertens and Ravn (2014). Frequency:
quarterly. Coverage: 1950-2006. Tags: fiscal-policy, tax, narrative,
proxy-svar, us.

**[Auerbach and Gorodnichenko (2012) fiscal
multipliers](https://www.aeaweb.org/articles?id=10.1257/pol.4.2.1)** —
AEA replication package with forecasts from SPF and Greenbook.\
Used in: Auerbach and Gorodnichenko (2012). Frequency: quarterly.
Coverage: 1947-2008. Tags: fiscal-policy, multipliers, regime-switching,
stvar, us.

## Productivity

**[Fernald utilization-adjusted
TFP](https://www.frbsf.org/research-and-insights/data-and-indicators/total-factor-productivity-tfp/)**
— Updated quarterly by the San Francisco Fed.\
Used in: Fernald (2014); Basu, Fernald and Kimball (2006); Gali (1999)
updates. Frequency: quarterly. Coverage: 1947-present. Tags: tfp,
technology-shocks, productivity, us.

## Uncertainty

**[Jurado, Ludvigson and Ng (2015) uncertainty
indexes](https://www.sydneyludvigson.com/macro-and-financial-uncertainty-indexes)**
— Macro, real and financial uncertainty at 1, 3 and 12 month horizons;
updated regularly.\
Used in: Jurado, Ludvigson and Ng (2015); Ludvigson, Ma and Ng (2021).
Frequency: monthly. Coverage: 1960-present. Tags: uncertainty, macro,
financial, us.

**[Economic Policy Uncertainty
index](https://www.policyuncertainty.com/)** — US and country-level
indexes plus categorical sub-indexes.\
Used in: Baker, Bloom and Davis (2016). Frequency: monthly/daily.
Coverage: 1985-present. Tags: uncertainty, news, policy, us, global.

## Asset prices

**[Shiller online data (S&P, CAPE, house
prices)](http://www.econ.yale.edu/~shiller/data.htm)** — The long S&P
price/dividend/earnings series behind psy2015 and most bubble tests.\
Used in: Shiller (1981); Campbell and Shiller (1988); Phillips, Shi and
Yu (2015); Case and Shiller (2003). Frequency: monthly/annual. Coverage:
1871-present. Tags: stock-market, dividends, cape, house-prices,
bubbles, us.

## Macro-financial panel

**[Jorda-Schularick-Taylor Macrohistory
Database](https://www.macrohistory.net/database/)** — 18 advanced
economies, 1870 onwards. CC BY-NC-SA licence; download as xlsx or dta.\
Used in: Schularick and Taylor (2012); Jorda, Schularick and Taylor
(2017); Jorda et al. (2019). Frequency: annual. Coverage: 1870-present.
Tags: panel, credit, crises, house-prices, returns, 18-countries.

## Crises

**[Reinhart and Rogoff crisis
chronologies](https://www.reinhartandrogoff.com/data/)** — Country-level
crisis dates and debt series.\
Used in: Reinhart and Rogoff (2009); Reinhart and Rogoff (2011).
Frequency: annual. Coverage: 1800-present. Tags: crises, banking,
sovereign-debt, inflation, panel.

**[Laeven and Valencia systemic banking crises
database](https://www.imf.org/en/Publications/WP/Issues/2018/09/14/Systemic-Banking-Crises-Revisited-46232)**
— IMF WP 18/206 with the database as an appendix xlsx.\
Used in: Laeven and Valencia (2013); Laeven and Valencia (2020).
Frequency: annual. Coverage: 1970-2017. Tags: crises, banking, panel,
imf.

## Growth panel

**[Penn World Table](https://www.rug.nl/ggdc/productivity/pwt/)** — Also
on CRAN as the `pwt10` package.\
Used in: Mankiw, Romer and Weil (1992); Hall and Jones (1999); Feenstra,
Inklaar and Timmer (2015). Frequency: annual. Coverage: 1950-present.
Tags: growth, productivity, panel, cross-country.

**[Maddison Project
Database](https://www.rug.nl/ggdc/historicaldevelopment/maddison/)** —
Long-run GDP per capita. CRAN: `maddison` package.\
Used in: Bolt and van Zanden (2020). Frequency: annual. Coverage:
1-2018. Tags: growth, gdp-per-capita, long-run, cross-country.

**[Barro-Lee educational attainment](http://www.barrolee.com/)** —
Download as csv or dta from the project site.\
Used in: Barro and Lee (2013). Frequency: 5-yearly. Coverage: 1950-2015.
Tags: education, human-capital, panel, cross-country.

## Institutions

**[Acemoglu, Johnson and Robinson (2001) settler
mortality](https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive)**
— Data archive on Acemoglu’s MIT page covers most of his published
papers.\
Used in: Acemoglu, Johnson and Robinson (2001); Albouy (2012).
Frequency: cross-section. Coverage: 1995. Tags: institutions,
instrumental-variables, cross-country, colonial.

## Unit roots

**[Nelson and Plosser (1982) US macro
series](https://cran.r-project.org/package=tseries)** — Bundled in R:
`tseries::NelPlo`. Extended to 1988 by Schotman and van Dijk (1991).\
Used in: Nelson and Plosser (1982); Perron (1989); Zivot and Andrews
(1992). Frequency: annual. Coverage: 1860-1970. Tags: unit-root,
structural-break, long-run, us.

## Textbook

**[Lutkepohl (2005) and JMulTi textbook
datasets](https://cran.r-project.org/package=vars)** — Bundled in R:
`vars::Canada`; e1-e6 datasets ship with JMulTi and `urca`.\
Used in: Lutkepohl (2005); Pfaff (2008). Frequency: quarterly. Coverage:
1960-2000. Tags: var, svar, vecm, cointegration, germany, canada.

**[Kilian and Lutkepohl (2017) textbook
datasets](https://sites.google.com/site/lkilian2019/textbook)** — The
`kl2017` and `oil` datasets in this package come from here; the site has
the full chapter-by-chapter data and Matlab code.\
Used in: Kilian and Lutkepohl (2017). Frequency: quarterly. Coverage:
1954-2013. Tags: var, svar, oil, monetary-policy, us.

## Repository

**[AEA Data and Code Repository
(openICPSR)](https://www.openicpsr.org/openicpsr/aea)** — Mandatory
replication packages for all AEA journals. Search by DOI.\
Used in: Any AER, AEJ, JEP or JEL paper since 2019. Frequency: various.
Coverage: various. Tags: replication, repository, aea.

**[Journal of Applied Econometrics Data
Archive](http://qed.econ.queensu.ca/jae/)** — Long-running archive; most
classic applied time-series papers (Hamilton, Perron, Pesaran…) have
entries.\
Used in: Any JAE paper since 1988. Frequency: various. Coverage:
various. Tags: replication, repository, jae, time-series.

**[Harvard Dataverse](https://dataverse.harvard.edu/)** — Many top-5
journals deposit replication packages here; search by paper title.\
Used in: QJE, ReStud, JPE, Econometrica replication packages. Frequency:
various. Coverage: various. Tags: replication, repository, dataverse.

**[Federal Reserve Economic Data (FRED)](https://fred.stlouisfed.org/)**
— R access via `fredr` or `quantmod::getSymbols(src = 'FRED')`. ALFRED
holds real-time vintages.\
Used in: Nearly every US macro paper. Frequency: various. Coverage:
various. Tags: us, macro, api, fred.

## Missing something?

Open an [issue](https://github.com/kvasilopoulos/econdata/issues) with
the paper, the URL and a line on what the data are, or edit
[`data-raw/sources.csv`](https://github.com/kvasilopoulos/econdata/blob/master/data-raw/sources.csv)
and send a pull request.
