# Build the `papers` table from data-raw/bib/papers.bib
library(RefManageR)
library(dplyr)

# All data-raw/bib/*.bib are concatenated (papers.bib first); one file per batch
bibfile <- tempfile(fileext = ".bib")
bibs <- list.files("data-raw/bib", pattern = "\\.bib$", full.names = TRUE)
bibs <- c("data-raw/bib/papers.bib", setdiff(bibs, "data-raw/bib/papers.bib"))
writeLines(unlist(lapply(bibs, readLines)), bibfile)

bibdf <- bib2df::bib2df(bibfile) %>%
  select_if(~ !all(is.na(.))) %>%
  mutate(across(c(TITLE, PUBLISHER), ~ gsub("[{}\\\\]", "", .x)),
         YEAR = as.integer(YEAR))

bib <- ReadBib(bibfile)
stopifnot(unname(names(bib)) == bibdf$BIBTEXKEY)

# .sort = FALSE keeps bib-file order so rows line up with bibdf
ref <- format(bib, style = "text", .bibstyle = "authoryear", .sort = FALSE) %>%
  gsub("\n", " ", .) %>%
  sub("^\\[\\] ", "", .) %>%
  gsub("[“”]", "'", .) %>%
  gsub("}\\.>", ">", .)

bibdf$AUTHORYEAR <- Citet(bib) %>% strsplit("; ") %>% .[[1]]
bibdf$REFERENCE <- ref

papers <- bibdf %>%
  select(BIBTEXKEY, AUTHORYEAR, TITLE, JOURNAL, DOI, everything())
usethis::use_data(papers, overwrite = TRUE)
