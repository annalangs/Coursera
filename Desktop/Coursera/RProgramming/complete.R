complete <- function(directory, id=1:332) {
	old_dir <-getwd()
	setwd("/Users/annachefter/Desktop/Coursera/RProgramming")
	
	# both pollutants - "sulfate" or "nitrate" - should be defined, i.e. have values
	pollutants=c('sulfate', 'nitrate')
		
	nobs <- rep(0,length(id))
	#loop through all monitors and populate a vector of means of each monitor
	for (i in 1:length(id)) {
		index<-id[i]
		filename_str <- "XXX";

		if (index<10) {
				filename_str<- paste("00",index, sep="")
			}
		else if (index<100) {
				filename_str<- paste("0",index, sep="")
			}
			else {
				filename_str<-index;
			}
		
		#open the file from directory with names dir/i.CSV
		x<-read.csv(paste("specdata/", filename_str, ".csv", sep=""))

		y<-x[pollutants]	
		z<- na.omit(y)
		#print(paste("length z =", nrow(z), sep=" "))
		if (nrow(z) == 0) {
			#all elements are NA ; set mean to NA and go to the next file
			
		}
		else {
			#print(paste("SUM z=", sum(z[pollutant])))
			#print(paste("LENGTH z=",lengths(z[pollutant])))
			nobs[i] <- lengths(z[pollutants])
		}

	}
	result<-data.frame(id,nobs)
	
}