
library(tidyverse)
data = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exmp12-16.txt",header = TRUE)

#lager først et scatterplot


ggplot(data,aes(y = Wingspan, x = Height)) + geom_point() + geom_smooth()

#beregner korrelasjonen
cor(data$Height,data$Wingspan)


x = data$Height
y = data$Wingspan
model = lm(y ~ x)
summary(model)


print(model$coefficients[1])

funk = function(x){
  a = model$coefficients[1]
  b = model$coefficients[2]
  return (a + b*x)
}

a = data.frame(x = x, y = funk(x))


#lager et plot, der jeg legger over regresjonanalysen. Bruker da to ulike datasett for de to ulike linjære modellene
ggplot() + geom_point(data = data, aes(x = Height, y = Wingspan)) + geom_smooth(data = a, aes(x = x, y = y))

