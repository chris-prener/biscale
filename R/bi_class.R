#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a bivariate map. These data will be stored
#'     in a new variable named \code{bi_class}, which will be added to the given
#'     data object.
#'
#' @usage bi_class(.data, x, y, style = "quantile", dim = 3, keep_factors = FALSE)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable
#' @param y The \code{y} variable
#' @param style A string identifying the style used to calculate breaks. Currently
#'     supported styles are \code{"quantile"} (default), \code{"equal"}, \code{"fisher"},
#'     and \code{"jenks"}.
#' @param dim The dimensions of the palette, either \code{2} for a two-by-two palette or
#'     \code{3} for a three-by-three palette.
#' @param keep_factors A logical scalar; if \code{TRUE}, the intermediate factor
#'     variables created as part of the calculation of \code{bs_class} will be
#'     retained. If \code{FALSE} (default), they will not be returned.
#'
#' @return A copy of \code{.data} with a new variable \code{bi_class} that contains
#'     combinations of values that correspond to an observations values for \code{x}
#'     and \code{y}. This is the basis for applying a bivariate color palette.
#'
#' @importFrom classInt classIntervals
#' @importFrom dplyr mutate pull select
#' @importFrom glue glue
#' @importFrom rlang enquo quo quo_name sym
#' @importFrom stats quantile
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
#' # equal breaks
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "equal", dim = 3)
#'
#' # summarize equal breaks, 3x3
#' table(data$bi_class)
#'
#' # fisher breaks
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "fisher", dim = 3)
#'
#' # summarize fisher breaks, 3x3
#' table(data$bi_class)
#'
#' # jenks breaks
#' data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "jenks", dim = 3)
#'
#' # summarize jenks breaks, 3x3
#' table(data$bi_class)
#'
#' @export
bi_class <- function(.data, x, y, style = "quantile", dim = 3, keep_factors = FALSE){

  # global bindings
  bi_x = bi_y = NULL

  # check inputs
  if (missing(.data)) {
    stop("An object containing data must be specified for the '.data' argument.")
  }

  if (missing(x)) {
    stop("A variable must be given for the 'x' argument.")
  }

  if (missing(y)) {
    stop("A variable must be given for the 'y' argument.")
  }

  if (style %in% c("quantile", "equal", "fisher", "jenks") == FALSE){
    stop("The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
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

  # check data
  if ("sf" %in% class(.data) == TRUE & "sf" %in% (.packages()) == FALSE){
    warning("The 'sf' package is not loaded, and the class 'sf' attribute of the given data set has been lost. Load 'sf' to retain the class when using 'bi_class'.")
  }

  # save parameters to list
  paramList <- as.list(match.call())

  # nse
  if (!is.character(paramList$x)) {
    xQ <- rlang::enquo(x)
  } else if (is.character(paramList$x)) {
    xQ <- rlang::quo(!! rlang::sym(x))
  }

  xQN <- rlang::quo_name(rlang::enquo(x))

  if (!is.character(paramList$y)) {
    yQ <- rlang::enquo(y)
  } else if (is.character(paramList$y)) {
    yQ <- rlang::quo(!! rlang::sym(y))
  }

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

  # create three bins for x and y
  bins_x <- dplyr::pull(.data, !!xQ)
  bins_y <- dplyr::pull(.data, !!yQ)

  # calculate breaks
  if (style == "quantile"){

    bins_x <- classInt::classIntervals(bins_x, n = dim, style = "quantile")
    bins_y <- classInt::classIntervals(bins_y, n = dim, style = "quantile")

  } else if (style == "equal"){

    bins_x <- classInt::classIntervals(bins_x, n = dim, style = "equal")
    bins_y <- classInt::classIntervals(bins_y, n = dim, style = "equal")

  } else if (style == "fisher"){

    bins_x <- classInt::classIntervals(bins_x, n = dim, style = "fisher")
    bins_y <- classInt::classIntervals(bins_y, n = dim, style = "fisher")

  } else if (style == "jenks"){

    bins_x <- classInt::classIntervals(bins_x, n = dim, style = "jenks")
    bins_y <- classInt::classIntervals(bins_y, n = dim, style = "jenks")

  }

  # convert to breaks
  bins_x <- bins_x$brks
  bins_y <- bins_y$brks

  # cut into groups defined above
  out <- dplyr::mutate(.data, bi_x = cut(!!xQ, breaks = bins_x, include.lowest = TRUE))
  out <- dplyr::mutate(out, bi_y = cut(!!yQ, breaks = bins_y, include.lowest = TRUE))
  out <- dplyr::mutate(out, bi_class = paste0(as.numeric(bi_x), "-", as.numeric(bi_y)))

  # optionally remove factors
  if (keep_factors == FALSE){
    out <- dplyr::select(out, -c(bi_x, bi_y))
  }

  # return output
  return(out)

}
