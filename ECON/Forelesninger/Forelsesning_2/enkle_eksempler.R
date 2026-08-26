

pi = 5
print(pi)
#går tilbake til konstanten som er innebygd i R
rm(pi)
print(pi)

typeof(pi)

(10%%3==0)

a = c(4,32,4,2)
b = c(5,3,2,4)
print(a%*%b)

x = c(1,4,5,3,59,3,0)
x == 0


# man trenger ikke gi argumetner

funk = function(x, power = 2){
  return (x^power)
} #bruerken bestemmer om den vil gi funksjonsverdi osv eller ikke