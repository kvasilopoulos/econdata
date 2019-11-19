context("bib")

test_that("bbe2005 test", {
  expect_error(valid_key("bbe2005"), NA)
  expect_equal(
    bib_title("bbe2005"),
    paste("Measuring the Effects of Monetary Policy:" ,
           "A Factor-Augmented Vector Autoregressive ({FAVAR}) Approach"))
  # expect_equal(
  #   bib_author("bbe2005"), c("B. S. Bernanke", "J. Boivin", "P. Eliasz" ))
  # expect_equal(bib_year("bbe2005"), 2005)
  # expect_equal(bib_abstract("bbe2005"), NULL)
})
