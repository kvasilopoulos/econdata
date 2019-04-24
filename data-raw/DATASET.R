library(tidyverse)

conflicted::conflict_prefer("select", "dplyr")

sw2001 <-
  readxl::read_excel("data-raw/sw2001.xlsx") %>%
  mutate(date = lubridate::yq(obs),
         obs = NULL) %>%
  rename(infl = 1,
         un = 2,
         ff = 3) %>%
  select(date, everything())


# usethis::use_data(sw2001, overwrite = TRUE)

