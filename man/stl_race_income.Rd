% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stl_race_income.R
\docType{data}
\name{stl_race_income}
\alias{stl_race_income}
\title{Race and Median Income in St. Louis by Census Tract, 2017}
\format{
A data frame with 106 rows and 4 variables:
\describe{
  \item{GEOID}{full GEOID string}
  \item{pctWhite}{Percent of white residents per tract}
  \item{medInc}{Median household income of tract}
  \item{geometry}{simple features geometry}
  }
}
\source{
\code{tidycensus} package
}
\usage{
data(stl_race_income)
}
\description{
A simple features data set containing the geometry and associated attributes
    for the 2013-2017 American Community Survey estimates for median household income and the
    percentage of white residents in St. Louis. This version of the sample data are stored
    as polygon data.
}
\examples{
str(stl_race_income)
head(stl_race_income)
summary(stl_race_income$medInc)

}
\keyword{datasets}
