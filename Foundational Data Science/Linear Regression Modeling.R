# copy from clipboard in OSX - pull in XLS data
data <- read.table(pipe("pbpaste"), sep = "\t", header = TRUE)

data

#rename long header names
date <- data$observation_date
exch <- data$USEUR
gdp <- data$GDP

# examine correlation between two variables
cor(gdp, exch)

# visualiziton to plot
plot(data)

# plot refinded, for 2 variables

plot(gdp, exch)
plot(gdp, exch, main = "Currency Exchange Rate vs. GDP", xlab = "GDP", ylab = "Exchange Rate", col.main = "red", col.lab = "red")
#check arguments here, change colors and adjust points 
plot(gdp, exch, main = "Currency Exchange Rate vs. GDP", xlab = "GDP", ylab = "Exchange Rate", col.main = "red", col.lab = "red", col = "black", pch = 15)

#build regerssion model
model <- lm(exch ~ gdp, data = data)
model

# PR |t| - is P-value.  P value less than 0.05, the more signficanly influences value of target variable
# *** rating shows the same thing, shows signifigance
# R square shows model fits 56% of data in good manner
summary(model)


#plot model linerar regression equation
abline(model, col="blue")

# use model to predict first row of data in table
exchange.predict <- predict(model, data.frame(gdp = 14721.35))

exchange.predict

#create simple data frame, comparing actual metric vs. predicted metric
df.exchange.actual.predicted <- data.frame(exchange.actual = data[1,3], exchange.predict = exchange.predict)
df.exchange.actual.predicted

# playground scripts

plot(mtcars)

Sales <-c(370, 341, 650, 940, 330, 510, 400, 830)
Advertising.Cost <-c(1.8, 1.9, 3.0, 5, 1.9, 2.5, 1.4, 4.3)
mod <-lm(Sales~Advertising.Cost)
summary(mod)
plot(Advertising.Cost, Sales, xlab="Advertising Cost (in $1000)", ylab="Monthly E-commerce Sales (in $1000)", ylim=c(200,1000), pch=16, cex=2, col="blue")
abline(lm(Sales~Advertising.Cost))

new_Sales <-c(370, 341, 650, 940, 330, 510, 400, 830)
new_Advertising.Cost <-c(1.8, 1.9, 3.0, 5, 1.9, 2.5, 1.4, 4.3)
Free.Shipping <-c(0,0,1,1,0,1,1,1)
new_mod <-lm(new_Sales~new_Advertising.Cost+as.factor(Free.Shipping))
summary(new_mod)
scatter3d(x=Free.Shipping, y=new_Advertising.Cost, z=new_Sales)

X <- c(0, 3, 7, 10)
Y <- c(5, 5, 27, 31)
model.1 <- lm(Y ~ X)
summary(model.1)

plot(X, Y, ylim=c(0,35))
lines(sort(X), fitted(model.1)[order(X)])

base <- c(1,2,4,5)
base2 <- c(1,3,5,7)

base_model <- lm(base ~ base2)
base_model
summary(base_model)

scores <- read.csv('http://data-analytics.zybooks.com/ExamScores.csv')
model <- lm(scores$Exam4 ~ scores$Exam1 + scores$Exam2 + scores$Exam3)
anova(model)

Y <-  c(2, 3, 2, 4, 5, 8, 6, 8, 8, 10, 14, 11, 12, 13, 15, 18, 19, 16) # Quality
X1 <- c(2, 1, 3, 4, 2, 5, 1, 3, 6,  1,  4,  7,  2,  6,  3,  4,  5,  7) # Speed
X2 <- c(1, 1, 2, 3, 2, 4, 2, 3, 5,  3,  5,  6,  4,  6,  5,  6,  7,  7) # Angle

pairs(cbind(Y, X1, X2))

model.12 <- lm(Y ~ X1 + X2)
summary(model.12)

fitted(model.12)
residuals(model.12)
anova(model.12)
