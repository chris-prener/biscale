devtools::load_all()

library(dplyr)
library(ggplot2)
library(cowplot)
library(sf)

theme_map <- function(...) {
  theme_minimal() +
    theme(

      # text defaults
      text = element_text(family = "sans", color = "#000000"),

      # remove all axes
      axis.line = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks = element_blank(),

      # add a grid that blends into plot background
      panel.grid.major = element_line(color = "#ebebeb", size = 0.2),
      panel.grid.minor = element_blank(),

      # background colors
      plot.background = element_rect(fill = "#ffffff", color = NA),
      panel.background = element_rect(fill = "#ffffff", color = NA),
      legend.background = element_rect(fill = "#ffffff", color = NA),

      # borders and margins
      plot.margin = unit(c(.5, .5, .2, .5), "cm"),
      panel.border = element_blank(),
      panel.spacing = unit(c(-.1, 0.2, .2, 0.2), "cm"),

      # titles
      legend.title = element_text(size = 11),
      legend.text = element_text(size = 9, hjust = 0, color = "#222222"),
      plot.title = element_text(size = 20, hjust = 0.5, color = "#222222", face = "bold"),
      plot.subtitle = element_text(size = 16, hjust = 0.5, color = "#222222",
                                   margin = margin(b = -0.1, t = -0.1, l = 2, unit = "cm"),
                                   face = "bold", debug = FALSE),

      # captions
      plot.caption = element_text(size = 10, hjust = .5, margin = margin(t = 0.2, b = 0, unit = "cm"),
                                  color = "#939184"),
      ...
    )
}

# load data
data <- stl_race_income

# create classes
data <- bi_class(data, x = pctWhite, y = medInc)

# apply palette
data_DkViolet <- bi_pal(data, pal = "DkCyan")

# plot
map <- ggplot() +
  geom_sf(data = data_DkViolet, aes(fill = bs_fill), color = "white", size = 0.1) +
  scale_fill_identity() +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Cyan (DkCyan) Palette"
  ) +
  theme_map()


# separate the groups used for plotting
bs <- pal_dkcyan() %>%
  tidyr::separate(bs_class, into = c("x", "y"), sep = " - ") %>%
  dplyr::mutate(x = as.integer(x), y = as.integer(y))

# draw legend
legend <- ggplot() +
  geom_tile(data = bs, mapping = aes(x = x, y = y, fill = bs_fill)) +
  scale_fill_identity() +
  labs(x = expression(paste("Higher % White ", ""%->%"")),
       y = expression(paste("Higher Income ", ""%->%""))) +
  theme_map() +

  # make font small enough
  theme(axis.title = element_text(size = 10)) +

  # quadratic tiles
  coord_fixed()

# combine map with legend
finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, .7, 0.2, 0.2)

finalPlot

ggsave(filename = "inst/extdata/dkcyan.png", height = 12.54, width = 8.505, dpi = 500)
