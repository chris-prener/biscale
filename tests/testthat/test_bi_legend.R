context("test bi_legend function")

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_legend(dim = 3),
               "A palette must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_legend(pal = "ham", dim = 3),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(bi_legend(pal = "DkBlue", dim = 5),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  expect_error(bi_legend(pal = "DkBlue", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  expect_error(bi_legend(pal = "DkViolet", dim = 4),
               "The legacy 'DkViolet' palette does not support 4x4 bivarite mapping. Please use 'DkViolet2' instead.")
  expect_error(bi_legend(pal = "GrPink", dim = 4),
               "The legacy 'GrPink' palette does not support 4x4 bivarite mapping. Please use 'GrPink2' instead.")
  expect_error(bi_legend(pal = "DkBlue", dim = 4),
               "The legacy 'DkBlue' palette does not support 4x4 bivarite mapping. Please use 'DkBlue2' instead.")
  expect_error(bi_legend(pal = "DkCyan", dim = 4),
               "The legacy 'DkCyan' palette does not support 4x4 bivarite mapping. Please use 'DkCyan2' instead.")
  expect_error(bi_legend(pal = "Brown", dim = 4),
               "The legacy 'Brown' palette does not support 4x4 bivarite mapping. Please use 'Brown2' instead.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, xlab = 24),
               "The 'xlab' argument must be a character string.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, ylab = 24),
               "The 'ylab' argument must be a character string.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, size = "ham"),
               "The 'size' argument must be a numeric value.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {

  expect_error(bi_legend(pal = "GrPink", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "GrPink", dim = 3, xlab = "ham", ylab = "bacon"), NA)
})

a <- "ham"
b <- "bacon"

test_that("correctly specified functions execute without error", {
  expect_error(bi_legend(pal = "Brown", dim = 2, xlab = a, ylab = b), NA)
})

# custom_pal <- bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80", val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B")

# test_that("correctly specified functions execute without error", {
#  expect_error(bi_legend(pal = custom_pal, dim = 2, xlab = a, ylab = b), NA)
# })

# test results ------------------------------------------------

result1 <- bi_legend(pal = "GrPink", dim = 2)
result2 <- bi_legend(pal = "GrPink", dim = 3)
# result3 <- bi_legend(pal = custom_pal, dim = 2)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  # expect_equal("ggplot" %in% class(result3), TRUE)
})
