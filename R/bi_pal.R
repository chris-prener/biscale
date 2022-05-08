#' Palette Preview and Hex Values
#'
#' @description Prints either a visual preview of each palette or the associated
#'     hex values.
#'
#' @details The \code{"Brown"}, \code{"DkBlue"}, \code{"DkCyan"}, and \code{"GrPink"}
#'     palettes were made by
#'     \href{http://www.joshuastevens.net/cartography/make-a-bivariate-choropleth-map/}{Joshua Stevens}.
#'     The \code{"DkViolet"} palette was made by
#'     \href{https://timogrossenbacher.ch/2019/04/bivariate-maps-with-ggplot2-and-sf/}{Timo Grossenbacher and Angelo Zehr}.
#'
#' @usage bi_pal(pal, dim = 3, preview = TRUE, flip_axes = FALSE, rotate_pal = FALSE)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param preview A logical scalar; if \code{TRUE} (default), an image preview will
#'     be generated. If \code{FALSE}, a vector with hex color values will be returned.
#' @param flip_axes A logical scalar; if \code{TRUE} (default: FALSE) the axes of the palette will be flipped.
#' @param rotate_pal A logical scalar; if \code{TRUE} (default: FALSE) the palette will be rotated 180 degrees.
#'
#' @return If \code{preview = TRUE}, an image preview of the legend will be returned.
#'     Otherwise, if \code{preview = FALSE}, a named vector with class values for names
#'     and their corresponding hex color values.
#'
#' @examples
#' # gray pink palette, 2x2
#' bi_pal(pal = "GrPink", dim = 2)
#'
#' # gray pink palette, 2x2 hex values
#' bi_pal(pal = "GrPink", dim = 2, preview = FALSE)
#'
#' # gray pink palette, 3x3
#' bi_pal(pal = "GrPink", dim = 3)
#'
#' # gray pink palette, 3x3 hex values
#' bi_pal(pal = "GrPink", dim = 3, preview = FALSE)
#'
#' @export
bi_pal <- function(pal, dim = 3, preview = TRUE, flip_axes = FALSE, rotate_pal = FALSE){

  # global bindings
  x = y = bi_fill = NULL

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette must be specified for the 'pal' argument. Please choose one of: .")
  }

  if (pal %in% c("DkViolet", "DkViolet2", "GrPink", "GrPink2") == FALSE){
    stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: .")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  }

  if (dim %in% c(2:4) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2', '3', or '4'.")
  }

  if (dim == 4 & pal %in% c("DkViolet", "GrPink")){
    if(pal == "DkViolet"){
      stop("The legacy 'DkViolet' palette does not support 4x4 bivarite mapping. Please use 'DkViolet2' instead.")
    } else if (pal == "GrPink"){
      stop("The legacy 'GrPink' palette does not support 4x4 bivarite mapping. Please use 'GrPink2' instead.")
    }
  }

  if (is.logical(preview) == FALSE){
    stop("A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(flip_axes) == FALSE){
    stop("A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(rotate_pal) == FALSE){
    stop("A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # create vector
  out <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  # optionally create preview
  if (preview == TRUE){

    out <- bi_legend_build(leg = out, xlab = "x var ", ylab = "y var ", size = 10, pad_width = NA, pad_color = "#ffffff")

  }

  # return output
  return(out)

}

bi_pal_pull <- function(pal, dim, flip_axes, rotate_pal){

  ## load palette list
  load("R/sysdata.rda")

  ## pull palette vector
  out <- pals[[pal]][[paste0("d", dim)]]

  ## optionally flip axes (high x becomes high y and high y becomes high x)
  if (flip_axes == TRUE){
    out <- bi_pal_flip(out)
  }

  ## optionally rotate palette (high x, high y becomes low x, low y)
  if (rotate_pal == TRUE){
    out <- bi_pal_rotate(out)
  }

  return(out)

}


# Flip the Axes of a Palette (Not Exported)
#
# @param pal A named atomic, character vector of length 4 or 9
#
# @return A named atomic, character vector equal to input length, with palette axes inverted
bi_pal_flip <- function(pal){

  if (length(pal) == 4){

    flipped <- pal

    flipped['1-2'] <- pal['2-1']
    flipped['2-1'] <- pal['1-2']

  } else if(length(pal) == 9){

    flipped <- pal

    flipped['1-2'] <- pal['2-1']
    flipped['1-3'] <- pal['3-1']
    flipped['2-1'] <- pal['1-2']
    flipped['2-3'] <- pal['3-2']
    flipped['3-1'] <- pal['1-3']
    flipped['3-2'] <- pal['2-3']

  } else if(length(pal) == 16){

    stop("Flipped axes for 4x4 plots not implemented yet!")

  }

  return(flipped)

}


# Rotate the Axes of a Palette (Not Exported)
#
# @param pal A named atomic, character vector of length 4 or 9
#
# @return A named atomic, character vector equal to input length, with palette rotated 180 degrees
bi_pal_rotate <- function(pal){

  if (length(pal) == 4){

    rotated <- pal

    rotated['1-1'] <- pal['2-2']
    rotated['1-2'] <- pal['2-1']
    rotated['2-2'] <- pal['1-1']
    rotated['2-1'] <- pal['1-2']

  } else if (length(pal) == 9){

    rotated <- pal

    rotated['1-1'] <- pal['3-3']
    rotated['1-2'] <- pal['3-2']
    rotated['1-3'] <- pal['3-1']
    rotated['2-1'] <- pal['2-3']
    rotated['2-3'] <- pal['2-1']
    rotated['3-1'] <- pal['1-3']
    rotated['3-2'] <- pal['1-2']
    rotated['3-3'] <- pal['1-1']

  } else if (length(pal) == 16){

    rotated <- pal

    rotated['1-1'] <- pal['4-4']
    rotated['1-2'] <- pal['4-3']
    rotated['1-3'] <- pal['4-2']
    rotated['1-4'] <- pal['4-1']
    rotated['2-1'] <- pal['3-4']
    rotated['2-2'] <- pal['3-3']
    rotated['2-3'] <- pal['3-2']
    rotated['2-4'] <- pal['3-1']
    rotated['3-1'] <- pal['2-4']
    rotated['3-2'] <- pal['2-3']
    rotated['3-3'] <- pal['2-2']
    rotated['3-4'] <- pal['2-1']
    rotated['4-1'] <- pal['1-4']
    rotated['4-2'] <- pal['1-3']
    rotated['4-3'] <- pal['1-2']
    rotated['4-4'] <- pal['1-1']

  }

  return(rotated)

}
