complete <- function(directory, id = 1:332){
    
    wd <- getwd()
    setwd(file.path(wd, directory))
    
    all_files <- list.files(pattern = "*.csv")
    
    files_id <- all_files[id]
    
    my_data <- data.frame()
    
    for(file in files_id){
        data_file <- read.csv(file)
        nobs <- 0
        
        for(line in 1:nrow(data_file)){
            
            if(!is.na(data_file[line,"sulfate"]) == TRUE && !is.na(data_file[line,"nitrate"]) == TRUE){
                nobs <- nobs + 1
            }
        }
        
        my_data <- rbind(my_data,  c(data_file[line,"ID"], nobs))
    }
    colnames(my_data) <- c("id", "nobs")
    my_data
}