# Det er et vakkkert resulatet at summer av tilfelidige variabler oppfører seg som en normalfordeling, til tross for at de i utganspunktet ikke har noe med normalfordelingen å gjøre. 

# For å vise dette, begynner vi med å trekke 1000 uniformt fordelte variable

n = 1000
x = runif(n,0,1)

qqnorm(x)
qqline(x) #Vi ser at fordelingen er svært skjev
a = 0
terms = 10000
for (i in 1:terms){
  a = a + runif(n,0,1)
}

hist(a) #summen av de uniforme fordelingene gir en tilnærmesle til normalfordelingen
qqnorm(a)
qqline(a) #vi får en tilnøring til normalfodelingen

#Gjør tilsvarende prosedyre for eksponensialfordelte data


n = 1000

terms = 10
b = 0
for (i in 1:terms){
  b = b + rexp(1000)
  
}

hist(b) #for små verdier av terms, får vi en positivt skjev fordeling, da eksponejsialfordelignen er positivt skve