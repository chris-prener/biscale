devtools::load_all()

legend <- bi_legend(pal = "GrPink",
                    dim = 3,
                    xlab = "Higher % 白人", # Here are some chinese characters.
                    ylab = "Higher 收入 ", # Here are some chinese characters.
                    size = 8,
                    arrows = FALSE)

showtext::showtext_auto()

library(ggplot2)

ggplot(data = stl_race_income, mapping = aes(x = pctWhite, y = medInc)) +
  geom_point() +
  labs(
    x = "白人",
    y = "收入"
  )
