


mynter = c(100,50,20,10,5,1) #lager en vektor med alle myntene han kan velge mellom


pocet = c() #lager en tom lommebok

betaling = 0 #lager hvor mye han har betalt
price = 179 #prisen på varen

i = 1 #starter indikseringe på i
while ((betaling != price)){ #kjører så lenge han ikke har truffet prisen
    while (betaling < price){
      betaling = betaling + mynter[i]
      pocet = c(pocet,mynter[i])
      if (betaling>price){
        pocet = pocet[-(length(pocet))]
        print(pocet)
        betaling = betaling - mynter[i]
        i = i + 1 
  
    }
  }
    
}


antall_mynter = length(pocet) #antall mynter han må betale er lengden på vektoren som er lommeboka hans
print(pocet)
print(antall_mynter)

