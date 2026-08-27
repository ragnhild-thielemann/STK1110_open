
n = 1000000
x = rbinom(n,1,0.5) #trekker fra [0,1] ; tilsvarer den bernullifordelingen

kumsum = cumsum(x)

phat = kumsum/(1:n) #Deler den oppsamlede verdien for kumsum på antall elementer vi har kjørt igjenom

plot(1:n,phat, type = "l") #vi ser at denne stabiliserer seg mot 0.5

plot(1:n, (kumsum - 0.5*(1:n))), type = "l",xlab = "n", ylab = "avvik fra forveningnen") #avviket fra forveningen til sukesser vi øke

plot(1:n, sqrt((kumsum - 0.5*(1:n))**2/n), type = "l",xlab = "n", ylab = "avvik fra forveningnen")


#vi ser at avviket fra forveningen går mot uendelig, mens den empiriske forventingen blir liten
#dersom vi bruker empirisk standardavvik, vil avviket fra forventingen derimot gå mot 0 når n-> uendelig