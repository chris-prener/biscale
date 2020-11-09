#' Apply Bivariate Fill to ggplot Object
#'
#' @description Applies the selected palette as the fill aesthetic when \code{\link{geom_sf}}
#'     is used and the \code{bi_class} variable is given as the \code{fill} in the aesthetic
#'     mapping.
#'
#' @usage bi_scale_fill(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...)
#'
#' @param pal Either palette name (one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}) or a custom palette
#'     object created with \code{\link{bi_pal_manual}}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param flip_axes A logical scalar; if \code{TRUE} (default: FALSE) the axes of the palette will be flipped.
#' @param rotate_pal A logical scalar; if \code{TRUE} (default: FALSE) the palette will be rotated 180 degrees.
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
bi_scale_fill <- function(pal, dim = 3, flip_axes = FALSE, rotate_pal = FALSE, ...){

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette must be specified for the 'pal' argument. Please choose one of: 'BlGold', 'BlOrange', 'BlYellow', 'Brown', 'Diverging', 'DkBlue', 'DkCyan', 'DkViolet', 'Fire', 'GnPink', 'GnPurple', 'GrPink', 'OrgPurple', 'Reds' or 'Viridis' or supply a custom palette created with 'bi_pal_custom()'.")
  }

  if ("bi_pal_custom" %in% class(pal) == TRUE) {

    if (dim == 2 & length(pal) != 4){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    } else if (dim == 3 & length(pal) != 9){
      stop("There is a mismatch between the length of your custom palette object and the given dimensions.")
    }

  } else if ("bi_pal_custom" %in% class(pal) == FALSE){

    if (pal %in% c("BlGold", "BlOrange", "BlYellow", "Brown", "Diverging", "DkBlue", "DkCyan", "DkViolet", "Fire", "GnPink", "GnPurple", "GrPink", "OrgPurple", "Reds", "Viridis") == FALSE){
      stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'BlGold', 'BlOrange', 'BlYellow', 'Brown', 'Diverging', 'DkBlue', 'DkCyan', 'DkViolet', 'Fire', 'GnPink', 'GnPurple', 'GrPink', 'OrgPurple', 'Reds' or 'Viridis'.")
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

    x <- switch(pal,
      "DkViolet" = pal_dkviolet(n = dim),
      "GrPink" = pal_grpink(n = dim),
      "DkBlue" = pal_dkblue(n = dim),
      "DkCyan" = pal_dkcyan(n = dim),
      "Brown" = pal_brown(n = dim),
      "BlGold" = pal_blgold(n = dim),
      "BlOrange" = pal_blorange(n = dim),
      "BlYellow" = pal_blyellow(n = dim),
      "Viridis" = pal_viridis(n = dim),
      "Diverging" = pal_diverging(n = dim),
      "GnPink" = pal_gnpink(n = dim),
      "GnPurple" = pal_gnpurp(n = dim),
      "OrgPurple" = pal_orgpurp(n = dim),
      "Fire" = pal_fire(n = dim),
      "Reds" = pal_reds(n = dim)
    )

    if(flip_axes){
      x <- bi_pal_flip(x)
    }

    if(rotate_pal){
      x <- bi_pal_rotate(x)
    }

  }

  # apply to ggplot object
  ggplot2::scale_fill_manual(values = x, ...)

}
