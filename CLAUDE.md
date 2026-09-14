# econdata

R data package: curated datasets from influential macro papers, served both as
R objects and as static CSVs from `docs/` (GitHub Pages, branch master /docs).
No pkgdown, no Jekyll (`docs/.nojekyll`): `data-raw/site.R` string-templates
`docs/index.html` + `docs/variables.html` (Bootstrap 5.3 + Newsreader from
CDN, ~20 lines of vanilla JS for the catalog filter), writes the CSV API under
`docs/data/`, and renders the vignettes as self-contained HTML in
`docs/articles/`. Hero chart is an inline SVG built from rz2018 + nber_rec.

## Layout

- `data-raw/<key>/` raw files; `data-raw/DATASETS.R` builds `data/<key>.rda`
- `data-raw/bib/papers.bib` -> `bib/create_papers.R` -> `data/papers.rda`
  (`REFERENCE`/`AUTHORYEAR` must stay in bib-file order: `.sort = FALSE`)
- `data-raw/catalog.csv` (hand-curated category/tags/source per dataset) +
  `data-raw/sources.csv` (external replication data) -> `catalog.R` ->
  `data/catalog.rda`, `data/sources.rda`; nrow/ncol/start/end are computed
- `data-raw/catalog.R` also builds `variables` (column dictionary) from the
  readme sheets of the wide panels (bbe2005 catalog.CSV is windows-1252)
- `data-raw/site.R` -> everything under `docs/` (deletes and recreates it)
- `R/datasets.R` roxygen for every object; `man-roxygen/rox_papers.R`
  template pulls title/reference from `papers` via `\Sexpr` at render time,
  so the package must be installed before `document()`. Datasets sharing a
  paper (kl2017/oil, r2016_*) get explicit titles + `@references \Sexpr`
  instead of the template so reference titles stay distinct

## Adding a dataset

1. Raw file under `data-raw/<key>/`, block in `DATASETS.R`, run it
2. Bib entry in `data-raw/bib/papers.bib` (brace the year), run `create_papers.R`
3. Row in `data-raw/catalog.csv` (category must be in `cat_order` in
   `site.R`), run `catalog.R`
4. `#' @template rox_papers` + `@templateVar key "<key>"` in `R/datasets.R`
5. `devtools::document(); devtools::install(); devtools::test()`
6. `Rscript data-raw/site.R`; commit `docs/`

External source only: row in `data-raw/sources.csv`, run `catalog.R` + `site.R`.

`data-raw/TODO.md` is the dataset backlog (bundled / todo / blocked with
URLs). Update it every time a lead is checked or a dataset lands; the user
wants the search to keep going. `DATASETS.R` has `frac_to_date()` for
fractional-year dates and `month_date()` for year+month columns.

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
