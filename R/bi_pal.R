#' Print Hex Values for Palette
#'
#' @description Prints the hex values for a specified palette.
#'
#' @usage bi_pal(pal)
#'
#' @param pal The name of the palette to print hex values for.
#'
#' @export
bi_pal <- function(pal){

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

  return(out)

}

pal_dkviolet <- function(){

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

  return(out)

}


pal_grpink <- function(){

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

  return(out)

}

pal_dkblue <- function(){

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

  return(out)

}

pal_dkcyan <- function(){

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

  return(out)

}

pal_brown <- function(){

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

  return(out)

}
