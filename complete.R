complete <- function(directory, id = 1:332) {
  takegooddata <- function(file){
    tmpdata <- read.csv(file)
    gooddata <- complete.cases(tmpdata)
    tmpdata <- tmpdata[gooddata, ]
  }
  
  takecomplete <- function(data) {
    nrow(data)
  }

  colnames <- c("id", "nobs")
  data <- data.frame()
  files <- list.files(directory, full.names = T)
  for (i in id) {
    nobs <- nrow(takegooddata(files[i]))
    data <- rbind(data, c(i, nobs))
  }
  names(data) <- colnames
  data

}