
library(tidyverse)
data = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe12-16.txt", header = TRUE)


#lager to vektorer med dateene fra datasettet
parent = data[,"midpar"] #henter ut kolonnen med midpar
datter = data[,"daughter"]


ggplot(data) + geom_point(aes(x = midpar, y = daughter)) + labs(x = "Foreldre", y = "Datter")

model = lm(data$daughter ~ data$midpar)
summary(model)

a = coefficients(model)
print(a)


funk = function(x){
  a = coefficients(model)[1]
  b = coefficients(model)[2]
  return (a + b*x)
  
}

#legger de predikerte verdiene til som en ekstra kolonne i datasettet. 
data = data |> mutate(y = funk(data$midpar))

#lager et plott, der vi har fått med dataene våre
ggplot(data) + geom_point(aes(x = midpar, y = daughter)) + geom_line(aes(x = midpar, y = y)) + labs(x = "Foreldre", y = "Datter")

