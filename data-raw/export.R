# Export every dataset as CSV (plus a JSON index) into pkgdown/assets/data/.
# pkgdown copies pkgdown/assets/ to the site root, so the files are served at
#   https://kvasilopoulos.github.io/econdata/data/<key>.csv
# Run after catalog.R.
out <- "pkgdown/assets/data"
dir.create(out, recursive = TRUE, showWarnings = FALSE)

write_csv <- function(x, name) {
  x[] <- lapply(x, function(v) if (is.list(v)) vapply(v, paste, "", collapse = " and ") else v)
  utils::write.csv(x, file.path(out, paste0(name, ".csv")), row.names = FALSE, na = "")
}

for (f in list.files("data", pattern = "\\.rda$", full.names = TRUE)) {
  name <- sub("\\.rda$", "", basename(f))
  e <- new.env()
  load(f, envir = e)
  write_csv(e[[name]], name)
}

# Variable dictionary for the 120-series BBE panel
bbe_vars <- read.csv("data-raw/bbe2005/catalog.CSV", check.names = FALSE)
write_csv(bbe_vars[c("Name", "F", "Dates", "Comments")], "bbe2005-variables")

file.copy("data-raw/bib/papers.bib", file.path(out, "papers.bib"), overwrite = TRUE)

load("data/catalog.rda")
base <- "https://kvasilopoulos.github.io/econdata/data/"
index <- transform(catalog, csv = paste0(base, key, ".csv"))
index$tags <- strsplit(index$tags, "|", fixed = TRUE)
jsonlite::write_json(index, file.path(out, "index.json"), pretty = TRUE, auto_unbox = TRUE, na = "null")
