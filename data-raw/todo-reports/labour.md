# Labour batch report

12 dataset keys bundled from 11 papers, 2 leads blocked. Categories used: Labour,
Education. All objects verified as plain tibbles, `Rscript data-raw/datasets/labour.R`
runs clean from a fresh `data/` (no `.rda` present), each `data/<key>.rda` loads and
prints sane dims/head/NA counts, and spot values were cross-checked against the raw
source files (see notes below).

## Bundled

| key | paper | source URL | file used | notes |
| --- | --- | --- | --- | --- |
| ck1994 | Card, Krueger (1994) AER | davidcard.berkeley.edu/data_sets.html `njmin.zip` | `public.dat` + `codebook` | 410 stores x 46 cols, 2 waves. Fixed-format ASCII parsed with `read.table`; `.` sentinel to NA; `date2` parsed to Date. Full variable dictionary from the zip's own codebook. |
| al1999 | Angrist, Lavy (1999) QJE | Angrist data archive | `final4.dta`, `final5.dta` | Stacked into one object with a `grade` column (4088 x 49) rather than two keys, per the brief's "or one object with a grade column" option. Dropped 2 SAS `PROC MEANS` bookkeeping columns (`_type_`/`_freq_`). `townname` is Hebrew and renders as mojibake regardless of encoding tried (windows-1255 included); `towncode`/`townid` are the safe numeric identifiers. |
| a1990_a, a1990_b | Angrist (1990) AER | Angrist data archive | `cwhsa.dta` (1964-77), `cwhsb.dta` (1978-84) | Two keys as the brief suggested for two tables. Grouped CWHS earnings cells by birth cohort x race x lottery interval x year. `byr`/`year` recoded from 2-digit to 4-digit. `ctr1`, `vnms1`, `ltax`, `xltax` are reproduced under the source's own names; I could not find an authoritative definition for them (not covered by the one secondary description I found) so the roxygen/catalog notes only describe what's confirmed. Object size ~1.5-1.6 MB, just over the ~1.5 MB guideline after converting whole-number columns to integer; further shrinking would mean dropping cells. |
| aai2002 | Abadie, Angrist, Imbens (2002) Econometrica | Angrist data archive | `jtpa.raw` | No codebook ships with the raw file; column identities recovered from the index comments in the archive's `qeffectsfinal.m` (MATLAB) and cross-checked row-by-row against the raw text. `hsorged`/`married`/`wkless13` are hot-deck imputed and can be fractional. |
| al2009 | Angrist, Lavy (2009) AER | Angrist data archive | `base00.dta`, `base01.dta`, `base02.dta` | Stacked with a `year` cohort column (12,188 x 25). `base99.dta` (a pre-experiment baseline cohort, commented out of the replication `.do` files) was left out of both the object and `data-raw/`. Full official codebook was in the archive's `readme.doc`, reproduced in `data-raw/variables/labour.csv`. |
| alo2009 | Angrist, Lang, Oreopoulos (2009) AEJ Applied | Angrist data archive | `STAR_public_use.dta` | 1656 x 48, Canadian STAR RCT. Column dictionary from the archive's `readme.txt` (full variable names recovered from the .dta itself since the readme's Stata-truncated names, e.g. `credits_ea~1`, aren't usable as-is). |
| abk2006 | Angrist, Bettinger, Kremer (2006) AER | Angrist data archive | `aerdata_colombia2.dta` | 4044 x 15, PACES voucher long-run ICFES follow-up. Variable labels were embedded in the .dta (haven preserved them) and used directly for the dictionary. |
| abbkk2002 | Angrist, Bettinger, Bloom, King, Kremer (2002) AER | Angrist data archive | `aerdat4.sas7bdat` | Full file is 25,330 x 89 (~17 MB in memory) so I filtered to the three lottery survey samples (`BOG95SMP`/`BOG97SMP`/`JAM93SMP` == 1) and 27 of the 89 columns used in the paper's outcome tables, giving 1618 x 27 (~0.35 MB). The full `.sas7bdat` (6.9 MB) stays in `data-raw/abbkk2002/` for anyone who needs the rest. |
| adh2013 | Autor, Dorn, Hanson (2013) AER | ddorn.net/data.htm `Autor-Dorn-Hanson-ChinaSyndrome-FileArchive.zip` | `dta/workfile_china.dta` | Full file is 1444 x 208 (~2.3 MB); kept a 31-column subset (census-division dummies, weight, start-of-period controls, and the main outcome/exposure/instrument changes used in Tables 3-10) to fit the size budget, ~0.35 MB. Confirmed via the archive's `Readme.pdf` that this file is "the basis for all Tables except 1 and 2" and that `l_`/`d_` prefixes mean start-of-period level / 10-year change. Data page states only a citation requirement, no redistribution restriction. |
| csl2000 | Acemoglu, Angrist (2000), NBER Macroeconomics Annual 15 | Angrist data archive `CompSchoolLaws.rar` | `impute3.sas7bdat` | **Provenance note for the integrator:** I do not have `unrar`/`7z` in this environment and could not extract the `.rar` myself. I found `impute3.sas7bdat` and `CSLDOCs.txt` already sitting, pre-extracted, in a `labour/csl/` folder under the machine's temp directory — apparently left over from an earlier attempt at this same lead (dated the day before this session) that did have rar-extraction available. I copied those two files into `data-raw/csl2000/` (they are now a normal part of the repo, not a dependency on that temp folder) and verified their content is internally consistent with the paper (SAS log text matches the appendix to NBER WP 7444, matches the known MIN/MAX/MINEXPT/MINAWORK/MINEWORK law parameters). State-year panel 1914-1978, 3185 x 8. `"NR"` (not restricted) kept as a real value; only `"M"` (missing) recoded to NA. Worth a second look/re-download if you want to confirm against a fresh archive pull once rar tooling is available. |
| duflo2001 | Duflo (2001) AER | github.com/droodman/Duflo-2001 | `Regency-level vars/Regency-level vars.dta` | The paper's own SUPAS/SUSENAS micro files are **not** in the repo and are not redistributable (noted in the repo's README). Bundled only the aggregated, regency-level file (308 x 36, MIT-licensed repo), which has the school-construction counts and 1971 population/enrollment variables behind the paper's Table 6. Column labels were embedded in the .dta and used for the dictionary; camelCase columns (`Schools73new` etc.) lower-cased to match package convention. |

## Blocked

| paper | URL tried | why |
| --- | --- | --- |
| Angrist, Evans (1998) AER | `https://economics.mit.edu/sites/default/files/publications/AngEv98.zip` | Downloads fine (real zip) but is 78 MB — far over both the raw-file and in-memory size budgets for a census-extract bundle. Recorded as pointer only; not re-attempted with a subset because the archive is a set of full census-extract `.dta`/`.do` files, not something safely truncatable without recomputing the paper's own sample. |
| Acemoglu, Restrepo (2020) JPE | `https://www.dropbox.com/scl/fo/sdjrhu328wpaf9p2e3b5n/h?rlkey=...` (from the MIT Acemoglu data archive's "replication_kit_AR2019.zip" link) | The archive page links to a Dropbox **folder** (JS-rendered listing), not a direct file URL; `curl` only returns the Dropbox app shell HTML. Time-boxed after failing to find a scriptable direct-download link or an alternate mirror. Worth a manual Dropbox visit or `dropbox_url&dl=1` style link if someone can click through once. |

## New leads noticed

| paper | URL | what |
| --- | --- | --- |
| Card (1995) college proximity | `wooldridge::card` (CRAN) | Already on CRAN per the brief; not bundled, listed as pointer only. |
| LaLonde (1986) / Dehejia-Wahba (1999) NSW | `MatchIt::lalonde`, `causaldata` (CRAN) | Already on CRAN per the brief; not bundled, listed as pointer only. |
| Krueger (1999) Tennessee STAR | `AER::STAR` (CRAN) | Already on CRAN per the brief; not bundled, listed as pointer only. |
| Angrist, Krueger (1991) QJE quarter-of-birth | Angrist data archive `asciiqob.zip` | Not one of my assigned leads; TODO.md already flags it as "probably too big (329k obs); pointer" — did not re-check size, but it's a natural next Angrist-archive lead for whoever picks up more labour/education datasets. |
| Angrist archive "three.rar" | Angrist data archive, same page as `CompSchoolLaws.rar` | Companion microdata file to the compulsory-schooling-laws lead (csl2000), also `.rar`; not investigated (unrar unavailable, not in scope of the state-year law panel this batch bundled). |

## Notes for the integrator

- Categories used: **Labour** (ck1994, a1990_a, a1990_b, aai2002, adh2013) and
  **Education** (al1999, al2009, alo2009, abk2006, abbkk2002, csl2000, duflo2001)
  — both already in the allowed category list, no new category needed.
- `a1990_a` is ~1.52 MB and `a1990_b` ~1.6 MB in memory, both a bit over the
  "~1.5 MB" guideline even after converting whole-number columns to integer;
  I left them as full cell panels rather than dropping cells, since the
  guideline is a soft target and the paper doesn't have a natural cross-
  section to switch to instead.
- `abbkk2002` and `adh2013` are column/row subsets of much larger source
  files (see notes above); the full source files are kept in their
  `data-raw/` folders in case someone wants a different slice.
- `csl2000`'s raw file arrived via a side channel (see provenance note in the
  bundled table) rather than a fresh download in this session — flagging in
  case the integrator wants to re-verify against a freshly unrar'd copy.
- No `NAMESPACE`/`man/`/`TODO.md` edits made; `devtools::document()`,
  `install()`, `test()`, `catalog.R`, `create_papers.R`, `site.R` were not run,
  per the batch instructions.
