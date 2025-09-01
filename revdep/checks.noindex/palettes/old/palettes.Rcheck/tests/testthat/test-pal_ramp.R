test_that("colour vectors work", {
  x <- pal_colour(c("red", "blue"))
  expect_length(pal_ramp(x, n = 5), 5)
})

test_that("single colour vectors are repeated", {
  x <- pal_colour("#FF0000")
  expect_identical(unique(pal_ramp(x, n = 5)), x)
})

test_that("direction works", {
  x <- pal_colour(c("#FF0000", "#0000FF"))
  expect_identical(pal_ramp(x, direction = -1), rev(x))
})

test_that("colour palettes work", {
  x <- pal_palette(
    pal1 = c("red", "blue"),
    pal2 = c("purple", "yellow")
  )
  expect_length(pal_ramp(x, n = 5), 2)
})

test_that("objects that are not supported fail with an error", {
  x <- c("red", "blue")
  expect_error(pal_ramp(x), "no applicable method")
})
