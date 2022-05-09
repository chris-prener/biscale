

#' Create Manual Palette
#'
#' @description A function for structuring manual bi-variate palettes. All values must be entered
#'     as six-digit hex values (e.g. #000000) and must be preceded by the number symbol. Short
#'     forms of hex values (e.g. #000) are not accepted as valid inputs. For two-by-two palettes,
#'     only the 'val_1_1', 'val_1_2', 'val_2_1', and 'val_2_2' parameters are required. For
#'     three-by-three palettes, all parameters are required.
#'
#' @usage bi_pal_manual(val_1_1, val_1_2, val_1_3, val_2_1, val_2_2, val_2_3,
#'     val_3_1, val_3_2, val_3_3, preview = FALSE)
#'
#' @param val_1_1 A hex value for cell 1-1
#' @param val_1_2 A hex value for cell 1-2
#' @param val_1_3 A hex value for cell 1-3
#' @param val_2_1 A hex value for cell 2-1
#' @param val_2_2 A hex value for cell 2-2
#' @param val_2_3 A hex value for cell 2-3
#' @param val_3_1 A hex value for cell 3-1
#' @param val_3_2 A hex value for cell 3-2
#' @param val_3_3 A hex value for cell 3-3
#' @param preview A logical scalar; if \code{TRUE} (default), an image preview will
#'     be generated. If \code{FALSE}, a vector with hex color values will be returned.
#'
#' @examples
#' custom_pal <- bi_pal_manual(val_1_1 = "#E8E8E8", val_1_2 = "#73AE80",
#'   val_2_1 = "#6C83B5", val_2_2 = "#2A5A5B")
#'
#' @export
bi_pal_manual <- function(val_1_1, val_1_2, val_1_3, val_2_1, val_2_2, val_2_3,
                          val_3_1, val_3_2, val_3_3, preview = FALSE){

  # save parameters to list
  paramList <- as.list(match.call())

  # test length of input
  if ("preview" %in% names(paramList) == TRUE){
    input <- length(match.call())-2
  } else {
    input <- length(match.call())-1
  }

  if (input != 4 & input != 9){
    stop("Incorrect number of values specified. For two-by-two palettes, there should be four values.
         For three-by-three palettes, there should be nine.")
  }

  # ensure correct inputs are present for 2x2 palettes
  if (input == 4 & (missing(val_1_1) == TRUE |
                    missing(val_1_2) == TRUE |
                    missing(val_2_1) == TRUE |
                    missing(val_2_2) == TRUE)){
    stop("For two-by-two palettes, the 'val_1_1', 'val_1_2', 'val_2_1', and 'val_2_2' parameters are required.")
  }

  # ensure inputs are formatted properly, 2x2 palette
  if (grepl(pattern = "^#", x = val_1_1) == FALSE |
      nchar(x = val_1_1) != 7){
    stop("Hex value for 'val_1_1' not formatted appropriately.")
  }

  if (grepl(pattern = "^#", x = val_1_2) == FALSE |
      nchar(x = val_1_2) != 7){
    stop("Hex value for 'val_1_2' not formatted appropriately.")
  }

  if (grepl(pattern = "^#", x = val_2_1) == FALSE |
      nchar(x = val_2_1) != 7){
    stop("Hex value for 'val_2_1' not formatted appropriately.")
  }

  if (grepl(pattern = "^#", x = val_2_2) == FALSE |
      nchar(x = val_2_2) != 7){
    stop("Hex value for 'val_2_2' not formatted appropriately.")
  }

  # ensure inputs are formatted properly, 3x3 palette
  if (input == 9){

    if (grepl(pattern = "^#", x = val_1_3) == FALSE |
        nchar(x = val_1_3) != 7){
      stop("Hex value for 'val_1_3' not formatted appropriately.")
    }

    if (grepl(pattern = "^#", x = val_2_3) == FALSE |
        nchar(x = val_2_3) != 7){
      stop("Hex value for 'val_2_3' not formatted appropriately.")
    }

    if (grepl(pattern = "^#", x = val_3_3) == FALSE |
        nchar(x = val_3_3) != 7){
      stop("Hex value for 'val_3_3' not formatted appropriately.")
    }

    if (grepl(pattern = "^#", x = val_3_1) == FALSE |
        nchar(x = val_3_1) != 7){
      stop("Hex value for 'val_3_1' not formatted appropriately.")
    }

    if (grepl(pattern = "^#", x = val_3_2) == FALSE |
        nchar(x = val_3_2) != 7){
      stop("Hex value for 'val_3_2' not formatted appropriately.")
    }

  }

  # assign values
  if (input == 4){

    out <- c(
      "2-2" = val_2_2, # high x, high y
      "1-2" = val_1_2, # low x, high y
      "2-1" = val_2_1, # high x, low y
      "1-1" = val_1_1 # low x, low y
    )

    dim <- 2

  } else if (input == 9) {

    out <- c(
      "3-3" = val_3_3, # high x, high y
      "2-3" = val_2_3,
      "1-3" = val_1_3, # low x, high y
      "3-2" = val_3_2,
      "2-2" = val_2_2, # medium x, medium y
      "1-2" = val_1_2,
      "3-1" = val_3_1, # high x, low y
      "2-1" = val_2_1,
      "1-1" = val_1_1 # low x, low y
    )

    dim <- 3

  }

  # assign class
  class(out) <- append(class(out),"bi_pal_custom")

  # create output
  if (preview == TRUE){

    # construct image
    out <- bi_legend(pal = out, dim = dim, size = 16)

  }

  # return output
  return(out)

}

# Flip the Axes of a Palette (Not Exported)
#
# @param pal A named atomic, character vector of length 4 or 9
#
# @return A named atomic, character vector equal to input length, with palette axes inverted
bi_pal_flip <- function(pal){
  if(length(pal) == 4){
    flipped <- pal
    flipped['1-2'] <- pal['2-1']
    flipped['2-1'] <- pal['1-2']
  }else if(length(pal) == 9){
    flipped <- pal
    flipped['1-2'] <- pal['2-1']
    flipped['1-3'] <- pal['3-1']
    flipped['2-1'] <- pal['1-2']
    flipped['2-3'] <- pal['3-2']
    flipped['3-1'] <- pal['1-3']
    flipped['3-2'] <- pal['2-3']
  }else{
    stop('Palette is not of a supported dimension, cannot be flipped.')
  }
  return(flipped)
}

# Rotate the Axes of a Palette (Not Exported)
#
# @param pal A named atomic, character vector of length 4 or 9
#
# @return A named atomic, character vector equal to input length, with palette rotated 180 degrees
bi_pal_rotate <- function(pal){
  if(length(pal) == 4){
    rotated <- pal
    rotated['1-1'] <- pal['2-2']
    rotated['1-2'] <- pal['2-1']
    rotated['2-2'] <- pal['1-1']
    rotated['2-1'] <- pal['1-2']
  }else if(length(pal) == 9){
    rotated <- pal
    rotated['1-1'] <- pal['3-3']
    rotated['1-2'] <- pal['3-2']
    rotated['1-3'] <- pal['3-1']
    rotated['2-1'] <- pal['2-3']
    rotated['2-3'] <- pal['2-1']
    rotated['3-1'] <- pal['1-3']
    rotated['3-2'] <- pal['1-2']
    rotated['3-3'] <- pal['1-1']
  }else{
    stop('Palette is not of a supported dimension, cannot be rotated.')
  }
  return(rotated)
}
