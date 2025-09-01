# ------------------------------------------------------------------------------
# as_palette()

test_that("can convert palette -> palette", {
  x <- list(black = "black")
  expect_identical(as_palette(new_palette(x)), new_palette(x))
})

test_that("can convert list -> palette", {
  colour_palette <- pal_palette(black = "black")
  colour_list <- list(black = "black")
  expect_identical(as_palette(colour_list), colour_palette)
})

# ------------------------------------------------------------------------------
# as.list()

test_that("as.list() works", {
  colour_palette <- pal_palette(black = "black")
  colour_list <- list(black = pal_colour("black"))
  expect_identical(as.list(colour_palette), colour_list)
})

test_that("as.list() works with NA", {
  expect_identical(as.list(pal_palette(NA)), list(pal_colour(NA_character_)))
})

# ------------------------------------------------------------------------------
# as_tibble()

test_that("as_tibble() works", {
  colour_palette <- pal_palette(palette = "black")
  colour_tibble <- tibble(palette = "palette", colour = pal_colour("black"))
  expect_identical(as_tibble(colour_palette), colour_tibble)
})

# ------------------------------------------------------------------------------
# pal_palette()

test_that("zero-length input works", {
  expect_s3_class(pal_palette(), "palettes_palette")
  expect_length(pal_palette(), 0)
  expect_true(is_palette(pal_palette()))
})

# ------------------------------------------------------------------------------
# plot()

test_that("plotting works", {
  x <- pal_palette(pal = c("red", "blue"))
  y <- pal_palette(pal1 = c("red", "blue"), pal2 = c("yellow", "purple"))
  expect_s3_class(plot(x), "gg")
  expect_s3_class(plot(y), "gg")
})

# ------------------------------------------------------------------------------
# vec_c()

test_that("vec_c(x, y) is class palettes_palette", {
  expect_s3_class(vec_c(pal_palette(), pal_palette()), "palettes_palette")
})

test_that("vec_c(x, y) and vec_c(y, x) are type list", {
  expect_type(vec_c(pal_palette(), list()), "list")
  expect_type(vec_c(list(), pal_palette()), "list")
})

test_that("inputs that cannot be combined fail with an error", {
  expect_error(vec_c("a", pal_palette()), class = "vctrs_error_incompatible_type")
  expect_error(vec_c(1, pal_palette()), class = "vctrs_error_incompatible_type")
  expect_error(vec_c(TRUE, pal_palette()), class = "vctrs_error_incompatible_type")
})

# ------------------------------------------------------------------------------
# vec_is_list()

test_that("palette is considered a list in the vctrs sense", {
  expect_identical(vec_is_list(pal_palette("black")), TRUE)
})

# ------------------------------------------------------------------------------
# vec_ptype_abbr()

test_that("ptype abbreviation is correct", {
  expect_identical(vec_ptype_abbr(pal_palette()), "palette")
})

# ------------------------------------------------------------------------------
# vec_ptype_common()

test_that("ptype is correct", {
  expect_identical(
    vec_ptype(pal_palette("black")),
    vec_ptype(pal_palette(character()))
  )
})
