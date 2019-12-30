# generate sample data
GPA <- runif(1000, 0, 4)

# cutoff point = 3.5
future_success <- 10 + 2 * GPA + 10 * (GPA>=3.5) + rnorm(1000)

# load rddtools
library(rddtools)

# create the rdd data object
data <- rdd_data(future_success, GPA, cutpoint=3.5)

# plot the dataset
plot(data, col="red", cex=0.1, xlab="GPA", ylab="future_success")

# estimate the sharp RDD model
rdd_mod <- rdd_reg_lm(rdd_object=data, slope="same")
summary(rdd_mod)

# plot the RDD model along-with binned observations
plot(rdd_mod, cex=0.1, col="red", xlab="GPA", ylab="future_success")
