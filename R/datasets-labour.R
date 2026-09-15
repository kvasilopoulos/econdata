# Batch: labour --------------------------------------------------------------

#' @template rox_papers
#' @templateVar key "ck1994"
#' @details 410 New Jersey and Pennsylvania fast-food restaurants surveyed
#'   just before and about 8 months after New Jersey's April 1992 minimum-wage
#'   increase (the `_2` suffix marks wave-2 columns); `state` is 1 for New
#'   Jersey. The canonical difference-in-differences dataset. Column
#'   dictionary from the source codebook: `subset(variables, dataset ==
#'   "ck1994")`.
#' @source <https://davidcard.berkeley.edu/data_sets.html>
"ck1994"

#' Angrist and Lavy (1999) Israel class size (Maimonides' rule)
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("al1999")}
#' @details 4th- and 5th-grade classes (`grade`) in Israeli public schools,
#'   c. 1991: enrollment, class size (`classize`), and average/pass rates on
#'   math and verbal tests, used to instrument class size with Maimonides'
#'   rule (an extra class is opened once enrollment passes a multiple of 40).
#'   Column dictionary (main variables): `subset(variables, dataset ==
#'   "al1999")`.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"al1999"

#' Angrist (1990) Vietnam draft lottery, FICA earnings cells 1964-1977
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("a1990")}
#' @details Grouped Social Security earnings cells by birth cohort
#'   (`byr`, 1944-1953), `race`, draft-lottery-number `interval` (73 bins of
#'   5 numbers) and calendar `year` (1964-1977): mean/sd/n of FICA-taxable
#'   earnings per cell. Column names as in the source file (`vmn1` mean
#'   earnings, `vsd1` sd, `vnu1` n, `vfin1` fraction with zero earnings).
#'   The 1978-1984 extension (also FICA and total W-2 pay) is [a1990_b].
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"a1990_a"

#' Angrist (1990) Vietnam draft lottery, FICA and W-2 earnings cells 1978-1984
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("a1990")}
#' @details Same cell structure as [a1990_a] for 1978-1984, with `type`
#'   distinguishing FICA-taxable (`"TAXAB"`) from total W-2 (`"TOTAL"`)
#'   earnings.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"a1990_b"

#' @template rox_papers
#' @templateVar key "aai2002"
#' @details 11,204 JTPA (Job Training Partnership Act) applicants randomly
#'   assigned to a training offer (`assignment`) with actual enrollment
#'   (`training`) and total earnings in the following 30 months
#'   (`earnings`); used for the paper's instrumental-variables quantile
#'   treatment effects. `hsorged`, `married` and `wkless13` are hot-deck
#'   imputed and can be fractional. Column dictionary: `subset(variables,
#'   dataset == "aai2002")`.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"aai2002"

#' Angrist and Lavy (2009) high school achievement awards RCT
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("al2009")}
#' @details Individual-level panel of Israeli high school students in
#'   schools randomized into a Bagrut (matriculation) achievement-award
#'   program, cohorts 2000-2002 (`year`). `treated` marks the award group;
#'   `att18`-`att24`/`awr18`-`awr24` are attempted/awarded Bagrut credit
#'   units and `achv_math`/`achv_eng`/`achv_hib` mark satisfying each
#'   subject requirement. Official codebook: `subset(variables, dataset ==
#'   "al2009")`. Student and school ids are fictitious.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"al2009"

#' @template rox_papers
#' @templateVar key "alo2009"
#' @details 1,656 first-year students at a Canadian university randomized
#'   into academic-support services and/or grade-based financial incentives
#'   (STAR); grades, credits earned, probation status and survey responses.
#'   Column dictionary from the archive's readme: `subset(variables, dataset
#'   == "alo2009")`.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"alo2009"

#' Angrist, Bettinger and Kremer (2006) Colombia voucher long-run follow-up
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("abk2006")}
#' @details 4,044 PACES voucher-lottery applicants (`vouch0`) matched to
#'   their national ICFES exam records 5-8 years after the lottery, with
#'   math and reading scores. Companion long-run file to [abbkk2002]. Column
#'   dictionary: `subset(variables, dataset == "abk2006")`.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"abk2006"

#' Angrist, Bettinger, Bloom, King and Kremer (2002) Colombia PACES voucher lottery
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("abbkk2002")}
#' @details Bogota (1995, 1997) and Jamundi (1993) PACES voucher-lottery
#'   survey respondents (`vouch0` = won the lottery): demographics, grade
#'   repetition/progression and labour-market outcomes. A 1,618-row,
#'   27-column subset of the archive's `aerdat4.sas7bdat` (25,330 rows x 89
#'   columns): filtered to the three survey samples and the covariates used
#'   in the paper's outcome tables to fit the package's per-object size
#'   budget; the full file is in `data-raw/abbkk2002/`. Column dictionary:
#'   `subset(variables, dataset == "abbkk2002")`.
#' @source <https://economics.mit.edu/people/faculty/josh-angrist/angrist-data-archive>
"abbkk2002"

#' @template rox_papers
#' @templateVar key "adh2013"
#' @details 722 US commuting zones by 2 ten-year periods (1990-2000,
#'   2000-2007, `yr`/`t2`): start-of-period levels (`l_` prefix) and 10-year
#'   changes (`d_` prefix) in manufacturing employment, wages and Chinese
#'   import exposure per worker (`d_tradeusch_pw`), plus the Autor-Dorn-
#'   Hanson instrument (`d_tradeotch_pw_lag`). A 31-column subset of the
#'   208-column `workfile_china.dta` (the main-table variables only), kept
#'   to stay under the package's per-object size budget; the full file is in
#'   `data-raw/adh2013/`. Column dictionary: `subset(variables, dataset ==
#'   "adh2013")`.
#' @source <https://www.ddorn.net/data.htm>
"adh2013"

#' @template rox_papers
#' @templateVar key "duflo2001"
#' @details 308 Indonesian birth regencies: number of INPRES primary schools
#'   built 1973-1978 (`Schools73new`-`Schools78new`), 1971 child population,
#'   school-enrollment rate and population density, the program-intensity
#'   instruments (`nin`, `recp`) and the `java`/`poor` indicators used in the
#'   paper's Table 6. From David Roodman's replication repository (MIT
#'   licence); the underlying 1995 SUPAS/SUSENAS micro files are not
#'   redistributable and are not part of this package. Column dictionary:
#'   `subset(variables, dataset == "duflo2001")`.
#' @source <https://github.com/droodman/Duflo-2001>
"duflo2001"
