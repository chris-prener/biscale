#' Create Classes for Bivariate Maps
#'
#' @description Creates mapping classes for a bivariate map. These data will be stored
#'     in a new variable named \code{bi_class}, which will be added to the given
#'     data object.
#'
#' @usage bi_class(.data, x, y, style, dim = 3, keep_factors = FALSE, dig_lab = 3)
#'
#' @param .data A data frame, tibble, or \code{sf} object
#' @param x The \code{x} variable, either a numeric (including double and integer
#'     classes) or factor
#' @param y The \code{y} variable, either a numeric (including double and integer
#'     classes) or factor
#' @param style A string identifying the style used to calculate breaks. Currently
#'     supported styles are \code{"quantile"}, \code{"equal"}, \code{"fisher"},
#'     and \code{"jenks"}. If both \code{x} and \code{y} are factors, this argument can
#'     be omitted.
#'
#'     Note that older versions of \code{biscale} used \code{"quantile"} as the default
#'     for this argument. Now that \code{bi_class} accepts factors, this argument
#'     no longer as a default and older code will error.
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
#' @param dig_lab An integer that is passed to \code{base::cut()}
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
bi_class <- function(.data, x, y, style, dim = 3, keep_factors = FALSE, dig_lab = 3){

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
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  if (dim < 2 | (dim %% 1 == 0) == FALSE){
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  if (is.logical(keep_factors) == FALSE){
    stop("A logical scalar must be supplied for 'keep_factors'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (missing(style)){
    style <- NULL
  }

  dig_vals <- bi_validate_dig_lab(dig_lab = dig_lab)

  # high dimension warning
  if (dim > 4){
    warning("Maps that are larger than 4x4 dimensions can be difficult to interpret, and biscale does not provide built-in palettes for these maps. If you proceed, you will need to supply a custom palette for these data.")
  }

  # nse
  xQN <- as.character(substitute(x))
  yQN <- as.character(substitute(y))

  # evaluate inputs
  bi_var_validate(.data, var = xQN, dim = dim, style = style)
  bi_var_validate(.data, var = yQN, dim = dim, style = style)

  # calculate classes
  .data <- bi_var_cut(.data, var = xQN, new_var = "bi_x", dim = dim, style = style, dig_lab = dig_vals[1])
  .data <- bi_var_cut(.data, var = yQN, new_var = "bi_y", dim = dim, style = style, dig_lab = dig_vals[2])

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
#' @description This function can be used to return a list containing vectors
#'     of either the ranges of values included in each category of \code{x}
#'     and \code{y} or, alternatively, the individual break values including
#'     the minimum and maximum values. This function supports simplified
#'     reporting as well as more descriptive legends.
#'
#' @usage bi_class_breaks(.data, x, y, style, dim = 3, clean_levels = TRUE,
#'     dig_lab = 3, split = FALSE)
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
#' @param clean_levels A logical scalar; if \code{TRUE} (default), the
#'     brackets and parentheses will be stripped from the output. If \code{FALSE}
#'     (default), the levels will be returned with brackets and parentheses. If
#'     \code{split} is \code{TRUE} and \code{clean_levels} is \code{FALSE},
#'     the \code{clean_levels} argument will be overridden.
#' @param dig_lab An integer that is passed to \code{base::cut()}; it determines
#'     the number of digits used in formatting break numbers. It can either be
#'     a scalar or a vector. If it is a scalar, the value will be applied to both
#'     the \code{x} and \code{y} variables. If it is a vector, the first element
#'     will be applied to the \code{x} variable and the second will be applied
#'     to the \code{y} variable.
#' @param si_levels A logical scalar or vector of length 2 that where \code{TRUE},
#'     and taking into account \code{dig_lab} (default = 3), rounds the
#'     level(s) and applies one of a few selected SI prefixes, if
#'     appropriate. Affects either or both the display of the \code{x} and
#'     \code{y} variables based on the same syntax as the \code{dig_lab}
#'     parameter. Defaults to \code{FALSE} (no adjustment to either variable).
#' @param split A logical scalar; if \code{FALSE} (default), the range of values
#'     for each factor level (corresponds to \code{dim}) will be returned for
#'     both the \code{x} and \code{y} variables. If \code{TRUE}, the individual
#'     values for each break (including the minimum and maximum values) will be
#'     returned.
#'
#' @return A list where \code{bi_x} is a vector containing the breaks for the
#'     \code{x} variable and \code{bi_y} is a vector containing the breaks for
#'     the \code{y} variable.
#'
#' @examples
#' # return ranges for each category of x and y
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     dim = 4, dig_lab = c(4, 5), split = FALSE)
#'
#' # ranges can be returned with brackets and parentheses
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     clean_levels = FALSE, dim = 4, dig_lab = 3, split = FALSE)
#'
#' # return breaks for each category of x and y
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     dim = 4, dig_lab = c(4, 5), split = TRUE)
#'
#' # show SI prefix
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     dim = 4, dig_lab = c(4, 5), si_levels = c(y = TRUE), split = TRUE)
#'
#' # optionally name vector for dig_lab for increased clarity of code
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     dim = 4, dig_lab = c(x = 4, y = 5), split = TRUE)
#'
#' # scalars can also be used for dig_lab, though results may be less optimal
#' bi_class_breaks(stl_race_income, style = "quantile", x = pctWhite, y = medInc,
#'     dim = 4, dig_lab = 3, split = TRUE)
#'
#' @export
bi_class_breaks <- function(.data, x, y, style, dim = 3, clean_levels = TRUE,
                            dig_lab = 3, si_levels = FALSE, split = FALSE){

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
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  if (dim < 2 | (dim %% 1 == 0) == FALSE){
    stop("An integer scalar must be supplied for 'dim' that is greater than or equal to '2'.")
  }

  if (is.logical(clean_levels) == FALSE){
    stop("A logical scalar must be supplied for 'clean_levels'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (is.logical(split) == FALSE){
    stop("A logical scalar must be supplied for 'split'. Please provide either 'TRUE' or 'FALSE'.")
  }

  if (split == TRUE & clean_levels == FALSE){
    warning("Splitting levels requires level cleaning as well. The 'clean_levels' argument has been overridden.")
  }

  if (missing(style)){
    style <- NULL
  }

  # high dimension warning
  if (dim > 4){
    warning("Maps that are larger than 4x4 dimensions can be difficult to interpret, and biscale does not provide built-in palettes for these maps. If you proceed, you will need to supply a custom palette for these data.")
  }

  # validate palette
  dig_vals <- bi_validate_dig_lab(dig_lab = dig_lab)
  si_vals  <- bi_validate_si_levels(si_levels = si_levels)

  # nse
  xQN <- as.character(substitute(x))
  yQN <- as.character(substitute(y))

  # evaluate inputs
  bi_var_validate(.data, var = xQN, dim = dim, style = style)
  bi_var_validate(.data, var = yQN, dim = dim, style = style)

  # calculate classes
  .data <- bi_var_cut(.data, var = xQN, new_var = "bi_x", dim = dim, style = style, dig_lab = dig_vals[1])
  .data <- bi_var_cut(.data, var = yQN, new_var = "bi_y", dim = dim, style = style, dig_lab = dig_vals[2])

  # create levels
  out <- list(
    bi_x = levels(.data$bi_x),
    bi_y = levels(.data$bi_y)
  )

  if (sum(si_levels) >= 1) {
    out <- bi_levels_si(levels_list = out, si_vals = si_vals, dig_vals = dig_vals)
  }

  if (clean_levels == TRUE | split == TRUE){
    out <- bi_levels_clean(levels_list = out, split = split)
  }

  # return output
  return(out)

}

# validate variable input
bi_var_validate <- function(.data, var, dim, style){

  if (var %in% names(.data) == FALSE){
    stop(paste0("The variable '", var, "' is not found in the given data set."))
  }

  if (inherits(x = .data[[var]], what = "factor")){

    if (length(levels(.data[[var]])) != dim){
      stop(paste0("The variable '", var, "' has a different number of levels than the value given for the 'dim' argument."))
    }

  } else if (inherits(x = .data[[var]], what = c("integer", "double", "numeric"))){

    if (is.null(style) == TRUE){
      stop("Please specify a style for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'.")
    }

    if (style %in% c("quantile", "equal", "fisher", "jenks") == FALSE){
      stop(paste0("The style '", style, "' is not a valid method for calculating breaks. The allowed styles are 'equal', 'fisher', 'jenks', or 'quantile'."))
    }

  } else {
    stop(paste0("The variable '", var, "' is not the correct class. It must be either integer, double, or factor."))
  }

}


# cut variable
bi_var_cut <- function(.data, var, new_var, dim, style, dig_lab){

  if (inherits(x = .data[[var]], what = "factor")){

    .data[[new_var]] <- .data[[var]]

  } else if (inherits(x = .data[[var]], what = c("integer", "double", "numeric"))){

    .data[[new_var]] <- cut(.data[[var]], breaks = classInt::classIntervals(.data[[var]], n = dim, style = style)$brks,
                            include.lowest = TRUE, dig.lab = dig_lab)

  }

  # return output
  return(.data)

}

# optionally abbreviate with International System of Units (SI)
bi_levels_si <- function(levels_list, si_vals, dig_vals){

  levels_list$bi_y <- gsub("[][()]", "", levels_list$bi_y)
  if (si_vals[1] == TRUE) {
    bi_x_clean <- gsub("[][()]", "", levels_list$bi_x)

    bi_x_clean_start    <- as.numeric(gsub(',.*','', bi_x_clean))
    bi_x_clean_start_si <- si_number(bi_x_clean_start, dig_vals[1])
    bi_x_clean_end      <- as.numeric(gsub('.*,','', bi_x_clean))
    bi_x_clean_end_si   <- si_number(bi_x_clean_end, dig_vals[1])
    levels_list$bi_x    <- paste0(
      # ( or ] captured, otherwise blank
      gsub("\\d", "", substr(levels_list$bi_x,1,1)),
      bi_x_clean_start_si, ",",
      bi_x_clean_end_si,
      gsub("\\d", "",
        substr(levels_list$bi_x,nchar(levels_list$bi_x),nchar(levels_list$bi_x)))
    )
  }
  if (si_vals[2] == TRUE) {
    bi_y_clean <- gsub("[][()]", "", levels_list$bi_y)

    bi_y_clean_start    <- as.numeric(gsub(',.*','', bi_y_clean))
    bi_y_clean_start_si <- si_number(bi_y_clean_start, dig_vals[2])
    bi_y_clean_end      <- as.numeric(gsub('.*,','', bi_y_clean))
    bi_y_clean_end_si   <- si_number(bi_y_clean_end, dig_vals[2])
    levels_list$bi_y    <- paste0(
      # ( or ] captured, otherwise blank
      gsub("\\d", "", substr(levels_list$bi_y,1,1)),
      bi_y_clean_start_si, ",",
      bi_y_clean_end_si,
      gsub("\\d", "",
           substr(levels_list$bi_y,nchar(levels_list$bi_y),nchar(levels_list$bi_y)))
    )
  }

  # return output
  return(levels_list)
}

# clean levels created by bi_var_cut
bi_levels_clean <- function(levels_list, split){

  # remove braces
  levels_list$bi_x <- gsub("[][()]", "", levels_list$bi_x)
  levels_list$bi_y <- gsub("[][()]", "", levels_list$bi_y)

  # add dashes
  levels_list$bi_x <- gsub(",", "-", levels_list$bi_x)
  levels_list$bi_y <- gsub(",", "-", levels_list$bi_y)

  # optionally split
  if (split == TRUE){

    levels_list$bi_x <- unique(unlist(strsplit(levels_list$bi_x, "-")))
    levels_list$bi_y <- unique(unlist(strsplit(levels_list$bi_y, "-")))

  }
  # return output
  return(levels_list)

}

# validate dig_lab inputs
bi_validate_dig_lab <- function(dig_lab){

  if (is.numeric(dig_lab) == FALSE){
    stop("A numeric scalar or vector must be supplied for 'dig_lab'.")
  }

  if (length(dig_lab) == 1){

    dig_vals <- c(dig_lab, dig_lab)

  } else if (length(dig_lab) == 2){

    if (is.null(names(dig_lab)) == TRUE){
      dig_vals <- dig_lab
    } else if (all(names(dig_lab) %in% c("x", "y")) == TRUE){
      dig_vals <- c(dig_lab[["x"]], dig_lab[["y"]])
    } else if (all(names(dig_lab) %in% c("x", "y")) == FALSE){
      stop("The vector supplied for the 'dig_lab' argument contains invalid names. Only 'x' and 'y' are accepted for named vectors.")
    }

  } else if (length(dig_lab) > 2) {
    stop("The vector supplied for the 'dig_lab' argument is too long.")
  }

  return(dig_vals)

}

# validate si_levels inputs
bi_validate_si_levels <- function(si_levels){

  if (is.logical(si_levels) == FALSE | anyNA(si_levels)){
    stop("A logical scalar or vector  must be supplied for 'si_levels'.")
  }

  if (length(si_levels) == 1){

    si_vals <- c(si_levels, si_levels)

  } else if (length(si_levels) == 2){

    if (is.null(names(si_levels)) == TRUE){
      si_vals <- si_levels
    } else if (all(names(si_levels) %in% c("x", "y")) == TRUE){
      si_vals <- c(si_levels[["x"]], si_levels[["y"]])
    } else if (all(names(si_levels) %in% c("x", "y")) == FALSE){
      stop("The vector supplied for the 'si_levels' argument contains invalid names. Only 'x' and 'y' are accepted for named vectors.")
    }

  } else if (length(si_levels) > 2) {
    stop("The vector supplied for the 'si_levels' argument is too long.")
  }

  return(si_vals)

}

# For si_levels: Slight modification of @Tarquinnn's function at
#  https://stackoverflow.com/a/59086755/2305061
si_number = function(x, digits) {
  xnum = as.numeric(x)

  compress = function(xnum, n) {
    signif(xnum * 10^(-n), digits)
  }

  ifelse(abs(xnum) >= 1e6,  paste0(compress(xnum, 6), "M"),
  ifelse(abs(xnum) >= 1000, paste0(compress(xnum, 3), "k"),
  ifelse(abs(xnum) >= 1,  as.character(compress(xnum, 0)),
  ifelse(abs(xnum) >= 0.001, paste0(compress(xnum, -3), "m"),
  ifelse(abs(xnum) >= 1e-6, paste0(compress(xnum, -6), "u"),
  as.character(xnum)))))
  )
}
