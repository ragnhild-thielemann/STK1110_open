
library(readr)
library(tidyverse)
data = read.csv("tekst_1.csv",sep = "",header = TRUE)


model = lm(data$y ~ data$x1 + data$x2 +  data$x3)


info = function(x_1,x_2,x_3) {
  b_0 = model$coefficients[1]
  b_1 = model$coefficients[2]
  b_2 = model$coefficients[3]
  b_3 = model$coefficients[4]
  return (b_0 + b_1 * x_1 + b_2 *x_2 + b_3*x_3)

}


y_e = (info(data$x1,data$x2,data$x3))
ggplot() + geom_point(aes(x = y_e, y = data$y)) 

cor(y_e,data$y) #denne er lik som korrelasjonen vi får i plottet vårt!
