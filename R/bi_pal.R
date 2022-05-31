#' Preview Palettes and Hex Values
#'
#' @description Prints either a visual preview of each palette or the associated
#'     hex values.
#'
#' @details The \code{"Brown"}, \code{"DkBlue"}, \code{"DkCyan"}, and \code{"GrPink"}
#'     palettes were made by
#'     \href{https://www.joshuastevens.net/cartography/make-a-bivariate-choropleth-map/}{Joshua Stevens}.
#'     The \code{"DkViolet"} palette was made by
#'     \href{https://timogrossenbacher.ch/2019/04/bivariate-maps-with-ggplot2-and-sf/}{Timo Grossenbacher and Angelo Zehr}.
#'     Many of the new palettes were inspired by Branson Fox's earlier work to expand
#'     \code{biscale}.
#'
#' @usage bi_pal(pal, dim = 3, preview = TRUE, flip_axes = FALSE, rotate_pal = FALSE)
#'
#' @param pal A palette name or a vector containing a custom palette.
#'     If you are providing a palette name, it must be one of:
#'     \code{"Bluegill"}, \code{"BlueGold"}, \code{"BlueOr"}, \code{"BlueYl"},
#'     \code{"Brown"}/\code{"Brown2"}, \code{"DkBlue"}/\code{"DkBlue2"},
#'     \code{"DkCyan"}/\code{"DkCyan2"}, \code{"DkViolet"}/\code{"DkViolet2"},
#'     \code{"GrPink"}/\code{"GrPink2"}, \code{"PinkGrn"}, \code{"PurpleGrn"},
#'     or \code{"PurpleOr"}.
#'
#'     Pairs of palettes, such as \code{"GrPink"}/\code{"GrPink2"}, are included
#'     for legacy support. The numbered palettes support four-by-four bivarite
#'     maps while the un-numbered ones, which were the five included in the
#'     original release of the package, only support two-by-two and
#'     three-by-three maps.
#'
#'     If you are providing a custom palette, it must follow the formatting
#'     described in the 'Advanced Options' vignette.
#' @param dim The dimensions of the palette. To use the built-in palettes,
#'     this value must be either \code{2}, \code{3}, or \code{4}. A value of
#'     \code{3}, for example, would be used to create a three-by-three bivariate
#'     map with a total of 9 classes.
#'
#'     If you are using a custom palette, this value may be larger (though these
#'     maps can be very hard to interpret). See the 'Advanced Options' vignette
#'     for details on the relationship between \code{dim} values and palette size.
#' @param preview A logical scalar; if \code{TRUE} (default), an image preview
#'     will be generated. If \code{FALSE}, a vector with hex color values will
#'     be returned.
#' @param flip_axes A logical scalar; if \code{TRUE} the axes of the palette
#'     will be flipped. If \code{FALSE} (default), the palette will be displayed
#'     on its original axes. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of flipping axes.
#' @param rotate_pal A logical scalar; if \code{TRUE} the palette will be
#'     rotated 180 degrees. If \code{FALSE} (default), the palette will be
#'     displayed in its original orientation. Custom palettes with 'dim' greater
#'     than 4 cannot take advantage of palette rotation.
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
#' # custom palette
#' custom_pal <- c(
#'     "1-1" = "#cabed0", # low x, low y
#'     "2-1" = "#ae3a4e", # high x, low y
#'     "1-2" = "#4885c1", # low x, high y
#'     "2-2" = "#3f2949" # high x, high y
#' )
#'
#' bi_pal(pal = custom_pal, dim = 2, preview = FALSE)
#'
#' @export
bi_pal <- function(pal, dim = 3, preview = TRUE, flip_axes = FALSE, rotate_pal = FALSE){

  # global bindings
  x = y = bi_fill = NULL

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette name or a custom palette vector must be specified for the 'pal' argument. Please see bi_pal's help file for a list of included palettes.")
  }

  if (is.logical(preview) == FALSE){
    stop("A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # validate palette
  pal_validate(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  # create vector
  out <- bi_pal_pull(pal = pal, dim = dim, flip_axes = flip_axes, rotate_pal = rotate_pal)

  # optionally create preview
  if (preview == TRUE){
    out <- bi_legend_build(leg = out, xlab = "x var ", ylab = "y var ", size = 10,
                           pad_width = NA, pad_color = "#ffffff", breaks = NULL,
                           arrows = TRUE)
  }

  # return output
  return(out)

}

# retrieve built-in palette
bi_pal_pull <- function(pal, dim, flip_axes, rotate_pal){

  ## pull palette vector
  if (length(pal) == 1){
    out <- pals[[pal]][[paste0("d", dim)]]
  } else {
    out <- pal
  }

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

# validate palette input
pal_validate <- function(pal, dim, flip_axes, rotate_pal){

  # validate dim argument
  if (is.numeric(dim) == FALSE){
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  if (dim < 2 | (dim %% 1 == 0) == FALSE){
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  # validate logical arguments
  if (is.logical(flip_axes) == FALSE){
    stop("A logical scalar must be supplied for 'flip_axes'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(rotate_pal) == FALSE){
    stop("A logical scalar must be supplied for 'rotate_pal'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # validate palette
  if(length(pal) == 1){

    ## error if built-in palette supplied is not valid
    if (pal %in% c("DkViolet", "DkViolet2", "GrPink", "GrPink2", "DkBlue", "DkBlue2", "DkCyan", "DkCyan2", "Brown", "Brown2", "Bluegill", "BlueGold", "BlueOr", "BlueYl", "PinkGrn", "PurpleGrn", "PurpleOr") == FALSE){
      stop("The given palette is not one of the allowed options for bivariate mapping. Please see bi_pal's help file for a list of included palettes.")
    }

    ## error if legacy palette used with 4x4 plots
    if (dim == 4 & pal %in% c("DkViolet", "GrPink", "DkBlue", "DkCyan", "Brown")){
      stop(paste0("The legacy '", pal, "' palette does not support 4x4 bivarite mapping. Please use '", pal, "2' instead."))
    }

    ## error if dim is >4 with built-in palette
    if (dim > 4){
      stop("The palettes built-in to biscale only support bivariate maps where 'dim' is 2, 3, or 4.")
    }

  } else if (length(pal) > 1){

    ## ensure custom palette has correct number of values
    if (length(pal)/dim != dim){
      stop("The custom palette provided does not have the correct number of entries for the given dimensions.")
    }

    ## ensure formatting of hex values is correct
    bi_pal_validate_names(pal = pal, dim = dim)

    x <- lapply(pal, bi_pal_validate_hash)
    x <- lapply(pal, bi_pal_validate_length)

    ## error for flipping and roating axes if dim > 4
    if (dim > 4 & flip_axes == TRUE){
      stop("Flipping axes for custom palettes is only available when 'dim' is 2, 3, or 4.")
    }

    if (dim > 4 & rotate_pal == TRUE){
      stop("Rotation for custom palettes is only available when 'dim' is 2, 3, or 4.")
    }

  }

}

# validate custom palette
bi_pal_validate_hash <- function(x){

  if(substr(x, 1, 1) != "#"){
    stop("Custom palette contains formatting errors - at least one entry does not begin with a hash.")
  }

}

bi_pal_validate_length <- function(x){

  if(nchar(x) != 7){
    stop("Custom palette contains formatting errors - at least one entry is not the right length.")
  }

}

bi_pal_validate_names <- function(pal, dim){

  x <- rep(x = 1:dim, times = dim)
  y <- sort(rep(x = 1:dim, times = dim))

  std <- paste(x, y, sep = "-")

  if (all(names(pal) == std) == FALSE){
    stop("Custom palette contains formatting errors - at least one entry name is incorrect.")
  }

}

# flip palette axes
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

    flipped <- pal

    flipped['1-2'] <- pal['2-1']
    flipped['1-3'] <- pal['3-1']
    flipped['1-4'] <- pal['4-1']

    flipped['2-4'] <- pal['4-2']
    flipped['3-4'] <- pal['4-3']

    flipped['4-2'] <- pal['2-4']
    flipped['4-3'] <- pal['3-4']

    flipped['3-2'] <- pal['2-3']
    flipped['2-3'] <- pal['3-2']

    flipped['2-1'] <- pal['1-2']
    flipped['3-1'] <- pal['1-3']
    flipped['4-1'] <- pal['1-4']

  }

  return(flipped)

}


# rotate axes
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
