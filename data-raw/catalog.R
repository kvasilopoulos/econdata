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

# Variable dictionary for the wide panels, from the source readme sheets
readme_vars <- function(key, file, sheet) {
  x <- readxl::read_excel(file, sheet = sheet, col_names = c("variable", "description"),
                          col_types = "text")
  e <- new.env(); load(file.path("data", paste0(key, ".rda")), envir = e)
  x %>%
    mutate(variable = tolower(variable)) %>%
    filter(variable %in% names(e[[key]]), !is.na(description)) %>%
    mutate(dataset = key, .before = 1)
}
bbe <- readr::read_csv("data-raw/bbe2005/catalog.CSV", col_types = "c",
                       locale = readr::locale(encoding = "windows-1252")) %>%
  transmute(dataset = "bbe2005", variable = Name, description = Comments)
variables <- bind_rows(
  bbe,
  readme_vars("ramey2016_monetary", "data-raw/ramey2016/Monetarydat.xlsx", "Readme"),
  readme_vars("ramey2016_govt", "data-raw/ramey2016/homgovdat.xlsx", "readme"),
  readme_vars("ramey2016_tech", "data-raw/ramey2016/Technology_data.xlsx", "readme"),
  readme_vars("ramey2016_tax", "data-raw/ramey2016/homtaxdat.xlsx", "Readme"),
  readme_vars("rz2018", "data-raw/rz2018/RZDAT.xlsx", "readme")
)

usethis::use_data(catalog, sources, variables, overwrite = TRUE)
