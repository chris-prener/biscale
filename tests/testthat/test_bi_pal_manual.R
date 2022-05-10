context("test bi_pal_manual function")

# test custom palette ------------------------------------------------

test_that("correctly specified functions execute without error", {
  expect_warning(bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80", val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B"),
                 "The 'bi_pal_manual' function will be removed in the next version of biscale. See the Advanced Options vignette for a replacement workflow.")
  expect_warning(bi_pal_manual(val_1_1 = "#ffffff", val_1_2 = "#ffffff", val_1_3 = "#ffffff", val_2_1 = "#ffffff", val_2_2 = "#ffffff", val_2_3 = "#ffffff", val_3_1 = "#ffffff", val_3_2 = "#ffffff", val_3_3 = "#ffffff"),
                 "The 'bi_pal_manual' function will be removed in the next version of biscale. See the Advanced Options vignette for a replacement workflow.")
})
