#' List of the contained papers
#'
#' One row per bibliography entry in `data-raw/bib/papers.bib`. `BIBTEXKEY`
#' matches the `paper` column of [catalog].
#'
#' @seealso [catalog], [sources]
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
