# import house traning set
house_train <- read.csv('MIS470housingtraining.csv')

# impoort house testing set
house_test <- read.csv('MIS470housingtesting.csv')

# calculate summary sats
summary(house_test)
sd(house_test$SalePrice)
sd(house_test$LotArea)
sapply(house_test, sd)

# playground

# import house traning set
house_train <- read.csv('MIS470housingtraining.csv')

# impoort house testing set
house_test <- read.csv('MIS470housingtesting.csv')

# calculate summary sats
summary(house_test)
sd(house_test$SalePrice)
sd(house_test$LotArea)
sapply(house_test, sd)

#histogram for sale price
hist(house_test$SalePrice)

# combine two previous datasets
# install and load dplyr
install.packages('dplyr')
library('dplyr')
house_all <- combine(house_test, house_train)

# histogram of combined dataset, Sale Prices
hist(house_all$SalePrice)
hist(house_test$SalePrice)
hist(house_train$SalePrice)

# clean up hist - combine data, reduce sale by $1000 and labels
clean_sale <-c(house_all$SalePrice/1000)
clean_sale
hist(clean_sale, ylab = 'Frequency', xlab = 'Sale Price in $1000s', 
     main = 'Histogam of Sale Price - All Data',
     col.lab = 'red', col.main = 'red')

# clean up hist - test data, reduce sale by $1000 and labels
clean_sale_test <-c(house_test$SalePrice/1000)
clean_sale_test
hist(clean_sale_test, ylab = 'Frequency', xlab = 'Sale Price in $1000s', 
     main = 'Histogam of Sale Price - Test Data',
     col.lab = 'red', col.main = 'red')

# clean up hist - train data, reduce sale by $1000 and labels
clean_sale_train <-c(house_train$SalePrice/1000)
clean_sale_train
hist(clean_sale_train, ylab = 'Frequency', xlab = 'Sale Price in $1000s', 
     main = 'Histogam of Sale Price - Train Data',
     col.lab = 'red', col.main = 'red')


# fit lin reg model, train set, all var
lm_train <- lm(SalePrice ~ MSSubClass+LotFrontage+LotArea+OverallQual+OverallCond+
                 YearBuilt+YearRemodAdd+YearRemodAdd+MasVnrArea+TotalBsmtSF+GrLivArea+FullBath+
                 HalfBath+BedroomAbvGr+KitchenAbvGr+TotRmsAbvGrd+Fireplaces+GarageYrBlt+
                 GarageCars+GarageArea+WoodDeckSF+OpenPorchSF+MoSold+YrSold, data = house_train)

#summary of lin reg model
summary(lm_train)

#remove NA values from house test data
house_test_complete <- house_test[complete.cases(house_test), ]

# predict sale price from complete test data
prediction <- predict(lm_train, newdata = house_test_complete)
prediction[1:20]

# create df to compare predicted v. actual
compare_predict <- data.frame(sale_actual = house_test_complete[1:350,25], sale_predict = prediction)
compare_predict[1:20, ]

# create df to compare predicted v. actual
compare_predict2 <- data.frame(sale_actual = house_test_complete[1:350,25], 
                               sale_predict = prediction, sale_dif = (prediction - house_test_complete[1:350,25]))
compare_predict2[1:20, ]

# create df to compare predicted v. actual
compare_predict3 <- data.frame(sale_actual = house_test_complete[1:350,25], 
                               sale_predict = prediction, sale_dif = (prediction - house_test_complete[1:350,25]), 
                               sale_dif_abs = abs((prediction - house_test_complete[1:350,25])))
compare_predict3[1:20, ]

# summary stats for predict df
summary(compare_predict2)
summary(compare_predict3)

