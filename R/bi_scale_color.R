#' Apply Bivariate Color to ggplot Object
#'
#' @description Applies the selected palette as the color aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{color} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_color(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...)
#'
#' @param pal A palette name; one of \code{"Bluegill"}, \code{"BlueGold"},
#'     \code{"BlueOr"}, \code{"BlueYl"}, \code{"Brown"}/\code{"Brown2"},
#'     \code{"DkBlue"}/\code{"DkBlue2"}, \code{"DkCyan"}/\code{"DkCyan2"},
#'     \code{"DkViolet"}/\code{"DkViolet2"}, \code{"GrPink"}/\code{"GrPink2"},
#'     \code{"PinkGrn"}, \code{"PurpleGrn"}, or \code{"PurpleOr"}.
#'
#'     Pairs of palettes, such as \code{"GrPink"}/\code{"GrPink2"}, are included
#'     for legacy support. The numbered palettes support four-by-four bivarite
#'     maps while the un-numbered ones, which were the five included in the
#'     original release of the package, only support two-by-two and
#'     three-by-three maps.
#' @param dim The dimensions of the palette, either \code{2} for a
#'     two-by-two palette, \code{3} for a three-by-three palette, or \code{4}
#'     for a four-by-four palette.
#' @param flip_axes A logical scalar; if \code{TRUE} the axes of the palette
#'     will be flipped. If \code{FALSE} (default), the palette will be displayed
#'     on its original axes.
#' @param rotate_pal A logical scalar; if \code{TRUE} the palette will be
#'     rotated 180 degrees. If \code{FALSE} (default), the palette will be
#'     displayed in its original orientation
#' @param ... Arguments to pass to \code{\link{scale_color_manual}}
#'
#' @return A \code{ggplot} object with the given bivariate palette applied to the data.
#'
#' @export
bi_scale_color <- function(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...){

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
  }

  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    if (dim == 2 & length(pal) != 4){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    } else if (dim == 3 & length(pal) != 9){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    }

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

    if (pal %in% c("DkViolet", "DkViolet2", "GrPink", "GrPink2", "DkBlue", "DkBlue2", "DkCyan", "DkCyan2", "Brown", "Brown2", "Bluegill", "BlueGold", "BlueOr", "BlueYl", "PinkGrn", "PurpleGrn", "PurpleOr") == FALSE){
      stop("The given palette is not one of the allowed options for bivariate mapping. Please see bi_scale_color's help file for a list of included palettes.")
    }

  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  }

  if (dim %in% c(2:4) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  }

  # obtain palette
  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    x <- pal

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

    x <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  }

  # apply to ggplot object
  ggplot2::scale_color_manual(values = x, ...)

}
