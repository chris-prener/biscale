# Create Images for Palettes
devtools::load_all()
library(ggplot2)

pals <- gridExtra::grid.arrange(ncol = 2,
  bi_pal("Brown", dim = 2) + labs(subtitle = "Brown"),
  bi_pal("Brown", dim = 3) + labs(subtitle = ""),
  bi_pal("DkBlue", dim = 2) + labs(subtitle = "DkBlue"),
  bi_pal("DkBlue", dim = 3) + labs(subtitle = ""),
  bi_pal("DkCyan", dim = 2) + labs(subtitle = "DkCyan"),
  bi_pal("DkCyan", dim = 3) + labs(subtitle = ""),
  bi_pal("DkViolet", dim = 2) + labs(subtitle = "DkViolet"),
  bi_pal("DkViolet", dim = 3) + labs(subtitle = ""),
  bi_pal("GrPink", dim = 2) + labs(subtitle = "GrPink"),
  bi_pal("GrPink", dim = 3) + labs(subtitle = "")
)

ggsave(pals, filename = "man/figures/pals_legancy.jpeg", dpi = 200,
       width = 4, height = 6, units = "in")

pals <- gridExtra::grid.arrange(ncol = 3,
  bi_pal("Bluegill", dim = 2) + labs(subtitle = "Bluegill"),
  bi_pal("Bluegill", dim = 3) + labs(subtitle = ""),
  bi_pal("Bluegill", dim = 4) + labs(subtitle = ""),
  bi_pal("BlueGold", dim = 2) + labs(subtitle = "BlueGold"),
  bi_pal("BlueGold", dim = 3) + labs(subtitle = ""),
  bi_pal("BlueGold", dim = 4) + labs(subtitle = ""),
  bi_pal("BlueOr", dim = 2) + labs(subtitle = "BlueOr"),
  bi_pal("BlueOr", dim = 3) + labs(subtitle = ""),
  bi_pal("BlueOr", dim = 4) + labs(subtitle = ""),
  bi_pal("BlueYl", dim = 2) + labs(subtitle = "BlueYl"),
  bi_pal("BlueYl", dim = 3) + labs(subtitle = ""),
  bi_pal("BlueYl", dim = 4) + labs(subtitle = ""),
  bi_pal("Brown2", dim = 2) + labs(subtitle = "Brown2"),
  bi_pal("Brown2", dim = 3) + labs(subtitle = ""),
  bi_pal("Brown2", dim = 4) + labs(subtitle = ""),
  bi_pal("DkBlue2", dim = 2) + labs(subtitle = "DkBlue2"),
  bi_pal("DkBlue2", dim = 3) + labs(subtitle = ""),
  bi_pal("DkBlue2", dim = 4) + labs(subtitle = ""),
  bi_pal("DkCyan2", dim = 2) + labs(subtitle = "DkCyan2"),
  bi_pal("DkCyan2", dim = 3) + labs(subtitle = ""),
  bi_pal("DkCyan2", dim = 4) + labs(subtitle = ""),
  bi_pal("DkViolet2", dim = 2) + labs(subtitle = "DkViolet2"),
  bi_pal("DkViolet2", dim = 3) + labs(subtitle = ""),
  bi_pal("DkViolet2", dim = 4) + labs(subtitle = ""),
  bi_pal("GrPink2", dim = 2) + labs(subtitle = "GrPink2"),
  bi_pal("GrPink2", dim = 3) + labs(subtitle = ""),
  bi_pal("GrPink2", dim = 4) + labs(subtitle = ""),
  bi_pal("PinkGrn", dim = 2) + labs(subtitle = "PinkGrn"),
  bi_pal("PinkGrn", dim = 3) + labs(subtitle = ""),
  bi_pal("PinkGrn", dim = 4) + labs(subtitle = ""),
  bi_pal("PurpleGrn", dim = 2) + labs(subtitle = "PurpleGrn"),
  bi_pal("PurpleGrn", dim = 3) + labs(subtitle = ""),
  bi_pal("PurpleGrn", dim = 4) + labs(subtitle = ""),
  bi_pal("PurpleOr", dim = 2) + labs(subtitle = "PurpleOr"),
  bi_pal("PurpleOr", dim = 3) + labs(subtitle = ""),
  bi_pal("PurpleOr", dim = 4) + labs(subtitle = "")
)

ggsave(pals, filename = "man/figures/pals_primary.jpeg", dpi = 200,
       width = 6, height = 16, units = "in")

pals <- gridExtra::grid.arrange(ncol = 2,
  bi_pal(pal = "PurpleOr", dim = 3) + labs(subtitle = "Original"),
  bi_pal(pal = "PurpleOr", dim = 3, flip_axes = TRUE) + labs(subtitle = "Flipped"),
  bi_pal(pal = "PurpleOr", dim = 3, rotate_pal = TRUE) + labs(subtitle = "Rotated"),
  bi_pal(pal = "PurpleOr", dim = 3, flip_axes = TRUE, rotate_pal = TRUE) + labs(subtitle = "Flipped and Rotated"))

ggsave(pals, filename = "man/figures/manipulated_pal.jpeg", dpi = 200,
       width = 6, height = 3, units = "in")
