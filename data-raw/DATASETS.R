library(dplyr)
library(tidyr)
library(readr)
library(purrr)
library(usethis)

# Blanchard and Quad 1989 -------------------------------------------------

bq1989 <-
  readxl::read_excel("data-raw/bq1989/bq1989.xls") %>%
  set_names("date", "gdp_growth", "un") %>%
  mutate(date = lubridate::yq(date))


usethis::use_data(bq1989, overwrite = TRUE)


# Bernanke Boivin Eliasz 2005 ---------------------------------------------

bbe2005 <- readxl::read_excel("data-raw/bbe2005/bbe2005.xlsx")  %>%
  mutate(Date = lubridate::ymd(Date, truncated = 1))

usethis::use_data(bbe2005, overwrite = TRUE)

# Stock and Watson 2001 ---------------------------------------------------

sw2001 <-
  readxl::read_excel("data-raw/sw2001/sw2001.xlsx") %>%
  mutate(date = lubridate::yq(obs),
         obs = NULL) %>%
  rename(infl = 1,
         un = 2,
         ff = 3) %>%
  select(date, everything())

usethis::use_data(sw2001, overwrite = TRUE)

# Uhlig 2005 --------------------------------------------------------------

u2005 <-
  readxl::read_excel("data-raw/u2005/u2005.xls") %>%
  set_names("date", "rgdp", "cpi", "cprice", "ff", "nbres", "tres") %>%
  mutate(date = as.Date(date))

usethis::use_data(u2005, overwrite = TRUE)


# PSY 2015 ----------------------------------------------------------------

psy2015 <- readxl::read_excel("data-raw/psy2015/psy2015.xlsx") %>%
  set_names("date", "price", "dividend", "ratio", "iratio") %>%
  mutate(date = as.Date(date))

usethis::use_data(psy2015, overwrite = TRUE)


# Gertler and Karadi 2015 -------------------------------------------------

gk2015 <- readxl::read_excel("data-raw/gk2015/gk2015.xlsx") %>%
  unite(date, year, month, sep = " ") %>%
  mutate(date = lubridate::ymd(date, truncated = 1)) %>%
  mutate(across(everything(), ~ replace(.x, .x == 123456789, NA))) # source uses 123456789 as NA

usethis::use_data(gk2015, overwrite = TRUE)



# Books ###################################################################


# Killian Lutkepohl 2017 --------------------------------------------------

kl2017 <- read_csv("data-raw/kl2017/kl2017.csv", col_names = FALSE) %>% as_tibble() %>%
  set_names("drgdp", "ff", "infl") %>%
  mutate(date = seq(as.Date("1954-10-01"), as.Date("2007-10-01"), "quarters")) %>%
  select(date, everything())

usethis::use_data(kl2017, overwrite = TRUE)


# Killian Lutkepohl 2017 oil var ------------------------------------------

oil <- read_csv("data-raw/kl2017/oil.csv", col_names = FALSE) %>% as_tibble() %>%
  set_names("drpoil", "infl", "drgdp") %>%
  mutate(date = seq(as.Date("1973-01-01"), as.Date("2013-04-01"), "quarters")) %>%
  select(date, everything())

usethis::use_data(oil, overwrite = TRUE)

# NBER Recession ###########################################################

nber_rec <- jsonlite::fromJSON("https://data.nber.org/data/cycles/business_cycle_dates.json") %>%
  as_tibble() %>%
  set_names("Peak", "Trough") %>%
  mutate(across(everything(), ~ as.Date(na_if(.x, ""))),
         Duration = as.integer(12 * (lubridate::year(Trough) - lubridate::year(Peak)) +
           lubridate::month(Trough) - lubridate::month(Peak)))

use_data(nber_rec, overwrite = TRUE)


# Ramey (2016) Handbook of Macroeconomics ##################################
# https://econweb.ucsd.edu/~vramey/research.html -> Ramey_HOM_*.zip

# Sheets use fractional-year dates: 1959, 1959.083, ... (monthly) or
# 1947, 1947.25, ... (quarterly)
frac_to_date <- function(x, per) {
  yr <- floor(x + 1e-6)
  sub <- round((x - yr) * per)
  as.Date(sprintf("%d-%02d-01", yr, sub * (12 / per) + 1))
}

ramey_sheet <- function(file, sheet, per) {
  readxl::read_excel(file.path("data-raw/ramey2016", file), sheet = sheet) %>%
    rename_with(tolower) %>%
    rename(date = 1) %>%
    mutate(date = frac_to_date(date, per))
}

ramey2016_monetary <- ramey_sheet("Monetarydat.xlsx", "Monthly", 12)
ramey2016_govt <- ramey_sheet("homgovdat.xlsx", "govdat", 4)
ramey2016_tech <- ramey_sheet("Technology_data.xlsx", "techdat", 4)
ramey2016_tax <- ramey_sheet("homtaxdat.xlsx", "homtaxdat", 4)

usethis::use_data(ramey2016_monetary, ramey2016_govt, ramey2016_tech,
                  ramey2016_tax, overwrite = TRUE)

# Ramey and Zubairy (2018) ------------------------------------------------

rz2018 <- readxl::read_excel("data-raw/rz2018/RZDAT.xlsx", sheet = "rzdat") %>%
  rename(date = quarter) %>%
  mutate(date = frac_to_date(date, 4))

usethis::use_data(rz2018, overwrite = TRUE)

# Gilchrist and Zakrajsek (2012) excess bond premium ----------------------
# https://www.federalreserve.gov/econres/notes/feds-notes/ebp_csv.csv

gz2012 <- read_csv("data-raw/gz2012/ebp.csv", show_col_types = FALSE) %>%
  as_tibble() %>%
  mutate(date = as.Date(date, "%m/%d/%Y"))

usethis::use_data(gz2012, overwrite = TRUE)
