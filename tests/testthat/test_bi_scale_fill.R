context("test bi_scale_fill function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")
data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2)

# load suggested dependencies ------------------------------------------------

library(ggplot2)
library(sf)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(dim = 2),
               "A palette must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.", fixed = TRUE)
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "ham", dim = 2),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_scale_fill's help file for a list of included palettes.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 5),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 2), NA)
})

# test custom palette ------------------------------------------------

# custom_pal <- bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80", val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B")

# test_that("correctly specified functions execute without error", {
#  expect_error(ggplot() +
#                 geom_sf(data = data, aes(color = bi_class), show.legend = FALSE) +
#                 bi_scale_fill(pal = custom_pal, dim = 2), NA)
# })
