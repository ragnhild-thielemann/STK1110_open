
library (tidyverse)
data = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe12-17.txt", header = TRUE)



head(data)

#Vi ser enkelt at scatterplottet er linjært, som støtter at vi bruker en enkel linjær regresjonsmodell
ggplot(data) + geom_point(aes(x = x , y = y))



model = lm(data$y ~ data$x)

summary(model)


funk = function(x){
  a = coefficients(model)[1]
  b = coefficients(model)[2]
  
  return (a + b*x)
}

data = data |> mutate(est = funk(x))
data = data |> mutate(feil = y - est)
ggplot(data) + geom_point(aes(x = x , y = y)) + geom_line(aes(x = x , y = est))

ggplot(data) + geom_point(aes(x = x , y =))
print(funk(50))

