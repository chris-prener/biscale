test_that("palettes scale changes point colour", {
  x <- pal_palette(pal = c("red", "green", "blue"))
  p1 <- ggplot2::ggplot(mtcars, ggplot2::aes(disp, mpg, colour = as.factor(cyl), fill = as.factor(cyl))) + ggplot2::geom_point()
  p2 <- p1 + scale_colour_palette_d(x)
  p3 <- p1 + scale_fill_palette_d(x)
  expect_false(any(ggplot2::layer_data(p1)$colour == ggplot2::layer_data(p2)$colour))
  expect_false(any(ggplot2::layer_data(p1)$fill == ggplot2::layer_data(p3)$fill))
})

test_that("binned scales only support continuous data", {
  x <- pal_colour(c("red", "green", "blue"))
  p1 <- ggplot2::ggplot(mtcars, ggplot2::aes(disp, mpg, colour = as.character(gear), fill = as.character(gear))) + ggplot2::geom_point()
  p2 <- p1 + scale_colour_palette_b(x)
  p3 <- p1 + scale_fill_palette_b(x)
  expect_snapshot_error(ggplot2::ggplot_build(p2))
  expect_snapshot_error(ggplot2::ggplot_build(p3))
})

test_that("only the first palette is used", {
  x <- pal_palette(pal1 = c("red", "green", "blue"), pal2 = c("blue", "green", "red"))
  y <- pal_colour(c("red", "green", "blue"))
  p1 <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = mpg, fill = mpg)) + ggplot2::geom_point()
  expect_warning(p1 + scale_colour_palette_c(x), "only the first")
  expect_warning(p1 + scale_fill_palette_c(x), "only the first")
})
