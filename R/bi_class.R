#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a bivariate map. These data will be stored
#'     in a new variable named \code{bi_class}, which will be added to the given
#'     data object.
#'
#' @usage bi_class(.data, x, y, style, dim = 3, keep_factors = FALSE)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable, either a numeric (including double and integer
#'     classes) or factor
#' @param y The \code{y} variable, either a numeric (including double and integer
#'     classes) or factor
#' @param style A string identifying the style used to calculate breaks. Currently
#'     supported styles are \code{"quantile"} (default), \code{"equal"}, \code{"fisher"},
#'     and \code{"jenks"}. If both \code{x} and \code{y} are factors, this argument can
#'     be omitted.
#' @param dim The dimensions of the palette. To use the built-in palettes,
#'     this value must be either \code{2}, \code{3}, or \code{4}. A value of
#'     \code{3}, for example, would be used to create a three-by-three bivariate
#'     map with a total of 9 classes.
#'
#'     If you are using a custom palette, this value may be larger (though these
#'     maps can be very hard to interpret).
#'
#'     If you are using pre-made factors, both factors must have the same number
#'     of levels as this value.
#' @param keep_factors A logical scalar; if \code{TRUE}, the intermediate factor
#'     variables created as part of the calculation of \code{bi_class} will be
#'     retained. If \code{FALSE} (default), they will not be returned.
#'
#' @return A copy of \code{.data} with a new variable \code{bi_class} that contains
#'     combinations of values that correspond to an observations values for \code{x}
#'     and \code{y}. This is the basis for applying a bivariate color palette.
#'
#' @examples
#' # quantile breaks, 2x2
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 2)
#'
#' # summarize quantile breaks, 2x2
#' table(data$bi_class)
#'
#' # quantile breaks, 3x3
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3)
#'
#' # summarize quantile breaks, 3x3
#' table(data$bi_class)
#'
#' @export
bi_class <- function(.data, x, y, style, dim = 3, keep_factors = FALSE){

  # global bindings
  bi_x = bi_y = NULL

  # check inputs
  if (missing(.data)) {
    stop("An object containing data must be specified for the '.data' argument.")
  }

  # check inputs
  if (missing(x)) {
    stop("A variable must be given for the 'x' argument.")
  }

  if (missing(y)) {
    stop("A variable must be given for the 'y' argument.")
  }

  if (is.numeric(dim) == FALSE){
    stop("The 'dim' argument only accepts numeric values.")
  }

  if (is.logical(keep_factors) == FALSE){
    stop("A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (missing(style)){
    style <- NULL
  }

  # high dimension warning
  if (dim > 4){
    warning("Maps that are larger than 4x4 dimensions can be difficult to interpret, and biscale does not provide built-in palettes for these maps. If you proceed, you will need to supply a custom palette for these data.")
  }

  # nse
  xQN <- rlang::quo_name(rlang::enquo(x))
  yQN <- rlang::quo_name(rlang::enquo(y))

  # evaluate inputs
  bi_var_validate(.data, var = xQN, dim = dim, style = style)
  bi_var_validate(.data, var = yQN, dim = dim, style = style)

  # calculate classes
  .data <- bi_var_cut(.data, var = xQN, new_var = "bi_x", dim = dim, style = style)
  .data <- bi_var_cut(.data, var = yQN, new_var = "bi_y", dim = dim, style = style)

  # combine
  .data$bi_class <- paste0(as.numeric(.data$bi_x), "-", as.numeric(.data$bi_y))

  # optionally remove factors
  if (keep_factors == FALSE){
    .data <- subset(.data, select = -c(bi_x, bi_y))
  }

  # return output
  return(.data)

}

#' Return Breaks
#'
#' @export
bi_class_breaks <- function(.data, x, y, style, dim){

  return(.data)

}

#' Validate
#'
#'
bi_var_validate <- function(.data, var, dim, style){

  if (var %in% names(.data) == FALSE){
    stop(glue::glue("The variable '{var}' is not found in the given data set.",
                    var = var))
  }

  if (inherits(x = .data[[var]], what = "factor")){

    if (length(levels(.data[[var]])) != dim){
      stop(glue::glue("The variable '{var}' has a different number of levels than the value given for the 'dim' argument.",
                      var = var))
    }

  } else if (inherits(x = .data[[var]], what = c("integer", "double", "numeric"))){

    if (is.null(style) == TRUE){
      stop("Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    if (style %in% c("quantile", "equal", "fisher", "jenks") == FALSE){
      stop(glue::glue("The style '{style}' is not a valid method for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.",
                      var = style))
    }

  } else {

    stop(glue::glue("The variable '{var}' is not the correct class. It must be either integer, double, or factor.",
                    var = var))

  }

}


#' Cut
#'
#'
bi_var_cut <- function(.data, var, new_var, dim, style){

  if (inherits(x = .data[[var]], what = "factor")){

    .data[[new_var]] <- .data[[var]]

  } else if (inherits(x = .data[[var]], what = c("integer", "double", "numeric"))){

    .data[[new_var]] <- cut(.data[[var]], breaks = classInt::classIntervals(.data[[var]], n = dim, style = style)$brks,
                            include.lowest = TRUE)

  }

  # return output
  return(.data)

}
