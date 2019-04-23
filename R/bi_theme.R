#' Basic Theme for Bivariate Mapping
#'
#' @description A theme for creating a simple, clean bivariate map.
#'
#' @param ... Arguments to pass on to \code{ggplot2}'s \code{theme} function
#'
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_minimal
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 element_rect
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 unit
#' @importFrom ggplot2 margin
#'
#' @export
bi_theme <- function(...) {
  ggplot2::theme_minimal() +
    ggplot2::theme(

      # text defaults
      text = ggplot2::element_text(family = "sans", color = "#000000"),

      # remove all axes
      axis.line = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),

      # add a grid that blends into plot background
      panel.grid.major = ggplot2::element_line(color = "#ebebeb", size = 0.2),
      panel.grid.minor = ggplot2::element_blank(),

      # background colors
      plot.background = ggplot2::element_rect(fill = "#ffffff", color = NA),
      panel.background = ggplot2::element_rect(fill = "#ffffff", color = NA),
      legend.background = ggplot2::element_rect(fill = "#ffffff", color = NA),

      # borders and margins
      plot.margin = ggplot2::unit(c(.5, .5, .2, .5), "cm"),
      panel.border = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(c(-.1, 0.2, .2, 0.2), "cm"),

      # titles
      legend.title = ggplot2::element_text(size = 11),
      legend.text = ggplot2::element_text(size = 9, hjust = 0, color = "#222222"),
      plot.title = ggplot2::element_text(size = 20, hjust = 0.5, color = "#222222", face = "bold"),
      plot.subtitle = ggplot2::element_text(size = 16, hjust = 0.5, color = "#222222",
                                   margin = ggplot2::margin(b = -0.1, t = -0.1, l = 2, unit = "cm"),
                                   face = "bold", debug = FALSE),

      # captions
      plot.caption = ggplot2::element_text(size = 10, hjust = .5, margin = ggplot2::margin(t = 0.2, b = 0, unit = "cm"),
                                  color = "#939184"),
      ...
    )
}
