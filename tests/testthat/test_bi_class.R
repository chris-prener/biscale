context("test bi_class function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

bins_x <- classInt::classIntervals(stl_race_income$pctWhite, n = 3, style = "quantile")$brks
bins_y <- classInt::classIntervals(stl_race_income$medInc, n = 3, style = "quantile")$brks
stl_race_income$factor_x <- cut(stl_race_income$pctWhite, breaks = bins_x, include.lowest = TRUE)
stl_race_income$factor_y <- cut(stl_race_income$medInc, breaks = bins_y, include.lowest = TRUE)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_class(x = pctWhite, y = medInc, style = "quantile", dim = 2),
               "An object containing data must be specified for the '.data' argument.")
  expect_error(bi_class(stl_race_income, y = medInc, style = "quantile", dim = 2),
               "A variable must be given for the 'x' argument.")
  expect_error(bi_class(stl_race_income, x = pctWhite, style = "quantile", dim = 2),
               "A variable must be given for the 'y' argument.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, dim = 2),
               "Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "ham", dim = 2),
               "The style 'ham' is not a valid method for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
  expect_error(bi_class(stl_race_income, x = ham, y = medInc, style = "quantile", dim = 2),
               "The variable 'ham' is not found in the given data set.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "ham", dim = 2),
               "The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2, keep_factors = "ham"),
               "A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
  expect_error(bi_class(stl_race_income, x = factor_x, y = factor_y, dim = 2),
               "The variable 'factor_x' has a different number of levels than the value given for the 'dim' argument.")
  expect_error(bi_class(stl_race_income, x = factor_x, y = factor_y, dim = "ham"),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_class(stl_race_income, x = factor_x, y = factor_y, dim = 1),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_class(stl_race_income, x = factor_x, y = factor_y, dim = 2.5),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
})

stl_race_income$pctWhite_chr <- as.character(stl_race_income$pctWhite)

test_that("non-numeric or factor vectors trigger error", {
  expect_error(bi_class(stl_race_income, x = pctWhite_chr,
                        y = medInc, style = "ham", dim = 2),
               "The variable 'pctWhite_chr' is not the correct class. It must be either integer, double, or factor.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error, continuous inputs", {
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2), NA)
  expect_error(bi_class(stl_race_income, x = "pctWhite", y = "medInc", style = "quantile", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3, keep_factors = TRUE), NA)
})

test_that("correctly specified functions execute without error, factor inputs", {
  expect_error(bi_class(stl_race_income, x = factor_x, y = factor_y, dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = factor_x, y = medInc, style = "quantile", dim = 3), NA)
  expect_error(bi_class(stl_race_income, x = pctWhite, y = factor_y, style = "quantile", dim = 3), NA)
})

test_that("high dimension inputs generate warning", {
  expect_warning(bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 5),
                 "Maps that are larger than 4x4 dimensions can be difficult to interpret, and biscale does not provide built-in palettes for these maps. If you proceed, you will need to supply a custom palette for these data.")
})
