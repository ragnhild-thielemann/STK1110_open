
library(readr)
library(tidyverse)

data = read.csv("12_19.csv", header = F, sep = " ")

#na.omit fjerner tomme celler
x_verdier = c(na.omit(as.numeric(unlist(data[data$V1 == "x",-1]))))
y_verdier = c(na.omit(as.numeric(unlist(data[data$V1 == "y",-1]))))
n = length(x_verdier)

model = lm(y_verdier ~ x_verdier)
summary(model)

S_xx = sum(x_verdier**2)-mean(x_verdier)**2*n
S_yy = sum(y_verdier**2)-mean(y_verdier)**2*n
S_xy = sum(x_verdier*y_verdier)-mean(x_verdier)*mean(y_verdier)*n

print(c(S_x = S_xx , S_y = S_yy , xy = S_xy, n = n))
