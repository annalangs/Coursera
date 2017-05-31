pollutantmean <- function(directory, pollutant, id=1:332) {
	
	old_dir <-getwd()
	setwd("/Users/annachefter/Desktop/Coursera/RProgramming")
	
	#loop through all monitors and populate a vector of means of each monitor
	monitor_sum_vect <- rep(NA,length(id))
	monitor_num<-0
	
	print(paste("LENNN=", length(id)))
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
		# pollutant is either "sulfate" or "nitrate"
		y<-x[pollutant]	
		z<- na.omit(y)
		#print(paste("length z =", nrow(z), sep=" "))
		if (nrow(z) == 0) {
			#all elements are NA ; set mean to NA and go to the next file
			sum_i <- NA
		}
		else {
			#print(paste("SUM z=", sum(z[pollutant])))
			#print(paste("LENGTH z=",lengths(z[pollutant])))
			sum_i <- sum(z[pollutant])
			monitor_num<-monitor_num + lengths(z[pollutant])
			#print(paste (index, mean_i))

		}
		
		monitor_sum_vect[i]<-sum_i

	}
	print(monitor_sum_vect)

	setwd(old_dir)
	#sum(monitor_mean_vect)/lengths(monitor_mean_vect)
	print(paste("SUM=",sum(monitor_sum_vect)))
	print(paste("LEN=",monitor_num))
	no_na_monitor_sum <- na.omit(monitor_sum_vect)
	if (length(no_na_monitor_sum)==0) {
		result<-NA
	}
	else {
		result<-sum(no_na_monitor_sum)/monitor_num
		}
	result
	#calculate and return mean
}