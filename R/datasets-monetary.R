# Batch: monetary ##########################################################

#' Nakamura and Steinsson (2018) monetary policy news shock
#'
#' One row per FOMC announcement, Jan 2000-Mar 2014 (baseline sample:
#' excludes unscheduled meetings and the Sep 2008-Jun 2009 financial-crisis
#' window). `policy_news_shock` is the first principal component of five
#' interest-rate futures in a 30-minute window around the announcement,
#' rescaled so a unit change equals the response of the 1-year nominal
#' Treasury yield; `ffr_shock` is the unexpected change in the fed funds
#' rate over the same window.
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ns2018")}
#' @seealso [ns2018_1995]
"ns2018"

#' Nakamura and Steinsson (2018) monetary policy news shock, extended sample
#'
#' Same construction as [ns2018] but on the larger Jan 1995-Mar 2014 sample:
#' includes unscheduled meetings (flagged by `unscheduled`) and the
#' financial-crisis window (still excludes the two Sep 2001 meetings after
#' 9/11). `policy_news_shock` differs slightly from [ns2018] on overlapping
#' dates because the first principal component is re-estimated on this
#' sample.
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ns2018")}
#' @seealso [ns2018]
"ns2018_1995"

#' @template rox_papers
#' @templateVar key "s2021"
#' @details One row per FOMC announcement, Jul 1991-Jun 2019: three
#'   orthogonal factors from a rotation of interest-rate and asset-price
#'   changes in a 30-minute announcement window: the fed funds factor
#'   (`ff_factor`), forward guidance factor (`fg_factor`) and large-scale
#'   asset purchase factor (`lsap_factor`). Extends Gurkaynak, Sack and
#'   Swanson (2005) through the ZLB and QE period.
"s2021"

#' Bauer and Swanson (2023) monetary policy surprises, monthly
#'
#' Monthly high-frequency monetary policy surprises, Feb 1988-Dec 2023.
#' `mps` sums the FOMC-announcement surprises (fed funds and Eurodollar
#' futures through 2008, then SOFR-adjusted Treasury futures) within the
#' month; `mps_orth` is `mps` orthogonalised against pre-FOMC macro/financial
#' controls to remove the Fed information effect. See [bs2023_fomc] for the
#' announcement-level data and the control variables (`nfp_surp` to
#' `tr_skew`).
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("bs2023")}
#' @seealso [bs2023_fomc]
"bs2023"

#' Bauer and Swanson (2023) monetary policy surprises, FOMC-announcement level
#'
#' One row per FOMC announcement, Feb 1988-Dec 2023: fed funds and
#' Eurodollar futures changes (`ff1`, `ff2`, `ed1`-`ed4`), Treasury note/bond
#' yield changes, the S&P 500 return, the raw surprise (`mps`) and its
#' orthogonalised version (`mps_orth`), plus the pre-FOMC-window control
#' surprises used to construct `mps_orth` (payrolls surprise and trailing
#' growth, S&P momentum, yield-curve slope, commodity returns, Treasury
#' option skew). Column dictionary in [variables]. Updates the original
#' Gurkaynak-Sack-Swanson / Swanson-Jayawickrema series.
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("bs2023")}
#' @seealso [bs2023]
"bs2023_fomc"

#' @template rox_papers
#' @templateVar key "mar2021"
#' @details One row per FOMC date, Feb 1990-Dec 2009. `fomc_date` and
#'   `gb_date` give the meeting date and the preceding Greenbook publication
#'   date; `is_unscheduled` flags non-scheduled meetings. `iv1` and `iv5` are
#'   the fed funds futures (FF4) instruments purged of central-bank
#'   information effects using Greenbook forecasts, built at all Greenbook
#'   rounds (`iv1`) and at scheduled FOMC meetings only (`iv5`).
"mar2021"

#' Altavilla et al. (2019) Euro Area Monetary Policy Event-Study Database, monetary event window
#'
#' One row per Governing Council monetary policy event, Jan 1999-Oct 2025:
#' changes (basis points, or percent for equities/FX) in OIS rates,
#' German/Italian/French/Spanish government bond yields, euro-area equity
#' indices and EUR exchange rates, over the combined press-release-plus-
#' press-conference window. Column dictionary in [variables]. See
#' [eampd_pr] and [eampd_pc] for the two sub-windows separately; this is the
#' dataset behind [jk2020_ecb].
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("eampd")}
#' @seealso [eampd_pr], [eampd_pc]
"eampd"

#' Altavilla et al. (2019) EA-MPD, press release window
#'
#' Same columns as [eampd], restricted to the press-release window (the
#' initial Governing Council statement, narrower than the combined event
#' window).
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("eampd")}
#' @seealso [eampd], [eampd_pc]
"eampd_pr"

#' Altavilla et al. (2019) EA-MPD, press conference window
#'
#' Same columns as [eampd], restricted to the press-conference Q&A window;
#' `NA` on dates with no press conference (Governing Council statement only).
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("eampd")}
#' @seealso [eampd], [eampd_pr]
"eampd_pc"

#' @template rox_papers
#' @templateVar key "hlw2017"
#' @details Quarterly 1961Q1-2026Q2 (Euro area from 1972Q1) estimates from
#'   the Holston-Laubach-Williams state-space model, for the US, Canada and
#'   the Euro area: trend GDP growth (`g_`), the other-determinants factor
#'   (`z_`), the natural rate of interest (`rstar_`) and the model-implied
#'   output gap (`gap_`). Column dictionary in [variables]. Maintained by the
#'   New York Fed and updated quarterly.
"hlw2017"

#' @template rox_papers
#' @templateVar key "k2021"
#' @details Monthly 1975-01 to 2025-12: `oil_supply_surprise` is the change
#'   in the front-month Brent futures price in a narrow window around OPEC
#'   announcements; `oil_supply_news_shock` is the same surprise series
#'   orthogonalised and scaled via the paper's VAR. CC BY 4.0, snapshot of
#'   the 2025M12 vintage from the author's GitHub repository.
"k2021"

#' @template rox_papers
#' @templateVar key "bh2019"
#' @details Monthly 1975-02 to 2026-03 posterior-median structural oil
#'   shocks from a Bayesian SVAR with incomplete sign/narrative
#'   identification: `supply_shock`, `activity_shock` (global economic
#'   activity), `consumption_demand_shock` and `inventory_demand_shock`.
"bh2019"

#' @template rox_papers
#' @templateVar key "ll2001"
#' @details Quarterly 1952Q1-2019Q3: log consumption per capita (`c`), log
#'   asset wealth (`w`), log labour income (`y`) and the cointegrating
#'   residual `cay` = c - 0.218 w - 0.801 y + 0.441 (the consumption-wealth
#'   ratio). From 2014Q3 the authors construct `c` from personal consumption
#'   expenditures rather than nondurables-and-services. Not updated past
#'   2019Q3 as of this snapshot.
"ll2001"
