# Build docs/ for GitHub Pages (branch master, folder /docs):
#   docs/data/<key>.csv + index.json + catalog/papers/sources/variables.csv  (static API)
#   docs/index.md, docs/variables.md                                          (rendered by GitHub's Jekyll)
#   docs/articles/*.html                                                      (vignettes, self-contained)
# No site generator needed. Run after catalog.R.
unlink("docs", recursive = TRUE)
dir.create("docs/data", recursive = TRUE)
dir.create("docs/articles")

base <- "https://kvasilopoulos.github.io/econdata/"
load_all <- function() for (f in list.files("data", full.names = TRUE)) load(f, envir = globalenv())
load_all()

# CSV API ------------------------------------------------------------------

write_csv <- function(x, name) {
  x[] <- lapply(x, function(v) if (is.list(v)) vapply(v, paste, "", collapse = " and ") else v)
  utils::write.csv(x, file.path("docs/data", paste0(name, ".csv")), row.names = FALSE, na = "")
}
for (key in sub("\\.rda$", "", list.files("data"))) write_csv(get(key), key)
file.copy("data-raw/bib/papers.bib", "docs/data/papers.bib")

index <- transform(catalog, csv = paste0(base, "data/", key, ".csv"))
index$tags <- strsplit(index$tags, "|", fixed = TRUE)
jsonlite::write_json(index, "docs/data/index.json", pretty = TRUE, auto_unbox = TRUE, na = "null")

# Markdown helpers --------------------------------------------------------

md_table <- function(df) {
  esc <- function(x) gsub("|", "\\|", ifelse(is.na(x), "", as.character(x)), fixed = TRUE)
  c(paste("|", paste(names(df), collapse = " | "), "|"),
    paste("|", paste(rep("---", ncol(df)), collapse = " | "), "|"),
    apply(df, 1, function(r) paste("|", paste(esc(r), collapse = " | "), "|")))
}
link <- function(text, href) sprintf("[%s](%s)", text, href)
ref <- function(key) papers$REFERENCE[match(key, papers$BIBTEXKEY)]
authoryear <- function(key) papers$AUTHORYEAR[match(key, papers$BIBTEXKEY)]

# index.md ----------------------------------------------------------------

cat_order <- c("Monetary policy", "Fiscal policy", "Business cycles", "Financial conditions",
               "Productivity", "Asset prices", "Oil and energy")
stopifnot(all(catalog$category %in% cat_order))
tbl <- transform(catalog,
  dataset = paste0("`", key, "`"),
  csv = link("csv", paste0("data/", key, ".csv")),
  paper = ifelse(is.na(paper), "", link(authoryear(paper), source_url)),
  sample = paste(format(start, "%Y-%m"), "to", format(end, "%Y-%m")),
  dim = paste(nrow, "x", ncol),
  tags = gsub("|", " ", tags, fixed = TRUE))

out <- c(
  "# econdata",
  "",
  "Curated datasets from influential empirical macroeconomics papers, served as an R package and as plain CSV files.",
  "Every table below is downloadable at `data/<key>.csv`; the machine-readable index is [`data/index.json`](data/index.json).",
  "",
  "```r",
  '# R (no package needed)',
  sprintf('sw2001 <- read.csv("%sdata/sw2001.csv")', base),
  "",
  "# or install the package",
  'pak::pak("kvasilopoulos/econdata"); library(econdata); catalog',
  "```",
  "```python",
  sprintf('pd.read_csv("%sdata/gk2015.csv", parse_dates=["date"])', base),
  "```",
  "```stata",
  sprintf('import delimited "%sdata/rz2018.csv", clear', base),
  "```",
  "",
  "## Datasets",
  "")
for (ct in cat_order) {
  s <- tbl[tbl$category == ct, ]
  if (!nrow(s)) next
  out <- c(out, paste("###", ct), "",
           md_table(s[c("dataset", "csv", "title", "paper", "frequency", "sample", "dim", "tags")]), "")
}
out <- c(out,
  "Column definitions for the wide panels (`bbe2005`, `r2016_*`, `rz2018`) are on the [variables](variables.html) page",
  "and in [`data/variables.csv`](data/variables.csv).",
  "",
  "## Static API",
  "",
  "| File | Contents |", "| --- | --- |",
  "| [`data/index.json`](data/index.json) | this catalog as JSON, tags as arrays, with csv URLs |",
  "| [`data/catalog.csv`](data/catalog.csv) | same as CSV |",
  "| [`data/papers.csv`](data/papers.csv), [`data/papers.bib`](data/papers.bib) | bibliography |",
  "| [`data/variables.csv`](data/variables.csv) | variable dictionary |",
  "| [`data/sources.csv`](data/sources.csv) | external replication data sources (below) |",
  "| `data/<key>.csv` | one file per dataset |",
  "",
  "## Replications",
  "",
  "* [Stock and Watson (2001)](articles/replication-sw2001.html)",
  "* [Bernanke, Boivin and Eliasz (2005)](articles/replication-bbe2005.html)",
  "",
  "## Papers",
  "",
  paste0("* `", papers$BIBTEXKEY, "` &mdash; ", papers$REFERENCE),
  "",
  "## Finding other replication data",
  "",
  "Freely available datasets behind commonly replicated papers, not bundled here (too large, updated regularly, or restrictively licensed).",
  "Author websites are still the best source for shock series because authors keep extending them; AEA journals since 2019 have",
  "replication packages on [openICPSR](https://www.openicpsr.org/openicpsr/aea); top-5 journals deposit on [Harvard Dataverse](https://dataverse.harvard.edu/).",
  "")
for (ct in unique(sources$category)) {
  s <- sources[sources$category == ct, ]
  out <- c(out, paste("###", ct), "",
           sprintf("* **%s** &mdash; %s<br><small>Used in: %s. %s, %s.</small>",
                   link(s$name, s$url), s$notes, s$used_in, s$frequency, s$coverage), "")
}
out <- c(out,
  "## Contributing",
  "",
  "Missing a dataset or a source? Open an [issue](https://github.com/kvasilopoulos/econdata/issues) or edit",
  "[`data-raw/catalog.csv`](https://github.com/kvasilopoulos/econdata/blob/master/data-raw/catalog.csv) /",
  "[`data-raw/sources.csv`](https://github.com/kvasilopoulos/econdata/blob/master/data-raw/sources.csv) and send a pull request.",
  "")
writeLines(out, "docs/index.md")

# variables.md ------------------------------------------------------------

out <- c("# Variable dictionary", "", "[Back to index](index.html). Also as [`data/variables.csv`](data/variables.csv).", "")
for (key in unique(variables$dataset)) {
  v <- variables[variables$dataset == key, c("variable", "description")]
  out <- c(out, sprintf("## `%s` (%d variables)", key, nrow(v)), "",
           ref(catalog$paper[catalog$key == key]), "", md_table(v), "")
}
writeLines(out, "docs/variables.md")

# Jekyll config + vignettes ------------------------------------------------

writeLines(c("theme: jekyll-theme-cayman", "title: econdata",
             "description: Curated macro datasets, as R objects and plain CSV"),
           "docs/_config.yml")

for (v in list.files("vignettes", pattern = "\\.Rmd$", full.names = TRUE)) {
  rmarkdown::render(v, output_format = rmarkdown::html_document(self_contained = TRUE, theme = "cosmo"),
                    output_dir = "docs/articles", quiet = TRUE)
}
