##directory <- "specdata"
##threshold <- 15000
##source("complete.R")

corr <- function(directory, threshold = 0) {
  takegooddata <- function(file){
    tmpdata <- read.csv(file)
    gooddata <- complete.cases(tmpdata)
    tmpdata <- tmpdata[gooddata, ]
  }
  datacomp <- complete(directory)
  idthrdata <- datacomp[which(datacomp$nobs > threshold), "id"]
  corrr <- c(numeric(0))
  data <- data.frame()
  files <- list.files(directory, full.names = T)
  for (i in idthrdata) {
    data <- takegooddata(files[i]) #rbind(data, read.csv(files[i]))
    corrr <- c(corrr, cor(data$sulfate, data$nitrate))
  }  
  return(corrr)
}
