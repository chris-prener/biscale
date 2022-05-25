#' Create Object for Drawing Legend
#'
#' @description Creates a \code{ggplot} object containing a legend that is
#'     specific to bivariate mapping.
#'
#' @usage bi_legend(pal, dim = 3, xlab, ylab, size = 10, flip_axes = FALSE,
#'     rotate_pal = FALSE, pad_width = NA, pad_color = "#ffffff",
#'     breaks = NULL, arrows = TRUE)
#'
#' @param pal A palette name or a vector containing a custom palette. See
#'     the help file for \code{\link{bi_pal}} for complete list of built-in palette
#'     names. If you are providing a custom palette, it must follow the formatting
#'     described in the 'Advanced Options' vignette.
#' @param dim The dimensions of the palette. To use the built-in palettes,
#'     this value must be either \code{2}, \code{3}, or \code{4}. A value of
#'     \code{3}, for example, would be used to create a three-by-three bivariate
#'     map with a total of 9 classes.
#'
#'     If you are using a custom palette, this value may be larger (though these
#'     maps can be very hard to interpret). See the 'Advanced Options' vignette
#'     for details on the relationship between \code{dim} values and palette size.
#' @param xlab Text for desired x axis label on legend
#' @param ylab Text for desired y axis label on legend
#' @param size A numeric scalar; size of axis labels
#' @param flip_axes A logical scalar; if \code{TRUE}, the axes of the palette
#'     will be flipped. If \code{FALSE} (default), the palette will be displayed
#'     on its original axes. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of flipping axes.
#' @param rotate_pal A logical scalar; if \code{TRUE}, the palette will be
#'     rotated 180 degrees. If \code{FALSE} (default), the palette will be
#'     displayed in its original orientation. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of palette rotation.
#' @param pad_width An optional numeric scalar; controls the width of padding
#'     between tiles in the legend
#' @param pad_color An optional character scalar; controls the color of padding
#'     between tiles in the legend
#' @param breaks An optional list created by \code{bi_class_breaks}. Depending
#'     on the options selected when making the list, labels will placed
#'     showing the corresponding range of values for each axis or, if
#'     \code{split = TRUE}, showing the individual breaks.
#' @param arrows A logical scalar; if \code{TRUE} (default), directional arrows
#'     will be added to both the x and y axes of the legend. If you want to
#'     suppress these arrows, especially if you are supplying breaks to create
#'     a more detailed legend, this parameter can be set of \code{FALSE}.
#'
#' @return A \code{ggplot} object with a bivariate legend.
#'
#' @seealso \code{\link{bi_pal}}
#'
#' @examples
#' # sample 3x3 legend
#' legend <- bi_legend(pal = "GrPink",
#'                     dim = 3,
#'                     xlab = "Higher % White ",
#'                     ylab = "Higher Income ",
#'                     size = 16)
#'
#' # print legend
#' legend
#'
#' # sample 3x3 legend with breaks
#' ## create vector of breaks
#' break_vals <- bi_class_breaks(stl_race_income, style = "quantile",
#'     x = pctWhite, y = medInc, dim = 3, dig_lab = c(x = 4, y = 5),
#'     split = TRUE)
#'
#' ## create legend
#' legend <- bi_legend(pal = "GrPink",
#'                     dim = 3,
#'                     xlab = "Higher % White ",
#'                     ylab = "Higher Income ",
#'                     size = 16,
#'                     breaks = break_vals,
#'                     arrows = FALSE)
#'
#' # print legend
#' legend
#'
#' @export
bi_legend <- function(pal, dim = 3, xlab, ylab, size = 10, flip_axes = FALSE,
                      rotate_pal = FALSE, pad_width = NA, pad_color = '#ffffff',
                      breaks = NULL, arrows = TRUE){

  # global binding
  bi_class = bi_fill = x = y = NULL

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
  }

  if (is.logical(arrows) == FALSE){
    stop("A logical scalar must be supplied for 'arrows'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (missing(xlab) == TRUE){
    xlab <- "x var "
  }

  if (is.character(xlab) == FALSE){
    stop("The 'xlab' argument must be a character string.")
  }

  if (missing(ylab) == TRUE){
    ylab <- "y var "
  }

  if (is.character(ylab) == FALSE){
    stop("The 'ylab' argument must be a character string.")
  }

  if (is.numeric(size) == FALSE){
    stop("The 'size' argument must be a numeric value.")
  }

  # validate palette
  pal_validate(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  # create palette
  if (length(pal) == 1){
    leg <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)
  } else if (length(pal) > 1){
    leg <- pal
  }

  # build legend
  out <- bi_legend_build(leg = leg, dim = dim, xlab = xlab, ylab = ylab, size = size,
                         pad_width = pad_width, pad_color = pad_color, breaks = breaks, arrows = arrows)

  # return output
  return(out)

}

bi_legend_build <- function(leg, dim, xlab, ylab, size, pad_width, pad_color, breaks, arrows){

  # global bindings
  bi_fill = x = y = NULL

  # nse
  xQN <- as.name(xlab)
  yQN <- as.name(ylab)

  # create tibble for plotting
  leg <- data.frame(
    bi_class = names(leg),
    bi_fill = leg
  )

  leg$x <- as.integer(substr(leg$bi_class, 1, 1))
  leg$y <- as.integer(substr(leg$bi_class, 3, 3))

  # create ggplot2 legend object
  ## initial build
  legend <- ggplot2::ggplot() +
    ggplot2::geom_tile(data = leg, mapping = ggplot2::aes(x = x, y = y, fill = bi_fill), lwd = pad_width, col = pad_color) +
    ggplot2::scale_fill_identity()

  ## optionally add breaks
  if (is.null(breaks) == FALSE){

    breaks_include <- TRUE

    if (length(breaks$bi_x) == dim){

      breaks_seq <- seq(from = 1, to = dim, by = 1)

    } else if (length(breaks$bi_x) == dim+1){

      breaks_seq <- seq(from = 0.5, to = dim+0.5, by = 1)

    }

    legend <- legend +
      ggplot2::scale_x_continuous(
        breaks = breaks_seq,
        labels = breaks$bi_x,
        expand = c(.015, .015)) +
      ggplot2::scale_y_continuous(
        breaks = breaks_seq,
        labels = breaks$bi_y,
        expand = c(.015, .015))

  } else {

    breaks_include <- FALSE

  }

  ## add arrows
  if (arrows == TRUE) {

    legend <- legend +
      ggplot2::labs(x = substitute(paste(xQN, ""%->%"")), y = substitute(paste(yQN, ""%->%"")))

  } else if (arrows == FALSE){

    legend <- legend +
      ggplot2::labs(x = xQN, y = yQN)

  }

  ## final legend elements
  legend <- legend +
    ggplot2::theme(axis.title = ggplot2::element_text(size = size)) +
    ggplot2::coord_fixed()

  ## add theme
  if (breaks_include == TRUE){
    legend <- legend + bi_theme_legend(base_size = size)
  } else if (breaks_include == FALSE){
    legend <- legend + bi_theme(base_size = size)
  }

  # return output
  return(legend)

}
