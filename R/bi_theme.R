#' Basic Theme for Bivariate Mapping
#'
#' @description A theme for creating a simple, clean bivariate map using
#'     \code{\link{ggplot2}}.
#'
#' @param base_family A character string representing the font family to be used
#'     in the map.
#' @param base_size A number representing the base size used in the map.
#' @param bg_color A character string containing the hex value for the desired
#'     color of the map's background.
#' @param font_color A character string containing the hex value for the desired
#'     color of the map's text.
#' @param ... Arguments to pass on to \code{ggplot2}'s \code{theme} function
#'
#' @examples
#' # load suggested dependencies
#' library(ggplot2)
#' library(sf)
#'
#' # add breaks, 3x3
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3)
#'
#' # create map
#' ggplot() +
#'   geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
#'   bi_scale_fill(pal = "GrPink", dim = 3) +
#'   bi_theme()
#'
#' @export
bi_theme <- function(base_family = "sans", base_size = 24, bg_color = "#ffffff", font_color = "#000000", ...) {

  ggplot2::theme_minimal(base_family = base_family, base_size = base_size) +
    ggplot2::theme(

      # text defaults
      text = ggplot2::element_text(color = font_color),

      # remove all axes
      axis.line = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),

      # add a grid that blends into plot background
      panel.grid.major = ggplot2::element_line(color = bg_color, size = 0.2),
      panel.grid.minor = ggplot2::element_blank(),

      # background colors
      plot.background = ggplot2::element_rect(fill = bg_color, color = NA),
      panel.background = ggplot2::element_rect(fill = bg_color, color = NA),
      legend.background = ggplot2::element_rect(fill = bg_color, color = NA),

      # borders and margins
      plot.margin = ggplot2::unit(c(.5, .5, .2, .5), "cm"),
      panel.border = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(c(-.1, 0.2, .2, 0.2), "cm"),

      # titles
      plot.title = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, color = font_color, face = "bold"),
      plot.subtitle = ggplot2::element_text(hjust = 0.5, color = font_color,
                                   margin = ggplot2::margin(b = -0.1, t = -0.1, l = 2, unit = "cm"),
                                   face = "bold", debug = FALSE),
      legend.title = ggplot2::element_text(color = font_color),
      legend.text = ggplot2::element_text(hjust = 0, color = font_color),

      # captions
      plot.caption = ggplot2::element_text(size = ggplot2::rel(.6), hjust = .5,
                                           margin = ggplot2::margin(t = 0.2, b = 0, unit = "cm"),
                                           color = font_color),
      ...
    )

}

bi_theme_legend <- function(base_family = "sans", base_size = 24, bg_color = "#ffffff", font_color = "#000000", ...) {

  ggplot2::theme_minimal(base_family = base_family, base_size = base_size) +
    ggplot2::theme(

      # text defaults
      text = ggplot2::element_text(color = font_color),

      # axes
      axis.text = ggplot2::element_text(size = ggplot2::rel(.8)),
      axis.ticks = ggplot2::element_line(),

      # add a grid that blends into plot background
      panel.grid.major = ggplot2::element_line(color = bg_color, size = 0.2),
      panel.grid.minor = ggplot2::element_blank(),

      # background colors
      plot.background = ggplot2::element_rect(fill = bg_color, color = NA),
      panel.background = ggplot2::element_rect(fill = bg_color, color = NA),
      legend.background = ggplot2::element_rect(fill = bg_color, color = NA),

      # borders and margins
      plot.margin = ggplot2::unit(c(.5, .5, .2, .5), "cm"),
      panel.border = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(c(-.1, 0.2, .2, 0.2), "cm"),

      # titles
      plot.title = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, color = font_color, face = "bold"),
      plot.subtitle = ggplot2::element_text(hjust = 0.5, color = font_color,
                                            margin = ggplot2::margin(b = -0.1, t = -0.1, l = 2, unit = "cm"),
                                            face = "bold", debug = FALSE),
      legend.title = ggplot2::element_text(color = font_color),
      legend.text = ggplot2::element_text(hjust = 0, color = font_color),

      # captions
      plot.caption = ggplot2::element_text(size = ggplot2::rel(.6), hjust = .5,
                                           margin = ggplot2::margin(t = 0.2, b = 0, unit = "cm"),
                                           color = font_color),
      ...
    )

}
