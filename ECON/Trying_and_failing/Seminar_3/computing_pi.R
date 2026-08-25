
library(tidyverse)


#lager to kallbare funksjoner for å etsimere pi
pi_g = function(terms){
  pi_gregory = 0
  denominator = 1
for (i in 0:terms){
  pi_gregory = pi_gregory + ((4/(denominator))*(-1)**(i))
  denominator = denominator + 2
}
  return (pi_gregory)
}

pi_n = function(terms){
pi_nil = 3
tall_i_nevenern = 4
denominator = 6
for (i in 1:terms){
  denominator = (2*i)*(2*i+1)*(2*i+2)
  tall_i_nevenern = tall_i_nevenern + 1
  ledd = (4/denominator)*(-1)**(i+1)
  pi_nil = pi_nil + ledd
}
return (pi_nil)}
print(pi_n(10))

#skal lage to vektorer, som ser på hvordan de approksimeres ved ulik mengde intraksjoner
#finner differansen til den sanne verdien for pi for ulike verdier av n.
#funksjonen returnerer en dataframe
vek = function(terms){
  

vek_l = c()
for (i in 1:terms){
  vek_l = c(vek_l,pi_g(i)-pi)}
vek_n = c()
  for (i in 1:terms){
    vek_n = c(vek_n,pi_n(i)-pi)}
vek_a = c()
for (i in 1:terms){
  vek_a = c(vek_a,i)}

data_frame_ja = data.frame("n" = vek_a,"Leibnitz" = vek_l,"Nilakantha" = vek_n) #opretter dataframe

return (data_frame_ja)} 

data_frame = vek(20) #lager en instans av klassen


pi_plot = ggplot(data_frame) + geom_point(aes(x = n, y =Leibnitz,color = "Leibniz")) + geom_point(aes(x = n,y =Nilakantha,color = "Nilakantha" )) + labs(x = "Antall intraksjoner",y="reusidal",color = "Beregning",title = "Beregning")
ggsave("intrasjoner_pi.png",plot = pi_plot)
