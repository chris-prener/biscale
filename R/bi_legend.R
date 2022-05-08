#' Create Object for Drawing Legend
#'
#' @description Creates a \code{ggplot} object containing a legend that is specific
#'     to bivariate mapping.
#'
#' @usage bi_legend(pal, dim = 3, xlab, ylab, size,
#'  flip_axes = FALSE, rotate_pal = FALSE, pad_width = NA, pad_color)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param xlab Text for desired x axis label on legend
#' @param ylab Text for desired y axis label on legend
#' @param size Size of axis labels
#' @param flip_axes A logical scalar; if \code{TRUE} (default: FALSE) the axes of the palette will be flipped.
#' @param rotate_pal A logical scalar; if \code{TRUE} (default: FALSE) the palette will be rotated 180 degrees.
#' @param pad_width An optional numeric scalar; Controls the width of padding between tiles in the legend
#' @param pad_color An optional character scalar (valid to ggplot::geom_tile); Controls the color of padding between tiles in the legend
#'
#' @return A \code{ggplot} object with a bivariate legend.
#'
#' @examples
#' # construct 2x2 legend
#' legend <- bi_legend(pal = "GrPink",
#'                     dim = 2,
#'                     xlab = "Higher % White ",
#'                     ylab = "Higher Income ",
#'                     size = 16)
#'
#' # print legend
#' legend
#'
#' # construct 3x3 legend
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
    stop("A palette must be specified for the 'pal' argument. Please choose one of: .")
  }

  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    if (dim == 2 & length(pal) != 4){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    } else if (dim == 3 & length(pal) != 9){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    }

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

    if (pal %in% c("DkViolet", "DkViolet2") == FALSE){
      stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: .")
    }

  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  }

  if (dim %in% c(2:4) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
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

  # create palette
  if ("bi_pal_custom" %in% class(pal) == FALSE) {

    # built-in
    leg <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  } else if ("bi_pal_custom" %in% class(pal) == TRUE){

    # custom
    leg <- pal

  }

  # build legend
  out <- bi_legend_build(leg = leg, xlab = xlab, ylab = ylab, size = size, pad_width = pad_width, pad_color = pad_color)

  # return output
  return(out)

}

bi_legend_build <- function(leg, xlab, ylab, size, pad_width, pad_color){

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
