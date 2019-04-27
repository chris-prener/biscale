#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a 3x3 bivariate map.
#'
#' @usage bi_class(.data, x, y, style = "tercile", keep_factors = FALSE)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable
#' @param y The \code{y} variable
#' @param style A string identifying the style used to calculate breaks. Currently
#'     supported styles are \code{"tercile"} (default), \code{"equal"}, \code{"fisher"},
#'     and \code{"jenks"}.
#' @param keep_factors A logical scalar; if \code{TRUE}, the fintermediate factor
#'     variables created as part of the calculation of \code{bs_class} will be
#'     retained. If \code{FALSE} (default), they will not be returned.
#'
#' @return A copy of \code{.data} with a new variable \code{bs_class} that contains
#'     combinations of values that correspond to an observations values for \code{x}
#'     and \code{y}. This is the basis for applying a bivariate color palette.
#'
#' @importFrom classInt classIntervals
#' @importFrom dplyr mutate
#' @importFrom dplyr pull
#' @importFrom dplyr select
#' @importFrom rlang enquo
#' @importFrom rlang quo
#' @importFrom rlang sym
#' @importFrom stats quantile
#'
#' @export
bi_class <- function(.data, x, y, style = "tercile", keep_factors = FALSE){

  # global bindings
  bi_x = bi_y = NULL

  # check inputs
  if (style %in% c("tercile", "equal", "fisher", "jenks") == FALSE){
    stop("The allowed styles are 'equal', 'fisher', 'jenks', or 'tercile'.")
  }

  if (is.logical(keep_factors) == FALSE){
    stop("A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
  }

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

  # create three bins for x and y
  bins_x <- dplyr::pull(.data, !!xQ)
  bins_y <- dplyr::pull(.data, !!yQ)

  # calculate breaks
  if (style == "tercile"){

    bins_x <- stats::quantile(bins_x, probs = seq(0, 1, length.out = 4))
    bins_y <- stats::quantile(bins_y, probs = seq(0, 1, length.out = 4))

  } else if (style == "equal"){

    bins_x <- classInt::classIntervals(bins_x, n = 3, style = "equal")
    bins_y <- classInt::classIntervals(bins_y, n = 3, style = "equal")

  } else if (style == "fisher"){

    bins_x <- classInt::classIntervals(bins_x, n = 3, style = "fisher")
    bins_y <- classInt::classIntervals(bins_y, n = 3, style = "fisher")

  } else if (style == "jenks"){

    bins_x <- classInt::classIntervals(bins_x, n = 3, style = "jenks")
    bins_y <- classInt::classIntervals(bins_y, n = 3, style = "jenks")

  }

  # convert to breaks
  if (style %in% c("equal", "fisher", "jenks")){

    bins_x <- bins_x$brks
    bins_y <- bins_y$brks

  }

  # cut into groups defined above and join fill
  out <- dplyr::mutate(.data, bi_x = cut(!!xQ, breaks = bins_x, include.lowest = TRUE))
  out <- dplyr::mutate(out, bi_y = cut(!!yQ, breaks = bins_y, include.lowest = TRUE))
  out <- dplyr::mutate(out, bi_class = paste0(as.numeric(bi_x), "-", as.numeric(bi_y)))

  # optionally remove factors
  if (keep_factors == FALSE){
    out <- dplyr::select(out, -c(bi_x, bi_y))
  }

  # return output
  return(out)

}
