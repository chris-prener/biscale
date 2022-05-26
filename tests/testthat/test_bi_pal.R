context("test bi_pal function")

# load test data ------------------------------------------------

data("stl_race_income", package = "biscale")

# test errors ------------------------------------------------

test_that("missing parameters trigger appropriate errors", {
  expect_error(bi_pal(dim = 3, preview = FALSE),
               "A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
})

test_that("incorrectly specified parameters trigger appropriate errors", {
  expect_error(bi_pal(pal = "ham", dim = 3, preview = FALSE),
               "The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
  expect_error(bi_pal(pal = "GrPink", dim = "ham", preview = FALSE),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_pal(pal = "GrPink", dim = 1, preview = FALSE),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  expect_error(bi_pal(pal = "GrPink", dim = 2.5, preview = FALSE),
               "An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
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
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE, flip_axes = "ham"),
               "A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE, rotate_pal = "ham"),
               "A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
})

# test inputs ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_error(bi_pal(pal = "GrPink", dim = 2, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 2, preview = FALSE,
                      flip_axes = FALSE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 2, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE,
                      flip_axes = FALSE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = "GrPink", dim = 3, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = "GrPink2", dim = 4, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = FALSE), NA)
  expect_error(bi_pal(pal = "GrPink2", dim = 4, preview = FALSE,
                      flip_axes = FALSE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = "GrPink2", dim = 4, preview = FALSE,
                      flip_axes = TRUE, rotate_pal = TRUE), NA)
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
  expect_error(bi_pal(pal = custom_pal_valid1, dim = 2, preview = FALSE), NA)
  expect_error(bi_pal(pal = custom_pal_valid1, dim = 2, preview = FALSE, flip_axes = TRUE), NA)
  expect_error(bi_pal(pal = custom_pal_valid1, dim = 2, preview = FALSE, rotate_pal = TRUE), NA)
  expect_error(bi_pal(pal = custom_pal_valid2, dim = 5, preview = FALSE), NA)
})

custom_pal_invalid1 <- c(
  "1-1" = "#cabed0", # low x, low y
  "2-1" = "#ae3a4e", # high x, low y
  "1-2" = "#4885c1", # low x, high y
  "2-2" = "3f2949" # high x, high y
)

custom_pal_invalid2 <- c(
  "1-1" = "#cabed0", # low x, low y
  "2-1" = "#ae3a4e", # high x, low y
  "1-2" = "#4885c1", # low x, high y
  "2-2" = "#3f" # high x, high y
)

custom_pal_invalid3 <- c(
  "1-1" = "#cabed0", # low x, low y
  "2-1" = "#ae3a4e", # high x, low y
  "1-2" = "#4885c1", # low x, high y
  "1-2" = "#3f2949" # high x, high y
)

custom_pal_invalid4 <- c(
  "1-1" = "#cabed0", # low x, low y
  "1-2" = "#4885c1", # low x, high y
  "2-1" = "#ae3a4e", # high x, low y
  "2-2" = "#3f2949" # high x, high y
)

test_that("custom palettes with common errors are caught", {
  expect_error(bi_pal(pal = custom_pal_invalid1, dim = 2, preview = FALSE),
               "Custom palette contains formatting errors - at least one entry does not begin with a hash.")
  expect_error(bi_pal(pal = custom_pal_invalid2, dim = 2, preview = FALSE),
               "Custom palette contains formatting errors - at least one entry is not the right length.")
  expect_error(bi_pal(pal = custom_pal_invalid3, dim = 2, preview = FALSE),
               "Custom palette contains formatting errors - at least one entry name is incorrect.")
  expect_error(bi_pal(pal = custom_pal_invalid4, dim = 2, preview = FALSE),
               "Custom palette contains formatting errors - at least one entry name is incorrect.")
  expect_error(bi_pal(pal = custom_pal_valid2, dim = 2, preview = FALSE),
               "The custom palette provided does not have the correct number of entries for the given dimensions.")
  expect_error(bi_pal(pal = custom_pal_valid2, dim = 5, preview = FALSE, flip_axes = TRUE),
               "Flipping axes for custom palettes is only available when 'dim' is 2, 3, or 4.")
  expect_error(bi_pal(pal = custom_pal_valid2, dim = 5, preview = FALSE, rotate_pal = TRUE),
               "Rotation for custom palettes is only available when 'dim' is 2, 3, or 4.")
})

# test results ------------------------------------------------

result1 <- bi_pal(pal = "GrPink", dim = 2)
result2 <- bi_pal(pal = "GrPink", dim = 3)
result3 <- bi_pal(pal = "GrPink", dim = 2, preview = FALSE)
result4 <- bi_pal(pal = "GrPink", dim = 3, preview = FALSE)

result5 <- bi_pal(pal = "GrPink2", dim = 4)
result6 <- bi_pal(pal = "GrPink2", dim = 4, preview = FALSE)

result7 <- bi_pal(pal = custom_pal_valid2, dim = 5, preview = TRUE)

test_that("correct classes of output are returned", {
  expect_equal("ggplot" %in% class(result1), TRUE)
  expect_equal("ggplot" %in% class(result2), TRUE)
  expect_equal("character" %in% class(result3), TRUE)
  expect_equal("character" %in% class(result4), TRUE)
  expect_equal("ggplot" %in% class(result5), TRUE)
  expect_equal("character" %in% class(result6), TRUE)
  expect_equal("ggplot" %in% class(result7), TRUE)
})
