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



# Books ###################################################################


# Killian Lutkepohl 2017 --------------------------------------------------

kl2017 <- read_csv("data-raw/kl2017.csv", col_names = FALSE) %>%
  set_names("drgdp", "ff", "infl") %>%
  mutate(date = seq(as.Date("1954-10-01"), as.Date("2007-10-01"), "quarters")) %>%
  select(date, everything())

usethis::use_data(kl2017, overwrite = TRUE)


# Killian Lutkepohl 2017 oil var ------------------------------------------

oil <- read_csv("data-raw/oil.csv", col_names = FALSE) %>%
  set_names("drpoil", "infl", "drgdp") %>%
  mutate(date = seq(as.Date("1973-01-01"), as.Date("2013-04-01"), "quarters")) %>%
  select(date, everything())

usethis::use_data(oil, overwrite = TRUE)

# NBER Recession ###########################################################

nber_url <- "https://www.nber.org/cycles/NBER%20chronology.xlsx"

nber_temp <- "data-raw/nber-rec.xlsx"

download.file(nber_url, destfile = nber_temp, mode = 'wb')

nber_rec <- readxl::read_excel("data-raw/nber-rec.xlsx") %>%
  select(1, 2, 5) %>%
  set_names("Peak", "Trough", "Duration") %>%
  slice(-c((nrow(.) - 6):nrow(.))) %>%
  mutate(Peak = parse_date(Peak, format = "%B %Y"),
         Trough = parse_date(Trough, format = "%B %Y"))

use_data(nber_rec, overwrite = TRUE)


