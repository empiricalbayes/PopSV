% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mean.sd.outlierR.R
\name{mean.sd.outlierR}
\alias{mean.sd.outlierR}
\title{Mean and standard diviation after outlier removal}
\usage{
\method{mean}{sd.outlierR}(x, pv.max.ol = 1e-06)
}
\arguments{
\item{x}{a vector of numeric values.}

\item{pv.max.ol}{the maximum P-value for the Grubbs test. Any outlier
with a P-value lower will be considered as outlier.}
}
\value{
a vector similar to 'x' but with NAs for outliers.
}
\description{
Computes the mean and standard deviation after removing outlier groups.
\code{outliers} package and Grubbs approach are used.
}
\author{
Jean Monlong
}
\keyword{internal}
