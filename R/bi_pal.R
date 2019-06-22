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
#' @usage bi_pal(pal, dim = 3, preview = TRUE)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, or \code{"GrPink"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param preview A logical scalar; if \code{TRUE} (default), an image preview will
#'     be generated. If \code{FALSE}, a vector with hex color values will be returned.
#'
#' @return If \code{preview = TRUE}, an image preview of the legend will be returned.
#'     Otherwise, if \code{preview = FALSE}, a named vector with class values for names
#'     and their corresponding hex color values.
#'
#' @examples
#' # brown palette, 3x3 preview
#' bi_pal(pal = "Brown", dim = 3)
#'
#' # brown palette, 3x3 hex values
#' bi_pal(pal = "Brown", dim = 3, preview = FALSE)
#'
#' # dark blue palette, 3x3 preview
#' bi_pal(pal = "DkBlue", dim = 3)
#'
#' # dark blue palette, 3x3 hex values
#' bi_pal(pal = "DkBlue", dim = 3, preview = FALSE)
#'
#' # dark cyan palette, 3x3
#' bi_pal(pal = "DkCyan", dim = 3)
#'
#' # dark cyan palette, 3x3 hex values
#' bi_pal(pal = "DkCyan", dim = 3, preview = FALSE)
#'
#' # dark violet palette, 3x3
#' bi_pal(pal = "DkViolet", dim = 3)
#'
#' # dark violet palette, 3x3 hex values
#' bi_pal(pal = "DkViolet", dim = 3, preview = FALSE)
#'
#' # gray pink palette, 3x3
#' bi_pal(pal = "GrPink", dim = 3)
#'
#' # gray pink palette, 3x3 hex values
#' bi_pal(pal = "GrPink", dim = 3, preview = FALSE)
#'
#' @export
bi_pal <- function(pal, dim = 3, preview = TRUE){

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

  if (is.logical(preview) == FALSE){
    stop("A logical scalar must be supplied for 'preview'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # create output
  if (preview == TRUE){

    # construct image
    out <- bi_legend(pal = pal, dim = dim, size = 16)

  } else if (preview == FALSE){

    # construct vectors
    if (pal == "DkViolet"){
      out <- pal_dkviolet(n = dim)
    } else if (pal == "GrPink"){
      out <- pal_grpink(n = dim)
    } else if (pal == "DkBlue"){
      out <- pal_dkblue(n = dim)
    } else if (pal == "DkCyan"){
      out <- pal_dkcyan(n = dim)
    } else if (pal == "Brown"){
      out <- pal_brown(n = dim)
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
