complete <- function(directory, id = 1:332) {
  files_full <- list.files(directory, full.names=TRUE)
  nbsobs <- data.frame()
  for (i in id) {
    dat <- data.frame()
    dat <- read.csv(files_full[i])
    x <- subset(dat, !is.na(sulfate))
    y <- subset(x, !is.na(nitrate))
    r <- cbind(i, nrow(y))
    nbsobs <- rbind(nbsobs, r)
  }
  nbsobs
}