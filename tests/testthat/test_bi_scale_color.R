context("test bi_scale_color function")

# load suggested dependencies ------------------------------------------------

library(ggplot2)
library(sf)

# load test data ------------------------------------------------

load("data_central.rda")
pointData <- bi_class(pointData, x = totalsnow, y = Ratio1517, dim = 3)
pointData_2 <- bi_class(pointData, x = totalsnow, y = Ratio1517, dim = 2)

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(dim = 3),
               "A palette must be specified for the 'pal' argument. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', or 'GrPink'.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(pal = "ham", dim = 2),
               "The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', or 'GrPink'.")
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(pal = "Brown", dim = 5),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_color(pal = "Brown", dim = "ham"),
               "The 'dim' argument only accepts the numeric values '2' or '3'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "Brown", dim = 3), NA)
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "DkBlue", dim = 3), NA)
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "DkCyan", dim = 3), NA)
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "DkViolet", dim = 3), NA)
  expect_error(ggplot() +
                 geom_sf(data = pointData, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = "GrPink", dim = 3), NA)
})

# test custom palette ------------------------------------------------

custom_pal <- bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80", val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B")

test_that("correctly specified functions execute without error", {
  expect_error(ggplot() +
                 geom_sf(data = pointData_2, aes(color = bi_class), show.legend = FALSE) +
                 bi_scale_fill(pal = custom_pal, dim = 2), NA)
})
