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
  bi_scale_fill(pal = "DkViolet") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Violet (DkViolet) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet3.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, dim = 2, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet", dim = 2) +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Violet (DkViolet) Palette"
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet2.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Quantile Breaks",
    caption = "Breaks for percent white are 14.0% and 62.0% (range is 0-96.7%).\nBreaks for median income are $26,200 and $43,900\n(range is $10,500-$74,400)."
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet3-quantile.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, style = "equal", keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Equal Breaks",
    caption = "Breaks for percent white are 32.2% and 64.5% (range is 0-96.7%).\nBreaks for median income are $31,800 and $53,100\n(range is $10,500-$74,400)."
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet3-equal.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, style = "fisher", keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Fisher Breaks",
    caption = "Breaks for percent white are 25.9% and 65.0% (range is 0-96.7%).\nBreaks for median income are $31,600 and $49,900\n(range is $10,500-$74,400)."
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet3-fisher.png", height = 12.54, width = 8.505, dpi = 500)

# prep data
data <- stl_race_income
data <- bi_class(data, x = pctWhite, y = medInc, style = "jenks", keep_factors = TRUE)

# draw map
map <- ggplot() +
  geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet") +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Jenks Breaks",
    caption = "Breaks for percent white are 23.9% and 63.6% (range is 0-96.7%).\nBreaks for median income are $30,600 and $49,200\n(range is $10,500-$74,400)."
  ) +
  bi_theme()

# draw legend
legend <- bi_legend(pal = "DkViolet",
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
ggsave(filename = "inst/extdata/dkviolet3-jenks.png", height = 12.54, width = 8.505, dpi = 500)
