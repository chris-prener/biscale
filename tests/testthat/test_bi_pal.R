context("test bi_pal function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# load suggested dependencies ------------------------------------------------

library(sf)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_pal(dim = 3, preview = FALSE),
               "A palette must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_pal(pal = "ham", dim = 3, preview = FALSE),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(bi_pal(pal = "GrPink", dim = 5, preview = FALSE),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  expect_error(bi_pal(pal = "GrPink", dim = "ham", preview = FALSE),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  expect_error(bi_pal(pal = "DkViolet", dim = 4, preview = FALSE),
               "The legacy 'DkViolet' palette does not support 4x4 bivarite mapping. Please use 'DkViolet2' instead.")
  expect_error(bi_pal(pal = "GrPink", dim = 4, preview = FALSE),
               "The legacy 'GrPink' palette does not support 4x4 bivarite mapping. Please use 'GrPink2' instead.")
  expect_error(bi_pal(pal = "DkBlue", dim = 4, preview = FALSE),
               "The legacy 'DkBlue' palette does not support 4x4 bivarite mapping. Please use 'DkBlue2' instead.")
  expect_error(bi_pal(pal = "DkCyan", dim = 4, preview = FALSE),
               "The legacy 'DkCyan' palette does not support 4x4 bivarite mapping. Please use 'DkCyan2' instead.")
  expect_error(bi_pal(pal = "Brown", dim = 4, preview = FALSE),
               "The legacy 'Brown' palette does not support 4x4 bivarite mapping. Please use 'Brown2' instead.")
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = "ham"),
               "A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
})

# test inputs ------------------------------------------------

# test results ------------------------------------------------

result1 <- bi_pal(pal = "GrPink", dim = 2)
result2 <- bi_pal(pal = "GrPink", dim = 3)
result3 <- bi_pal(pal = "GrPink", dim = 2, preview = FALSE)
result4 <- bi_pal(pal = "GrPink", dim = 3, preview = FALSE)

result5 <- bi_pal(pal = "GrPink2", dim = 4)
result6 <- bi_pal(pal = "GrPink2", dim = 4, preview = FALSE)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  expect_equal("character" %in% class(result3), TRUE)
  expect_equal("character" %in% class(result4), TRUE)
  expect_equal("ggplot" %in% class(result5), TRUE)
  expect_equal("character" %in% class(result6), TRUE)
})
