devtools::load_all()

showtext::showtext_auto()

bi_legend(pal = "GrPink",
    dim = 3,
    size = 8,
    arrows = FALSE,
    labs = FALSE) +
  ggplot2::labs(
    x = "白人",
    y = "收入"
  )

bi_legend(pal = "GrPink",
          dim = 3,
          xlab = "白人",
          ylab = "白人",
          size = 12,
          arrows = TRUE,
          family = "")


library(ggplot2)

ggplot(data = stl_race_income, mapping = aes(x = pctWhite, y = medInc)) +
  geom_point() +
  labs(
    x = "白人",
    y = "收入"
  )
