---
title: "README"
output: html_document
---

## Variable tybes

- Double: desimaltall (tilsvarende float)
-  Integer : heltall
- Chareter : En streng av str 
- Logical : True or fale (boolsk variabel, gi dummy-variabler)
- List : Flere variabler i en bag, uten krav om at de er samme variabeltype
- Factor : Kategorisk data

  - Hva slags variabel vi har, kan vi lære ved typeof(variable)
  
## Operetorer 

- Vanlige regneregler gjelder i R
- a^2 -> opphøyd i
- sqrt(6) , log(5) = naturlig logatime , log(5,2) = $log_{2} (5)$
- Logical: a == 5, b> 10
  - Retunerer TRUE/FALSE or 1/0 , avhening av om vi gjør matematiske opprasjoner på dem
  
### Oprasjoner på heltall

- 10 %% 3 = 1 , da man får en i rest
- 10%/% 3 = 3 - Heltallsversonen av svaret
  - as.integer(10/3) = 3
    - gir oss verdien i heltall
    
### Strings

- noen funskjoner
  - paste(String1,String2, sep = " ") 
    - plasserer to strenger sammen
  - nhar(String) gir oss lengden til Strengen

- Stringr - pakken gir oss flere funskjoner om strenger


  
