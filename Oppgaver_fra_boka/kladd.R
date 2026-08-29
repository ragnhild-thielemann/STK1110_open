
library(readr)

data = read.csv("f.csv",header = TRUE, sep = " ")

x_1 = data$x_3
y_1 = data$y_3

model = lm(y_1 ~ x_1)
summary(model)
n = length(x_1)
print(n)


a = pt(3.622,15)
print(1-a)

