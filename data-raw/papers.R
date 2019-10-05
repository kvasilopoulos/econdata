library(tidyverse)

# Blanchard and Quad 1989 -------------------------------------------------

bq1989 <-
  readxl::read_excel("data-raw/bq1989.xls") %>%
  set_names("date", "gdp_growth", "un") %>%
  mutate(date = lubridate::yq(date))


usethis::use_data(bq1989, overwrite = TRUE)


# Bernanke Boivin Eliasz 2005 ---------------------------------------------

bbe2005 <- readxl::read_excel("data-raw/bbe2005/bbe2005.xlsx")  %>%
  mutate(Date = lubridate::ymd(Date, truncated = 1))

usethis::use_data(bbe2005, overwrite = TRUE)

# Stock and Watson 2001 ---------------------------------------------------

sw2001 <-
  readxl::read_excel("data-raw/sw2001.xlsx") %>%
  mutate(date = lubridate::yq(obs),
         obs = NULL) %>%
  rename(infl = 1,
         un = 2,
         ff = 3) %>%
  select(date, everything())

usethis::use_data(sw2001, overwrite = TRUE)

# Uhlig 2005 --------------------------------------------------------------

u2005 <-
  readxl::read_excel("data-raw/u2005.xls") %>%
  set_names("date", "rgdp", "cpi", "cprice", "ff", "nbres", "tres") %>%
  mutate(date = as.Date(date))

usethis::use_data(u2005, overwrite = TRUE)


# PSY 2015 ----------------------------------------------------------------

psy2015 <- readxl::read_excel("data-raw/psy2015.xlsx") %>%
  set_names("date", "price", "dividend", "ratio", "iratio") %>%
  mutate(date = as.Date(date))

usethis::use_data(psy2015, overwrite = TRUE)


# Gertler and Karadi 2015 -------------------------------------------------

gk2015 <- readxl::read_excel("data-raw/gk2015.xlsx") %>%
  unite(date, year, month, sep = " ") %>%
  mutate(date = lubridate::ymd(date, truncated = 1))

usethis::use_data(gk2015, overwrite = TRUE)

