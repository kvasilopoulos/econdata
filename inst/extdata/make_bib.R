# file.create("extdata/papers.bib")

# library(rcrossref)
# library(purrr)
# library(dplyr)
#
# cr_cn(
#   c("10.1080/13504851.2014.912030",
#     "10.1080/13504851.2014.912030")
#   ) %>% map_chr(~ paste0(.x, "\n\n")) %>%
#   cat(file = "extdata/papers.bib")
#
# cr_works("10.1080/13504851.2014.912030")
#
#
# cr_abstract(c("10.1080/13504851.2014.912030"))
