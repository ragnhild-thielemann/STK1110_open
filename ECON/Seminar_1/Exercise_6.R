
library(readr)
library(tidyverse)

inc_wealth = read_csv("inc_wealth.csv")

head(inc_wealth)
kronekurs = 11.57 
#Oppretter en ny kolonne i data-framen som viser formuen i Euro
inc_wealth$inc_euro = inc_wealth$wealth / kronekurs

#finner alle som har negativ formue
neg_wealth = inc_wealth[inc_wealth$wealth <0,]

tredje = (inc_wealth)[3,] 
print(tredje) #finner den tredje observasjonen

andre_fjerde = (inc_wealth)[4,2]
print(andre_fjerde) #finner andre variabel fra den fjerde observasjonen

#lager en data-frame med de fire første observasjonene
some.persons = inc_wealth[1:4,]

print(some.persons)

woman = inc_wealth[inc_wealth$female=="1",]
q = quantile(inc_wealth$wealth,0.9)
print(q) #finner kvantilen for hvor høy inntekt du må ha for å være blandt de 10% rikeste

wealthy = inc_wealth[inc_wealth$wealth>q,]
non_wealthy = inc_wealth[inc_wealth$wealth<q,]
wealthy_age = wealthy$age
non_wealthy_age = non_wealthy$age

#tar inn en vektor
info = function(x) {
  return(c("mean", mean(x),"Var", var(x)))
  
}

a_w = (info(wealthy$wealth)[4]) 
a_nw = (info(non_wealthy$wealth)[4])

a_w = as.numeric(a_w) 
a_nw = as.numeric(a_nw)
print(c(a_w,a_nw))
print(a_w/a_nw) # vi ser at variansen blandt den øverste 10% kvantilen er høyere enn variansen blant resten. Dette vitner om at vi har noen som er superrike!


ggplot() + geom_point(non_wealthy, mapping = aes(x = age, y = income))