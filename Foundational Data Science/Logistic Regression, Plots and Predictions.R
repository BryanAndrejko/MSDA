# logistic Regression 
#model variables = am (categorical var, class = target variable) and mpg
# 0 = Automaitc Transmission
# 1 = Manual Transmission

# scatter plot1 - 
plot(mtcars$mpg, mtcars$am)
plot(mtcars$mpg, mtcars$am, ylab = 'Transmission Type', xlab = 'MPG', 
     main = 'Transmission Type vs. MPG', col.lab = 'red', col.main = 'red', pch = 16)

#rename mtcrars data into vecotrs
mpg <- c(mtcars$mpg)
mpg
trans <- c(mtcars$am)
trans

# scatter plot2 - 
plot(mpg, trans)
plot(mpg, trans, ylab = 'Transmission Type', xlab = 'MPG', 
     main = 'Transmission Type vs. MPG', col.lab = 'red', col.main = 'red', pch = 16)
mtcars
mtcars(head)

# create data frame - for ml algo
car.df <- data.frame(trans, mpg)
car.df

model <- glm(trans ~ mpg, data = car.df, family = 'binomial')
model
summary(model)

## we model the funciton of the target variable ##
#  for glm, you are not modelling the target vairable in terms of perdictor, but modelling
## a function of target variable in terms of perdictor 
# logit(odds of Trans = 1) = -6.6035 + 0.307 * MPG
# model -> prob: p(am=1|mpg) = 1 / ( 1 + exp (-(-6.6035 + 0.307 * mpg) ) )

# probablity for 30 mpg - expect to be close to 1.0
p <- 1 / ( 1 + exp (-(-6.6035 + 0.307 * 30) ) )
p
# probability for 20 mpg - expect to be close to 0.5
# get probility of 0.38616 that Car is am if mpg is 20
p1 <- 1 / ( 1 + exp (-(-6.6035 + 0.307 * 20) ) )
p1

# working s-curve plot for created df mtcars trans(am) ~ mpg
library(ggplot2)
ggplot(car.df, aes(x=mpg, y=trans)) + geom_point() + 
  ggtitle('Transmission Type \nvs. MPG') + xlab('MPG') + ylab('Transmission Type') +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE )

# understand class of target variable, vs understand probability
# set threshold as class definer
class <- ifelse(p > 0.5, 'class = Manual', 'class = Automatic')
class

# predict function 1
prob.Auto.Predicted <- predict(model, data.frame(mpg = 30), type = "response")
prob.Auto.Predicted 
class.Auto.Predicted <- ifelse(prob.Auto.Predicted  > 0.5, 'class = Manual', 'class = Automatic')
class.Auto.Predicted

# predict function 2
p2 <- 1 / ( 1 + exp (-(-6.6035 + 0.307 * 20) ) )
p2
prob.Auto.Predicted2 <- predict(model, data.frame(mpg = 20), type = "response")
prob.Auto.Predicted2
class.Auto.Predicted2 <- ifelse(prob.Auto.Predicted2  > 0.5, 'class = Manual', 'class = Automatic')
class.Auto.Predicted2

#predict function 3
p3 <- 1 / ( 1 + exp (-(-6.6035 + 0.307 * 25) ) )
p3
prob.Auto.Predicted3 <- predict(model, data.frame(mpg = 25), type = "response")
prob.Auto.Predicted3
class.Auto.Predicted3 <- ifelse(prob.Auto.Predicted3  > 0.5, 'class = Manual', 'class = Automatic')
class.Auto.Predicted3

# predicted category for CT
p4 <- 1 / ( 1 + exp (-(-6.6035 + 0.307 * 16) ) )
p4
prob.Auto.Predicted4 <- predict(model, data.frame(mpg = 16), type = "response")
prob.Auto.Predicted4
class.Auto.Predicted4 <- ifelse(prob.Auto.Predicted4  > 0.5, 'class = Manual', 'class = Automatic')
class.Auto.Predicted4

# playground

# logistic model fit - interactive lecture

Age <- c(30,28,55,33,41,23,20,37,38,40)
Default <- c(0,0,0,1,1,0,0,0,1,1)
data.new <- data.frame(Age,Default)

log.mod <- glm(Default ~ Age, data=data.new, family = binomial)

# loads the class library - ZyBooks
library(class)

# loads the iris dataset
data(iris)

# sets the seed
set.seed(12345)

# randomizes the data set
index <- sample(rep(1:150)) 
iris <- iris[index,]

# normalizes the data set
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

iris_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))

# splits the data into training and test sets
train <- iris_norm[1:120,]
train_label <- iris[1:120,5]
test <- iris_norm[121:150,]
test_label <- iris[121:150,5]

# initializes and runs the classifier
model <- knn(train=train, test=test, cl=train_label, k=3)

# gives the confusion matrix
table(test_label, model)

# loads the necessary libraries - ZyBooks
library(rpart)
library(rpart.plot)

# loads the iris dataset
data(iris)

# builds the CART model
model <- rpart(Species ~ ., data = iris)

# prunes the model
model_pruned <- prune(model, cp = 0.00005)

# gives the confusion matrix
conf.matrix <- table(iris$Species, predict(model_pruned, type="class"))
print(conf.matrix)

# loads the data set - ZyBooks
hof <- read.csv('hof.csv')

# sets the seed
set.seed(12345) 

# randomizes the data
index <- sample(rep(1:774)) 
hof <- hof[index,]

# sets the training and test sets
train <- hof[1:620,]
test <- hof[621:774,]

# creates the logistic model
model <- glm(HOF ~.,family=binomial(link='logit'),data=train)

# displays the summary
summary(model)

# runs the classifier on the test set with cutoff at 0.5
predicted <- predict(model,newdata=subset(test,select=c(1)),type='response')
predicted <- ifelse(predicted > 0.5,1,0)

# displays the classification error
misc_error <- mean(predicted != test$HOF)
misc_error

# k-means
data(iris)
model <- kmeans(iris[,1:4], 3, nstart=20)
model

# loads the iris data set
data(iris)

# sets the seed
set.seed(12345)

# defines a function to normalize data
normalize = function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

# normalizes data
iris_norm = as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))

# finds the sum of squares within groups for each value of 
# k up to 15
k.max <- 15
data <- iris_norm
ssw <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})

# plots the ssw
plot(1:k.max, ssw,
     type="b", pch = ".", 
     main = "The elbow method for k means",
     xlab="Number of clusters",
     ylab="SSW")

# stack overflow for s cruve - test mtcars

fit = glm(vs ~ hp, data=mtcars, family=binomial)
newdat <- data.frame(hp=seq(min(mtcars$hp), max(mtcars$hp),len=100))
newdat$vs = predict(fit, newdata=newdat, type="response")
plot(vs~hp, data=mtcars, col="red4")
lines(vs ~ hp, newdat, col="green4", lwd=2)

# ggplot for s-curve
library(ggplot2)
ggplot(car.df, aes(x=mpg, y=trans)) + geom_point() + 
  ggtitle('Transmission Type  \nvs. MPG') + xlab('MPG') + ylab('Transmission Type') +
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE )

#import dataset
house <- read.csv('MIS470housingtraining.csv')

# calculate summary sats
summary(house)
sd(house$SalePrice)
sd(house$LotArea)
sapply(house, sd)

# histogram for sale price
# create list of price in $1000s
clean_sale <-c(house$SalePrice/1000)
clean_sale
hist(clean_sale, ylab = 'Frequency', xlab = 'Sale Price in $1000s', main = 'Histogam of Sale Price',
     col.lab = 'red', col.main = 'red')

#histogram for sale price
hist(house$SalePrice)

