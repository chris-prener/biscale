context("test bi_class function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_class(x = pctWhite, y = medInc, style = "quantile", dim = 2),
               "An object containing data must be specified for the '.data' argument.")
  expect_error(bi_class(stl_race_income, y = medInc, style = "quantile", dim = 2),
               "A variable must be given for the 'x' argument.")
  expect_error(bi_class(stl_race_income, x = pctWhite, style = "quantile", dim = 2),
               "A variable must be given for the 'y' argument.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_class(stl_race_income, x = ham, y = medInc, style = "quantile", dim = 2),
               "The given 'x' variable 'ham' is not found in the given data set.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = ham, style = "quantile", dim = 2),
               "The given 'y' variable 'ham' is not found in the given data set.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "ham", dim = 2),
               "The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 4),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2, keep_factors = "ham"),
               "A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = "pctWhite", y = "medInc", style = "quantile", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "equal", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "equal", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "fisher", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "fisher", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3, keep_factors = TRUE), NA)
})

# test results ------------------------------------------------


