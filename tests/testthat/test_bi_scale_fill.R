context("test bi_scale_fill function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")
data <- bi_class(stl_race_income, x = pctWhite, y = medInc, dim = 2)

# load suggested dependencies ------------------------------------------------

library(ggplot2)
library(sf)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(dim = 2),
               "A palette must be specified for the 'pal' argument. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "ham", dim = 2),
               "The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 5),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkBlue", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkBlue", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkCyan", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkCyan", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkViolet", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "DkViolet", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 2), NA)
  expect_error(ggplot() +
                 geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 2), NA)
})
