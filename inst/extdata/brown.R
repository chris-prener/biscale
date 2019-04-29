devtools::load_all()
library(cowplot)
library(ggplot2)
library(sf)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "Brown") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Brown (Brown) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "Brown",
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# print map
finalPlot

# save map
ggsave(filename = "inst/extdata/brown3.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, dim = 2, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "Brown", dim = 2) +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Brown (Brown) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "Brown",
                    dim = 2,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# print map
finalPlot

# save map
ggsave(filename = "inst/extdata/brown2.png", height = 12.54, width = 8.505, dpi = 500)
