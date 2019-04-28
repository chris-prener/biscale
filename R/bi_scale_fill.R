#' Apply Bivariate Scale to ggplot Object
#'
#' @description Applies the selected palette as the fill aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is used as the \code{fill} in the aesthetic
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
#' @importFrom ggplot2 scale_fill_manual
#'
#' @examples
#' # load dependency
#' library(ggplot2)
#'
#' # add breaks
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc)
#'
#' # create map
#' ggplot() +
#'   geom_sf(data = data, aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
#'   bi_scale_fill(pal = "GrPink")
#'
#' @export
bi_scale_fill <- function(pal, dim = 3, ...){

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
