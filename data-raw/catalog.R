# Build `catalog` (bundled datasets, with hand-curated categories/tags in
# data-raw/catalog.csv) and `sources` (external replication data, from
# data-raw/sources.csv). Run after DATASETS.R and bib/create_papers.R.
library(dplyr)

catalog <- readr::read_csv("data-raw/catalog.csv", col_types = "c", na = "")

# Computed fields straight from the .rda files so they never go stale
describe <- function(key) {
  e <- new.env()
  load(file.path("data", paste0(key, ".rda")), envir = e)
  x <- e[[key]]
  dates <- Filter(function(v) inherits(v, "Date"), x)
  rng <- range(unlist(lapply(dates, as.numeric)), na.rm = TRUE)
  tibble(
    key = key,
    nrow = nrow(x),
    ncol = ncol(x),
    start = as.Date(rng[1], origin = "1970-01-01"),
    end = as.Date(rng[2], origin = "1970-01-01"),
    variables = paste(names(x), collapse = ", ")
  )
}

catalog <- catalog %>%
  left_join(bind_rows(lapply(catalog$key, describe)), by = "key") %>%
  select(key, title, paper, category, tags, frequency, country,
         start, end, nrow, ncol, variables, source_url, notes)

load("data/papers.rda")
stopifnot(all(na.omit(catalog$paper) %in% papers$BIBTEXKEY))

sources <- readr::read_csv("data-raw/sources.csv", col_types = "c", na = "")

usethis::use_data(catalog, sources, overwrite = TRUE)
