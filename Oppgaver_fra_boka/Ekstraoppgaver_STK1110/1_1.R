# simulereinger for store talls lov, og setnralgrenseteoremt


n = 1000
size = 25
binom_05 = rbinom(n,size, 0.5) #trekker 100 tall fra fordelingen binom(size,0.5)

hist(binom_05/n,xlab = "X", ylab = "Frekvens",main = paste("p = 0.5"))
binom_06 = rbinom(n,size, 0.6) #trekker 100 tall fra fordelingen binom(size,0.5)

hist(binom_06/n,xlab = "X", ylab = "Frekvens",main = paste("p = 0.6"))

info = function(x){ #funksjon om hvorhvit den er positivt eller negativt skjev
  
  me = mean(x) 
  med = median(x)
  if (abs(me-med)<0.01){
    return ("Sentrert fordeling")
  } else if (me>med){
    return ("Hoyreskjev - positivt skjev")
  } else  {
    return ("Venstreskjev - negativt skjev")
  }
}


info_1 = function(x){ #funksjon om hvorhvit den er positivt eller negativt skjev
  
  me = mean(x) 
  med = median(x)
  return (c("mean" = me,"median " =med))}
print(info_1(binom_06))

print(info_1(binom_05))


#Vi ser at vi ved binomisk fordeling kommer nærmest normalfordelingen ved p != 0.5

#for å vise dette tydligere, kan vi lage et qqplot for de to ulike fordelingne

qqnorm( binom_06 , main = "0.6")
qqline(binom_06) #for 0.6 er den like skjev i begge ender, som da trekker i hver sin retning

qqnorm(binom_05,main = "0.5") #for 0.5 er skjevheten utelukkende postiv, altså at verdiene er mindre enn de skal være
qqline(binom_05) #Dette gir resulatetet om at forventnignen er sigifikant mindre enn medianen


