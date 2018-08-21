#partition the data into training set nd test set and check regression
mtcars
library(caret) #partitioning the data
#index <- createDataPartition( y = mtcars$am, p=0.7, list = F )
index <- sample( x = 1:nrow(mtcars) , size=.7 * nrow(mtcars))
train <- mtcars[index , ]
test <- mtcars[-index , ]
nrow(train)
nrow(test)
nrow(train) + nrow(test)

library(olsrr)
fit <- lm( mpg ~ disp + hp + wt + qsec , data = train)
k <- ols_step_all_possible(fit) 
k
summary( lm( mpg ~ wt, data = train) )
summary( lm( mpg ~ wt + hp , data = train) )

library(gvlma)
gvmodel <- gvlma(fit)
gvmodel

finalmodel <- lm( mpg ~ wt + hp , data = train)
(predictedValues <- predict(finalmodel ,test))
(cbind(test$mpg , predictedValues))
