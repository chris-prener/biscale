#' Race and Median Income in St. Louis by Census Tract, 2017
#'
#' @description A simple features data set containing the geometry and associated attributes
#'     for the 2013-2017 American Community Survey estimates for median household income and the
#'     percentage of white residents in St. Louis. This version of the sample data are stored
#'     as point data.
#'
#' @docType data
#'
#' @usage data(stl_race_income_point)
#'
#' @format A data frame with 106 rows and 4 variables:
#' \describe{
#'   \item{GEOID}{full GEOID string}
#'   \item{pctWhite}{Percent of white residents per tract}
#'   \item{medInc}{Median household income of tract}
#'   \item{geometry}{simple features geometry}
#'   }
#'
#' @source \code{tidycensus} package
#'
#' @examples
#' str(stl_race_income_point)
#' head(stl_race_income_point)
#' summary(stl_race_income_point$medInc)
#'
"stl_race_income_point"
