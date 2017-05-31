myfunction <- function (x) {
		y <- rnorm (100)
		mean (y)
}

second <- function (x) {
	x+ rnorm(length(x))
}

install.packages("swirl")

packageVersion("swirl")


library(swirl)

install_from_swirl("R Programming")

y<-x[!is.na(x)]
y[y>0] # a vector of all the positive values in y

x[!is.na(x) & x>0]
