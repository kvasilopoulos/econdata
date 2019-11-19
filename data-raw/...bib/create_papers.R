# filepath <- "data-raw/bib/papers.bib"
# file.create(filepath)

library(rcrossref)
library(purrr)
library(dplyr)
require(RefManageR)

# cr_cn(
#   c(
#     "10.1162/0033553053327452", # bbe2005
#     # "10.3386/w2737", #bq1989
#     "10.1257/mac.20130329", #gk2015
#     "10.1257/jep.15.4.101", #sw2001
#     # "10.1111/iere.12132", #psy2015
#     "10.1016/j.jmoneco.2004.05.007" #u2005
#   )
#   ) %>% map_chr(~ paste0(.x, "\n\n")) %>%
#   cat(file = filepath)
#
# readLines("data-raw/bib/papers-default.bib") %>%
#   cat(file = filepath, append = TRUE, sep = "\n")


# change the name of the key ----------------------------------------------

# readLines(filepath) %>%
#   gsub("Stock_2001"     , "sw2001", .) %>%
#   gsub("Bernanke_2005"  , "bbe2005", .) %>%
#   gsub("Gertler_2015"   , "gk2015", .) %>%
#   # gsub("Phillips_2015"  , "psy2015", .) %>%
#   # gsub("Blanchard_1988" , "bq1989", .) %>% #doi only available for wp
#   gsub("Uhlig_2005"     , "u2005", .) %>%
#   writeLines(filepath)


# store as data -----------------------------------------------------------

bibfile <- file.path("data-raw/...bib/papers.bib")

bibdf_raw <- bib2df::bib2df(bibfile)
bibdf <- bibdf_raw %>%
  select_if(~ !all(is.na(.)))

bib <- ReadBib(bibfile, check = "error")

to_ref <- function(x, .opts = list(bib.style = "authoryear"), ...) {

  # if (length(.opts)) {
  #   oldopts <- RefManageR:::BibOptions(.opts)
  #   on.exit(RefManageR:::BibOptions(oldopts))
  # }
  style <- RefManageR:::.BibOptions$style
  sorting <- if (!length(RefManageR:::.BibOptions$sorting))
    sorting <- switch(RefManageR:::.BibOptions$bib.style, authoryear = "nyt",
                      alphabetic = "anyt", draft = "debug",
                      "nty")
  else RefManageR:::.BibOptions$sorting
  style <- RefManageR:::.BibEntry_match_format_style(style)
  no.print <- RefManageR:::.BibOptions$no.print.fields
  if (length(x) && length(no.print)) {
    for (i in seq_along(no.print)) {
      x <- do.call(`$<-`, list(x = x, name = tolower(no.print[i]), value = NULL))
    }
  }
  if (style == "R") {
    writeLines(format(x, style, collapse = TRUE, ...))
  }
  else if (length(x)) {
    y <- format(x, style = style, RefManageR:::.BibOptions$bib.style, .sorting = sorting, .sort = TRUE, ...)
    if (style == "citation") {
      n <- length(y)
      header <- y[1L]
      footer <- y[n]
      if (nzchar(header))
        header <- c("", header, "")
      if (nzchar(footer))
        footer <- c("", footer, "")
      out <- writeLines(c(header, paste(y[-c(1L, n)], collapse = "\n\n"), footer))
    }
    else {
      out <- writeLines(paste(y, collapse = "\n\n"))
    }
  }
  y
}

ref <- to_ref(bib)
ref <- gsub("\n", " ", ref)
ref <- gsub("“", "'", ref)
ref <- gsub("”", "'", ref)

bibdf$AUTHORYEAR <- Citet(bib) %>%
  strsplit(";") %>%
  .[[1]] %>%
  strwrap()
bibdf$REFERENCE <- ref

bibdf <- bibdf %>%
  select(BIBTEXKEY, AUTHORYEAR, TITLE, JOURNAL, DOI, everything())
papers <- bibdf
usethis::use_data(papers, overwrite = TRUE)
