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
#' # brown palette, 2x2 preview
#' bi_pal(pal = "Brown", dim = 2)
#'
#' # brown palette, 2x2 hex values
#' bi_pal(pal = "Brown", dim = 2, preview = FALSE)
#'
#' # brown palette, 3x3 preview
#' bi_pal(pal = "Brown", dim = 3)
#'
#' # brown palette, 3x3 hex values
#' bi_pal(pal = "Brown", dim = 3, preview = FALSE)
#'
#' # dark blue palette, 2x2 preview
#' bi_pal(pal = "DkBlue", dim = 2)
#'
#' # dark blue palette, 2x2 hex values
#' bi_pal(pal = "DkBlue", dim = 2, preview = FALSE)
#'
#' # dark blue palette, 3x3 preview
#' bi_pal(pal = "DkBlue", dim = 3)
#'
#' # dark blue palette, 3x3 hex values
#' bi_pal(pal = "DkBlue", dim = 3, preview = FALSE)
#'
#' # dark cyan palette, 2x2
#' bi_pal(pal = "DkCyan", dim = 2)
#'
#' # dark cyan palette, 2x2 hex values
#' bi_pal(pal = "DkCyan", dim = 2, preview = FALSE)
#'
#' # dark cyan palette, 3x3
#' bi_pal(pal = "DkCyan", dim = 3)
#'
#' # dark cyan palette, 3x3 hex values
#' bi_pal(pal = "DkCyan", dim = 3, preview = FALSE)
#'
#' # dark violet palette, 2x2
#' bi_pal(pal = "DkViolet", dim = 2)
#'
#' # dark violet palette, 2x2 hex values
#' bi_pal(pal = "DkViolet", dim = 2, preview = FALSE)
#'
#' # dark violet palette, 3x3
#' bi_pal(pal = "DkViolet", dim = 3)
#'
#' # dark violet palette, 3x3 hex values
#' bi_pal(pal = "DkViolet", dim = 3, preview = FALSE)
#'
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

  # check parameters
  if (missing(pal) == TRUE){
    stop("A palette must be specified for the 'pal' argument. Please choose one of: 'BlGold', 'BlOrange', 'BlYellow', 'Brown', 'Diverging', 'DkBlue', 'DkCyan', 'DkViolet', 'Fire', 'GnPink', 'GnPurple', 'GrPink', 'OrgPurple', 'Reds' or 'Viridis'.")
  }

  if (pal %in% c("BlGold", "BlOrange", "BlYellow", "Brown", "Diverging", "DkBlue", "DkCyan", "DkViolet", "Fire", "GnPink", "GnPurple", "GrPink", "OrgPurple", "Reds", "Viridis") == FALSE){
    stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'BlGold', 'BlOrange', 'BlYellow', 'Brown', 'Diverging', 'DkBlue', 'DkCyan', 'DkViolet', 'Fire', 'GnPink', 'GnPurple', 'GrPink', 'OrgPurple', 'Reds' or 'Viridis'.")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (dim != 2 & dim != 3){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (is.logical(preview) == FALSE){
    stop("A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # create output
  if (preview == TRUE){

    # construct image
    out <- bi_legend(pal = pal, dim = dim, size = 16, flip_axes = flip_axes, rotate_pal = rotate_pal)

  } else if (preview == FALSE){

    # construct vectors
    out <- switch(pal,
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
      out <- bi_pal_flip(out)
    }

    if(rotate_pal){
      out <- bi_pal_rotate(out)
    }

  }
  # return output
  return(out)

}

# dark violet palette
pal_dkviolet <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#3F2949", # high x, high y
      "1-2" = "#4885C1", # low x, high y
      "2-1" = "#AE3A4E", # high x, low y
      "1-1" = "#CABED0" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#3F2949", # high x, high y
      "2-3" = "#435786",
      "1-3" = "#4885C1", # low x, high y
      "3-2" = "#77324C",
      "2-2" = "#806A8A", # medium x, medium y
      "1-2" = "#89A1C8",
      "3-1" = "#AE3A4E", # high x, low y
      "2-1" = "#BC7C8F",
      "1-1" = "#CABED0" # low x, low y
    )

  }

  # return output
  return(out)

}

# gray pink palette
pal_grpink <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#574249", # high x, high y
      "1-2" = "#64ACBE", # low x, high y
      "2-1" = "#C85A5A", # high x, low y
      "1-1" = "#E8E8E8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#574249", # high x, high y
      "2-3" = "#627F8C",
      "1-3" = "#64ACBE", # low x, high y
      "3-2" = "#985356",
      "2-2" = "#AD9EA5", # medium x, medium y
      "1-2" = "#B0D5DF",
      "3-1" = "#C85A5A", # high x, low y
      "2-1" = "#E4ACAC",
      "1-1" = "#E8E8E8" # low x, low y
    )

  }

  # return output
  return(out)

}

# dark blue palette
pal_dkblue <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#3B4994", # high x, high y
      "1-2" = "#BE64AC", # low x, high y
      "2-1" = "#5AC8C8", # high x, low y
      "1-1" = "#E8E8E8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#3B4994", # high x, high y
      "2-3" = "#8C62AA",
      "1-3" = "#BE64AC", # low x, high y
      "3-2" = "#5698B9",
      "2-2" = "#A5ADD3", # medium x, medium y
      "1-2" = "#DFB0D6",
      "3-1" = "#5AC8C8", # high x, low y
      "2-1" = "#ACE4E4",
      "1-1" = "#E8E8E8" # low x, low y
    )

  }

  # return output
  return(out)

}

# dark cyan palette
pal_dkcyan <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#2A5A5B", # high x, high y
      "1-2" = "#73AE80", # low x, high y
      "2-1" = "#6C83B5", # high x, low y
      "1-1" = "#E8E8E8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#2A5A5B", # high x, high y
      "2-3" = "#5A9178",
      "1-3" = "#73AE80", # low x, high y
      "3-2" = "#567994",
      "2-2" = "#90B2B3", # medium x, medium y
      "1-2" = "#B8D6BE",
      "3-1" = "#6C83B5", # high x, low y
      "2-1" = "#B5C0DA",
      "1-1" = "#E8E8E8" # low x, low y
    )

  }

  # return output
  return(out)

}

# brown palette
pal_brown <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#804D36", # high x, high y
      "1-2" = "#9972AF", # low x, high y
      "2-1" = "#C8B35A", # high x, low y
      "1-1" = "#E8E8E8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#804D36", # high x, high y
      "2-3" = "#976B82",
      "1-3" = "#9972AF", # low x, high y
      "3-2" = "#AF8E53",
      "2-2" = "#C8ADA0", # medium x, medium y
      "1-2" = "#CBB8D7",
      "3-1" = "#C8B35A", # high x, low y
      "2-1" = "#E4D9AC",
      "1-1" = "#E8E8E8" # low x, low y
    )

  }

  # return output
  return(out)

}

# blue gold palette
pal_blgold <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#000000", # high x, high y
      "1-2" = "#f4b301", # low x, high y
      "2-1" = "#4f9dc1", # high x, low y
      "1-1" = "#e8e6f3" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#000000", # high x, high y
      "2-3" = "#795a00",
      "1-3" = "#f4b301", # low x, high y
      "3-2" = "#284e61",
      "2-2" = "#8d916e", # medium x, medium y
      "1-2" = "#f2d379",
      "3-1" = "#4f9dc1", # high x, low y
      "2-1" = "#a2c8db",
      "1-1" = "#e8e6f3" # low x, low y
    )

  }


  # return output
  return(out)

}

# blue orange palette
pal_blorange <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#5b473c", # high x, high y
      "1-2" = "#18ade5", # low x, high y
      "2-1" = "#f3742d", # high x, low y
      "1-1" = "#fef0e3" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#5b473c", # high x, high y
      "2-3" = "#407b8f",
      "1-3" = "#18ade5", # low x, high y
      "3-2" = "#aa5f36",
      "2-2" = "#b0988c", # medium x, medium y
      "1-2" = "#98d0e7",
      "3-1" = "#f3742d", # high x, low y
      "2-1" = "#fab186",
      "1-1" = "#fef0e3" # low x, low y
    )

  }

  # return output
  return(out)

}

# blue yellow (x darkness)
pal_blyellow <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#007fc4", # high x, high y
      "1-2" = "#d3e4f6", # low x, high y
      "2-1" = "#efd100", # high x, low y
      "1-1" = "#fffdf0" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#007fc4", # high x, high y
      "2-3" = "#a1c7eb",
      "1-3" = "#d3e4f6", # low x, high y
      "3-2" = "#4eb87a",
      "2-2" = "#bfdebc", # medium x, medium y
      "1-2" = "#e6f1e0",
      "3-1" = "#efd100", # high x, low y
      "2-1" = "#fff3a9",
      "1-1" = "#fffdf0" # low x, low y
    )

  }

  # return output
  return(out)

}

# classic viridis
pal_viridis <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#218f8c", # high x, high y
      "1-2" = "#fef286", # low x, high y
      "2-1" = "#9874a0", # high x, low y
      "1-1" = "#e8f4f3" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#218f8c", # high x, high y
      "2-3" = "#72cf8e",
      "1-3" = "#fef286", # low x, high y
      "3-2" = "#6381a6",
      "2-2" = "#86c2c0", # medium x, medium y
      "1-2" = "#def1c1",
      "3-1" = "#9874a0", # high x, low y
      "2-1" = "#c1bdd6",
      "1-1" = "#e8f4f3" # low x, low y
    )

  }

  # return output
  return(out)

}

# diverging palette (dim 3 recommended)
pal_diverging <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#b30101", # high x, high y
      "1-2" = "#240d5f", # low x, high y
      "2-1" = "#ffcc80", # high x, low y
      "1-1" = "#c3b3d8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#b30101", # high x, high y
      "2-3" = "#7f7f7f",
      "1-3" = "#240d5f", # low x, high y
      "3-2" = "#f35927",
      "2-2" = "#bfbfbf", # medium x, medium y
      "1-2" = "#7b67ac",
      "3-1" = "#ffcc80", # high x, low y
      "2-1" = "#e6e6e6",
      "1-1" = "#c3b3d8" # low x, low y
    )

  }

  # return output
  return(out)

}

# green pink
pal_gnpink <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#8a6458", # high x, high y
      "1-2" = "#cf1989", # low x, high y
      "2-1" = "#4caa25", # high x, low y
      "1-1" = "#e8e8e8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#8a6458", # high x, high y
      "2-3" = "#b13b72",
      "1-3" = "#cf1989", # low x, high y
      "3-2" = "#6c8746",
      "2-2" = "#bf9b93", # medium x, medium y
      "1-2" = "#f2b7df",
      "3-1" = "#4caa25", # high x, low y
      "2-1" = "#b6de86",
      "1-1" = "#e8e8e8" # low x, low y
    )

  }

  # return output
  return(out)

}

# green purple
pal_gnpurp <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#3e4f61", # high x, high y
      "1-2" = "#7a3192", # low x, high y
      "2-1" = "#028633", # high x, low y
      "1-1" = "#e8e8e8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#3e4f61", # high x, high y
      "2-3" = "#5d477a",
      "1-3" = "#7a3192", # low x, high y
      "3-2" = "#007052",
      "2-2" = "#9aa9ae", # medium x, medium y
      "1-2" = "#c3a4cc",
      "3-1" = "#028633", # high x, low y
      "2-1" = "#a7da9f",
      "1-1" = "#e8e8e8" # low x, low y
    )

  }

  # return output
  return(out)

}

# orange purple
pal_orgpurp <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#a04e50", # high x, high y
      "1-2" = "#5e3c94", # low x, high y
      "2-1" = "#e75f01", # high x, low y
      "1-1" = "#e8e8e8" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#a04e50", # high x, high y
      "2-3" = "#7e4572",
      "1-3" = "#5e3c94", # low x, high y
      "3-2" = "#c25525",
      "2-2" = "#b67878", # medium x, medium y
      "1-2" = "#b2a9cd",
      "3-1" = "#e75f01", # high x, low y
      "2-1" = "#fdb861",
      "1-1" = "#e8e8e8" # low x, low y
    )

  }

  # return output
  return(out)

}

# orange purple
pal_fire <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#c40000", # high x, high y
      "1-2" = "#ffcf73", # low x, high y
      "2-1" = "#a67373", # high x, low y
      "1-1" = "#f9e5e5" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#c40000", # high x, high y
      "2-3" = "#f68c39",
      "1-3" = "#ffcf73", # low x, high y
      "3-2" = "#aa3939",
      "2-2" = "#df7373", # medium x, medium y
      "1-2" = "#fedaac",
      "3-1" = "#a67373", # high x, low y
      "2-1" = "#d3acac",
      "1-1" = "#f9e5e5" # low x, low y
    )

  }

  # return output
  return(out)

}

# orange purple
pal_reds <- function(n){

  # construct palette
  if (n == 2){

    out <- c(
      "2-2" = "#7f0000", # high x, high y
      "1-2" = "#fe7373", # low x, high y
      "2-1" = "#737373", # high x, low y
      "1-1" = "#f2e5e5" # low x, low y
    )

  } else if (n == 3){

    out <- c(
      "3-3" = "#7f0000", # high x, high y
      "2-3" = "#c63939",
      "1-3" = "#fe7373", # low x, high y
      "3-2" = "#723939",
      "2-2" = "#b97373", # medium x, medium y
      "1-2" = "#f2acac",
      "3-1" = "#737373", # high x, low y
      "2-1" = "#b9acac",
      "1-1" = "#f2e5e5" # low x, low y
    )

  }

  # return output
  return(out)

}

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
