
# Real Home prices --------------------------------------------------------

download.file("http://www.econ.yale.edu/~shiller/data/Fig3-1.xls",
              destfile = "data-raw/shiller.xls", mode = "wb")

total <-
  readxl::read_excel("data-raw/shiller.xls", sheet = "Data") %>%
  select(1, 2) %>%
  set_names("date", "rhpi") %>%
  slice(-c(1:6)) %>%
  mutate(rhpi = as.numeric(rhpi))

to52 <- total %>%
  filter(date <= "1952")

from52 <- total %>%
  filter(date > "1952") %>%
  mutate(date = stringr::str_sub(date, 1, 4)) %>%
  group_by(date) %>%
  summarise(rhpi = mean(rhpi))

joined <- bind_rows(to52, from52)

rest <-
  readxl::read_excel("data-raw/shiller.xls", sheet = "Data") %>%
  select(...3:...6) %>%
  slice(-c(1:6)) %>%
  set_names("date", "rbci", "pop", "rate") %>%
  mutate_at(vars(-date), as.numeric) %>%
  mutate(date = lubridate::ymd(date, truncated = 2)) %>%
  slice(1:NROW(joined))

hprice <-
  bind_cols(joined, rest) %>%
  select(date, rhpi, rbci, pop, rate)

use_data(hprice, overwrite = TRUE)


# SP500 -------------------------------------------------------------------

sp500 <-
  readxl::read_excel(path = "data-raw/sp500.xls",
                    sheet = "Data",
                    col_types = c("text",  "skip", "skip", "skip",
                                  "skip", "skip", "skip", "numeric",
                                  "numeric", "skip", "skip"), skip = 7) %>%
  na.omit() %>%
  dplyr::mutate( Date = Date %>%
                   zoo::as.yearmon("%Y.%m") %>%
                   lubridate::myd(truncated = 1)) %>%
  dplyr::mutate(Ratio = Price/Dividend) %>%
  as_tibble()

use_data(sp500, overwrite = TRUE)


# Dallas Fed --------------------------------------------------------------

library(rvest)

relative_url <-
  read_html("https://www.dallasfed.org/institute/houseprice#tab2") %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep(".xlsx$", ., value = TRUE) %>%
  `[`(1)

absolute_url <- paste0("https://www.dallasfed.org", relative_url)

temp <- "data-raw/hp_iho.xlsx"

download.file(absolute_url, destfile = temp, mode = 'wb')

rhpi <- readxl::read_excel(temp, sheet = 3)

rpdi <- readxl::read_excel(temp, sheet = 5)


# Real House Price Index
price_iho <-
  rhpi %>%
  slice(-1) %>%
  rename(Date = 1) %>%
  mutate(Date = Date %>% lubridate::yq()) %>%
  select( -25) %>%
  na.omit()

# Real Personal Disposable Index
income_iho <-
  rpdi %>%
  slice(-1) %>%
  rename(Date = 1) %>%
  mutate(Date = Date %>% lubridate::yq()) %>%
  select( -25) %>%
  na.omit()

hprice_iho <- full_join(
    gather(price_iho, name, price, -Date),
    gather(income_iho, name, income, -Date),
    by = c("Date", "name")
) %>%
  group_by(Date, name) %>%
  mutate(ratio = price/income) %>%
  ungroup()

use_data(hprice_iho, overwrite = TRUE)
