complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## load stringr package
  require("stringr")
  
  ## prepare results data frame
  res <- data.frame(id, nobs = vector("numeric", length(id))) 
  counter <- 0               
  
  for(i in id) { 
    
    counter <- counter + 1
    
    ## constructing path to csv file
    path <- paste0(directory, "/", str_pad(i,3, pad="0"), ".csv")
    
    ## reading i monitor values into data frame
    x <- read.csv(path, sep = ",")
    
    ## create complete cases logical vector
    cc <- complete.cases(x)
    
    ## storing number of complete cases into results data frame
    res[counter, 2] <- nrow(x[cc,])
  }

  res
}