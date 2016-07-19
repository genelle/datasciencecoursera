pollutantmean <- function(directory, pollutant, id = 1:332){
    
    wd <- getwd()
    setwd(file.path(wd, directory))
    
    all_files <- list.files(pattern = "*.csv")
    
    files_id <- all_files[id]
    
    my_data <- data.frame()
    
    for(file in files_id){
        data_file <- read.csv(file)
        my_data <- rbind(my_data, data_file)
        
    }
    
    pol_data <- my_data[,pollutant]
    mean(pol_data[!is.na(pol_data)])
}