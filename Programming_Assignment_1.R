directory <- "specdata"
id<- 151:152

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  data <- data.frame()
  files <- list.files(directory, full.names = T)
  for (i in id) {
    data <- rbind(data, read.csv(files[i]))
  
  }
  
  return(data)

}

datat <- pollutantmean(directory, 1, id)