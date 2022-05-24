context("test bi_legend function")

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_legend(dim = 3),
               "A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_legend(pal = "ham", dim = 3),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(bi_legend(pal = "DkViolet", dim = 4),
               "The legacy 'DkViolet' palette does not support 4x4 bivarite mapping. Please use 'DkViolet2' instead.")
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

custom_pal_valid1 <- c(
  "1-1" = "#cabed0", # low x, low y
  "2-1" = "#ae3a4e", # high x, low y
  "1-2" = "#4885c1", # low x, high y
  "2-2" = "#3f2949" # high x, high y
)

custom_pal_valid2 <- c(
  "1-1" = "#d3d3d3", # low x, low y
  "2-1" = "#b6cdcd",
  "3-1" = "#97c5c5",
  "4-1" = "#75bebe",
  "5-1" = "#52b6b6", # high x, low y
  "1-2" = "#cab6c5",
  "2-2" = "#aeb0bf",
  "3-2" = "#91aab9",
  "4-2" = "#70a4b2",
  "5-2" = "#4e9daa",
  "1-3" = "#c098b9",
  "2-3" = "#a593b3",
  "3-3" = "#898ead",
  "4-3" = "#6b89a6",
  "5-3" = "#4a839f",
  "1-4" = "#b77aab",
  "2-4" = "#9e76a6",
  "3-4" = "#8372a0",
  "4-4" = "#666e9a",
  "5-4" = "#476993",
  "1-5" = "#ad5b9c", # low x, high y
  "2-5" = "#955898",
  "3-5" = "#7c5592",
  "4-5" = "#60528d",
  "5-5" = "#434e87" # high x, high y
)

test_that("custom palettes are accepted without error", {
  expect_error(bi_legend(pal = custom_pal_valid1, dim = 2, xlab = a, ylab = b), NA)
  expect_error(bi_legend(pal = custom_pal_valid2, dim = 5, xlab = a, ylab = b), NA)
})

break_vals <- bi_class_breaks(stl_race_income, style = "quantile",
                              x = pctWhite, y = medInc, dim = 3,
                              dig_lab = c(x = 4, y = 5), split = TRUE)

test_that("accepts split breaks without error", {
  expect_error(bi_legend(pal = "GrPink", dim = 3, xlab = "ham", ylab = "bacon",
                         breaks = break_vals), NA)
})

break_vals <- bi_class_breaks(stl_race_income, style = "quantile",
                              x = pctWhite, y = medInc, dim = 3,
                              dig_lab = c(x = 4, y = 5), split = FALSE)

test_that("accepts break ranges without error", {
  expect_error(bi_legend(pal = "GrPink", dim = 3, xlab = "ham", ylab = "bacon",
                         breaks = break_vals), NA)
})

# test results ------------------------------------------------

result1 <- bi_legend(pal = "GrPink", dim = 2)
result2 <- bi_legend(pal = "GrPink", dim = 3)
result3 <- bi_legend(pal = custom_pal_valid2, dim = 5)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  expect_equal("ggplot" %in% class(result3), TRUE)
})


