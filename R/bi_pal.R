#' Print Hex Values for Palette
#'
#' @description Prints the hex values for a specified palette.
#'
#' @usage bi_pal(pal)
#'
#' @param pal A palette name; one of \code{"Brown"}, \code{"DkBlue"},
#'     \code{"DkCyan"}, \code{"DkViolet"}, and \code{"GrPink"}.
#'
#' @return A named vector with class values for names and their corresponding
#'     hex color values.
#'
#' @examples
#' bi_pal(pal = "DkBlue")
#' bi_pal(pal = "DkCyan")
#'
#' @export
bi_pal <- function(pal){

  # check parameters
  if (pal %in% c("Brown", "DkBlue", "DkCyan", "DkViolet", "GrPink") == FALSE){
    stop("The given palette is not one of the allowed options for bivariate mapping. Please choose one of: 'Brown', 'DkBlue', 'DkCyan', 'DkViolet', and 'GrPink'.")
  }

  # call sub functions
  if (pal == "DkViolet"){
    x <- pal_dkviolet()
  } else if (pal == "GrPink"){
    x <- pal_grpink()
  } else if (pal == "DkBlue"){
    x <- pal_dkblue()
  } else if (pal == "DkCyan"){
    x <- pal_dkcyan()
  } else if (pal == "Brown"){
    x <- pal_brown()
  }

  # return output
  return(x)

}

# dark violet palette
pal_dkviolet <- function(){

  # construct palette
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

  # return output
  return(out)

}

# gray pink palette
pal_grpink <- function(){

  # construct palette
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

  # return output
  return(out)

}

# dark blue palette
pal_dkblue <- function(){

  # construct palette
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

  # return output
  return(out)

}

# dark cyan palette
pal_dkcyan <- function(){

  # construct palette
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

  # return output
  return(out)

}

# brown palette
pal_brown <- function(){

  # construct palette
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

  # return output
  return(out)

}
