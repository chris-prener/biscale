context("test bi_class function")

# load suggested dependencies ------------------------------------------------

library(sf)

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "equal", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "equal", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "fisher", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "fisher", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3), NA)
})
