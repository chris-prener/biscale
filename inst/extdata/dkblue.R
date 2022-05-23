devtools::load_all()
library(cowplot)
library(ggplot2)
library(sf)

# prep data
data <- stl_race_income
data <- bi_class(data, style = "quantile", x = pctWhite, y = medInc, dim = 4, keep_factors = TRUE)

x <- bi_class_breaks(data, style = "quantile", x = pctWhite, y = medInc, dim = 4,
                dig_lab = c(4,5), split = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkBlue2", dim = 4) +
  labs(
    title = "",
    subtitle = ""
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkBlue2",
                    dim = 4,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot4 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/dkblue4.png", height = 12.54, width = 8.505, dpi = 300)

# prep data
data <- stl_race_income
data <- bi_class(data, style = "quantile", x = pctWhite, y = medInc, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkBlue2") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue2) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkBlue2",
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot3 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/dkblue3.png", height = 12.54, width = 8.505, dpi = 300)

# prep data
data <- stl_race_income
data <- bi_class(data, style = "quantile", x = pctWhite, y = medInc, dim = 2, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkBlue2", dim = 2) +
  labs(
    title = "",
    subtitle = ""
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkBlue2",
                    dim = 2,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 10)

# combine map with legend
finalPlot2 <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, 0.7, 0.22, 0.22)

# save map
ggsave(filename = "inst/extdata/dkblue2.png", height = 12.54, width = 8.505, dpi = 300)
