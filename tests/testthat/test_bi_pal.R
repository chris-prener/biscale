context("test bi_pal function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# create classes ------------------------------------------------

data <- bi_class(stl_race_income, x = pctWhite, y = medInc)

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_pal(data, pal = "Brown"), NA)
  expect_error(bi_pal(data, pal = "DkBlue"), NA)
  expect_error(bi_pal(data, pal = "DkCyan"), NA)
  expect_error(bi_pal(data, pal = "DkViolet"), NA)
  expect_error(bi_pal(data, pal = "GrPink"), NA)
})
