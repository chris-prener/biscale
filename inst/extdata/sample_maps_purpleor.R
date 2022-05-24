devtools::load_all()
library(cowplot)
library(ggplot2)
library(sf)

# prep data
data <- stl_race_income
data <- bi_class(data, style = "fisher", x = pctWhite, y = medInc, dim = 3, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "PurpleOr", dim = 3) +
  labs(
    title = "\n",
    subtitle = "Original"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "PurpleOr",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot4 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/PurpleOr_original.png", height = 12.54, width = 8.505, dpi = 300)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "PurpleOr", dim = 3, flip_axes = TRUE) +
  labs(
    title = "Race and Income in St. Louis, MO \nPurple Orange (PurpleOr) Palette",
    subtitle = "Flipped"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "PurpleOr",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10,
                    flip_axes = TRUE)

# combine map with legend
finalPlot3 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/PurpleOr_flipped.png", height = 12.54, width = 8.505, dpi = 300)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "PurpleOr", dim = 3, rotate_pal = TRUE) +
  labs(
    title = "\n",
    subtitle = "Rotated"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "PurpleOr",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10,
                    rotate_pal = TRUE)

# combine map with legend
finalPlot2 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/PurpleOr_rotated.png", height = 12.54, width = 8.505, dpi = 300)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "PurpleOr", dim = 3, flip_axes = TRUE, rotate_pal = TRUE) +
  labs(
    title = "Race and Income in St. Louis, MO \nPurple Orange (PurpleOr) Palette",
    subtitle = "Flipped and Rotated"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "PurpleOr",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10,
                    flip_axes = TRUE,
                    rotate_pal = TRUE)

# combine map with legend
finalPlot2 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/PurpleOr_flipped_rotated.png", height = 12.54, width = 8.505, dpi = 300)
