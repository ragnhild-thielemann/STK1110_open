
print("hei")
pi_gregory = 0
terms = 14
denominator = 1

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

vek = function(terms){
  

vek_l = c()
vel_n = c()
for (i in 1:10){
  vek_l = c(vek_l,pi_g(i)-pi)

}
return (vek_l)}

print(vek(10))
