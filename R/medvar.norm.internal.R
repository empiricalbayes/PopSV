##' The median and deviation to the median is normalized across samples. 
##' @title Median-variance normalization of bin counts
##' @param bc a matrix or data.frame with the bin counts (bin x sample).
##' @return a matrix with the normalized bin counts (bin x sample).
##' @author Jean Monlong
##' @keywords internal
medvar.norm.internal <- function(bc) {
  med = apply(bc, 2, stats::median, na.rm = TRUE)
  if(all(is.na(med))) stop("All the samples have median coverage of 0...Are these regions covered ?")
  if(any(med==0)) med[which(med==0)] = 1
  med.c = mean(med)
  bc = t(t(bc) * med.c/med)
  bc = bc - med.c
  md = apply(bc, 2, function(x) stats::median(abs(x), na.rm = TRUE))
  md.c = stats::median(abs(bc), na.rm = TRUE)
  bc = t(t(bc) * md.c/md)
  return(bc + med.c)
} 
