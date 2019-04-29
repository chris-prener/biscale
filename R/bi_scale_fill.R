#' Apply Bivariate Scale to ggplot Object
#'
#' @description Applies the selected palette as the fill aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{fill} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_fill(pal, dim = 3, ...)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param ... Arguments to pass to \code{\link{scale_fill_manual}}
#'
#' @return A \code{ggplot} object with the given bivariate palette applied to the data.
#'
#' @importFrom ggplot2 scale_fill_manual
#'
#' @examples
#' # load suggested dependencies
#' library(ggplot2)
#' library(sf)
#'
#' # add breaks, 2x2
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, dim = 2)
#'
#' # create map
#' ggplot() +
#'   geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
#'   bi_scale_fill(pal = "GrPink", dim = 2)
#'
#' # add breaks, 3x3
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, dim = 3)
#'
#' # create map
#' ggplot() +
#'   geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
#'   bi_scale_fill(pal = "GrPink", dim = 3)
#'
#' @export
bi_scale_fill <- function(pal, dim = 3, ...){

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

  # obtain palette
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

  # apply to ggplot object
  ggplot2::scale_fill_manual(values = x, ...)

}
