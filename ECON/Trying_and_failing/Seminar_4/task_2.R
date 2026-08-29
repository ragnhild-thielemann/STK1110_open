

library(readr)

library(ineq)
library(microbenchmark)
library(tidyverse) # skal lage et qq-plot
?microbenchmark
incomes = read.csv("incomes.csv",header = TRUE)

vektor = na.omit(incomes$income)

G_1 = function(x){
  GINI = 0
  m = mean(x)
  n = length(x)
  for (i in 1:n){
    x_i = x[i]
    for (j in 1:n){
      ledd = abs(x_i-x[j])
      GINI = GINI + ledd
      
    }
  }
  
  GINI = GINI /(2*n**2*m)
  return (GINI)
}
x = sort(x) #må sortere

G_2 = function(x){
  x = sort(x) #må sortere
  s = 0
  m = mean(x)
  n = length(x)
  for (i in 1:n){
    ledd = x[i]*i
    s = s + ledd
    
    
  }
  GINI = (2*s)/(n**2*m) - (n+1)/n
  return (GINI)
}

#måler tiden de ulike funksjonene bruker på å evaluere GINI
t_1 = microbenchmark(G_2(x), G_1(x),times=1000)
print(t_1)

#Dersom den er ferdigsortert, bruker funkjson nummer 2 kortest tid

#inntetektene er i utganspunktet ikke normalfordelt - derfor skal vi bruke bootstrapping


#åpenbart ikke normalfordelt, så kan ikke bruke normalantagelsen
ggplot() + geom_qq(aes(sample = vektor)) + geom_qq_line(aes(sample = vektor)) 

ggplot() + geom_histogram(aes(x = vektor))
print(mean(vektor))
print(median(vektor))


#Skal lage bootstrapping

gini_liste = c()
for (i in 1:200){
b = sample(vektor,length(vektor), replace = TRUE)
gini = G_2(b)
gini_liste = c(gini_liste,gini)

}

print(mean(gini_liste)) #forventningsverdien til listen
print(var(gini_liste)) #gir usikkerheten i estimatet vårt for gini-koefesienten
ggplot() + geom_histogram(aes(x = gini_liste))

