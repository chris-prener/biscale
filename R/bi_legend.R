#' Create Object for Drawing Legend
#'
#' @description Creates a tibble that can be used as the basis for
#'     drawing a legend.
#'
#' @usage bi_legend(pal)
#'
#' @param pal A palette name
#'
#' @importFrom dplyr mutate
#' @importFrom tidyr separate
#'
#' @export
bi_legend <- function(pal){

  # global binding
  bs_class = x = y = NULL

  # return palette colors
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

  # reformat
  out <- tidyr::separate(x, bs_class, into = c("x", "y"), sep = " - ")
  out <- dplyr::mutate(out, x = as.integer(x), y = as.integer(y))

  # return output
  return(out)

}
