# key <- "Li2014a"

bibfile <- function(key = NULL, filepath = "inst/extdata/Bubbles.bib"){
  out <- bib2df::bib2df(filepath)
  if (!is.null(key)) {
    out <- subset(out, BIBTEXKEY == key)
  }
  out
}

valid_key <- function(key) {
  bib <- bibfile()
  keys <- pull(bib, BIBTEXKEY)
  if (!(key %in% keys)) {
    stop(paste0(key, " is not a valid key"), call. = FALSE)
  }
}

bib_pull <- function(key, tag) {
  valid_key(key)
  key_set <- bibfile(key)
  key_set[, tag, drop = TRUE]
}

#' @importFrom dplyr pull filter
bib_title <- function(key) {
  bib_pull(key, "TITLE")
}

bib_abstract <- function(key) {
  valid_key(key)
  pull(bibfile(), ABSTRACT)
}

bib_journal <- function(key) {
  valid_key(key)
  pull(bibfile(), JOURNAL)
}

bib_author <- function(key) {
  valid_key(key)
  pull(bibfile(), AUTHOR) %>%
    unlist()
}

bib_year <- function(key) {
  valid_key(key)
  pull(bibfile(), YEAR)
}

bib_doi <- function(key) {
  valid_key(key)
  pull(bibfile(), DOI)
}

bib_url <- function(key) {
  valid_key(key)
  pull(bibfile(), URL)
}

bib_ref_apa <- function(key) {
  valid_key(key)
  rcrossref::cr_cn(dois = bib_doi(key), format = "text", style = "apa")
}

# TODO make a bib file with all the papers
# TODO reorganize the structure of the package
# TODO make a complete set of vari
