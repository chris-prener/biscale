#' Create Object for Drawing Legend
#'
#' @description Creates a \code{ggplot} object containing a legend that is
#'     specific to bivariate mapping.
#'
#' @usage bi_legend(pal, dim = 3, xlab, ylab, size, flip_axes = FALSE,
#'     rotate_pal = FALSE, pad_width = NA, pad_color)
#'
#' @param pal A palette name or a vector containing a custom palette. See
#'     the help file for \code{bi_pal} for complete list of built-in palette
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
#' @param flip_axes A logical scalar; if \code{TRUE} the axes of the palette
#'     will be flipped. If \code{FALSE} (default), the palette will be displayed
#'     on its original axes. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of flipping axes.
#' @param rotate_pal A logical scalar; if \code{TRUE} the palette will be
#'     rotated 180 degrees. If \code{FALSE} (default), the palette will be
#'     displayed in its original orientation. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of palette rotation.
#' @param pad_width An optional numeric scalar; controls the width of padding
#'     between tiles in the legend
#' @param pad_color An optional character scalar; controls the color of padding
#'     between tiles in the legend
#'
#' @return A \code{ggplot} object with a bivariate legend.
#'
#' @seealso bi_pal
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
#' @export
bi_legend <- function(pal, dim = 3, xlab, ylab, size = 10, flip_axes = FALSE, rotate_pal = FALSE, pad_width = NA, pad_color = '#ffffff'){

  # global binding
  bi_class = bi_fill = x = y = NULL

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts numeric values.")
  }

  if (is.logical(flip_axes) == FALSE){
    stop("A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(rotate_pal) == FALSE){
    stop("A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
  }

  pal_validate(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

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

  # create palette
  if (length(pal) == 1){
    leg <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)
  } else if (length(pal) > 1){
    leg <- pal
  }

  # build legend
  out <- bi_legend_build(leg = leg, xlab = xlab, ylab = ylab, size = size, pad_width = pad_width, pad_color = pad_color)

  # return output
  return(out)

}

bi_legend_build <- function(leg, xlab, ylab, size, pad_width, pad_color){

  # global bindings
  bi_fill = x = y = NULL

  # nse
  xQN <- rlang::quo_name(rlang::enquo(xlab))
  yQN <- rlang::quo_name(rlang::enquo(ylab))

  # create tibble for plotting
  leg <- data.frame(
    bi_class = names(leg),
    bi_fill = leg
  )

  # reformat
  split <- utils::read.table(text = leg$bi_class, sep="-", col.names=c('x', 'y'))
  split$x <- as.integer(split$x)
  split$y <- as.integer(split$y)
  leg <- cbind(leg, split)

  # create ggplot2 legend object
  legend <- ggplot2::ggplot() +
    ggplot2::geom_tile(data = leg, mapping = ggplot2::aes(x = x, y = y, fill = bi_fill), lwd = pad_width, col = pad_color) +
    ggplot2::scale_fill_identity() +
    ggplot2::labs(x = substitute(paste(xQN, ""%->%"")), y = substitute(paste(yQN, ""%->%""))) +
    bi_theme() +
    ggplot2::theme(axis.title = ggplot2::element_text(size = size)) +
    ggplot2::coord_fixed()

  # return output
  return(legend)

}
