getwd() 

jnj_data <- read.csv('MIS470JNJ.csv')

Sys.Date()

mean(jnj_data$Close)

sd(jnj_data$Close)

Sys.Date()

# option 1 for confidence interval 
t.test(jnj_data$Close, conf.level = 0.90)

t.test(jnj_data$Close, conf.level = 0.95)

t.test(jnj_data$Close, conf.level = 0.99)

# option 2 for hypothesis testing
# alternative high price is greater than true mean of 125
# goes from 129 to infinity, p-value is very small value
# p value less than sig level, reject NULL hypothesis
t.test(jnj_data$Close, alternative = 'greater', mu = 125, conf.level = 0.95)

# conf level sample, not part of CT assignment
t.test(jnj_data$Close, alternative = 'greater', mu = 125, conf.level = 0.99)

# playground scripts

furniture.sale <-c(4808, 4908, 5807, 5184, 5577, 5604, 5490, 5759, 5572, 5335)
t.test(furniture.sale)

x <- c(1,2,4,5)
mean(x)

sd(x)
var(x)

rent <- read.csv('rent.csv')

lapply(rent, sd)

rent

lapply(rent, var)

lapply(rent, mad)

mean(x)
mad(x)

y <- c(1,1,1,3,6,13,19,23,24,36,37,40,61,65,72)

summary(y)

z <- c(0,-6,10,5,8,2,-12,11,-2)
summary(z)

lapply(rent, max)

sapply(rent, min)

scores <- read.csv("http://data-analytics.zybooks.com/ExamScores.csv")
boxplot(scores, outline = TRUE)

fivenum(mtcars)
summary(mtcars)

fivenum(mtcars$hp)

IQR(mtcars$wt)
boxplot(mtcars$wt)


heights <- read.csv("http://data-analytics.zybooks.com/height.csv")
hist(heights$Height, breaks = 5)

vplot

squash <- c(10,17,17.5,18.5,19.5)

mean(squash)

t.test(squash)
summary(squash)
str(squash)
sd(squash)

2.576 * (1.25/sqrt(5))

t.test(squash, conf.level = .99)

pump <- c(5,7,7.5,8,8.5,8.75)
mean(pump)
sd(pump)

# quiz examples, real world questions 
yourdata <- c(4808, 4908, 5807, 5184)
t.test(yourdata, mu=5000, alternative="greater") 

newdata <- c(480, 490, 510, 500)
t.test(yourdata, conf.level = 0.95)
summary(newdata)

quiz_data <- c(100, 200, 300, 102, 230)
median(quiz_data)
mean(quiz_data)
sd(quiz_data)
t.test(quiz_data, conf.level = 0.90)

str(mod3_test)
summary(mod3_test)

pump <- c(5,7,7.5,8,8.5,8.75)
summary(pump)
sd(pump)
mean((pump))

2.015*(1.245/sqrt(6))
7.458+1.024

(281)/(1000)

1.960*sqrt((0.281*(1-0.281))/1000)

0.281+0.028

(105-100)/((15)/sqrt(36))

install.packages(BSDA)
library(BSDA)
scores <- read.csv(file='http://data-analytics.zybooks.com/ExamScores.csv')
# calculate the population standard deviation
sd.p <- sd(scores$Exam1)*(sqrt((length(scores$Exam1)-1)/length(scores$Exam1)))
z.test(scores$Exam1, alternative="two.sided", mu = 86, sigma.x = sd.p)

t.test(scores$Exam1, alternative = "two.sided", mu = 82)

t.test(scores$Exam2, alternative = "two.sided", mu = 83)

prop.test(31, 50, 0.5, alternative = "two.sided", correct=FALSE )

new_scores = read.csv("http://data-analytics.zybooks.com/ExamScoresGrouped.csv")
model = aov(Scores ~ Exam, data = new_scores)
summary(model)
boxplot(Scores ~ Exam, data = new_scores)

df <- read.csv('http://data-analytics.zybooks.com/ExamScoresGrouped.csv')
model <- aov(Scores ~ Exam, data = df)
TukeyHSD(x= model, 'Exam', conf.level=0.95)

