#' List of the contained papers
#'
#' One row per bibliography entry in `data-raw/bib/papers.bib`. `BIBTEXKEY`
#' matches the `paper` column of [catalog].
#'
#' @seealso [catalog], [sources], [variables]
"papers"

#' Catalog of the bundled datasets
#'
#' One row per dataset in the package with its category, tags, frequency,
#' sample range and the paper it comes from. Every dataset is also served as
#' CSV from `https://kvasilopoulos.github.io/econdata/data/<key>.csv`
#' (index at `data/index.json`).
#'
#' @format A tibble with one row per dataset:
#' \describe{
#'   \item{key}{Object name in the package, e.g. `"sw2001"`.}
#'   \item{title}{Short description.}
#'   \item{paper}{`BIBTEXKEY` of the source paper in [papers], or `NA`.}
#'   \item{category}{Broad topic: Monetary policy, Business cycles, Asset
#'     prices, Oil and energy.}
#'   \item{tags}{`|`-separated keywords.}
#'   \item{frequency, country}{Sampling frequency and country.}
#'   \item{start, end}{First and last date in the data.}
#'   \item{nrow, ncol}{Dimensions.}
#'   \item{variables}{Comma-separated column names.}
#'   \item{source_url}{Where the original data were obtained.}
#'   \item{notes}{Free text.}
#' }
#' @examples
#' catalog[, c("key", "category", "frequency", "start", "end")]
#' subset(catalog, grepl("var", tags))$key
"catalog"

#' External replication data sources
#'
#' Curated pointers to freely available datasets that are widely used in
#' empirical macroeconomics but are not bundled with the package (too large,
#' updated regularly, or restrictively licensed). Use it to find the data
#' behind a paper you want to reproduce.
#'
#' @format A tibble with one row per source: `name`, `used_in` (papers that
#'   use it), `category`, `tags` (`|`-separated), `frequency`, `coverage`,
#'   `url` and `notes`.
#' @examples
#' sources[grepl("monetary-policy", sources$tags), c("name", "url")]
"sources"

#' @template rox_papers
#' @importFrom tibble tibble
#' @templateVar key "bbe2005"
"bbe2005"

#' @template rox_papers
#' @templateVar key "bq1989"
"bq1989"

#' @template rox_papers
#' @templateVar key "u2005"
"u2005"

#' @template rox_papers
#' @templateVar key "gk2015"
"gk2015"

#' @template rox_papers
#' @templateVar key "sw2001"
"sw2001"

#' @template rox_papers
#' @templateVar key "psy2015"
"psy2015"

# Books -------------------------------------------------------------------

#' Kilian and Lütkepohl (2017) textbook monetary VAR
#'
#' Quarterly US data used in Chapter 2 of *Structural Vector Autoregressive
#' Analysis*: real GDP growth (`drgdp`), federal funds rate (`ff`) and
#' inflation (`infl`), 1954Q4-2007Q4.
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("kl2017")}
#' @seealso [oil]
"kl2017"

#' Kilian and Lütkepohl (2017) textbook oil VAR
#'
#' Quarterly US oil-market data used in Chapter 2 of *Structural Vector
#' Autoregressive Analysis*: real oil price growth (`drpoil`), inflation
#' (`infl`) and real GDP growth (`drgdp`), 1973Q1-2013Q2.
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("kl2017")}
#' @seealso [kl2017]
"oil"

# Recession periods -------------------------------------------------------

#' NBER business cycle reference dates
#'
#' Peak and trough months of US business cycles as dated by the NBER Business
#' Cycle Dating Committee, and the length of each contraction in months.
#'
#' @source <https://www.nber.org/research/data/us-business-cycle-expansions-and-contractions>
#' @examples
#' rec <- subset(nber_rec, Peak >= as.Date("1960-01-01"))
#' plot(sw2001$date, sw2001$un, type = "l", xlab = "", ylab = "Unemployment")
#' rect(rec$Peak, -1e3, rec$Trough, 1e3, col = adjustcolor("grey", 0.4), border = NA)
"nber_rec"

# Ramey Handbook / JPE ----------------------------------------------------

#' Ramey (2016) monetary shocks panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("r2016")}
#' @details Monthly US panel behind Section 3 (monetary shocks) of the
#'   Handbook chapter: macro aggregates plus Romer-Romer, Gertler-Karadi,
#'   Barakchian-Crowe and Sims-Zha shock series, the excess bond premium,
#'   the Wu-Xia shadow rate and five Stock-Watson factors. Column
#'   definitions: `subset(variables, dataset == "r2016_monetary")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"r2016_monetary"

#' Ramey (2016) government spending panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("r2016")}
#' @details Quarterly US panel behind Section 4 (government spending) of the
#'   Handbook chapter: nominal NIPA components and deflators, hours,
#'   population, Ramey military news and Ben Zeev-Pappa defense news.
#'   Column definitions: `subset(variables, dataset == "r2016_govt")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"r2016_govt"

#' Ramey (2016) technology shocks panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("r2016")}
#' @details Quarterly US panel behind Section 5 (technology shocks) of the
#'   Handbook chapter: Fernald TFP series, business output and hours, and
#'   identified technology/news shocks from several papers. Column
#'   definitions: `subset(variables, dataset == "r2016_tech")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"r2016_tech"

#' Ramey (2016) tax shocks panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("r2016")}
#' @details Quarterly US panel behind Section 4 (tax shocks) of the Handbook
#'   chapter: real NIPA aggregates, tax receipts, Romer-Romer and
#'   Mertens-Ravn narrative tax shocks. Column definitions:
#'   `subset(variables, dataset == "r2016_tax")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"r2016_tax"

#' Ramey and Zubairy (2018) US historical fiscal data
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("rz2018")}
#' @details Quarterly US data 1889-2015 (population from 1875) used for the
#'   state-dependent government spending multipliers: purchases, GDP,
#'   deflator, unemployment, military news, T-bill, ZLB dummy, potential GDP,
#'   debt and receipts. Column definitions:
#'   `subset(variables, dataset == "rz2018")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"rz2018"

#' Gilchrist and Zakrajsek (2012) excess bond premium
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gz2012")}
#' @details Monthly GZ credit spread (`gz_spread`), excess bond premium
#'   (`ebp`) and the implied 12-month-ahead recession probability
#'   (`est_prob`), as updated by the Federal Reserve Board. Snapshot of
#'   September 2026.
#' @source <https://www.federalreserve.gov/econres/notes/feds-notes/updating-the-recession-risk-and-the-excess-bond-premium-20161006.html>
"gz2012"

#' Variable dictionary for the wide panels
#'
#' Column descriptions for `bbe2005`, the four `r2016_*` panels, `rz2018`
#' and `ci2022`, taken from the original data files' readme sheets.
#'
#' @format A tibble with columns `dataset`, `variable`, `description`.
#' @examples
#' subset(variables, dataset == "rz2018")
"variables"

# Maintained series from author / Fed websites ---------------------------

#' @template rox_papers
#' @templateVar key "wx2016"
#' @details Monthly effective federal funds rate (`ff`) and the Wu-Xia shadow
#'   rate (`shadow`), both on the last business day of the month, 1960-2022.
#'   The shadow rate is only defined at the zero lower bound (NA otherwise).
#' @source <https://www.atlantafed.org/cqer/research/wu-xia-shadow-federal-funds-rate>
"wx2016"

#' @template rox_papers
#' @templateVar key "f2014"
#' @details Quarterly growth rates (400 x log change) of business-sector
#'   output, hours, labour productivity, capital and TFP (`dtfp`), the
#'   utilization adjustment (`dutil`) and utilization-adjusted TFP
#'   (`dtfp_util`), plus the investment/consumption sector split. September
#'   2026 vintage; the SF Fed revises the whole series each quarter.
#' @source <https://www.frbsf.org/research-and-insights/data-and-indicators/total-factor-productivity-tfp/>
"f2014"

#' @template rox_papers
#' @templateVar key "bbd2016"
#' @details Monthly US economic policy uncertainty: the news-based index
#'   from 1900 (`epu_news`) and, from 1985, the three-component index
#'   (`epu_3comp`) with its news, government-forecaster disagreement, CPI
#'   disagreement and tax-expiration parts.
#' @source <https://www.policyuncertainty.com/>
"bbd2016"

#' @template rox_papers
#' @templateVar key "k2009"
#' @details Monthly index of global real economic activity in industrial
#'   commodity markets (`igrea`), built from dry-bulk shipping rates, as
#'   corrected and maintained by the Dallas Fed. The demand-side series in
#'   the Kilian (2009) oil market VAR.
#' @source <https://www.dallasfed.org/research/igrea>
"k2009"

#' @template rox_papers
#' @templateVar key "jln2015"
#' @details Monthly macro, financial and real uncertainty indexes at 1, 3
#'   and 12 month horizons (`macro_h1`, ..., `real_h12`). August 2026 update.
#' @source <https://www.sydneyludvigson.com/macro-and-financial-uncertainty-indexes>
"jln2015"

#' Jarocinski and Karadi (2020) Fed monetary policy and information shocks
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("jk2020")}
#' @details Monthly sums of FOMC-announcement surprises 1990-2019: the
#'   policy-indicator principal component (`pc1ff1_hf`) and the S&P 500
#'   (`sp500_hf`), decomposed into monetary policy (`mp_`) and central bank
#'   information (`cbi_`) shocks with poor man's (`_pm`) and median
#'   (`_median`) sign restrictions.
#' @source <https://marekjarocinski.github.io/jkshocks/jkshocks.html>
"jk2020"

#' @template rox_papers
#' @templateVar key "mr2013"
#' @details Quarterly 1950-2006: narrative personal (`T_PI`) and corporate
#'   (`T_CI`) income tax liability changes, their unanticipated parts
#'   (`m_PI`, `m_CI`), average tax rates, tax bases and the macro
#'   aggregates of the SVAR. Column names as in the replication files.
#' @source <https://karelmertens.com/research/>
"mr2013"

#' @template rox_papers
#' @templateVar key "ci2022"
#' @details Monthly geopolitical risk: the recent index from 1985 (`GPR`)
#'   and historical index from 1900 (`GPRH`), each split into threats and
#'   acts, article shares by category and 44 country-specific indexes
#'   (`GPRC_*`). Column definitions:
#'   `subset(variables, dataset == "ci2022")`. August 2026 vintage.
#' @source <https://www.matteoiacoviello.com/gpr.htm>
"ci2022"

#' @template rox_papers
#' @templateVar key "s2015"
#' @details Monthly S&P Composite price, dividends, earnings, CPI and long
#'   rate from 1871, the real series, CAPE, total-return CAPE, excess CAPE
#'   yield and 10-year forward returns, as on Shiller's website.
#' @source <http://www.econ.yale.edu/~shiller/data.htm>
"s2015"

#' @template rox_papers
#' @templateVar key "r2011"
#' @details Quarterly 1939-2008: present discounted value of defense news
#'   (`pdvmil`, and `pdvmily` as a share of lagged GDP), real GDP and
#'   components, government and defense spending, hours, population, real
#'   manufacturing wage, CPI, BAA yield, T-bill and the average marginal
#'   tax rate.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"r2011"

#' Jarocinski and Karadi (2020) ECB monetary policy and information shocks
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("jk2020")}
#' @details ECB counterpart of [jk2020]: monthly sums of surprises around
#'   ECB announcements 1999-2023 from the Altavilla et al. (2019) Euro Area
#'   Monetary Policy event-study Database, split into monetary policy
#'   (`mp_`) and central bank information (`cbi_`) shocks.
#' @source <https://marekjarocinski.github.io/jkshocks/jkshocks.html>
"jk2020_ecb"

#' @template rox_papers
#' @templateVar key "mr2014"
#' @details Quarterly 1950-2006 log real tax revenues (`ltax`), government
#'   spending (`lgov`) and output (`lgdp`), the Romer-Romer narrative tax
#'   measure (`tax_narrative`) and its alternatives.
#' @source <https://karelmertens.com/research/>
"mr2014"

#' @template rox_papers
#' @templateVar key "mmo2018"
#' @details Annual 1946-2012 average marginal tax rates by income group
#'   (`amtr_*` total, `amiitr_*` income tax, `amptr_*` payroll), narrative
#'   marginal-rate shocks (`shock_*`), log average income (`linc_*`) and the
#'   macro controls of the paper (`ctrl_*`).
#' @source <https://karelmertens.com/research/>
"mmo2018"

#' Gurkaynak, Sack and Swanson (2005) target and path factors
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gss2005")}
#' @details One row per FOMC announcement 1994-2018 with the target and
#'   path factors, as updated by Gurkaynak, Karasoy-Can and Lee (2021,
#'   Journal of Finance). The raw asset-price surprises they are built from
#'   are in [gss2005_surprises].
#' @source <http://www.bilkent.edu.tr/~refet/>
"gss2005"

#' Gurkaynak, Sack and Swanson (2005) raw FOMC-day surprises
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gss2005")}
#' @details Intraday surprises around 342 FOMC announcements 1984-2019 in
#'   fed funds and eurodollar futures (`MP1`-`MP6`, `FF1`-`FF6`,
#'   `ED1`-`ED8`), OIS, on-the-run Treasuries, TIPS, stock indexes, FX and
#'   swap spreads, plus the Kuttner surprise and an intermeeting dummy.
#'   Column names as in `GSSrawdata.xlsx`; the factors are in [gss2005].
#' @source <http://www.bilkent.edu.tr/~refet/>
"gss2005_surprises"

#' @template rox_papers
#' @templateVar key "bw2016"
#' @details Quarterly 1947-2013 panel used to compare economic performance
#'   under Democratic and Republican presidents. FRED mnemonics are kept as
#'   column names; `subset(variables, dataset == "bw2016")` has the
#'   descriptions.
#' @source <https://www.princeton.edu/~mwatson/ddisk/>
"bw2016"

#' @template rox_papers
#' @templateVar key "glp2015"
#' @details The Stock-Watson quarterly dataset 1959Q1-2008Q4 used for the
#'   small VAR: real GDP, GDP deflator, consumption, investment, hours and
#'   real compensation (indexes, 2000 = 100) and the federal funds rate
#'   averaged from the monthly sheet.
#' @source <https://faculty.wcas.northwestern.edu/gep575/research.html>
"glp2015"
