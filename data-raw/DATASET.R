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


usethis::use_data(sw2001, overwrite = TRUE)


# Blanchard and Quad 1989 -------------------------------------------------

bq1989 <-
  readxl::read_excel("data-raw/bq1989.xls") %>%
  set_names("date", "gdp_growth", "un") %>%
  mutate(date = lubridate::yq(date))


usethis::use_data(bq1989, overwrite = TRUE)


# Uhlig 2005 --------------------------------------------------------------

u2005 <-
  readxl::read_excel("data-raw/u2005.xls") %>%
  set_names("date", "rgdp", "cpi", "cprice", "ff", "nbres", "tres") %>%
  mutate(date = as.Date(date))

usethis::use_data(u2005, overwrite = TRUE)
