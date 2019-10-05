#' #' @export
#' #' @importFrom dplyr select_if rename_all rename select mutate
#' #' @importFrom purrr map_chr
#' papers <- function(raw = FALSE) {
#'   out <- bibfile() %>%
#'     select_if(~ !all(is.na(.))) %>%
#'     rename_all(list(~tolower(.x))) %>%
#'     rename(key = bibtexkey)
#'   if (isFALSE(raw)) {
#'     out <- out %>%
#'       mutate(authors = map_chr(author, paste, collapse = ", ")) %>%
#'       select(key, authors, title)
#'   }
#'   out
#' }


# papers <- function() {
#   tibble::tribble(
#     ~ key,  ~ authoryear, ~ title,
#     "sw2001",  "Stock & Watson (2001)", "Vector Autoregressions",
#     "bq1989",  "Blanchard & Quah (1989)", "The Dynamic Effects of Aggregate Demand and Supply Disturbances",
#     "u2005",   "Uhlig (2005)",    "What are the effects of monetary policy on output",
#     "psy2015", "Phillips, Shi & Yu (2015)", "Testing For Multiple Bubbles: Historical Episodes Of Exuberance And Collapse In The S&P 500",
#     "gk2015",  "Gertler & Karadi (2015)", "Monetary Policy Surprises, Credit Costs, and Economic Activity"
#   ) %>%
#   dplyr::arrange(key) %>%
#   mutate(author = stringr::str_extract(authoryear, "([^,]+)") %>%
#            stringr::word(., start = 1)) %>%
#   mutate(year = stringr::str_extract(authoryear, "(?<=\\().*?(?=\\))"))
# }

# usethis::use_data(papers, overwrite = TRUE)


# Rest --------------------------------------------------------------------

# misc <-
#   tibble::tribble(
#     ~  Key, ~ Description,
#     "kl2017", "Killian Lutkepohl 2017 Book",
#     "hprice", "Historical Home prices",
#     "sp500", "SP500 stock market data",
#     "hprice_iho", "International House Price Database",
#     "nber_rec", "NBER Recession Periods",
#
#   )
#
# usethis::use_data(misc, overwrite = TRUE)
