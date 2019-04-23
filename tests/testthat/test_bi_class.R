context("test bi_class function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# create classes ------------------------------------------------

data <- bi_class(stl_race_income, x = pctWhite, y = medInc)

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc), NA)
})
