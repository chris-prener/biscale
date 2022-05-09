context("test bi_scale_color function")

# load suggested dependencies ------------------------------------------------

library(ggplot2)
library(sf)

# load test data ------------------------------------------------

load("data_central.rda")
pointData <- bi_class(pointData, x = totalsnow, y = Ratio1517, style = "quantile", dim = 3)
pointData_2 <- bi_class(pointData, x = totalsnow, y = Ratio1517, style = "quantile", dim = 2)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(dim = 3),
               "A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.", fixed = TRUE)
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(pal = "ham", dim = 2),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(pal = "Brown", dim = "ham"),
               "The 'dim' argument only accepts numeric values.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 3), NA)
})
