devtools::load_all()
library(cowplot)
library(raster)

DSM_HARV <- raster("data-raw/NEON_HARV_dsmCrop.tif")
neon_harv <- as.data.frame(DSM_HARV, xy = TRUE)
neon_harv$ele <- neon_harv$NEON_HARV_dsmCrop
neon_harv$sim <- rnorm_pre(neon_harv$NEON_HARV_dsmCrop, mu = 10, sd = 2, r = 0.5, empirical = TRUE)

neon_harv <- subset(neon_harv, select = c(ele, sim, x, y))

save(DSM_HARV, file = "data/MA_harvard_raster.rda")

DSM_HARV_df <- bi_class(DSM_HARV_df, x = HARV_dsmCrop, y = test, style = "quantile")


map <- ggplot() +
  geom_raster(data = DSM_HARV_df , aes(x = x, y = y, fill = bi_class)) +
  bi_scale_fill(pal = "DkBlue") +
  coord_quickmap() +
  labs(
    title = "Harvard Forest",
    x = "",
    y = "",
    caption = "Data via NEON Spatio-temporal Teaching Data Subset"
  ) +
  bi_theme(base_size = 16) +
  theme(legend.position="none")

# draw legend
legend <- bi_legend(pal = "DkBlue",
                    xlab = "Higher Elevation ",
                    ylab = "Higher Siimulated Var ",
                    size = 9)

# combine map with legend
finalPlot <-  plot_grid(
  map, legend,
  rel_widths = c(1, .4),
  nrow = 1
)

ggsave(finalPlot, filename = "man/figures/raster.jpeg", dpi = 200,
       width = 6, height = 6, units = "in")

