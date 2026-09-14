# econdata

R data package: curated datasets from influential macro papers, served both as
R objects and as static CSVs from the pkgdown site (`docs/`, GitHub Pages).

## Layout

- `data-raw/<key>/` raw files; `data-raw/DATASETS.R` builds `data/<key>.rda`
- `data-raw/bib/papers.bib` -> `bib/create_papers.R` -> `data/papers.rda`
  (`REFERENCE`/`AUTHORYEAR` must stay in bib-file order: `.sort = FALSE`)
- `data-raw/catalog.csv` (hand-curated category/tags/source per dataset) +
  `data-raw/sources.csv` (external replication data) -> `catalog.R` ->
  `data/catalog.rda`, `data/sources.rda`; nrow/ncol/start/end are computed
- `data-raw/export.R` -> `pkgdown/assets/data/*.csv`, `index.json`,
  `papers.bib`, `bbe2005-variables.csv`; pkgdown copies these to `docs/data/`
- `R/datasets.R` roxygen for every object; `man-roxygen/rox_papers.R`
  template pulls title/reference from `papers` via `\Sexpr` at render time,
  so the package must be installed before `document()`/pkgdown
- `vignettes/articles/` are site-only (Rbuildignored): `catalog.Rmd`
  (DT table, csv links), `sources.Rmd`

## Adding a dataset

1. Raw file under `data-raw/<key>/`, block in `DATASETS.R`, run it
2. Bib entry in `data-raw/bib/papers.bib` (brace the year), run `create_papers.R`
3. Row in `data-raw/catalog.csv`, run `catalog.R`, then `export.R`
4. `#' @template rox_papers` + `@templateVar key "<key>"` in `R/datasets.R`
5. Add to a `reference:` group in `_pkgdown.yml`
6. `devtools::document(); devtools::install(); devtools::test()`;
   `pkgdown::build_site()`; commit `docs/`

External source only: row in `data-raw/sources.csv`, run `catalog.R` + `export.R`.

## Conventions

- Date column first, lower-case short names (`ff`, `un`, `infl`), plain
  `tibble` (strip readr `spec_tbl_df`)
- Sentinel missing values from sources (e.g. `123456789`) become `NA`
- Site URL base for the CSV API: `https://kvasilopoulos.github.io/econdata/data/`
- Commits: semantic, one concern each, no co-author/AI trailers
- Shell: Git Bash heredocs mangle `\` in R/Rmd; use the Edit/Write tools for
  regexes and `\Sexpr`/`\Vignette` lines
- Rscript segfaults on multi-line `-e` here; write a script to `$TMP` and run it
