# Shared helpers for data-raw/datasets/*.R. Source this first.
library(dplyr)
library(tidyr)
library(readr)
library(purrr)
library(usethis)

# Fractional-year dates: 1959, 1959.083, ... (per = 12) or 1947, 1947.25, ... (per = 4)
frac_to_date <- function(x, per) {
  yr <- floor(x + 1e-6)
  sub <- round((x - yr) * per)
  as.Date(sprintf("%d-%02d-01", yr, sub * (12 / per) + 1))
}

month_date <- function(year, month) as.Date(sprintf("%d-%02d-01", as.integer(year), as.integer(month)))
