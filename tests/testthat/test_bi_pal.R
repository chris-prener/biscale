context("test bi_pal function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")
load(system.file("extdata", "testdata.rda", package = "biscale"))

# load suggested dependencies ------------------------------------------------

library(sf)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_pal(dim = 3, preview = FALSE),
               "A palette must be specified for the 'pal' argument. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_pal(pal = "ham", dim = 3, preview = FALSE),
               "The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  expect_error(bi_pal(pal = "DkBlue", dim = 5, preview = FALSE),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_pal(pal = "DkBlue", dim = "ham", preview = FALSE),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_pal(pal = "DkBlue", dim = 3, preview = "ham"),
               "A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_pal(pal = "Brown", dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = "Brown", dim = 3, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkBlue", dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkBlue", dim = 3, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkCyan", dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkCyan", dim = 3, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkViolet", dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = "DkViolet", dim = 3, preview = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 3), NA)
})

# test results ------------------------------------------------

result1 <- bi_pal(pal = "GrPink", dim = 2)
result2 <- bi_pal(pal = "GrPink", dim = 3)
result3 <- bi_pal(pal = "GrPink", dim = 2, preview = FALSE)
result4 <- bi_pal(pal = "GrPink", dim = 3, preview = FALSE)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  expect_equal("character" %in% class(result3), TRUE)
  expect_equal("character" %in% class(result4), TRUE)
})

result_brown2 <- bi_pal(pal = "Brown", dim = 2, preview = FALSE)
result_brown3 <- bi_pal(pal = "Brown", dim = 3, preview = FALSE)
result_dkblue2 <- bi_pal(pal = "DkBlue", dim = 2, preview = FALSE)
result_dkblue3 <- bi_pal(pal = "DkBlue", dim = 3, preview = FALSE)
result_dkcyan2 <- bi_pal(pal = "DkCyan", dim = 2, preview = FALSE)
result_dkcyan3 <- bi_pal(pal = "DkCyan", dim = 3, preview = FALSE)
result_dkviolet2 <- bi_pal(pal = "DkViolet", dim = 2, preview = FALSE)
result_dkviolet3 <- bi_pal(pal = "DkViolet", dim = 3, preview = FALSE)

test_that("correct color palettes are returned", {
  expect_equal(result_brown2, brown2)
  expect_equal(result_brown3, brown3)
  expect_equal(result_dkblue2, dkblue2)
  expect_equal(result_dkblue3, dkblue3)
  expect_equal(result_dkcyan2, dkcyan2)
  expect_equal(result_dkcyan3, dkcyan3)
  expect_equal(result_dkviolet2, dkviolet2)
  expect_equal(result_dkviolet3, dkviolet3)
  expect_equal(result3, grpink2)
  expect_equal(result4, grpink3)
})
