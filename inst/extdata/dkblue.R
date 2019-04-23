devtools::load_all()

library(dplyr)
library(ggplot2)
library(cowplot)
library(sf)

# load data
data <- stl_race_income

# create classes
data <- bi_class(data, x = pctWhite, y = medInc)

# apply palette
data_DkViolet <- bi_pal(data, pal = "DkBlue")

# plot
map <- ggplot() +
  geom_sf(data = data_DkViolet, aes(fill = bs_fill), color = "white", size = 0.1) +
  scale_fill_identity() +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue) Palette"
  ) +
  bi_theme()


# separate the groups used for plotting
bs <- bi_legend(pal = "DkBlue")

# draw legend
legend <- ggplot() +
  geom_tile(data = bs, mapping = aes(x = x, y = y, fill = bs_fill)) +
  scale_fill_identity() +
  labs(x = expression(paste("Higher % White ", ""%->%"")),
       y = expression(paste("Higher Income ", ""%->%""))) +
  bi_theme() +

  # make font small enough
  theme(axis.title = element_text(size = 10)) +

  # quadratic tiles
  coord_fixed()

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, .7, 0.2, 0.2)

finalPlot

ggsave(filename = "inst/extdata/dkblue.png", height = 12.54, width = 8.505, dpi = 500)
