test_that("bib lookups work", {
  expect_error(valid_key("bbe2005"), NA)
  expect_error(valid_key("nope"), "not a valid key")
  expect_equal(
    bib_title("bbe2005"),
    paste("Measuring the Effects of Monetary Policy:",
          "A Factor-Augmented Vector Autoregressive (FAVAR) Approach"))
  # REFERENCE must line up with BIBTEXKEY (was mis-sorted before 0.2.0)
  expect_match(bib_ref("bq1989"), "Blanchard and D. Quah")
  expect_match(bib_ref("gk2015"), "Gertler and P. Karadi")
})

test_that("catalog matches the shipped data", {
  for (i in seq_len(nrow(catalog))) {
    x <- get(catalog$key[i], envir = asNamespace("econdata"))
    expect_equal(nrow(x), catalog$nrow[i], info = catalog$key[i])
    expect_equal(ncol(x), catalog$ncol[i], info = catalog$key[i])
    expect_equal(paste(names(x), collapse = ", "), catalog$variables[i])
  }
  expect_true(all(na.omit(catalog$paper) %in% papers$BIBTEXKEY))
  expect_false(anyNA(catalog[c("category", "tags", "frequency", "start", "end")]))
  expect_false(anyNA(sources[c("name", "category", "tags", "url")]))
})
