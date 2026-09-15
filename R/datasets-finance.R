# Batch: finance -----------------------------------------------------------

#' @template rox_papers
#' @templateVar key "rr2017"
#' @details Semiannual financial-distress score (0-14, higher means more
#'   distress) for 30 OECD countries, 1967:1-2017:2. Long tibble: `date`
#'   (first day of the half-year), `country`, `distress`. Author's site
#'   extension of the original 24-country 1967-2012 series through 2017 and
#'   6 more countries.
#' @source <https://eml.berkeley.edu/~dromer/>
"rr2017"

#' He, Kelly and Manela (2017) intermediary capital ratio and risk factor (quarterly)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("hkm2017")}
#' @details Quarterly primary-dealer intermediary capital ratio
#'   (`intermediary_capital_ratio`), capital risk factor
#'   (`intermediary_capital_risk_factor`), value-weighted investment return
#'   and squared leverage ratio, 1970Q1-. Maintained by Zhiguo He; snapshot
#'   of the 2025-06-27 update. Monthly version: [hkm2017_monthly].
#' @source <https://zhiguohe.net/data-and-empirical-patterns/>
"hkm2017_quarterly"

#' He, Kelly and Manela (2017) intermediary capital ratio and risk factor (monthly)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("hkm2017")}
#' @details Monthly counterpart of [hkm2017_quarterly], 1970-01-. Same four
#'   columns. Snapshot of the 2025-06-27 update.
#' @source <https://zhiguohe.net/data-and-empirical-patterns/>
"hkm2017_monthly"

#' @template rox_papers
#' @templateVar key "bw2006"
#' @details Monthly US investor sentiment 1958-01 to 2023-12: the sentiment
#'   index (`SENT`) and its orthogonalized version (`SENT_ORTH`), the five
#'   underlying proxies (`pdnd`, `ripo`, `nipo`, `cefd`, `s`) and macro
#'   controls used to orthogonalize them. Column definitions:
#'   `subset(variables, dataset == "bw2006")`. NYSE turnover was dropped as
#'   a sixth sentiment proxy in this maintained version (unlike the original
#'   2006/2007 papers). Snapshot updated 2024-05-31.
#' @source <https://pages.stern.nyu.edu/~jwurgler/>
"bw2006"

#' Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (monthly)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gwz2024")}
#' @details 57 monthly predictor variables for the equity premium, 1871-01
#'   to 2025-12: prices, dividends, earnings, returns, bond yields and
#'   spreads, valuation ratios (`dp`, `dy`, `ep`, `de`, `bm`), and macro and
#'   sentiment controls. Column names follow Welch and Goyal's mnemonics
#'   (slashes dropped, e.g. `d/p` -> `dp`); definitions:
#'   `subset(variables, dataset == "gwz2024_monthly")`. Quarterly and annual
#'   versions: [gwz2024_quarterly], [gwz2024_annual].
#' @source <https://sites.google.com/view/agoyal145>
"gwz2024_monthly"

#' Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (quarterly)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gwz2024")}
#' @details Quarterly counterpart of [gwz2024_monthly], same 57 columns,
#'   1871Q1-2025Q4.
#' @source <https://sites.google.com/view/agoyal145>
"gwz2024_quarterly"

#' Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) equity premium predictors (annual)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("gwz2024")}
#' @details Annual counterpart of [gwz2024_monthly], same 57 columns,
#'   1871-2025.
#' @source <https://sites.google.com/view/agoyal145>
"gwz2024_annual"

#' @template rox_papers
#' @templateVar key "rr2009"
#' @details Country-year panel (20 advanced economies, 1946-2009):
#'   `debt_gdp` (public debt/GDP ratio), `debt_cat` (its Reinhart-Rogoff
#'   bucket: "0-30%", "30-60%", "60-90%", "Above 90%") and `gdp_growth`
#'   (real GDP growth). Reconstructed from the Reinhart-Rogoff data by
#'   Herndon, Ash and Pollin (2014, Cambridge Journal of Economics), whose
#'   widely cited replication and critique found a spreadsheet error and
#'   selective exclusions in the original "Growth in a Time of Debt"
#'   analysis; see their paper for details.
#' @source <https://peri.umass.edu/publication/item/526-does-high-public-debt-consistently-stifle-economic-growth-a-critique-of-reinhart-and-rogoff>
"rr2009"

#' @template rox_papers
#' @templateVar key "rf2009"
#' @details Long tibble (`year`, `activity`, `sex`, `age_group`, `hours`)
#'   reshaped from the authors' four multi-header sheets (Work, School, Home
#'   Production, Leisure), US 1900-2005. `activity` is one of "work",
#'   "school", "home_production", "leisure"; `sex` is "male", "female" or
#'   "all"; `age_group` follows the source's age bands (e.g. "14+",
#'   "18-24"). The "Lifetime Leisure" sheet (leisure hours by birth cohort)
#'   is not included.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"rf2009"

#' @template rox_papers
#' @templateVar key "fr2009"
#' @details Quarterly US 1948Q1-2007Q4, the "Data for SVARs" sheet: total
#'   and average weekly hours (unadjusted, demographically adjusted and
#'   efficiency-weighted), noninstitutional population by age group,
#'   government/nonprofit/business hours, real GDP and the Fisher/log
#'   labour-productivity and fed funds series (`fisherdlp`, `dlp`, `ffr`,
#'   only populated from the mid-1980s in the source file). Column
#'   definitions: `subset(variables, dataset == "fr2009")`.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"fr2009"

#' @template rox_papers
#' @templateVar key "nr2020"
#' @details Quarterly US price-cost markup measures, 1947Q1-2017Q4, under
#'   alternative production-function and labour-share assumptions: business
#'   (`mu_bus*`), nonfinancial business/corporate (`mu_nfb`, `mu_nfcb`),
#'   Cobb-Douglas (`lmu_cd*`) and CES (`lmu_ces*`) specifications, with and
#'   without overhead-labour (`_oh`) and marginal-cost (`_marg`)
#'   adjustments. Column names as in the replication file; see the paper's
#'   Section 2 for their construction.
#' @source <https://econweb.ucsd.edu/~vramey/research.html>
"nr2020"
