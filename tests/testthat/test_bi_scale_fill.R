context("test bi_scale_fill function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")
data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2)

# load dependencies ------------------------------------------------

library(ggplot2)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(dim = 2),
               "A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.", fixed = TRUE)
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "ham", dim = 2),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = "ham"),
               "The 'dim' argument only accepts numeric values.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 3, flip_axes = "ham"),
               "A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 3, rotate_pal = "ham"),
               "A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
})

# test inputs ------------------------------------------------

custom_pal_valid <- c(
  "1-1" = "#cabed0", # low x, low y
  "2-1" = "#ae3a4e", # high x, low y
  "1-2" = "#4885c1", # low x, high y
  "2-2" = "#3f2949" # high x, high y
)

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = custom_pal_valid, dim = 2), NA)
})

