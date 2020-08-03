#Function to get number of complete observations

complete <- function(directory,id = 1:332){
    setwd(directory)
    #initialise data frame
    output <- data.frame(id)
    
    #initialise vector to store number of complete observations
    nobs <- vector()
    
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
        nobs <- c(nobs,length(data[,1]))
    }
    return(cbind(output,nobs))
}