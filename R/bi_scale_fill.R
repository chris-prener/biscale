bi_scale_fill <- function(pal, ...){

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

  ggplot2::scale_fill_manual(values = x, ...)

}
