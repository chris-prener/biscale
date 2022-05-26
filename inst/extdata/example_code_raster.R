devtools::load_all()
library(cowplot)
library(raster)
library(faux)

DSM_HARV <- raster("https://github.com/slu-openGIS/test/raw/main/NEON_HARV_dsmCrop.tif")
neon_harv <- as.data.frame(DSM_HARV, xy = TRUE)
neon_harv$ele <- neon_harv$NEON_HARV_dsmCrop
neon_harv$sim <- rnorm_pre(neon_harv$y, mu = 10, sd = 2, r = 0.7, empirical = TRUE)

neon_harv <- subset(neon_harv, select = c(ele, sim, x, y))

save(neon_harv, file = "data-raw/sample_raster.rda")
readr::write_csv(neon_harv, file = "data-raw/neon_harv.csv")

neon_harv <- bi_class(neon_harv, x = ele, y = sim, style = "quantile")


map <- ggplot() +
  geom_raster(data = neon_harv , aes(x = x, y = y, fill = bi_class)) +
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
                    ylab = "Higher Simulated Var ",
                    size = 6)

# combine map with legend
finalPlot <-  plot_grid(
  map, legend,
  rel_widths = c(1, .4),
  nrow = 1
)

ggsave(finalPlot, filename = "man/figures/raster.jpeg", dpi = 200,
       width = 6, height = 5, units = "in")

