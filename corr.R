corr <- function(directory, threshold = 0){
    
    ##all monitors
    monitors <- complete(directory, 1:332)

    ##monitors that meet threshold
    monitors <- subset(monitors, nobs > threshold)

    ids = monitors[["id"]]
    all_files <- list.files(pattern = "*.csv")
    files_id <- all_files[ids]
    
    cors_by_id <- numeric()
    for(file in files_id){
        data_file <- read.csv(file)
        
        sulfate <- numeric()
        nitrate <- numeric()
        for(line in 1:nrow(data_file)){
            
            if(!is.na(data_file[line,"sulfate"]) == TRUE && !is.na(data_file[line,"nitrate"]) == TRUE){
                sulfate <- rbind(sulfate, data_file[line,"sulfate"])
                nitrate <- rbind(nitrate, data_file[line,"nitrate"])
            }
        }
        
        cors_by_id <- rbind(cors_by_id, cor(sulfate,nitrate))
    }
    
    cors_by_id
    
}