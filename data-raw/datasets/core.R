source("data-raw/helpers.R")

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

ramey_sheet <- function(file, sheet, per) {
  readxl::read_excel(file.path("data-raw/r2016", file), sheet = sheet) %>%
    rename_with(tolower) %>%
    rename(date = 1) %>%
    mutate(date = frac_to_date(date, per))
}

r2016_monetary <- ramey_sheet("Monetarydat.xlsx", "Monthly", 12)
r2016_govt <- ramey_sheet("homgovdat.xlsx", "govdat", 4)
r2016_tech <- ramey_sheet("Technology_data.xlsx", "techdat", 4)
r2016_tax <- ramey_sheet("homtaxdat.xlsx", "homtaxdat", 4)

usethis::use_data(r2016_monetary, r2016_govt, r2016_tech,
                  r2016_tax, overwrite = TRUE)

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


# Batch 2: maintained series from author / Fed websites ###################
# Raw files and download URLs are listed in data-raw/TODO.md.
# New batches go in their own file under data-raw/datasets/.

# Wu and Xia (2016) shadow rate (Atlanta Fed, stopped 2022-02) -----------
wx2016 <- readxl::read_excel("data-raw/wx2016/WuXiaShadowRate.xlsx", sheet = "Data",
                             range = readxl::cell_cols("A:C"), col_names = c("date", "ff", "shadow"), skip = 1) %>%
  filter(!is.na(date)) %>%
  mutate(date = as.Date(date), across(-date, as.numeric))
usethis::use_data(wx2016, overwrite = TRUE)

# Fernald (2014) utilization-adjusted TFP (SF Fed, quarterly) -----------
f2014 <- readxl::read_excel("data-raw/f2014/quarterly_tfp.xlsx", sheet = "quarterly", skip = 1) %>%
  filter(grepl("^[0-9]{4}:Q[1-4]$", date)) %>%
  mutate(date = lubridate::yq(date), across(-date, as.numeric))
usethis::use_data(f2014, overwrite = TRUE)

# Baker, Bloom and Davis (2016) US economic policy uncertainty ------------
epu_news <- readxl::read_excel("data-raw/bbd2016/US_Policy_Uncertainty_Data.xlsx", sheet = "Main News Index") %>%
  filter(!is.na(Month)) %>% rename(epu_news = 3)
epu_3 <- readxl::read_excel("data-raw/bbd2016/US_Policy_Uncertainty_Data.xlsx", sheet = "Legacy Three Component EPU") %>%
  filter(!is.na(Month)) %>%
  set_names("Year", "Month", "epu_3comp", "epu_news_legacy", "epu_govt_disagreement", "epu_cpi_disagreement", "epu_tax_expiration")
bbd2016 <- full_join(epu_news, epu_3, by = c("Year", "Month")) %>%
  mutate(date = month_date(Year, Month), Year = NULL, Month = NULL) %>%
  select(date, everything()) %>%
  arrange(date)
usethis::use_data(bbd2016, overwrite = TRUE)

# Kilian (2009) global real economic activity index (Dallas Fed) ----------
k2009 <- readxl::read_excel("data-raw/k2009/igrea.xlsx", col_names = c("date", "igrea"), skip = 1) %>%
  mutate(date = lubridate::floor_date(as.Date(date), "month"))
usethis::use_data(k2009, overwrite = TRUE)

# Jurado, Ludvigson and Ng (2015) uncertainty indexes ---------------------
jln_read <- function(kind) {
  readxl::read_excel(sprintf("data-raw/jln2015/%sUncertaintyToCirculate.xlsx", kind), sheet = 1) %>%
    set_names("date", paste0(tolower(kind), "_h", c(1, 3, 12))) %>%
    mutate(date = as.Date(date))
}
jln2015 <- jln_read("Macro") %>% full_join(jln_read("Financial"), by = "date") %>% full_join(jln_read("Real"), by = "date")
usethis::use_data(jln2015, overwrite = TRUE)

# Jarocinski and Karadi (2020) monetary policy and information shocks -----
jk2020 <- read_csv("data-raw/jk2020/shocks_fed_gss_pr_median_m.csv", show_col_types = FALSE) %>%
  mutate(date = month_date(year, month), year = NULL, month = NULL) %>%
  rename_with(tolower) %>%
  select(date, everything())
usethis::use_data(jk2020, overwrite = TRUE)

# Mertens and Ravn (2013) narrative tax shocks ----------------------------
mr2013 <- readxl::read_excel("data-raw/mr2013/MR_AER_DATASET.xlsx", sheet = "Quarterly") %>%
  rename(date = DATES) %>%
  mutate(date = frac_to_date(date, 4))
usethis::use_data(mr2013, overwrite = TRUE)

# Caldara and Iacoviello (2022) geopolitical risk -------------------------
ci2022 <- readxl::read_excel("data-raw/ci2022/data_gpr_export.xls", guess_max = 2000) %>%
  select(month, GPR:N3H, starts_with("SHAREH_CAT"), starts_with("GPRC_")) %>%
  rename(date = month) %>%
  mutate(date = as.Date(date))
usethis::use_data(ci2022, overwrite = TRUE)

# Shiller (2015) Irrational Exuberance online data ------------------------
s2015 <- readxl::read_excel("data-raw/s2015/ie_data.xls", sheet = "Data", skip = 8, col_names = FALSE,
                            col_types = "numeric") %>%
  select(1:13, 15, 17:22) %>%
  set_names("date", "price", "dividend", "earnings", "cpi", "date_frac", "gs10", "real_price", "real_dividend",
            "real_tr_price", "real_earnings", "real_tr_earnings", "cape", "tr_cape", "ecy",
            "bond_return", "real_bond_return", "stock_real_return_10y", "bond_real_return_10y", "excess_return_10y") %>%
  filter(!is.na(date)) %>%
  mutate(date = month_date(floor(date), round((date - floor(date)) * 100)), date_frac = NULL)
usethis::use_data(s2015, overwrite = TRUE)

# Ramey (2011) government spending shocks ---------------------------------
r2011 <- readxl::read_excel("data-raw/r2011/Ramey_Govt_Public_Data.xls", sheet = "Data for 1939-2008", skip = 4) %>%
  rename(date = quarter) %>%
  mutate(date = frac_to_date(date, 4))
usethis::use_data(r2011, overwrite = TRUE)


# Batch 3 ##################################################################

# Jarocinski and Karadi (2020), ECB shocks ---------------------------------
jk2020_ecb <- read_csv("data-raw/jk2020/shocks_ecb_mpd_me_m.csv", show_col_types = FALSE) %>%
  mutate(date = month_date(year, month), year = NULL, month = NULL) %>%
  rename_with(~ tolower(sub("_mpd$", "", .x))) %>%
  select(date, everything())
usethis::use_data(jk2020_ecb, overwrite = TRUE)

# Mertens and Ravn (2014) SVAR vs narrative tax multipliers ---------------
mr2014 <- readxl::read_excel("data-raw/mr2014/jme2014_data.xls", skip = 2, col_names = FALSE, col_types = "numeric") %>%
  select(-6) %>%
  set_names("date", "ltax", "lgov", "lgdp", "tax_narrative", "tax_longrun", "tax_retroactive",
            "tax_scaled_y4", "tax_all_romer") %>%
  filter(!is.na(date)) %>%
  mutate(date = frac_to_date(date, 4))
usethis::use_data(mr2014, overwrite = TRUE)

# Mertens and Montiel Olea (2018) marginal tax rates and income -----------
mmo_sheet <- function(sheet, prefix) {
  x <- readxl::read_excel("data-raw/mmo2018/data_mmo.xlsx", sheet = sheet)
  nm <- tolower(gsub("[^a-z0-9]+", "_", tolower(names(x)[-1])))
  nm <- sub("_$", "", nm)
  set_names(x, c("year", paste0(prefix, "_", nm)))
}
mmo2018 <- mmo_sheet("AMTR (Figure I)", "amtr") %>%
  full_join(mmo_sheet("AMIITR (Figure II)", "amiitr"), by = "year") %>%
  full_join(mmo_sheet("AMPTR (Figure III)", "amptr"), by = "year") %>%
  full_join(mmo_sheet("Narrative Shocks (Table IV)", "shock"), by = "year") %>%
  full_join(mmo_sheet("LOG AVG INCOME", "linc"), by = "year") %>%
  full_join(mmo_sheet("CONTROLS", "ctrl"), by = "year") %>%
  mutate(year = as.integer(year)) %>%
  arrange(year)
usethis::use_data(mmo2018, overwrite = TRUE)

# Gurkaynak, Sack and Swanson (2005) FOMC surprises, GKL (2021) update -----
gss2005 <- readxl::read_excel("data-raw/gss2005/GSSfactors.xlsx") %>%
  rename(date = datedaily) %>%
  mutate(date = as.Date(date))
gss2005_surprises <- readxl::read_excel("data-raw/gss2005/GSSrawdata.xlsx", na = ".") %>%
  rename(date = Date, intermeeting = intermeetdummy) %>%
  select(-month, -day, -year) %>%
  mutate(date = as.Date(date), across(-date, as.numeric))
usethis::use_data(gss2005, gss2005_surprises, overwrite = TRUE)

# Blinder and Watson (2016) presidents and the economy ---------------------
bw_names <- names(readxl::read_excel("data-raw/bw2016/DemRep.xlsx", sheet = "Quarterly", n_max = 1))
bw2016 <- readxl::read_excel("data-raw/bw2016/DemRep.xlsx", sheet = "Quarterly", skip = 3, col_names = bw_names) %>%
  rename(date = DATE) %>%
  filter(!is.na(date)) %>%
  mutate(date = as.Date(date), across(-date, as.numeric))
usethis::use_data(bw2016, overwrite = TRUE)

# Giannone, Lenza and Primiceri (2015) Stock-Watson VAR data ---------------
glp_q <- readxl::read_excel("data-raw/glp2015/DataSW.xls", sheet = "Quarterly", skip = 3, col_names = FALSE) %>%
  set_names("date", "rgdp", "pgdp", "cons", "inv", "hours", "rcomp") %>%
  mutate(date = lubridate::floor_date(as.Date(date, "%m\\%d\\%Y"), "quarter"))
glp_m <- readxl::read_excel("data-raw/glp2015/DataSW.xls", sheet = "Monthly", skip = 3, col_names = c("date", "ff")) %>%
  mutate(date = lubridate::floor_date(as.Date(date, "%m\\%d\\%Y"), "quarter")) %>%
  group_by(date) %>% summarise(ff = mean(ff), .groups = "drop")
glp2015 <- left_join(glp_q, glp_m, by = "date")
usethis::use_data(glp2015, overwrite = TRUE)
