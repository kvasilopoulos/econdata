
valid_key <- function(key) {
  keys <- bibdf[, "BIBTEXKEY", drop = TRUE]
  if (!(key %in% keys)) {
    stop(paste0(key, " is not a valid key"), call. = FALSE)
  }
}

bib_pull <- function(key, tag) {
  valid_key(key)
  key_set <- subset(bibdf, BIBTEXKEY == key)
  key_set[, tag, drop = TRUE]
}


# Functions used to roxygenise --------------------------------------------

bib_title <- function(key) {
  bib_pull(key, "TITLE")
}

bib_abstract <- function(key) {
  bib_pull(key, "ABSTRACT")
}

bib_journal <- function(key) {
  bib_pull(key, "JOURNAL")
}

bib_author <- function(key) {
  bib_pull(key, "AUTHOR") %>%
    unlist()
}

bib_year <- function(key) {
  bib_pull(key, "YEAR")
}

bib_doi <- function(key) {
  bib_pull(key, "DOI")}

bib_url <- function(key) {
  bib_pull(key, "URL")
}

bib_ref_apa <- function(key) {
  # rcrossref::cr_cn(dois = bib_doi(key), format = "text", style = "apa")
}
