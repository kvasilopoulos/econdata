source("data-raw/helpers.R")

# Batch: finance ###########################################################
# Crises, asset prices, financial conditions, fiscal-adjacent Ramey papers.
# Raw files and download URLs are listed in data-raw/todo-reports/finance.md.

# Romer and Romer (2017) financial distress measure, extended to 2017 -----
rr2017 <- readxl::read_excel("data-raw/rr2017/Romer-Romer_Financial_Distress_Extended.xlsx",
                              skip = 4) %>%
  rename(period = Date) %>%
  rename_with(~ gsub("([a-z])([A-Z])", "\\1 \\2", .x), -period) %>%
  pivot_longer(-period, names_to = "country", values_to = "distress") %>%
  mutate(year = as.integer(substr(period, 1, 4)),
         half = as.integer(substr(period, 6, 6)),
         date = as.Date(sprintf("%d-%02d-01", year, (half - 1) * 6 + 1)),
         year = NULL, half = NULL, period = NULL) %>%
  select(date, country, distress) %>%
  arrange(date, country)
usethis::use_data(rr2017, overwrite = TRUE)

# He, Kelly and Manela (2017) intermediary capital ratio and risk factor --
hkm2017_quarterly <- read_csv("data-raw/hkm2017/quarterly.csv", show_col_types = FALSE) %>%
  as_tibble() %>%
  mutate(year = yyyyq %/% 10, q = yyyyq %% 10,
         date = as.Date(sprintf("%d-%02d-01", year, (q - 1) * 3 + 1)),
         yyyyq = NULL, year = NULL, q = NULL) %>%
  select(date, everything())
hkm2017_monthly <- read_csv("data-raw/hkm2017/monthly.csv", show_col_types = FALSE) %>%
  as_tibble() %>%
  mutate(date = month_date(yyyymm %/% 100, yyyymm %% 100), yyyymm = NULL) %>%
  select(date, everything())
usethis::use_data(hkm2017_quarterly, hkm2017_monthly, overwrite = TRUE)

# Baker and Wurgler (2006) investor sentiment ------------------------------
bw2006 <- readxl::read_excel("data-raw/bw2006/SENTIMENT.xlsx", sheet = "DATA") %>%
  mutate(date = month_date(yearmo %/% 100, yearmo %% 100), yearmo = NULL) %>%
  select(date, everything())
usethis::use_data(bw2006, overwrite = TRUE)

# Welch and Goyal (2008) / Goyal, Welch and Zafirov (2024) predictors ------
gwz_sheet <- function(sheet, datecol, to_date) {
  readxl::read_excel("data-raw/gwz2024/PredictorData.xlsx", sheet = sheet) %>%
    rename(period = {{ datecol }}) %>%
    rename_with(~ gsub("/", "", .x), everything()) %>%
    mutate(date = to_date(period), period = NULL) %>%
    select(date, everything())
}
gwz2024_monthly <- gwz_sheet("Monthly", yyyymm, function(x) month_date(x %/% 100, x %% 100))
gwz2024_quarterly <- gwz_sheet("Quarterly", yyyyq, function(x) as.Date(sprintf("%d-%02d-01", x %/% 10, ((x %% 10) - 1) * 3 + 1)))
gwz2024_annual <- gwz_sheet("Annual", yyyy, function(x) as.Date(sprintf("%d-01-01", x)))
usethis::use_data(gwz2024_monthly, gwz2024_quarterly, gwz2024_annual, overwrite = TRUE)

# Reinhart and Rogoff debt/GDP-growth panel (Herndon-Ash-Pollin 2014 replication columns) --
rr2009 <- readxl::read_excel("data-raw/rr2009/RR-keycolumns.xlsx", sheet = "Sheet1") %>%
  rename(country = Country, year = Year, debt_gdp = debtgdp, debt_cat = dgcat, gdp_growth = dRGDP) %>%
  mutate(year = as.integer(year)) %>%
  arrange(country, year)
usethis::use_data(rr2009, overwrite = TRUE)

# Ramey and Francis (2009) A Century of Work and Leisure -------------------
century_sheet <- function(sheet, activity) {
  raw <- readxl::read_excel("data-raw/rf2009/Century_Public_Data.xls", sheet = sheet, col_names = FALSE)
  sex_row <- as.character(unlist(raw[3, -1]))
  age_row <- gsub("^Ages ", "", as.character(unlist(raw[4, -1])))
  data <- raw[5:nrow(raw), ]
  names(data) <- c("year", paste0("c", seq_len(ncol(data) - 1)))
  data <- data %>% mutate(across(everything(), as.numeric))
  data %>%
    pivot_longer(-year, names_to = "col", values_to = "hours") %>%
    mutate(idx = as.integer(sub("c", "", col)),
           sex = tolower(sub("s$", "", sex_row[idx])),
           age_group = age_row[idx],
           activity = activity,
           col = NULL, idx = NULL) %>%
    select(year, activity, sex, age_group, hours)
}
rf2009 <- bind_rows(
  century_sheet("Work", "work"),
  century_sheet("School", "school"),
  century_sheet("Home Production", "home_production"),
  century_sheet("Leisure", "leisure")
) %>%
  mutate(year = as.integer(year)) %>%
  arrange(activity, year, sex, age_group)
usethis::use_data(rf2009, overwrite = TRUE)

# Francis and Ramey (2009) hours per capita and technology shocks ---------
fr2009 <- readxl::read_excel("data-raw/fr2009/Francis-Ramey_JMCB_Data_09.xls",
                              sheet = "Data for SVARs", skip = 3) %>%
  mutate(date = frac_to_date(quarter, 4), quarter = NULL,
         across(c(fisherdlp, dlp, ffr), ~ as.numeric(na_if(.x, ".")))) %>%
  select(date, everything())
usethis::use_data(fr2009, overwrite = TRUE)

# Nekarda and Ramey (2020) cyclical markups ---------------------------------
nr2020 <- readxl::read_excel("data-raw/nr2020/nekarda_ramey_markups.xlsx", sheet = "Sheet1") %>%
  rename(date = qdate) %>%
  mutate(date = as.Date(date))
usethis::use_data(nr2020, overwrite = TRUE)
