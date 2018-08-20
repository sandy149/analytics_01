#Basic stats

x  <- ceiling(rnorm(10000, mean = 60, sd = 20)) # create data for normal distribution
mean(x)
median(x)

#no mode function
table(x)
sort(table(x), decreasing = T )

library(modeest)
mlv(x, method = 'shorth')

quantile(x)
quantile(x, seq(.1,1,by = .1)) #decile
quantile(x, seq(0.01, 1, by = 0.01)) #percentile

library(e1071)
plot(density(x))
e1071::skewness(x)
kurtosis(x)

sd(x); var(x)
cov(women$height, women$weight)
cov(women$weight, women$height)

#feq Table
library(fdth)
ftable1 = fdt(x)
ftable1

stem(x)
