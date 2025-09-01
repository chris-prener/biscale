# ------------------------------------------------------------------------------
# as_colour()

test_that("can convert colour -> colour", {
  expect_identical(as_colour(new_colour("black")), new_colour("black"))
})

test_that("can convert palette -> colour", {
  colour_palette <- pal_palette(black = "black")
  expect_identical(as_colour(colour_palette), new_colour("black"))
})

# ------------------------------------------------------------------------------
# as.character()

test_that("as.character() works", {
  x <- pal_colour("black")
  expect_identical(as.character(x), "black")
})

test_that("as.character() works with NA", {
  expect_identical(as.character(pal_colour(NA)), NA_character_)
})

# ------------------------------------------------------------------------------
# as_tibble()

test_that("as_tibble() works", {
  colour_vector <- pal_colour("black")
  colour_tibble <- tibble(colour = pal_colour("black"))
  expect_identical(as_tibble(colour_vector), colour_tibble)
})

# ------------------------------------------------------------------------------
# format()

test_that("format - can format() a colour", {
  local_palettes_options()
  expect_snapshot(format(pal_colour("black")))
})

# ------------------------------------------------------------------------------
# pal_colour()

test_that("zero-length input works", {
  expect_s3_class(pal_colour(), "palettes_colour")
  expect_length(pal_colour(), 0)
  expect_true(is_colour(pal_colour()))
})

test_that("hexadecimal string input works", {
  x <- pal_colour("#FFFFFF")
  x_alpha <- pal_colour("#FFFFFFFF")
  expect_true(is_colour(pal_colour(x)))
  expect_true(is_colour(pal_colour(x_alpha)))
})

test_that("colour name input works", {
  x <- pal_colour("red")
  expect_true(is_colour(pal_colour(x)))
})

test_that("invalid values fail with an error", {
  # No "#"
  expect_error(pal_colour("a"), class = "rlang_error")
  # Wrong number of values
  expect_error(pal_colour("#a"), class = "rlang_error")
  expect_error(pal_colour("#ab"), class = "rlang_error")
  expect_error(pal_colour("#abc"), class = "rlang_error")
  expect_error(pal_colour("#abcd"), class = "rlang_error")
  expect_error(pal_colour("#abcde"), class = "rlang_error")
  expect_error(pal_colour("#abcdefa"), class = "rlang_error")
  expect_error(pal_colour("#abcdefabc"), class = "rlang_error")
})

# ------------------------------------------------------------------------------
# pillar_shaft()

cli::test_that_cli("pillar shaft works", {
  local_palettes_options()
  x <- as_tibble(pal_colour("red"))
  expect_snapshot(pillar_shaft(x$colour))
})

# ------------------------------------------------------------------------------
# plot()

test_that("plotting works", {
  x <- pal_colour(c("red", "blue"))
  expect_s3_class(plot(x), "gg")
})

# ------------------------------------------------------------------------------
# print() / obj_print_data() / obj_print_footer()

cli::test_that_cli("normal print method works", {
  local_palettes_options()
  x <- pal_colour("red")
  expect_snapshot(x)
})

test_that("zero-length normal print method works", {
  x <- pal_colour()
  expect_snapshot(x)
})

cli::test_that_cli("palettes.print_symbol option works", {
  local_palettes_options(print_symbol = "square")
  x <- pal_colour("red")
  expect_snapshot(x)
})

test_that("palettes.print_symbol works with FALSE", {
  local_palettes_options(print_symbol = FALSE)
  x <- pal_colour("red")
  expect_snapshot(x)
})

cli::test_that_cli("palettes.print_hex option works", {
  local_palettes_options(print_hex = FALSE)
  x <- pal_colour("red")
  expect_snapshot(x)
})

test_that("palettes.print_alpha option works", {
  local_palettes_options(print_alpha = TRUE)
  x <- pal_colour(c("#88A0DCF0", "#381A61CC", "#7C4B73"))
  expect_snapshot(x)
})

test_that("palettes.print_sep option works", {
  local_palettes_options(print_sep = ", ")
  x <- pal_colour(c("red", "blue"))
  expect_snapshot(x)
})

test_that("palettes.print_width option works", {
  local_palettes_options(print_width = 2)
  x <- pal_colour(c("red", "blue", "green"))
  expect_snapshot(x)
})

test_that("palettes.print_index option works", {
  local_palettes_options(print_index = TRUE)
  x <- pal_colour(c("red", "blue", "green"))
  expect_snapshot(x)
})

test_that("disabling formatting works", {
  local_palettes_options(print_symbol = FALSE, print_hex = FALSE)
  x <- pal_colour(c("red", "#ff0000", "#FF0000"))
  expect_snapshot(x)
})

# ------------------------------------------------------------------------------
# vec_c()

test_that("vec_c(x, y) is class palettes_colour", {
  expect_s3_class(vec_c(pal_colour(), pal_colour()), "palettes_colour")
})

test_that("vec_c(x, y) and vec_c(y, x) are type character", {
  expect_type(vec_c(pal_colour(), character()), "character")
  expect_type(vec_c(character(), pal_colour()), "character")
})

test_that("inputs that cannot be combined fail with an error", {
  expect_error(vec_c(1, pal_colour()), class = "vctrs_error_incompatible_type")
  expect_error(vec_c(TRUE, pal_colour()), class = "vctrs_error_incompatible_type")
})

# ------------------------------------------------------------------------------
# vec_ptype()

test_that("ptype is correct", {
  expect_identical(vec_ptype(pal_colour("black")), pal_colour(character()))
})

# ------------------------------------------------------------------------------
# vec_ptype_abbr()

test_that("ptype abbreviation is correct", {
  expect_identical(vec_ptype_abbr(pal_colour()), "colour")
})

# ------------------------------------------------------------------------------
# vec_arith()

test_that("zero-length input works", {
  x <- pal_colour("black")
  expect_identical(x + pal_colour(character()), pal_colour(character()))
  expect_length(x + pal_colour(character()), 0)
  expect_true(is_colour(x + pal_colour(character())))
})

test_that("operators that are not supported fail with an error", {
  x <- pal_colour("black")
  expect_error(x - x, class = "vctrs_error_incompatible_op")
})

# ------------------------------------------------------------------------------
# vec_math()

test_that("sum works", {
  x <- pal_colour(c("red", "blue"))
  expect_identical(sum(x), x[1] + x[2])
})

test_that("cumsum works", {
  x <- pal_colour(c("red", "blue"))
  expect_length(cumsum(x), 2)
  expect_identical(cumsum(x)[2], sum(x))
})

test_that("functions that are not supported fail with an error", {
  x <- pal_colour(c("red", "blue"))
  expect_error(sqrt(x), "not implemented")
})
