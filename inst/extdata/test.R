devtools::load_all()
library(cowplot)
library(ggplot2)
library(sf)

data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc)

map <- ggplot() +
  geom_sf(data = data, aes(fill = bs_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "GrPink") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue) Palette"
  ) +
  bi_theme()

map

legend <- bi_legend(pal = "GrPink",
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 8)

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, .7, 0.2, 0.2)

# print map
finalPlot
