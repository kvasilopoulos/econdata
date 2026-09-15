#' @template rox_papers
#' @templateVar key "ajr2001"
#' @details 186 countries with at least one non-missing variable from the
#'   settler-mortality replication file (the 64-country `baseco == 1` sample
#'   is the paper's main IV regression sample): (log) European settler
#'   mortality (`extmort4`, `logem4`), average protection against
#'   expropriation risk 1985-95 (`avexpr`), log GDP per capita PPP 1995
#'   (`logpgp95`), European descent share in 1900 (`euro1900`), and
#'   constraints on the executive/democracy in 1900 and at independence.
#' @source <https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive>
"ajr2001"

#' @template rox_papers
#' @templateVar key "ajr2002"
#' @details 203 countries with at least one non-missing outcome/historical
#'   variable from the reversal-of-fortune replication file (the 41-country
#'   `baserf == 1` sample is the paper's main regression sample): log GDP
#'   per capita PPP 1995 (`logpgp95`), urbanization in 1995 (`urbz1995`),
#'   population density and log population density in 1500 and 1000 AD
#'   (`pd1500s`, `lpd1500s`, `lpd1000s`), an ever-a-European-colony dummy
#'   (`ex2col`) and constraints on the executive in 1990 (`cons90`).
#' @source <https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive>
#' @seealso [ajr2001]
"ajr2002"

#' Acemoglu, Johnson, Robinson and Yared (2008) income and democracy panel
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("ajry2008")}
#' @details 2321 country x 5-year-period observations 1950-2000 from the
#'   "5 Year Panel" sheet of the paper's replication file: log real GDP per
#'   capita (`lrgdpch`), log population (`lpop`), the augmented Freedom
#'   House political rights index (`fhpolrigaug`), the Polity IV score
#'   (`polity4`), savings rate, labour share, age structure, education and
#'   sample/instrument flags. Column definitions:
#'   `subset(variables, dataset == "ajry2008")`.
#' @source <https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive>
"ajry2008"

#' Acemoglu and Johnson (2007) disease, life expectancy and development
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("aj2007")}
#' @details 4257 country x decade observations 1900-2000 from the paper's
#'   replication file (`disease.dta`, main analysis columns only): life
#'   expectancy (`lifeexpect`), the predicted global-mortality instrument
#'   built from the international epidemiological transition
#'   (`globmort1000`), Maddison population and GDP levels, and the
#'   sample/startXXX tercile flags used in the paper's specifications.
#'   Column definitions: `subset(variables, dataset == "aj2007")`.
#' @source <https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive>
"aj2007"

#' @template rox_papers
#' @templateVar key "hj1999"
#' @details 152 countries (the "basic data" table of the paper's data
#'   appendix, c. 1988): log output, physical capital and human capital per
#'   worker, total factor productivity (`loga`), the government
#'   anti-diversion policy index (`gadp`), trade openness, the social
#'   infrastructure index (`socinf`), and language/geography controls.
#'   Column definitions: `subset(variables, dataset == "hj1999")`.
#' @source <https://web.stanford.edu/~chadj/>
"hj1999"

#' @template rox_papers
#' @templateVar key "j2002"
#' @details US annual growth-accounting series 1950-1993: real GDP, hours,
#'   capital stock, GDP per hour (`gdp_l`), capital-output ratio (`k_y`),
#'   saving rate (`sk`), average educational attainment (`edatt`) and total
#'   factor productivity (`a`). The scientists/engineers and employment
#'   tables for France, Germany, Japan, the UK and the G-5 total in the same
#'   source file are not included.
#' @source <https://web.stanford.edu/~chadj/>
"j2002"

#' @template rox_papers
#' @templateVar key "chks2014"
#' @details 741 commuting zones (Online Data Table V of the paper's online
#'   data tables): relative mobility (`rm_80_82_cohort`, the child-rank on
#'   parent-rank slope) and absolute upward mobility (`am_80_82_cohort`,
#'   the predicted rank of a child with parent at the 25th percentile) for
#'   the core 1980-82 birth cohort, plus by-sex, by-cohort, income-definition
#'   and covariate-adjusted variants, and college attendance/quality and
#'   teenage-birth outcome mobility. Column definitions (from the source's
#'   own variable dictionary): `subset(variables, dataset == "chks2014")`.
#' @source <https://opportunityinsights.org/data/>
"chks2014"

#' @template rox_papers
#' @templateVar key "cghhmn2017"
#' @details 45 birth cohorts (1940-1984) by 100 parent-income percentiles,
#'   in long format: the share of children earning more than their parents
#'   (`abs_mob`) at each parent percentile (`par_pctile`), plus the
#'   cohort's overall absolute mobility rate (`cohort_mean`) and the share
#'   of parents with zero or negative income (`par_frac0`).
#' @source <https://opportunityinsights.org/data/>
"cghhmn2017"

#' Chetty et al. (2016) life expectancy by household income percentile
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("chetty2016")}
#' @details National life expectancy at age 40 by household income
#'   percentile (1-100) and sex, 2001-2014, raw (`le_agg`) and
#'   race-adjusted (`le_raceadj`) with standard errors and cell counts.
#'   Released by the authors under a CC0 licence (public domain); cite the
#'   2016 JAMA paper. State-level breakdown in [chetty2016_state].
#' @source <https://healthinequality.org/data/>
#' @seealso [chetty2016_state]
"chetty2016"

#' Chetty et al. (2016) life expectancy by income quartile and state
#'
#' @references \Sexpr[stage=render,results=rd]{econdata:::bib_ref("chetty2016")}
#' @details Life expectancy at age 40 by household income quartile
#'   (`le_agg_q1_F`...`le_agg_q4_M`, raw and race-adjusted, by sex), US
#'   state, 2001-2014, with standard errors and cell counts. Same CC0
#'   licence as [chetty2016], which has the national breakdown.
#' @source <https://healthinequality.org/data/>
#' @seealso [chetty2016]
"chetty2016_state"

#' @template rox_papers
#' @templateVar key "ps2003"
#' @details Top fractile shares of income excluding capital gains,
#'   1913-2024 (Table A1 of the latest "TabFig" vintage on Saez's site):
#'   cumulative shares `p90_100` through `p99_99_100` and within-bracket
#'   shares `p90_95` through `p99_9_99_99`.
#' @source <https://eml.berkeley.edu/~saez/>
"ps2003"

#' @template rox_papers
#' @templateVar key "psz2018"
#' @details Equal-split pre-tax and post-tax national income shares of the
#'   bottom 50%, middle 40%, top 10% and top 1% (plus pre-tax top 0.1%),
#'   1913-2014. `pretax_bottom50`, `pretax_middle40` and all `posttax_*`
#'   series start in 1962, when individualized micro data begin.
#' @source <https://gabriel-zucman.eu/usdina/>
"psz2018"

#' @template rox_papers
#' @templateVar key "sz2016"
#' @details Top wealth shares from capitalizing income tax returns,
#'   1913-2012 (the Figure 1 series): `bottom90`, `top10`, `top5`, `top1`,
#'   `top05`, `top01` and `top001` (top 0.01%) shares of household wealth.
#' @source <https://gabriel-zucman.eu/uswealth/>
"sz2016"
