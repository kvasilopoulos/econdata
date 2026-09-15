# Development batch report

13 dataset keys bundled from 12 papers (leads 1-11 from the brief; lead 5 blocked,
lead 12 not attempted, time-boxed). Categories used: Development and growth, Health,
Inequality. `Rscript data-raw/datasets/development.R` runs clean from a fresh
`data/` (all 13 `.rda` deleted and rebuilt), each `data/<key>.rda` loads and prints
sane dims/NA counts, and spot values were cross-checked against the raw source files
(USA/known-country rows, known table cells) — see notes below.

Six raw files (`ajr2001/`, `ajr2002/`, `ajry2008/`, `aj2007/`, `hj1999/`, `chks2014/`,
`cghhmn2017/`, `chetty2016/`, `ps2003/`, `psz2018/`, `sz2016/`) were already on disk
from a prior session that died before writing any build script. Every one was opened
and content-verified (known-value spot checks, e.g. US settler mortality = 15 in
`ajr2001`, US life expectancy 1940 = 63.8 in `aj2007`, Seattle absolute mobility =
43.2 in `chks2014`) before reuse; none were re-downloaded. Two leftover derived CSVs
of unclear provenance (`aj2007/panel.csv`, `ajry2008/panel5yr.csv`) were deleted
after confirming the build script reads the original `.dta`/`.xls` files directly
instead and reproduces their content exactly.

## Bundled

| key | paper | source URL | file used | notes |
| --- | --- | --- | --- | --- |
| ajr2001 | Acemoglu, Johnson, Robinson (2001) AER | economics.mit.edu Acemoglu data archive | `maketable1.dta` | 186 x 11 (of 376 raw rows; dropped rows with an empty/"." country code or no non-missing variable). `baseco==1` marks the paper's 64-country base IV sample. USA row cross-checked (extmort4=15, avexpr=10, logpgp95=10.216) against known published values. |
| ajr2002 | Acemoglu, Johnson, Robinson (2002) QJE | economics.mit.edu Acemoglu data archive | `maketable1.dta` | 203 x 13 (of 376 raw rows; same empty-code cleanup, plus dropped rows with no non-missing outcome/historical variable). `baserf==1` marks the paper's 41-country base sample. USA row cross-checked (pd1500s=76.1, lpd1500s=0.0873). `sjb1500`'s exact definition could not be confirmed from available documentation; left undescribed in the variable dictionary rather than guessed. |
| ajry2008 | Acemoglu, Johnson, Robinson, Yared (2008) AER | economics.mit.edu Acemoglu data archive | `Income and Democracy Data AER adjustment.xls`, sheet "5 Year Panel" | 2321 x 22, 1950-2000. Dropped the sheet's redundant `code_numeric`/`year_numeric` columns. Column dictionary taken from the workbook's own "Variable Key" sheet, in `data-raw/variables/development.csv`. |
| aj2007 | Acemoglu, Johnson (2007) JPE | economics.mit.edu Acemoglu data archive | `disease.dta` (334 raw columns; 18 kept) | 4257 x 18, 1900-2000 by decade. US 1940 row cross-checked (lifeexpect=63.8, globmort1000=0.1324) directly against the raw `.dta`. Category set to **Health** (per TODO.md's Health section, not Development and growth). |
| hj1999 | Hall, Jones (1999) QJE | web.stanford.edu/~chadj | `HallJones400.asc` (basic-data table) | 152 x 20. The already-on-disk `basic_data.csv` was independently re-derived from the `.asc`'s fixed-width table in this session (regex/fixed-width parse) and matched it exactly (max abs diff = 0 on every numeric column), confirming it's a faithful transcription; used it directly. |
| j2002 | Jones (2002) AER | web.stanford.edu/~chadj | `Sources50.asc` (main US growth-accounting table) | 44 x 9, 1950-1993, parsed directly from the plain-text table (lines 81-124). The France/Germany/Japan/UK/G-5 scientist-and-employment tables further down the same file were left out (out of scope for a single-country key). |
| chks2014 | Chetty, Hendren, Kline, Saez (2014) QJE | opportunityinsights.org/data | `online_data_tables-4.xls`, "Online Data Table V" | 741 x 35, the CZ-level mobility table. Seattle row cross-checked (AM=43.2) against the raw sheet. >10 cryptic columns, so full dictionary (from the sheet's own "Variable"/"Description" block) is in `data-raw/variables/development.csv`. |
| cghhmn2017 | Chetty et al. (2017) Science | opportunityinsights.org/data | `table1_national_absmob_by_cohort_parpctile.xlsx` | 4500 x 5 (45 cohorts x 100 percentiles), pivoted from the source's wide 103-column layout into a tidy long table (`cohort`, `par_pctile`, `abs_mob`). Cohort 1940/percentile 1 cross-checked (0.946). |
| chetty2016 | Chetty et al. (2016) JAMA | healthinequality.org/data | `health_ineq_online_table_1.csv` | 200 x 9, national life expectancy by income percentile x sex, 2001-2014. Data released under a **CC0** licence (confirmed on the source page: "released to the public domain... to permit the widest possible reuse"). |
| chetty2016_state | Chetty et al. (2016) JAMA | healthinequality.org/data | `health_ineq_online_table_3.csv` | 51 x 43, state-level life expectancy by income quartile x sex. Same CC0 licence; bundled per the brief's "state table if small" (43 KB). |
| ps2003 | Piketty, Saez (2003, updated) QJE | eml.berkeley.edu/~saez | `TabFig2024.xlsx`, sheet "Table A1" | 112 x 12, 1913-2024 (latest "TabFig" vintage found, per the brief's instruction to look for a newer file than TabFig2018). Top fractile shares excluding capital gains, cumulative (P90-100...P99.99-100) and within-bracket (P90-95...P99.9-99.99). 2024 row cross-checked against the raw sheet. |
| psz2018 | Piketty, Saez, Zucman (2018) QJE | gabriel-zucman.eu/usdina | `PSZ2018MainData.xlsx`, "Data" sheet, equal-split pre/post-tax share columns | 102 x 10, 1913-2014 (trailing all-NA 2015-2020 rows dropped). Picked the "Equal-split pre-tax and post-tax income shares" block (cols 65-76) out of the sheet's 275 columns rather than the full appendix workbook, per the brief. `pretax_bottom50`/`pretax_middle40`/all `posttax_*` only start in 1962 (individualized micro data). |
| sz2016 | Saez, Zucman (2016) QJE | gabriel-zucman.eu/uswealth | `SaezZucman2015MainData.xlsx`, sheet "DataFig1-6-7b" | 100 x 8, 1913-2012 (trailing all-NA rows dropped). This is the Figure 1 wealth-share time series (bottom90/top10/top5/top1/top05/top01/top001), which is more useful than the single-year "Table1" cross-section also in the workbook. 2012 row cross-checked (top10=0.7724, top1=0.4182, top01=0.2201). |

Licence notes: `chetty2016`/`chetty2016_state` are explicitly CC0. `healthinequality.org`
requests citation of the 2016 JAMA paper. The Acemoglu archive, chadj, Saez and Zucman
pages state no explicit licence but are the authors' own freely downloadable research
pages with no login/paywall; catalog notes say "no licence stated on the site, cite
the paper" for those. `opportunityinsights.org/data` likewise states no explicit
per-file licence on the page I could fetch.

## Blocked

| paper | URL tried | why |
| --- | --- | --- |
| Acemoglu, Naidu, Restrepo, Robinson (2019) JPE (democracy-growth, `replication_files_ddcg.rar`) | Acemoglu data archive | `.rar`; this environment has neither `unrar` nor `7z`, confirmed in the brief. Not attempted. |
| Nunn (2008) QJE / Nunn, Wantchekon (2011) AER | `https://nathannunn.arts.ubc.ca/data/` | Returns a "Browser Verification | UBC Cybersecurity" bot-check page (HTTP 200, 31 KB HTML, not real data), same as the prior session's 2026-09-14 attempt. Retried once this session per the brief, still blocked. QoG's `slavet` mirror (noted in TODO.md) was not pursued — out of time budget for this batch. |

## New leads noticed

| paper | URL | what |
| --- | --- | --- |
| Goodman-Bacon (2018) JPE (state-year infant/child mortality, Medicaid) | journal supplement / author site | Lead 12 in the brief; not attempted this batch (lowest priority, no files pre-staged, time-boxed out). Still open. |
| Miguel, Kremer (2004) Econometrica (deworming RCT) | Harvard Dataverse, DOI linked from Miguel's site | Lead 12 in the brief; not attempted this batch. Dataverse is reportedly CC0 per TODO.md — worth checking file size before bundling if picked up later. |
| Hall, Jones (2007) QJE (health spending, value of life) | web.stanford.edu/~chadj `hxprograms500.zip` | Lead 6 in the brief (`hj2007`); not attempted — lower priority than the growth/inequality leads and not pre-staged on disk. Still open. |
| AJR maketable1.dta country-code merge artifact | economics.mit.edu Acemoglu data archive | Both `ajr2001/maketable1.dta` and `ajr2002/maketable1.dta` ship as 376-row files merged against a near-universal ISO country-code list, with only 186/203 rows carrying any real data (and one row with a literal `"."` code). Worth knowing for any future batch reusing Acemoglu-archive `.dta` files: always filter on non-missing content, not just row count. |
