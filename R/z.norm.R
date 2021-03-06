##' The Z-score is normalized to ensure centered distribution and similar variance across different GC classes. This is usually not necessary when the quality is comparable across the samples. However if some samples contain experiment-specific biases this approach can reduce false calls. 
##' @title Z-score normalization
##' @param z.df a data.frame with the Z-scores. 
##' @param gc.df a data.frame with the GC content.
##' @param class.size the number of bins in each GC classes. Default is 5000.
##' @return a vector with the normalized Z-scores.
##' @author Jean Monlong
##' @keywords internal
z.norm <- function(z.df,gc.df, class.size=5000){
  if(all(colnames(gc.df)!="GCcontent")){
    stop("'GCcontent' column missing.")
  }
  
  ## Slightly faster merge
  mergeGC <- function(z.df, bins.df){
    gcc = bins.df$GCcontent
    names(gcc) = with(bins.df, paste(chr,as.integer(start),as.integer(end)))
    z.df$GCcontent = with(z.df, gcc[paste(chr,as.integer(start),as.integer(end))])
    z.df
  }

  z.df = mergeGC(z.df, gc.df)
  gc.breaks = unique(stats::quantile(z.df$GCcontent,probs=seq(0,1,min(.5,class.size/nrow(z.df)))))
  gc.breaks[1] = -Inf
  gc.breaks[length(gc.breaks)] = Inf
  z.df$gc.class = cut(z.df$GCcontent, include.lowest = TRUE, breaks=gc.breaks)
  msd.l = tapply(z.df$z, z.df$gc.class, function(z)c(stats::median(z, na.rm=TRUE), stats::mad(z, na.rm=TRUE)))
  m.v = unlist(lapply(msd.l, "[", 1))
  sd.v = unlist(lapply(msd.l, "[", 2))
  (z.df$z-m.v[as.character(z.df$gc.class)])/sd.v[as.character(z.df$gc.class)]
}
