source("data-raw/helpers.R")
library(haven)
library(readxl)

# Acemoglu, Johnson and Robinson (2001) settler mortality -----------------
# https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive -> maketable1.dta

ajr2001 <- read_dta("data-raw/ajr2001/maketable1.dta") %>%
  rename(code = shortnam) %>%
  filter(!code %in% c("", "."), if_any(-c(code, baseco), ~ !is.na(.))) %>%
  as_tibble()

usethis::use_data(ajr2001, overwrite = TRUE)

# Acemoglu, Johnson and Robinson (2002) reversal of fortune ---------------
# https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive -> maketable1.dta

ajr2002 <- read_dta("data-raw/ajr2002/maketable1.dta") %>%
  rename(code = shortnam) %>%
  filter(!code %in% c("", "."),
         if_any(c(logpgp95, avexpr, pd1500s, lpd1500s, lpd1000s, sjb1500, urbz1995), ~ !is.na(.))) %>%
  as_tibble()

usethis::use_data(ajr2002, overwrite = TRUE)

# Acemoglu, Johnson, Robinson and Yared (2008) income and democracy -------
# https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive ->
# "Income and Democracy Data AER adjustment.zip", "5 Year Panel" sheet

ajry2008 <- read_excel("data-raw/ajry2008/Income and Democracy Data AER adjustment.xls",
                       sheet = "5 Year Panel") %>%
  select(-code_numeric, -year_numeric) %>%
  mutate(year = as.integer(year)) %>%
  select(code, country, year, everything()) %>%
  arrange(code, year) %>%
  as_tibble()

usethis::use_data(ajry2008, overwrite = TRUE)

# Acemoglu and Johnson (2007) disease and development ---------------------
# https://economics.mit.edu/people/faculty/daron-acemoglu/data-archive ->
# "Disease and development data and programs.zip", disease.dta

aj2007 <- read_dta("data-raw/aj2007/disease.dta") %>%
  select(country, ctry, year, lifeexpect, loglifeexpect, globmort1000,
         maddpop, logmaddpop, totalmaddgdp, logtotalmaddgdp, gdppcmadd,
         loggdppcmadd, sample40, sample80, startrich, startmedium,
         startpoor, above_medmort) %>%
  mutate(year = as.integer(year)) %>%
  as_tibble()

usethis::use_data(aj2007, overwrite = TRUE)

# Hall and Jones (1999) output per worker, 127 countries -------------------
# https://web.stanford.edu/~chadj/HallJones400.asc (basic data table)

hj1999 <- read_csv("data-raw/hj1999/basic_data.csv", show_col_types = FALSE) %>%
  as_tibble()

usethis::use_data(hj1999, overwrite = TRUE)

# Jones (2002) sources of US economic growth -------------------------------
# https://web.stanford.edu/~chadj/Sources50.asc (main annual growth-accounting table)

j2002_lines <- readLines("data-raw/j2002/Sources50.asc")[81:124]
j2002 <- read.table(text = j2002_lines,
                    col.names = c("year", "gdp", "hours", "k", "gdp_l", "k_y", "sk", "edatt", "a")) %>%
  as_tibble() %>%
  mutate(year = as.integer(year))

usethis::use_data(j2002, overwrite = TRUE)

# Chetty, Hendren, Kline and Saez (2014) intergenerational mobility by CZ -
# https://opportunityinsights.org/data/ -> "Online Data Table" (online_data_tables-4.xls),
# Online Data Table V (Intergenerational Mobility Estimates by Commuting Zone)

chks2014_hdr <- as.character(read_excel("data-raw/chks2014/online_data_tables-4.xls",
                                        sheet = "Online Data Table 5", col_names = FALSE,
                                        skip = 49, n_max = 1))
chks2014 <- read_excel("data-raw/chks2014/online_data_tables-4.xls",
                       sheet = "Online Data Table 5", col_names = FALSE, skip = 52) %>%
  set_names(chks2014_hdr) %>%
  rename_with(~ gsub("[^a-z0-9]+", "_", tolower(.x))) %>%
  rename_with(~ sub("_$", "", .x)) %>%
  as_tibble()

usethis::use_data(chks2014, overwrite = TRUE)

# Chetty, Grusky, Hilger, Hendren, Manduca and Narang (2017) absolute mobility -
# https://opportunityinsights.org/data/ ->
# table1_national_absmob_by_cohort_parpctile.xlsx

cghhmn2017 <- read_excel("data-raw/cghhmn2017/table1_national_absmob_by_cohort_parpctile.xlsx") %>%
  pivot_longer(starts_with("abs_mob_pos_par_p"),
               names_to = "par_pctile", names_prefix = "abs_mob_pos_par_p",
               values_to = "abs_mob") %>%
  mutate(cohort = as.integer(cohort), par_pctile = as.integer(par_pctile)) %>%
  select(cohort, par_pctile, abs_mob, par_frac0, cohort_mean) %>%
  arrange(cohort, par_pctile) %>%
  as_tibble()

usethis::use_data(cghhmn2017, overwrite = TRUE)

# Chetty, Stepner et al. (2016) life expectancy by income --------------
# https://healthinequality.org/data/ -> health_ineq_online_table_1.csv (national),
# health_ineq_online_table_3.csv (by state), CC0

chetty2016 <- read_csv("data-raw/chetty2016/health_ineq_online_table_1.csv", show_col_types = FALSE) %>%
  rename(sex = gnd, pctile = pctile) %>%
  as_tibble()

usethis::use_data(chetty2016, overwrite = TRUE)

chetty2016_state <- read_csv("data-raw/chetty2016/health_ineq_online_table_3.csv", show_col_types = FALSE) %>%
  rename(state_fips = st) %>%
  as_tibble()

usethis::use_data(chetty2016_state, overwrite = TRUE)

# Piketty and Saez (2003), updated: top income shares ----------------------
# https://eml.berkeley.edu/~saez/ -> TabFig2024.xlsx, sheet "Table A1"
# (top fractile shares excluding capital gains, 1913-2024)

ps2003 <- read_excel("data-raw/ps2003/TabFig2024.xlsx", sheet = "Table A1",
                     col_names = FALSE, skip = 5) %>%
  select(1:7, 9:13) %>%
  set_names("year", "p90_100", "p95_100", "p99_100", "p99_5_100", "p99_9_100", "p99_99_100",
            "p90_95", "p95_99", "p99_99_5", "p99_5_99_9", "p99_9_99_99") %>%
  mutate(year = suppressWarnings(as.numeric(year))) %>%
  filter(!is.na(year)) %>%
  mutate(year = as.integer(year), across(-year, as.numeric)) %>%
  as_tibble()

usethis::use_data(ps2003, overwrite = TRUE)

# Piketty, Saez and Zucman (2018) distributional national accounts ---------
# https://gabriel-zucman.eu/usdina/ -> PSZ2018MainData.xlsx, sheet "Data"
# (equal-split pre-tax and post-tax national income shares by group)

psz2018 <- read_excel("data-raw/psz2018/PSZ2018MainData.xlsx", sheet = "Data",
                      col_names = FALSE, skip = 3) %>%
  select(1, 65:69, 73:76) %>%
  set_names("year", "pretax_bottom50", "pretax_middle40", "pretax_top10", "pretax_top1", "pretax_top01",
            "posttax_bottom50", "posttax_middle40", "posttax_top10", "posttax_top1") %>%
  mutate(year = suppressWarnings(as.numeric(year))) %>%
  filter(!is.na(year)) %>%
  mutate(year = as.integer(year), across(-year, as.numeric)) %>%
  filter(if_any(-year, ~ !is.na(.))) %>%
  as_tibble()

usethis::use_data(psz2018, overwrite = TRUE)

# Saez and Zucman (2016) top wealth shares ----------------------------------
# https://gabriel-zucman.eu/uswealth/ -> SaezZucman2015MainData.xlsx,
# sheet "DataFig1-6-7b" (capitalization estimates, Figure 1)

sz2016 <- read_excel("data-raw/sz2016/SaezZucman2015MainData.xlsx", sheet = "DataFig1-6-7b",
                     col_names = FALSE, skip = 2) %>%
  select(1:7, 9) %>%
  set_names("year", "bottom90", "top10", "top5", "top1", "top05", "top01", "top001") %>%
  mutate(year = suppressWarnings(as.numeric(year))) %>%
  filter(!is.na(year)) %>%
  mutate(year = as.integer(year), across(-year, as.numeric)) %>%
  filter(if_any(-year, ~ !is.na(.))) %>%
  as_tibble()

usethis::use_data(sz2016, overwrite = TRUE)
