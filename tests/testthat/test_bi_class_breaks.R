context("test bi_class_breaks function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

bins_x <- classInt::classIntervals(stl_race_income$pctWhite, n = 3, style = "quantile")$brks
bins_y <- classInt::classIntervals(stl_race_income$medInc, n = 3, style = "quantile")$brks
stl_race_income$factor_x <- cut(stl_race_income$pctWhite, breaks = bins_x, include.lowest = TRUE)
stl_race_income$factor_y <- cut(stl_race_income$medInc, breaks = bins_y, include.lowest = TRUE)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_class_breaks(x = pctWhite, y = medInc, style = "quantile", dim = 2),
               "An object containing data must be specified for the '.data' argument.")
  expect_error(bi_class_breaks(stl_race_income, y = medInc, style = "quantile", dim = 2),
               "A variable must be given for the 'x' argument.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, style = "quantile", dim = 2),
               "A variable must be given for the 'y' argument.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, dim = 2),
               "Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "ham", dim = 2),
               "The style 'ham' is not a valid method for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               clean_levels = "ham"),
               "A logical scalar must be supplied for 'clean_levels'. Please provide either 'TRUE' or 'FALSE'.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = "ham"),
               "A logical scalar must be supplied for 'split'. Please provide either 'TRUE' or 'FALSE'.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = TRUE, dig_lab = "ham"),
               "A numeric scalar or vector must be supplied for 'dig_lab'.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = TRUE, dig_lab = c(3, "ham")),
               "A numeric scalar or vector must be supplied for 'dig_lab'.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = TRUE, dig_lab = c(ham = 3, y = 4)),
               "The vector supplied for the 'dig_lab' argument contains invalid names. Only 'x' and 'y' are accepted for named vectors.")
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = TRUE, dig_lab = c(4,5,6)),
               "The vector supplied for the 'dig_lab' argument is too long.")
  expect_error(bi_class_breaks(stl_race_income, x = factor_x, y = factor_y, dim = "ham"),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_class_breaks(stl_race_income, x = factor_x, y = factor_y, dim = 1),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_class_breaks(stl_race_income, x = factor_x, y = factor_y, dim = 2.5),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error, continuous inputs", {
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2,
                               split = TRUE, dig_lab = c(3, 4)), NA)
  expect_error(bi_class_breaks(stl_race_income, x = "pctWhite", y = "medInc", style = "quantile", dim = 3,
                               split = TRUE, dig_lab = c(x = 3, y = 4)), NA)
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3,
                               split = TRUE, dig_lab = c(y = 4, x = 3)), NA)
})

test_that("correctly specified functions execute without error, factor inputs", {
  expect_error(bi_class_breaks(stl_race_income, x = factor_x, y = factor_y, dim = 3,
                               split = TRUE, dig_lab = c(x = 3, y = 4)), NA)
  expect_error(bi_class_breaks(stl_race_income, x = factor_x, y = medInc, style = "quantile", dim = 3,
                               split = TRUE, dig_lab = c(x = 3, y = 4)), NA)
  expect_error(bi_class_breaks(stl_race_income, x = pctWhite, y = factor_y, style = "quantile", dim = 3,
                               split = TRUE, dig_lab = c(x = 3, y = 4)), NA)
})

test_that("inputs generate warnings", {
  expect_warning(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 5),
                 "Maps that are larger than 4x4 dimensions can be difficult to interpret, and biscale does not provide built-in palettes for these maps. If you proceed, you will need to supply a custom palette for these data.")
  expect_warning(bi_class_breaks(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3,
                                  clean_levels = FALSE, dig_lab = c(4,5), split = TRUE),
                  "Splitting levels requires level cleaning as well. The 'clean_levels' argument has been overridden.")
})
