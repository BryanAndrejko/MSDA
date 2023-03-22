# import churn dataset
cust <- read.csv('MIS470Telcocustomer.csv')

install.packages('caret')
library(caret)

# partition dataset into traind and testing data set 
intrain <- createDataPartition(cust$Churn,p=0.7,list=FALSE)
set.seed(2017)
training <- cust[intrain,]
testing <- cust[-intrain,]

# fit logistic regression model
LogModel <- glm(Churn ~ .,family=binomial(link="logit"),data=training)

# examine model fit
testing$Churn <- as.character(testing$Churn) 
testing$Churn[testing$Churn=="No"] <- "0" 
testing$Churn[testing$Churn=="Yes"] <- "1"
fitted.results <- predict(LogModel,newdata=testing,type='response') 
fitted.results <- ifelse(fitted.results > 0.5,1,0)
misClasificError <- mean(fitted.results != testing$Churn) 
print(paste('Logistic Regression Accuracy',1-misClasificError))

LogModel
summary(LogModel)

# same CT, same churn, using decision tree vs. log regression 
# fit decision tree model
tree <- ctree(Churn~gender+MultipleLines+StreamingTV+StreamingMovies+Contract, training)
plot(tree)

# examine model fit 
p1 <- predict(tree, training)
tab1 <- table(Predicted = p1, Actual = training$Churn)
pred_tree <- predict(tree, testing)
tab2 <- table(Predicted = pred_tree, Actual = testing$Churn) 
print(paste('Decision Tree Accuracy',sum(diag(tab2))/sum(tab2)))

# playground

# remove rows function with missing data
# omits rows with missing values
na.omit(housing)

pairs(housing)

scale()


