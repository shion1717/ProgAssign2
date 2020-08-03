#Function to get pollutant mean

#Working directory
directory <- "C:/Users/User/Desktop/R/courses/02_RProgramming/specdata/"

pollutantmean <- function(directory, pollutant, id=1:332){
    #set working directory to where the .csv files are at
    setwd(directory)
    
    #create container to store output data
    output <- vector()
    
    #for loop to read in the IDs specified
    for (id in id) {

        #set "id" to the filename form
        if(id < 10) {
            filename <- paste0("00",id,".csv")
        } else if (id < 100) {
            filename <- paste0("0",id,".csv")
        } else {
            filename <- paste0(id,".csv")
        }
        data <- read.csv(filename)[,pollutant]
        #remove NAs from data
        data <- data[!is.na(data)]
        
        
        #read in relevant pollutant data
        output <- c(output,data)

    }
    #return mean of all colleted data
    return(mean(output))
}