#kopierer bare inn koden fra forrige oppgave


money = function(amount){
  betaling = 0
  mynter = c(100,50,20,10,5,1)
  pocet = c()
  i = 1
while ((betaling != amount)){ 
  while (betaling < amount){
    betaling = betaling + mynter[i]
    pocet = c(pocet,mynter[i])
    if (betaling>amount){
      pocet = pocet[-(length(pocet))]
      betaling = betaling - mynter[i]
      i = i + 1 
      
    }
  }
  
}
  return (pocet)}






pris_pa_is = 1:100

for (pris in pris_pa_is){
  en_is = length(money(pris))
  to_is = length(money(pris*2))
  tre_is = length(money(pris*3))
  
  if (en_is == 4 & to_is == 6 & tre_is == 2){
    print(pris)
   
  }
}

#isen koster 17 kroner:) JEG KLARTE DET FOR FAEN