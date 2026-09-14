# Build `catalog` (bundled datasets, with hand-curated categories/tags in
# data-raw/catalog.csv) and `sources` (external replication data, from
# data-raw/sources.csv). Run after DATASETS.R and bib/create_papers.R.
library(dplyr)

# One CSV per batch under data-raw/catalog/; core.csv first
catalog <- list.files("data-raw/catalog", pattern = "\\.csv$", full.names = TRUE) %>%
  (function(f) c("data-raw/catalog/core.csv", setdiff(f, "data-raw/catalog/core.csv"))) %>%
  lapply(readr::read_csv, col_types = "c", na = "") %>%
  bind_rows()
stopifnot(!anyDuplicated(catalog$key))

# Computed fields straight from the .rda files so they never go stale
describe <- function(key) {
  e <- new.env()
  load(file.path("data", paste0(key, ".rda")), envir = e)
  x <- e[[key]]
  # sample range from Date columns, else from an integer year column, else NA
  dates <- Filter(function(v) inherits(v, "Date"), x)
  if (length(dates)) {
    rng <- range(unlist(lapply(dates, as.numeric)), na.rm = TRUE)
  } else if ("year" %in% names(x)) {
    rng <- as.numeric(as.Date(paste0(range(x$year, na.rm = TRUE), "-01-01")))
  } else {
    rng <- c(NA_real_, NA_real_)
  }
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
  readme_vars("r2016_monetary", "data-raw/r2016/Monetarydat.xlsx", "Readme"),
  readme_vars("r2016_govt", "data-raw/r2016/homgovdat.xlsx", "readme"),
  readme_vars("r2016_tech", "data-raw/r2016/Technology_data.xlsx", "readme"),
  readme_vars("r2016_tax", "data-raw/r2016/homtaxdat.xlsx", "Readme"),
  readme_vars("rz2018", "data-raw/rz2018/RZDAT.xlsx", "readme"),
  readxl::read_excel("data-raw/ci2022/data_gpr_export.xls", range = "DJ1:DK200") %>%
    transmute(dataset = "ci2022", variable = var_name, description = var_label) %>%
    filter(!is.na(variable)),
  readxl::read_excel("data-raw/bw2016/DemRep.xlsx", sheet = "Quarterly", n_max = 1, col_types = "text") %>%
    tidyr::pivot_longer(everything(), names_to = "variable", values_to = "description") %>%
    mutate(dataset = "bw2016", .before = 1),
  # extra dictionaries dropped in by batch scripts: dataset,variable,description
  lapply(list.files("data-raw/variables", pattern = "\\.csv$", full.names = TRUE),
         readr::read_csv, col_types = "ccc") %>% bind_rows()
)
# keep only columns that actually ship (ci2022 drops the *_NOEW/_AND/_BASIC and GPRHC_ variants)
cols <- unlist(lapply(unique(variables$dataset), function(k) {
  e <- new.env(); load(file.path("data", paste0(k, ".rda")), e); paste(k, names(e[[k]]))
}))
variables <- filter(variables, paste(dataset, variable) %in% cols)

usethis::use_data(catalog, sources, variables, overwrite = TRUE)
