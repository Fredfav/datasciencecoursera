corr <- function(directory, threshold = 0) {
  files_full <- list.files(directory, full.names=TRUE)
  CR <- vector('numeric')
  for (i in 1:332) {
    if (sum(complete(directory, i)) > threshold) {
      DF <- data.frame()
      DF <- read.csv(files_full[i])
      x <- subset(DF, !is.na(sulfate))
      y <- subset(x, !is.na(nitrate))
      CR[i] <- cor(y[['nitrate']], y[['sulfate']])
    }
  }
  CR
}