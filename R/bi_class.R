#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a 3x3 bivariate map.
#'
#' @usage bi_class(.data, x, y)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable
#' @param y The \code{y} variable
#'
#' @return A copy of \code{.data} with a new variable \code{bs_class} that contains
#'     combinations of values that correspond to an observations values for \code{x}
#'     and \code{y}. This is the basis for applying a bivariate color palette.
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr pull
#' @importFrom rlang enquo
#' @importFrom rlang quo
#' @importFrom rlang sym
#' @importFrom stats quantile
#'
#' @export
bi_class <- function(.data, x, y){

  # global bindings
  bs_x = bs_y = NULL

  # save parameters to list
  paramList <- as.list(match.call())

  # nse
  if (!is.character(paramList$x)) {
    xQ <- rlang::enquo(x)
  } else if (is.character(paramList$x)) {
    xQ <- rlang::quo(!! rlang::sym(x))
  }

  if (!is.character(paramList$y)) {
    yQ <- rlang::enquo(y)
  } else if (is.character(paramList$y)) {
    yQ <- rlang::quo(!! rlang::sym(y))
  }

  # create three bins for x
  bins_x <- dplyr::pull(.data, !!xQ)
  bins_x <- stats::quantile(bins_x, probs = seq(0, 1, length.out = 4))


  # create three bins for mean income
  bins_y <- dplyr::pull(.data, !!yQ)
  bins_y <- stats::quantile(bins_y, probs = seq(0, 1, length.out = 4))

  # cut into groups defined above and join fill
  out <- dplyr::mutate(.data, bs_x = cut(!!xQ, breaks = bins_x, include.lowest = TRUE))
  out <- dplyr::mutate(out, bs_y = cut(!!yQ, breaks = bins_y, include.lowest = TRUE))
  out <- dplyr::mutate(out, bs_class = paste0(as.numeric(bs_x), "-", as.numeric(bs_y)))

  # return output
  return(out)

}
