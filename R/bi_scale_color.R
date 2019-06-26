#' Apply Bivariate Color to ggplot Object
#'
#' @description Applies the selected palette as the color aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{color} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_color(pal, dim = 3, ...)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param ... Arguments to pass to \code{\link{scale_fill_manual}}
#'
#' @return A \code{ggplot} object with the given bivariate palette applied to the data.
#'
#' @importFrom ggplot2 scale_color_manual
#'
#' @export
bi_scale_color <- function(pal, dim = 3, ...){

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
  ggplot2::scale_color_manual(values = x, ...)

}
