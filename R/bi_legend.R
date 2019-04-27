#' Create Object for Drawing Legend
#'
#' @description Creates a tibble that can be used as the basis for
#'     drawing a legend.
#'
#' @usage bi_legend(pal)
#'
#' @param pal A palette name
#'
#' @importFrom dplyr mutate tibble
#' @importFrom ggplot2 aes coord_fixed element_text geom_tile ggplot labs
#'     scale_fill_identity theme
#' @importFrom tidyr separate
#'
#' @export
bi_legend <- function(pal, xlab, ylab, size){

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

  # create tibble for plotting
  x <- dplyr::tibble(
    bs_class = names(x),
    bs_fill = x
  )

  # reformat
  leg <- tidyr::separate(x, bs_class, into = c("x", "y"), sep = "-")
  leg <- dplyr::mutate(leg, x = as.integer(x), y = as.integer(y))

  # create ggplot2 legend object
  legend <- ggplot2::ggplot() +
    ggplot2::geom_tile(data = leg, mapping = ggplot2::aes(x = x, y = y, fill = bs_fill)) +
    ggplot2::scale_fill_identity() +
    ggplot2::labs(x = substitute(paste(xlab, ""%->%"")), y = substitute(paste(ylab, ""%->%""))) +
    bi_theme() +
    ggplot2::theme(axis.title = ggplot2::element_text(size = size)) +
    ggplot2::coord_fixed()

  # return output
  return(legend)

}
