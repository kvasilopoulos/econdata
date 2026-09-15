source("data-raw/helpers.R")

# Batch: monetary ##########################################################
# Raw files and download URLs are listed in data-raw/todo-reports/monetary.md.

# Mixed date columns: some source spreadsheets switch partway through the
# series from an Excel date serial (stored as text) to a "m/d/yyyy" or
# "d/m/yyyy" text string. Helpers below dispatch on whether the cell looks
# like a bare integer.
parse_mixed_mdy <- function(x) {
  is_serial <- grepl("^[0-9]+$", x)
  out <- as.Date(rep(NA_character_, length(x)))
  out[is_serial] <- as.Date(as.numeric(x[is_serial]), origin = "1899-12-30")
  out[!is_serial] <- lubridate::mdy(x[!is_serial])
  out
}
parse_mixed_dmy <- function(x) {
  is_serial <- grepl("^[0-9]+$", x)
  out <- as.Date(rep(NA_character_, length(x)))
  out[is_serial] <- as.Date(as.numeric(x[is_serial]), origin = "1899-12-30")
  out[!is_serial] <- as.Date(x[!is_serial], format = "%d/%m/%Y")
  out
}

# Nakamura and Steinsson (2018) policy news shock -------------------------
# https://eminakamura.com/papers/PolicyNewsShocksWeb.xlsx

ns2018 <- readxl::read_excel("data-raw/ns2018/PolicyNewsShocksWeb.xlsx", sheet = "PolicyNewsShocks") %>%
  transmute(date = as.Date(date_daily), policy_news_shock, ffr_shock = FFR_shock)
usethis::use_data(ns2018, overwrite = TRUE)

ns2018_1995 <- readxl::read_excel("data-raw/ns2018/PolicyNewsShocksWeb.xlsx", sheet = "PolicyNewsShocks1995") %>%
  transmute(date = as.Date(date_daily), unscheduled = unscheduled_meetings,
            policy_news_shock = policy_news_shocks, ffr_shock = FFR_shock)
usethis::use_data(ns2018_1995, overwrite = TRUE)

# Swanson (2021) FFR / forward guidance / LSAP factors ---------------------
# https://sites.socsci.uci.edu/~swanson2/papers/pre-and-post-ZLB-factors-extended.xlsx

s2021 <- readxl::read_excel("data-raw/s2021/pre-and-post-ZLB-factors-extended.xlsx",
                             sheet = "Data", col_names = FALSE, skip = 2) %>%
  select(1:4) %>%
  set_names("raw_date", "ff_factor", "fg_factor", "lsap_factor") %>%
  mutate(date = parse_mixed_mdy(raw_date), raw_date = NULL) %>%
  select(date, everything())
usethis::use_data(s2021, overwrite = TRUE)

# Bauer and Swanson (2023) monetary policy surprises -----------------------
# https://www.frbsf.org/wp-content/uploads/monetary-policy-surprises-data.xlsx

bs2023 <- readxl::read_excel("data-raw/bs2023/monetary-policy-surprises-data.xlsx",
                              sheet = "Monthly (update 2023)") %>%
  rename_with(tolower) %>%
  mutate(date = month_date(year, month), year = NULL, month = NULL) %>%
  select(date, everything())
usethis::use_data(bs2023, overwrite = TRUE)

bs2023_fomc <- readxl::read_excel("data-raw/bs2023/monetary-policy-surprises-data.xlsx",
                                   sheet = "FOMC (update 2023)") %>%
  rename_with(~ gsub(" ", "_", tolower(.x))) %>%
  mutate(date = as.Date(date))
usethis::use_data(bs2023_fomc, overwrite = TRUE)

# Miranda-Agrippino and Ricco (2021) informationally-robust shock instrument
# http://silviamirandaagrippino.com/s/Instruments_web-x8wr.xlsx

mar2021 <- readxl::read_excel("data-raw/mar2021/Instruments_web.xlsx", sheet = "Daily") %>%
  set_names("date", "fomc_date", "gb_date", "is_fomc", "is_unscheduled", "iv1", "iv5") %>%
  mutate(across(c(date, fomc_date, gb_date), as.Date))
usethis::use_data(mar2021, overwrite = TRUE)

# Altavilla, Brugnolini, Gurkaynak, Motto and Ragusa (2019) EA-MPD ---------
# https://www.ecb.europa.eu/pub/pdf/annex/Dataset_EA-MPD.xlsx

eampd_sheet <- function(sheet) {
  readxl::read_excel("data-raw/eampd/Dataset_EA-MPD.xlsx", sheet = sheet, col_types = "text") %>%
    mutate(date = parse_mixed_dmy(date),
           across(-date, as.numeric)) %>%
    rename_with(tolower, -date) %>%
    arrange(date)
}
eampd <- eampd_sheet("Monetary Event Window")
eampd_pr <- eampd_sheet("Press Release Window")
eampd_pc <- eampd_sheet("Press Conference Window")
usethis::use_data(eampd, eampd_pr, eampd_pc, overwrite = TRUE)

# Holston, Laubach and Williams (2017) r* estimates ------------------------
# https://www.newyorkfed.org/medialibrary/media/research/economists/williams/data/Holston_Laubach_Williams_current_estimates.xlsx

hlw2017 <- readxl::read_excel("data-raw/hlw2017/Holston_Laubach_Williams_current_estimates.xlsx",
                               sheet = "HLW Estimates", skip = 5) %>%
  select(1, 3, 4, 5, 7, 8, 9, 11, 12, 13, 15, 16, 17) %>%
  set_names("date", "g_us", "g_ca", "g_ea", "z_us", "z_ca", "z_ea",
            "rstar_us", "rstar_ca", "rstar_ea", "gap_us", "gap_ca", "gap_ea") %>%
  mutate(date = as.Date(date), across(-date, ~ suppressWarnings(as.numeric(.x))))
usethis::use_data(hlw2017, overwrite = TRUE)

# Kanzig (2021) oil supply news shocks -------------------------------------
# https://raw.githubusercontent.com/dkaenzig/oilsupplynews/master/oilSupplyNewsShocks_2025M12.xlsx
# CC BY 4.0; snapshot 2025M12 vintage

k2021 <- readxl::read_excel("data-raw/k2021/oilSupplyNewsShocks_2025M12.xlsx", sheet = "Monthly") %>%
  set_names("yearmon", "oil_supply_surprise", "oil_supply_news_shock") %>%
  mutate(date = month_date(substr(yearmon, 1, 4), substr(yearmon, 6, 7)), yearmon = NULL) %>%
  select(date, everything())
usethis::use_data(k2021, overwrite = TRUE)

# Baumeister and Hamilton (2019) oil supply/demand SVAR shocks -------------
# https://sites.google.com/site/cjsbaumeister/datasets

bh2019_supply <- readxl::read_excel("data-raw/bh2019/oil_supply_shocks.xlsx", skip = 1) %>%
  transmute(date = as.Date(...1), supply_shock = `oil supply shocks`)
bh2019_demand <- readxl::read_excel("data-raw/bh2019/oil_demand_shocks.xlsx", skip = 1) %>%
  transmute(date = as.Date(...1), activity_shock = `economic activity shocks`,
            consumption_demand_shock = `oil consumption demand shocks`,
            inventory_demand_shock = `oil inventory demand shocks`)
bh2019 <- full_join(bh2019_supply, bh2019_demand, by = "date") %>% arrange(date)
usethis::use_data(bh2019, overwrite = TRUE)

# Lettau and Ludvigson (2001) consumption-wealth ratio (cay) ---------------
# https://drive.google.com/uc?export=download&id=1iju5xUGE0l7ZnFHMZtFDzunI0V85Zi5y

ll2001 <- read_csv("data-raw/ll2001/cay_current.txt", col_names = FALSE, skip = 1, show_col_types = FALSE) %>%
  as_tibble() %>%
  set_names("date", "c", "w", "y", "cay") %>%
  mutate(date = lubridate::floor_date(as.Date(date), "quarter"))
usethis::use_data(ll2001, overwrite = TRUE)
