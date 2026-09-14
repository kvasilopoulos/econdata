# econdata

R data package: curated datasets from influential macro papers, served both as
R objects and as static CSVs from `docs/` (GitHub Pages, branch master /docs).
No pkgdown, no Jekyll (`docs/.nojekyll`): `data-raw/site.R` string-templates
`docs/index.html` + `docs/variables.html` (Bootstrap 5.3 + Newsreader from
CDN, ~20 lines of vanilla JS for the catalog filter), writes the CSV API under
`docs/data/`, and renders the vignettes as self-contained HTML in
`docs/articles/`. Hero chart is an inline SVG built from rz2018 + nber_rec.

## Layout

- `data-raw/<key>/` raw files; `data-raw/datasets/<batch>.R` builds
  `data/<key>.rda` (each script starts with `source("data-raw/helpers.R")`,
  which loads dplyr/tidyr/readr/purrr/usethis and `frac_to_date()`,
  `month_date()`). `core.R` is the original set; one file per later batch
- `data-raw/bib/*.bib` (papers.bib + one per batch) -> `bib/create_papers.R`
  -> `data/papers.rda` (`REFERENCE`/`AUTHORYEAR` stay in bib order:
  `.sort = FALSE`)
- `data-raw/catalog/*.csv` (core.csv + one per batch; hand-curated
  category/tags/source per dataset) + `data-raw/sources.csv` -> `catalog.R`
  -> `data/catalog.rda`, `data/sources.rda`; nrow/ncol/start/end computed
- `catalog.R` also builds `variables` (column dictionary) from readme sheets
  plus any `data-raw/variables/*.csv` (dataset,variable,description)
- `R/datasets*.R` roxygen; one file per batch is fine
- Parallel batches (subagents): each batch touches only its own
  `datasets/<b>.R`, `bib/<b>.bib`, `catalog/<b>.csv`, `variables/<b>.csv`,
  `R/datasets-<b>.R`, `data-raw/<key>/`, `data/<key>.rda`; never edits the
  shared scripts, TODO.md, NAMESPACE or man/, and never runs document(),
  install(), test() or git. Integration (document/test/site/commit) is done
  once at the end by the main session
- `data-raw/site.R` -> everything under `docs/` (deletes and recreates it)
- `R/datasets.R` roxygen for every object; `man-roxygen/rox_papers.R`
  template pulls title/reference from `papers` via `\Sexpr` at render time,
  so the package must be installed before `document()`. Datasets sharing a
  paper (kl2017/oil, r2016_*) get explicit titles + `@references \Sexpr`
  instead of the template so reference titles stay distinct

## Adding a dataset

1. Raw file under `data-raw/<key>/`, block in `data-raw/datasets/<batch>.R`, run it
2. Bib entry in `data-raw/bib/<batch>.bib` (brace the year), run `create_papers.R`
3. Row in `data-raw/catalog/<batch>.csv` (category must be in `cat_order` in
   `site.R`), run `catalog.R`
4. `#' @template rox_papers` + `@templateVar key "<key>"` in `R/datasets-<batch>.R`;
   datasets sharing a bib key get an explicit title + `@references \Sexpr`
5. `devtools::document(); devtools::install(); devtools::test()`
6. `Rscript data-raw/site.R`; commit `docs/`

External source only: row in `data-raw/sources.csv`, run `catalog.R` + `site.R`.

`data-raw/TODO.md` is the dataset backlog (bundled / todo / blocked with
URLs); the user also adds leads to it by hand. Update it every time a lead
is checked or a dataset lands; the user wants the search to keep going.
Subagents report into `data-raw/todo-reports/<batch>.md`, the main session
folds those into TODO.md.

## Conventions

- Date column first, lower-case short names (`ff`, `un`, `infl`), plain
  `tibble` (strip readr `spec_tbl_df`)
- Sentinel missing values from sources (e.g. `123456789`) become `NA`
- Site URL base for the CSV API: `https://kvasilopoulos.github.io/econdata/data/`
- Commits: semantic, one concern each, no co-author/AI trailers
- Site look: white paper, navy ink (#1b2a49), cranberry accent (#c0334d),
  serif headings, monospace only for R object names. Preview with
  `python -m http.server` in docs/ (Playwright blocks file://)
- Shell: Git Bash heredocs mangle `\` in R/Rmd; use the Edit/Write tools for
  regexes and `\Sexpr`/`\Vignette` lines
- Rscript segfaults on multi-line `-e` here; write a script to `$TMP` and run it
