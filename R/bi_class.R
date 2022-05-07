#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a bivariate map. These data will be stored
#'     in a new variable named \code{bi_class}, which will be added to the given
#'     data object.
#'
#' @usage bi_class(.data, x, y, style, dim = 3, keep_factors = FALSE)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable
#' @param y The \code{y} variable
#' @param style A string identifying the style used to calculate breaks. Currently
#'     supported styles are \code{"quantile"} (default), \code{"equal"}, \code{"fisher"},
#'     and \code{"jenks"}. If both \code{x} and \code{y} are factors, this argument can
#'     be omitted.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
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
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (dim != 2 & dim != 3){
    stop("The 'dim' argument only accepts the numeric values '2' or '3'.")
  }

  if (is.logical(keep_factors) == FALSE){
    stop("A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
  }

  # nse
  xQN <- rlang::quo_name(rlang::enquo(x))
  yQN <- rlang::quo_name(rlang::enquo(y))

  # check variables
  if (xQN %in% names(.data) == FALSE){
    stop(glue::glue("The given 'x' variable '{var}' is not found in the given data set.",
                    var = xQN))
  }

  if (yQN %in% names(.data) == FALSE){
    stop(glue::glue("The given 'y' variable '{var}' is not found in the given data set.",
                    var = yQN))
  }

  # evaluate x
  if (class(.data[[xQN]]) %in% c("integer", "double", "numeric")){

    if (missing(style)){
      stop("Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    if (style %in% c("quantile", "equal", "fisher", "jenks") == FALSE){
      stop("The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    out <- .data
    out$bi_y <- cut(out[[xQN]], breaks = classInt::classIntervals(out[[xQN]], n = dim, style = style)$brks,
                    include.lowest = TRUE)

  } else if (class(.data[[xQN]]) == "factor"){

    if (length(levels(.data[[xQN]])) != dim){
      stop(glue::glue("The given 'x' variable '{var}' has a different number of levels than the value given for the 'dim' argument.",
                      var = xQN))
    }

    out <- .data
    names(out)[names(out) == xQN] <- "bi_x"


  } else {
    stop(glue::glue("The given 'x' variable '{var}' is not the correct class. It must be either integer, double, or factor.",
                    var = xQN))
  }

  # evaluate y
  if (class(.data[[yQN]]) %in% c("integer", "double", "numeric")){

    if (missing(style)){
      stop("Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    if (style %in% c("quantile", "equal", "fisher", "jenks") == FALSE){
      stop("The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    out$bi_y <- cut(out[[yQN]], breaks = classInt::classIntervals(out[[yQN]], n = dim, style = style)$brks,
                    include.lowest = TRUE)

  } else if (class(.data[[yQN]]) == "factor"){

    if (length(levels(.data[[yQN]])) != dim){
      stop(glue::glue("The given 'y' variable '{var}' has a different number of levels than the value given for the 'dim' argument.",
                      var = yQN))
    }

    names(out)[names(out) == yQN] <- "bi_y"

  } else {
    stop(glue::glue("The given 'y' variable '{var}' is not the correct class. It must be either integer, double, or factor.",
                    var = yQN))
  }

  # combine
  out$bi_class <- paste0(as.numeric(out$bi_x), "-", as.numeric(out$bi_y))

  # optionally remove factors
  if (keep_factors == FALSE){
    out <- subset(out, select = -c(bi_x, bi_y))
  }

  # return output
  return(out)

}
