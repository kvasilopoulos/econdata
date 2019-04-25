papers <-
  tibble::tribble(
    ~ Key,  ~ Authoryear, ~ Title,
    "sw2001",  "Stock & Watson (2001)", "Vector Autoregressions",
    "bq1989",  "Blanchard & Quah (1989)", "The Dynamic Effects of Aggregate Demand and Supply Disturbances",
    "u2005",   "Uhlig (2005)",    "What are the effects of monetary policy on output",
    "psy2015", "Phillips, Shi & Yu (2015)", "Testing For Multiple Bubbles: &nbsp; Historical Episodes Of Exuberance And Collapse In The S&P 500",
    "gk2015",  "Gertler & Karadi (2015)", "Monetary Policy Surprises, Credit Costs, and Economic Activity"
  ) %>%
    dplyr::arrange(Key)

usethis::use_data(papers, overwrite = TRUE)



# Rest --------------------------------------------------------------------

misc <-
  tibble::tribble(
    ~  Key, ~ Description,
    "hprice", "Historical Home prices",
    "sp500", "SP500 stocke market data"
  )

usethis::use_data(misc, overwrite = TRUE)
