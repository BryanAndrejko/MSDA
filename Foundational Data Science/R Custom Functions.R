
# sample custom function example
addPercent <- function(x){
  percent <- round(x*100, digits = 1)
  result <- paste(percent, "%", sep = "")
  return(result)
}

# convert F into Celsius 
f_convert <- function(x){
  z <- 5 * ((x) - 32) / 9;
  print(z)
}

# computes the sum of squares of two numbers
sum_squares <- function(x,y){
  ss <- ((x)^2 + (y)^2)
  print(ss)
}

# univariate dataset > calculate mean, min, max, sd
base_stats <- function(data){
  avg <- mean(data)
  low <- min(data)
  top <- max(data)
  dev <- sd(data)
  print(paste("The mean is: ",avg))
  print(paste("The minimum is: ", low))
  print(paste("The maximum is: ", top))
  print(paste("The standard deviation is: ", dev))
}

# univariate dataset > plot hist of raw data, plot hist 
# of log-transformed data
hist_plot <- function(data){
  hist(data)
  lg  <- log(data)
  hist(lg)
}

# custom function that takes max 
# of data set and divides by min
custom_fun <- function(data){
  p <- (max(data)) / min(data)
  print(p)
}

t <- c(2,8,9,12.5,4,12,8)

u <- c(15,27,3,58,2,2,3,27,15)

v <- c(18,4,7,8,3,3,3,4,4,3,26)

w <- c(2,3,4,5,6,7,8,8,8,8)

# playground

# convert F into Celcuis
t_convert <- function(x){
  z <- 5 * ((x) - 32) / 9;
  print(z)
}

# computes the sum of squares of two numbers
sum_squares <- function(x,y){
  ss <- ((x)^2 + (y)^2)
  print(ss)
}

# univariate dataset > calculate mean, min, max, sd
t_stats <- function(data){
  
}

myvalue<-function(x){z <- x*cos(x) + x^2; print(z)} 

seq(9,100,2) 
seq(9,99,2) 
seq(1,1000)

standard<-function(data){
  standard.data<-(data-mean(data))/sd(data)
  return(standard.data)
}
for(i in seq(0,6,2)){print(i)} 
for(i in 1:10){print(i)} 

number <- 101
if (number > 0) {print("the number is positive")} else if (number < 0) {print("the number is negative. ")} else {print("the number is zero.")} 

tbase_stats <- function(data){
  avg <- mean(data)
  low <- min(data)
  top <- max(data)
  dev <- sd(data)
  print(paste("The mean is: ", avg))
  print(paste("The minimum is: ", low))
  print(paste("The maximum is: ", top))
  print(paste("The standard deviation is: ", dev))
}

hist_plot <- function(data){
  hist(data)
  lg  <- log(data)
  hist(lg)
}

log_c <- (c(1,4,8,7,9,7,10))

tcustom_fun <- function(data){
  p <- (max(data)) / min(data)
  print(p)
}

