context("test bi_pal manipulation")

# test correct transformations ----------------------------------------------

test_that("palette transformations work properly", {
  expect_equal(
    bi_pal('DkBlue', preview = FALSE),
    c(`3-3` = "#3B4994", `2-3` = "#8C62AA", `1-3` = "#BE64AC", `3-2` = "#5698B9",
      `2-2` = "#A5ADD3", `1-2` = "#DFB0D6", `3-1` = "#5AC8C8", `2-1` = "#ACE4E4",
      `1-1` = "#E8E8E8")
  )
  expect_equal(
    bi_pal('DkBlue', preview = FALSE, flip_axes = TRUE),
    c(`3-3` = "#3B4994", `2-3` = "#5698B9", `1-3` = "#5AC8C8", `3-2` = "#8C62AA",
      `2-2` = "#A5ADD3", `1-2` = "#ACE4E4", `3-1` = "#BE64AC", `2-1` = "#DFB0D6",
      `1-1` = "#E8E8E8")
  )
  expect_equal(
    bi_pal('DkBlue', preview = FALSE, rotate_pal = TRUE),
    c(`3-3` = "#E8E8E8", `2-3` = "#ACE4E4", `1-3` = "#5AC8C8", `3-2` = "#DFB0D6",
      `2-2` = "#A5ADD3", `1-2` = "#5698B9", `3-1` = "#BE64AC", `2-1` = "#8C62AA",
      `1-1` = "#3B4994")
  )
  expect_equal(
    bi_pal('DkBlue', preview = FALSE, flip_axes = TRUE, rotate_pal = TRUE),
    c(`3-3` = "#E8E8E8", `2-3` = "#DFB0D6", `1-3` = "#BE64AC", `3-2` = "#ACE4E4",
      `2-2` = "#A5ADD3", `1-2` = "#8C62AA", `3-1` = "#5AC8C8", `2-1` = "#5698B9",
      `1-1` = "#3B4994")
  )
})
