# econdata

R data package: curated datasets from influential macro papers, served both as
R objects and as static CSVs from `docs/` (GitHub Pages, branch master /docs).
No pkgdown: `data-raw/site.R` writes `docs/index.md` + `docs/variables.md`
(rendered by GitHub's built-in Jekyll, theme in `docs/_config.yml`), the CSV
API under `docs/data/`, and the vignettes as self-contained HTML in
`docs/articles/`.

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
  paper (kl2017/oil, ramey2016_*) get explicit titles + `@references \Sexpr`
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

Raw sources bundled so far: Ramey's Handbook zips (`Ramey_HOM_*.zip`) and
Ramey-Zubairy replication zip from econweb.ucsd.edu/~vramey, Fed EBP csv.
Kilian (2009) AEA data needs a login; not fetchable.

## Conventions

- Date column first, lower-case short names (`ff`, `un`, `infl`), plain
  `tibble` (strip readr `spec_tbl_df`)
- Sentinel missing values from sources (e.g. `123456789`) become `NA`
- Site URL base for the CSV API: `https://kvasilopoulos.github.io/econdata/data/`
- Commits: semantic, one concern each, no co-author/AI trailers
- Shell: Git Bash heredocs mangle `\` in R/Rmd; use the Edit/Write tools for
  regexes and `\Sexpr`/`\Vignette` lines
- Rscript segfaults on multi-line `-e` here; write a script to `$TMP` and run it
