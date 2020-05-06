context("test bi_legend function")

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_legend(dim = 3),
               "A palette must be specified for the 'pal' argument.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_legend(pal = "ham", dim = 3),
               "The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', or 'GrPink'.")
  expect_error(bi_legend(pal = "DkBlue", dim = 5),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_legend(pal = "DkBlue", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, xlab = 24),
               "The 'xlab' argument must be a character string.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, ylab = 24),
               "The 'ylab' argument must be a character string.")
  expect_error(bi_legend(pal = "DkBlue", dim = 2, size = "ham"),
               "The 'size' argument must be a numeric value.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_legend(pal = "Brown", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "Brown", dim = 3, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkBlue", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkBlue", dim = 3, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkCyan", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkCyan", dim = 3, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkViolet", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "DkViolet", dim = 3, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "GrPink", dim = 2, xlab = "ham", ylab = "bacon"), NA)
  expect_error(bi_legend(pal = "GrPink", dim = 3, xlab = "ham", ylab = "bacon"), NA)
})

a <- "ham"
b <- "bacon"

test_that("correctly specified functions execute without error", {
  expect_error(bi_legend(pal = "Brown", dim = 2, xlab = a, ylab = b), NA)
})

custom_pal <- bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80", val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B")

test_that("correctly specified functions execute without error", {
  expect_error(bi_legend(pal = custom_pal, dim = 2, xlab = a, ylab = b), NA)
})

# test results ------------------------------------------------

result1 <- bi_legend(pal = "GrPink", dim = 2)
result2 <- bi_legend(pal = "GrPink", dim = 3)
result3 <- bi_legend(pal = custom_pal, dim = 2)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  expect_equal("ggplot" %in% class(result3), TRUE)
})
