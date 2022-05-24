devtools::load_all()
library(cowplot)
library(ggplot2)
library(sf)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, style = "quantile", keep_factors = TRUE)

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

# create palette
custom_pal3 <- c(
  "1-1" = "#d3d3d3", # low x, low y
  "2-1" = "#ba8890",
  "3-1" = "#9e3547", # high x, low y
  "1-2" = "#8aa6c2",
  "2-2" = "#7a6b84", # medium x, medium y
  "3-2" = "#682a41",
  "1-3" = "#4279b0", # low x, high y
  "2-3" = "#3a4e78",
  "3-3" = "#311e3b" # high x, high y
)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = custom_pal3) +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = custom_pal3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 12)

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.23, 0.66, 0.22, 0.22)

# print map
finalPlot

## example 1
labels1 <- bi_class_breaks(data, style = "quantile", x = pctWhite, y = medInc,
                           dim = 3, dig_lab = c(2, 5), split = FALSE)

## example 2
breaks2 <- bi_class_breaks(data, style = "quantile", x = pctWhite, y = medInc,
                           dim = 3, dig_lab = c(x = 2, y = 5), split = TRUE)

legend1 <- bi_legend(pal = "PurpleGrn",
                     xlab = "% White",
                     ylab = "Income",
                    size = 12,
                    breaks = labels1,
                    arrows = FALSE) +
  labs (subtitle = "Legend with Labels")

ggsave(legend1, filename = "man/figures/legend1.jpeg", dpi = 200,
       width = 6, height = 3, units = "in")

legend2 <- bi_legend(pal = "PurpleGrn",
                     xlab = "% White",
                     ylab = "Income",
                     size = 12,
                     breaks = breaks2,
                     arrows = FALSE) +
  labs (subtitle = "Legend with Breaks")

ggsave(legend2, filename = "man/figures/legend2.jpeg", dpi = 200,
       width = 6, height = 3, units = "in")

legend3 <- bi_legend(pal = "PurpleGrn",
                     xlab = "Higher % White",
                     ylab = "Higher Income",
                     size = 12) +
  labs (subtitle = "Legend with Default Configuration")

ggsave(legend3, filename = "man/figures/legend3.jpeg", dpi = 200,
       width = 6, height = 3, units = "in")

legend4 <- gridExtra::grid.arrange(ncol = 3,
                        bi_legend("BlueGold") + labs(subtitle = "Original"),
                        bi_legend("BlueGold", pad_width = 1.5) + labs(subtitle = "With Padding"),
                        bi_legend("BlueGold", pad_width = 1.5, pad_color = '#000000') + labs(subtitle = "With Colored Padding")
)

ggsave(legend4, filename = "man/figures/legend_padding.jpeg", dpi = 200,
       width = 6, height = 3, units = "in")
