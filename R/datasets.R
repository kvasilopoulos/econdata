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
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ramey2016")}
#' @details Monthly US panel behind Section 3 (monetary shocks) of the
#'   Handbook chapter: macro aggregates plus Romer-Romer, Gertler-Karadi,
#'   Barakchian-Crowe and Sims-Zha shock series, the excess bond premium,
#'   the Wu-Xia shadow rate and five Stock-Watson factors. Column
#'   definitions: `subset(variables, dataset == "ramey2016_monetary")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"ramey2016_monetary"

#' Ramey (2016) government spending panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ramey2016")}
#' @details Quarterly US panel behind Section 4 (government spending) of the
#'   Handbook chapter: nominal NIPA components and deflators, hours,
#'   population, Ramey military news and Ben Zeev-Pappa defense news.
#'   Column definitions: `subset(variables, dataset == "ramey2016_govt")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"ramey2016_govt"

#' Ramey (2016) technology shocks panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ramey2016")}
#' @details Quarterly US panel behind Section 5 (technology shocks) of the
#'   Handbook chapter: Fernald TFP series, business output and hours, and
#'   identified technology/news shocks from several papers. Column
#'   definitions: `subset(variables, dataset == "ramey2016_tech")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"ramey2016_tech"

#' Ramey (2016) tax shocks panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ramey2016")}
#' @details Quarterly US panel behind Section 4 (tax shocks) of the Handbook
#'   chapter: real NIPA aggregates, tax receipts, Romer-Romer and
#'   Mertens-Ravn narrative tax shocks. Column definitions:
#'   `subset(variables, dataset == "ramey2016_tax")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"ramey2016_tax"

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
#' Column descriptions for `bbe2005`, the four `ramey2016_*` panels and
#' `rz2018`, taken from the original data files' readme sheets.
#'
#' @format A tibble with columns `dataset`, `variable`, `description`.
#' @examples
#' subset(variables, dataset == "rz2018")
"variables"
