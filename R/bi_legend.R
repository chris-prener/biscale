#' Create Object for Drawing Legend
#'
#' @description Creates a \code{ggplot} object containing a legend that is specific
#'     to bivariate mapping.
#'
#' @usage bi_legend(pal, dim = 3, xlab, ylab, size)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param xlab Text for desired x axis label on legend
#' @param ylab Text for desired y axis label on legend
#' @param size Size of axis labels
#'
#' @return A \code{ggplot} object with a bivariate legend.
#'
#' @importFrom dplyr mutate tibble
#' @importFrom ggplot2 aes coord_fixed element_text geom_tile ggplot labs
#'     scale_fill_identity theme
#' @importFrom rlang enquo quo_name
#' @importFrom tidyr separate
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
bi_legend <- function(pal, dim = 3, xlab, ylab, size = 10){

  # global binding
  bi_class = bi_fill = x = y = NULL

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette must be specified for the 'pal' argument. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  }

  if (pal %in% c("Brown", "DkBlue", "DkCyan", "DkViolet", "GrPink") == FALSE){
    stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (dim != 2 & dim != 3){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
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

  # nse
  xQN <- rlang::quo_name(rlang::enquo(xlab))
  yQN <- rlang::quo_name(rlang::enquo(ylab))

  # return palette colors
  if (pal == "DkViolet"){
    x <- pal_dkviolet(n = dim)
  } else if (pal == "GrPink"){
    x <- pal_grpink(n = dim)
  } else if (pal == "DkBlue"){
    x <- pal_dkblue(n = dim)
  } else if (pal == "DkCyan"){
    x <- pal_dkcyan(n = dim)
  } else if (pal == "Brown"){
    x <- pal_brown(n = dim)
  }

  # create tibble for plotting
  x <- dplyr::tibble(
    bi_class = names(x),
    bi_fill = x
  )

  # reformat
  leg <- tidyr::separate(x, bi_class, into = c("x", "y"), sep = "-")
  leg <- dplyr::mutate(leg, x = as.integer(x), y = as.integer(y))

  # create ggplot2 legend object
  legend <- ggplot2::ggplot() +
    ggplot2::geom_tile(data = leg, mapping = ggplot2::aes(x = x, y = y, fill = bi_fill)) +
    ggplot2::scale_fill_identity() +
    ggplot2::labs(x = substitute(paste(xQN, ""%->%"")), y = substitute(paste(yQN, ""%->%""))) +
    bi_theme() +
    ggplot2::theme(axis.title = ggplot2::element_text(size = size)) +
    ggplot2::coord_fixed()

  # return output
  return(legend)

}
