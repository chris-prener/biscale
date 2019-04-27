#' Apply Bivariate Scale to ggplot Object
#'
#' @description Applies the selected palette as the fill aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is used as the \code{fill} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_fill(pal, ...)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, and \code{"GrPink"}.
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
bi_scale_fill <- function(pal, ...){

  # obtain palette
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

  # apply to ggplot object
  ggplot2::scale_fill_manual(values = x, ...)

}
