filepath <- "inst/extdata/papers.bib"
file.create(filepath)

library(rcrossref)
library(purrr)
library(dplyr)

cr_cn(
  c(
    "10.1162/0033553053327452", # bbe2005
    "10.3386/w2737", #bq1989
    "10.1257/mac.20130329", #gk2015
    "10.1257/jep.15.4.101", #sw2001
    "10.1111/iere.12132", #psy2015
    "10.1016/j.jmoneco.2004.05.007" #u2005
  )
  ) %>% map_chr(~ paste0(.x, "\n\n")) %>%
  cat(file = filepath)

readLines(filepath) %>%
  gsub("Stock_2001"     , "sw2001", .) %>%
  gsub("Bernanke_2005"  , "bbe2005", .) %>%
  gsub("Gertler_2015"   , "gk2015", .) %>%
  gsub("Phillips_2015"  , "psy2015", .) %>%
  gsub("Blanchard_1988" , "bq1989", .) %>% #doi only available for wp
  gsub("Uhlig_2005"     , "u2005", .) %>%
  writeLines(filepath)


# store as data -----------------------------------------------------------


bibdf_raw <- bib2df::bib2df("data-raw/bib/papers.bib")
bibdf <- bibdf_raw[!colSums(is.na(bibdf_raw))]

usethis::use_data(bibdf, overwrite = TRUE)
