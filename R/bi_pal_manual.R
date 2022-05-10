#' Create Manual Palette
#'
#' @description This function has been deprecated and will be removed from the
#'     next release of the package. See the Advanced Options vignette for a
#'     replacement workflow.
#'
#' @details A function for structuring manual bi-variate palettes. All values must be entered
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
#' @keywords internal
#'
#' @export
bi_pal_manual <- function(val_1_1, val_1_2, val_1_3, val_2_1, val_2_2, val_2_3,
                          val_3_1, val_3_2, val_3_3, preview = FALSE){

  # warn about deprecation
  .Deprecated(msg = "The 'bi_pal_manual' function will be removed in the next version of biscale. See the Advanced Options vignette for a replacement workflow.")

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

  # create output
  if (preview == TRUE){

    # construct image
    out <- bi_legend_build(leg = out, xlab = "x var ", ylab = "y var ", size = 10, pad_width = NA, pad_color = "#ffffff")

  }

  # return output
  return(out)

}
