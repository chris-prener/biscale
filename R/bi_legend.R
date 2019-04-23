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
  out <- x %>%
    tidyr::separate(bs_class, into = c("x", "y"), sep = " - ") %>%
    dplyr::mutate(x = as.integer(x), y = as.integer(y))

  # return output
  return(out)

}
