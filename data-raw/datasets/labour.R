source("data-raw/helpers.R")
library(haven)

# Card and Krueger (1994) NJ-PA fast-food minimum wage survey ------------
# https://davidcard.berkeley.edu/data_sets.html -> njmin.zip (public.dat + codebook)

ck1994_names <- c(
  "sheet", "chain", "co_owned", "state",
  "southj", "centralj", "northj", "pa1", "pa2", "shore",
  "ncalls", "empft", "emppt", "nmgrs", "wage_st", "inctime", "firstinc",
  "bonus", "pctaff", "meals", "open", "hrsopen", "psoda", "pfry", "pentree",
  "nregs", "nregs11",
  "type2", "status2", "date2", "ncalls2", "empft2", "emppt2", "nmgrs2",
  "wage_st2", "inctime2", "firstin2", "special2", "meals2", "open2r",
  "hrsopen2", "psoda2", "pfry2", "pentree2", "nregs2", "nregs112"
)

ck1994 <- read.table("data-raw/ck1994/public.dat", col.names = ck1994_names,
                      na.strings = ".") %>%
  as_tibble() %>%
  mutate(date2 = as.Date(sprintf("19%02d-%02d-%02d",
                                  date2 %% 100, date2 %/% 10000, (date2 %/% 100) %% 100)))

usethis::use_data(ck1994, overwrite = TRUE)

# Angrist and Lavy (1999) Israel class size (Maimonides rule) -----------
# Angrist data archive -> final4.dta, final5.dta

al1999_rename <- function(d, grade) {
  d %>%
    rename(c_numrd = !!paste0("c_num", grade, "rd"),
           flgrm = !!paste0("flgrm", grade),
           mrkgrm = !!paste0("mrkgrm", grade),
           ngrm = !!paste0("ngrm", grade),
           flmth = !!paste0("flmth", grade),
           mrkmth = !!paste0("mrkmth", grade),
           nmth = !!paste0("nmth", grade)) %>%
    mutate(grade = as.integer(grade))
}

al1999 <- bind_rows(
  al1999_rename(haven::read_dta("data-raw/al1999/final4.dta"), 4),
  al1999_rename(haven::read_dta("data-raw/al1999/final5.dta"), 5)
) %>%
  as_tibble() %>%
  select(-`_type_`, -`_freq_`) %>%  # PROC MEANS bookkeeping artifacts, not data
  mutate(across(where(~ is.numeric(.x) && all(.x == floor(.x), na.rm = TRUE)), as.integer)) %>%
  select(grade, schlcode, everything())

usethis::use_data(al1999, overwrite = TRUE)

# Angrist (1990) Vietnam draft lottery and SSA earnings cells ------------
# Angrist data archive -> cwhsa.dta (1964-77 FICA taxable earnings),
# cwhsb.dta (1978-84 FICA taxable and total W-2 earnings)

a1990_a <- haven::read_dta("data-raw/a1990/cwhsa.dta") %>%
  as_tibble() %>%
  mutate(byr = as.integer(1900 + byr),
         race = as.integer(race),
         interval = as.integer(interval),
         year = as.integer(1900 + year),
         vnu1 = as.double(vnu1),
         ctr1 = as.integer(ctr1)) %>%
  select(byr, race, interval, year, everything())

a1990_b <- haven::read_dta("data-raw/a1990/cwhsb.dta") %>%
  as_tibble() %>%
  mutate(byr = as.integer(1900 + byr),
         race = as.integer(race),
         interval = as.integer(interval),
         year = as.integer(1900 + year),
         ctr1 = as.integer(ctr1),
         type = factor(type)) %>%
  select(byr, race, interval, year, type, everything())

usethis::use_data(a1990_a, a1990_b, overwrite = TRUE)

# Abadie, Angrist and Imbens (2002) JTPA training experiment -------------
# Angrist data archive -> jtpa.raw (columns from qeffectsfinal.m comments)

aai2002_names <- c(
  "id", "earnings", "assignment", "training", "male",
  "hsorged", "black", "hispanic", "married", "wkless13", "afdc",
  "class_tr", "ojt_jsa",
  "age2225", "age2629", "age3035", "age3644", "age4554", "f2sms"
)

aai2002 <- read.table("data-raw/aai2002/jtpa.raw", col.names = aai2002_names) %>%
  as_tibble() %>%
  mutate(across(c(id, assignment, training, male, hsorged, black, hispanic,
                   class_tr, ojt_jsa, age2225, age2629, age3035, age3644,
                   age4554, f2sms), as.integer))

usethis::use_data(aai2002, overwrite = TRUE)

# Angrist and Lavy (2009) achievement awards RCT -------------------------
# Angrist data archive -> AngristLavy_AERdata.zip: data/base00/01/02.dta are
# the three post-randomization cohorts used in the paper's tables; base99.dta
# is a pre-experiment baseline cohort (commented out of the replication .do
# files) and is left out here.

al2009_read <- function(file, yr) {
  haven::read_dta(file) %>%
    as_tibble() %>%
    mutate(year = as.integer(yr))
}

al2009 <- bind_rows(
  al2009_read("data-raw/al2009/base00.dta", 2000),
  al2009_read("data-raw/al2009/base01.dta", 2001),
  al2009_read("data-raw/al2009/base02.dta", 2002)
) %>%
  mutate(across(-lagscore, as.integer)) %>%
  select(year, school_id, student_id, everything())

usethis::use_data(al2009, overwrite = TRUE)

# Angrist, Lang and Oreopoulos (2009) Canadian STAR incentives RCT ------
# Angrist data archive -> STARdatapost.zip: STAR_public_use.dta

alo2009 <- haven::read_dta("data-raw/alo2009/STAR_public_use.dta") %>%
  as_tibble() %>%
  # dad_edn/mom_edn/lastmin carry Stata value labels (e.g. 6 = "completed a
  # bachelor's degree"); resolve to the label text instead of shipping an
  # opaque haven_labelled numeric code
  mutate(across(where(haven::is.labelled), ~ as.character(haven::as_factor(.x))))

usethis::use_data(alo2009, overwrite = TRUE)

# Angrist, Bettinger and Kremer (2006) Colombia voucher long-run follow-up
# Angrist data archive -> angbetkre06data.zip: aerdata_colombia2.dta

abk2006 <- haven::read_dta("data-raw/abk2006/aerdata_colombia2.dta") %>%
  as_tibble()

usethis::use_data(abk2006, overwrite = TRUE)

# Angrist, Bettinger, Bloom, King and Kremer (2002) Colombia PACES vouchers
# Angrist data archive -> aerdat4.sas7bdat (haven::read_sas); full file is
# 25330 obs x 89 vars (~17 MB), so we keep the three lottery survey samples
# (Bogota 1995/1997, Jamundi 1993) and the covariates used in the paper's
# main outcome tables.

abbkk2002_cols <- c(
  "ID", "DBOGOTA", "DJAMUNDI", "D1993", "D1995", "D1997", "VOUCH0",
  "SEX", "AGE", "MOM_SCH", "MOM_AGE", "DAD_SCH", "DAD_AGE",
  "STRATAMS", "REPT6", "TOTSCYRS", "FINISH6", "FINISH7", "FINISH8",
  "USNGSCH", "HOURSUM", "WORKING", "MARRIED", "HASCHILD",
  "TEST_TAK", "RESPONSE", "SVY"
)

abbkk2002_raw <- haven::read_sas("data-raw/abbkk2002/aerdat4.sas7bdat")

abbkk2002 <- abbkk2002_raw %>%
  filter(BOG95SMP == 1 | BOG97SMP == 1 | JAM93SMP == 1) %>%
  select(all_of(abbkk2002_cols)) %>%
  rename_with(tolower) %>%
  as_tibble()

usethis::use_data(abbkk2002, overwrite = TRUE)

# Autor, Dorn and Hanson (2013) China syndrome commuting-zone panel -----
# https://www.ddorn.net/data.htm -> Autor-Dorn-Hanson-ChinaSyndrome-FileArchive.zip
# dta/workfile_china.dta has 1444 obs x 208 vars (~2.3 MB); we keep the
# commuting-zone ids, weights, census-division dummies, the initial-period
# controls and the changes in manufacturing/wage outcomes and trade exposure
# used in the paper's main 2SLS tables (Table 3 and Table 5). The full file
# stays in data-raw/adh2013/ and on ddorn.net/data.htm for anyone who needs
# the rest of the 208 columns.

adh2013_cols <- c(
  "czone", "statefip", "city", "yr", "t2", "timepwt48",
  "reg_midatl", "reg_encen", "reg_wncen", "reg_satl", "reg_escen",
  "reg_wscen", "reg_mount", "reg_pacif",
  "l_popcount", "l_shind_manuf_cbp", "l_sh_popedu_c", "l_sh_popfborn",
  "l_sh_empl_f", "l_sh_routine33", "l_task_outsource",
  "d_sh_empl", "d_sh_empl_mfg", "d_sh_empl_nmfg", "d_sh_unempl", "d_sh_nilf",
  "d_avg_lnwkwage", "d_avg_lnwkwage_mfg", "d_avg_lnwkwage_nmfg",
  "d_tradeusch_pw", "d_tradeotch_pw_lag"
)

adh2013 <- haven::read_dta("data-raw/adh2013/workfile_china.dta") %>%
  as_tibble() %>%
  select(all_of(adh2013_cols))

usethis::use_data(adh2013, overwrite = TRUE)

# csl2000 (Acemoglu and Angrist 2000 compulsory schooling laws) deliberately
# omitted: the raw file's origin could not be verified (no unrar/7z in this
# environment to have produced it as claimed) even though its content looks
# genuine. See data-raw/TODO.md. Re-add once cleanly re-downloaded.

# Duflo (2001) INPRES school construction, regency-level variables ------
# https://github.com/droodman/Duflo-2001 (MIT licence) ->
# "Regency-level vars/Regency-level vars.dta" (aggregated, redistributable;
# the underlying 1995 SUPAS/SUSENAS micro files are not in the repo)

duflo2001 <- haven::read_dta("data-raw/duflo2001/Regency-level vars.dta") %>%
  as_tibble() %>%
  rename_with(tolower)

usethis::use_data(duflo2001, overwrite = TRUE)
