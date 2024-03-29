% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{bostonhouseprice}
\alias{bostonhouseprice}
\title{Boston House Price Data (Original)}
\format{
A data frame with 506 rows and 9 variables:
\describe{
   \item{crime}{crimes committed per capita}
   \item{rooms}{average number of rooms per house}
   \item{radial}{index of accessibility to radial highways}
   \item{stratio}{average student-teacher ratio of schools in the community}
   \item{lowstat}{percentage of the population that are "lower status"}
   \item{lnox}{log(annual average nitrogen oxide concentration (pphm))}
   \item{lproptax}{log(property tax per $1000)}
   \item{ldist}{log(weighted distances to five employment centres in the Boston region)}
   \item{lprice}{log(median house price ($))}
   }
}
\source{
\url{https://CRAN.R-project.org/package=wooldridge}
}
\usage{
bostonhouseprice
}
\description{
Original data, which come from a study by Harrison Jr and Rubinfeld (1978), examining
the association between median house prices in a particular community with
various community characteristics. See \code{\link{bostonhouseprice2}}
for the corrected version, with additional variables.
}
\references{
Harrison Jr, D. and Rubinfeld, D. L. (1978). Hedonic housing prices and the
demand for clean air. Journal of environmental economics and management, 5(1):81-102.

Wooldridge, J. M. (2015). Introductory econometrics: A modern approach. Cengage learning.
}
\keyword{datasets}
