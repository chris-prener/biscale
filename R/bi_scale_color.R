#' Apply Bivariate Color to ggplot Object
#'
#' @description Applies the selected palette as the color aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{color} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_color(pal, dim = 3, ...)
#'
#' @param pal Either palette name (one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}) or a custom palette
#'     object created with \code{\link{bi_pal_manual}}.
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
    stop("A palette must be specified for the 'pal' argument. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', or 'GrPink'
         or supply a custom palette created with 'bi_pal_custom()'.")
  }

  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    if (dim == 2 & length(pal) != 4){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    } else if (dim == 3 & length(pal) != 9){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    }

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

    if (pal %in% c("Brown", "DkBlue", "DkCyan", "DkViolet", "GrPink") == FALSE){
      stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', or 'GrPink'.")
    }

  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (dim != 2 & dim != 3){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  # obtain palette
  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    x <- pal

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

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

  }

  # apply to ggplot object
  ggplot2::scale_color_manual(values = x, ...)

}
