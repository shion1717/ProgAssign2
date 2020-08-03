corr <- function(directory, threshold=0) {
    setwd(directory)
    
    #subset only nobs >= threshold, using function created in part 2
    data <- subset(complete(directory),nobs >=threshold)
    
    #get the IDs of the subsetted data
    id <- data$id   
    
    #initialise numeric to store correlations
    output <- numeric()


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
        data <- read.csv(filename)
        #remove NAs from data
        data <- subset(data,!(is.na(sulfate)|is.na(nitrate)))
        correlation <- cor(data$sulfate,data$nitrate)
        
        #store data
    output <- c(output,correlation)
    }
return(output)
}