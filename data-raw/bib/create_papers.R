# Build the `papers` table from data-raw/bib/papers.bib
library(RefManageR)
library(dplyr)

bibfile <- "data-raw/bib/papers.bib"

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
