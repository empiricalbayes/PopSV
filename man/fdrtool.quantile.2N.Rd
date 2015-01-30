% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/fdrtool.quantile.2N.R
\name{fdrtool.quantile.2N}
\alias{fdrtool.quantile.2N}
\title{P-values estimation from mixture of 2 centered normal}
\usage{
fdrtool.quantile.2N(z, plot = TRUE, min.prop.null = 0.95)
}
\arguments{
\item{z}{a vector with the Z-scores}

\item{plot}{should some graphs be displayed. Default if FALSE.}

\item{min.prop.null}{the minimum proportion of the genome expected to be normal.Recommended: 0.8 for "normal" samples, 0.4 (default) for tumor samples.}
}
\value{
a list with
\item{pval}{the vector of P-values}
\item{qval}{the vector of Q-values / FDR estimates}
\item{sigma.est.dup}{the estimated null distribution variance for positive Z-scores}
\item{sigma.est.del}{the estimated null distribution variance for negative Z-scores}
}
\description{
Compute P-values and Q-values from the Z-score distribution.
}
\author{
Jean Monlong
}
\keyword{internal}
