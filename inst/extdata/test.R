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
  bi_scale_fill(pal = "DkBlue") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkBlue",
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 12)

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.23, 0.66, 0.22, 0.22)

# print map
finalPlot

# save map
ggsave(filename = "inst/extdata/dkblue.png", height = 12.54, width = 8.505, dpi = 500)

