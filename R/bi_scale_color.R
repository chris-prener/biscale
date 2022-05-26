#' Apply Bivariate Color to ggplot Object
#'
#' @description Applies the selected palette as the color aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{color} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_color(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...)
#'
#' @param pal A palette name or a vector containing a custom palette. See
#'     the help file for \code{bi_pal} for complete list of built-in palette
#'     names. If you are providing a custom palette, it must follow the formatting
#'     described in the 'Advanced Options' vignette.
#' @param dim The dimensions of the palette. To use the built-in palettes,
#'     this value must be either \code{2}, \code{3}, or \code{4}. A value of
#'     \code{3}, for example, would be used to create a three-by-three bivariate
#'     map with a total of 9 classes.
#'
#'     If you are using a custom palette, this value may be larger (though these
#'     maps can be very hard to interpret). See the 'Advanced Options' vignette
#'     for details on the relationship between \code{dim} values and palette size.
#' @param flip_axes A logical scalar; if \code{TRUE} the axes of the palette
#'     will be flipped. If \code{FALSE} (default), the palette will be displayed
#'     on its original axes. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of flipping axes.
#' @param rotate_pal A logical scalar; if \code{TRUE} the palette will be
#'     rotated 180 degrees. If \code{FALSE} (default), the palette will be
#'     displayed in its original orientation. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of palette rotation.
#' @param ... Arguments to pass to \code{\link{scale_color_manual}}
#'
#' @return A \code{ggplot} object with the given bivariate palette applied to the data.
#'
#' @seealso bi_pal
#'
#' @examples
#' # load dependencies
#' library(ggplot2)
#'
#' # add breaks, 3x3
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3)
#'
#' # create map
#' plot <- ggplot() +
#'   geom_sf(data = data, aes(color = bi_class), size = 2, show.legend = FALSE) +
#'   bi_scale_color(pal = "GrPink", dim = 3)
#'
#' @export
bi_scale_color <- function(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...){

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts numeric values.")
  }

  if (is.logical(flip_axes) == FALSE){
    stop("A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(rotate_pal) == FALSE){
    stop("A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
  }

  pal_validate(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  # create palette
  if (length(pal) == 1){
    x <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)
  } else if (length(pal) > 1){
    x <- pal
  }

  # apply to ggplot object
  ggplot2::scale_color_manual(values = x, ...)

}
