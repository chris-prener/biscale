#' Create Object for Drawing Legend
#'
#' @description Creates a \code{ggplot} object containing a legend that is specific
#'     to bivariate mapping.
#'
#' @usage bi_legend(pal, xlab, ylab, size)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, and \code{"GrPink"}.
#' @param xlab Text for desired x axis label on legend
#' @param ylab Text for desired y axis label on legened
#' @param size Size of axis labels
#'
#' @return A \code{ggplot} object with a bivariate legend.
#'
#' @importFrom dplyr mutate tibble
#' @importFrom ggplot2 aes coord_fixed element_text geom_tile ggplot labs
#'     scale_fill_identity theme
#' @importFrom tidyr separate
#'
#' @examples
#' # construct legend
#' legend <- bi_legend(pal = "GrPink",
#'                     xlab = "Higher % White ",
#'                     ylab = "Higher Income ",
#'                     size = 16)
#'
#' # print legend
#' legend
#'
#' @export
bi_legend <- function(pal, xlab, ylab, size = 10){

  # global binding
  bi_class = bi_fill = x = y = NULL

  # check parameters
  if (pal %in% c("Brown", "DkBlue", "DkCyan", "DkViolet", "GrPink") == FALSE){
    stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  }

  if (is.character(xlab) == FALSE){
    stop("The 'xlab' argument must be a character string.")
  }

  if (is.character(ylab) == FALSE){
    stop("The 'ylab' argument must be a character string.")
  }

  if (is.numeric(size) == FALSE){
    stop("The 'size' argument must be a numeric value.")
  }

  # insert missing parameter values
  if (missing(xlab) == TRUE){
    xlab <- "x var "
  }

  if (missing(ylab) == TRUE){
    ylab <- "y var "
  }

  # return palette colors
  if (pal == "DkViolet"){
    x <- pal_dkviolet()
  } else if (pal == "GrPink"){
    x <- pal_grpink()
  } else if (pal == "DkBlue"){
    x <- pal_dkblue()
  } else if (pal == "DkCyan"){
    x <- pal_dkcyan()
  } else if (pal == "Brown"){
    x <- pal_brown()
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
    ggplot2::labs(x = substitute(paste(xlab, ""%->%"")), y = substitute(paste(ylab, ""%->%""))) +
    bi_theme() +
    ggplot2::theme(axis.title = ggplot2::element_text(size = size)) +
    ggplot2::coord_fixed()

  # return output
  return(legend)

}
