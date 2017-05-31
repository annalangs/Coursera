corr <- function(directory, threshold=0) {
	# 'directory' is a charactor vector of length 1 
	# indicating the location of csv files
	#
	# 'threshold' is numeric vector of length 1 indicating the 
	# number of complete observed observations (on all variables)
	# required to compute correlation between nitrate and sulfate
	# the default is 0
	#
	# Return the numeric vector of correlations
	
	old_dir <-getwd()
	setwd("/Users/annachefter/Desktop/Coursera/RProgramming")
	pollutants<-c('sulfate','nitrate')
	result<-NULL
	
	files <- list.files(directory)
	#loop through all monitors and populate a vector of sum of each monitor
	for (i in 1:length(files)) {
		filename_str <- paste(directory, "/", files[i], sep="")
		
		x<-read.csv(filename_str)
		#headers<- names(x)
		#print (headers)
		y<-x[pollutants]	
		z<- na.omit(y)
		sulfate_data <- z$'sulfate'
		nitrate_data <- z$'nitrate'
		data_pts_num <- length(sulfate_data)
		#print(data_pts_num)
		if (data_pts_num >= threshold) {
			sn_corr <- cor(sulfate_data, nitrate_data)
			if (! is.na(sn_corr)) {
				result<-c(result,sn_corr)	
			}
			
		}
		
	}
	result
}