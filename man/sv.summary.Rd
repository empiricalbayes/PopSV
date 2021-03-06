% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sv.summary.R
\name{sv.summary}
\alias{sv.summary}
\title{Abnormal regions summary}
\usage{
sv.summary(res.df, out.pdf = NULL, print = TRUE, FDR.th = 0.05,
  min.cn2Dev = 0, min.cov = 0, max.sing.kb = Inf)
}
\arguments{
\item{res.df}{the data.frame with the results.}

\item{out.pdf}{the name for the output PDF file to create. If NULL (default), the graphs are either displayed directly or returned as a list.}

\item{print}{Should the graphs be displayed ? If 'out.pdf' though, this parameter is not used as no graph will be displayed.}

\item{FDR.th}{the FDR threshold to use. Default is 0.05.}

\item{min.cn2Dev}{the minimum deviation from CN2. Default is 0. Using '0.5' would remove CNVs with CN estimates in [1.5,2.5].}

\item{min.cov}{the minimum coverage in the reference samples. Default is 0.}

\item{max.sing.kb}{the maximum amount of single-bin calls. Default is Inf. Use and tweak when batches or outliers are visible in the calls.}
}
\value{
A list with :
\item{graphs.l}{a list of ggplot graphs}
\item{cnv.df}{a data.frame with the selected CNVs}
\item{info.df}{a data.frame with different summary statistics}
}
\description{
Summary of regions with abnormal coverage as detected by 'call.abnomal.cov'. It's a static version of 'sv.summary.interactive'. It produces graphs to to get an idea of the quality of the calls. For normal samples we would expect: the amount of called genome in each sample to be somewhat similar; the copy number estimates to locate near integer values; No systematic calls (i.e. called in all samples). The output graphs represent the amount of affected genome across samples, the copy number estimates distribution, the frequency distribution.
}
\details{
A list is returned. Its first element is a list of ggplot object with the different graphs. The second is a data.frame with summary information used to create the graphs.
}
\author{
Jean Monlong
}
