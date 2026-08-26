---
title: "README"
output: html_document
---
# Basic R
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
  
### Heltall

- 10 %% 3 = 1 , da man får en i rest
- 10%/% 3 = 3 - Heltallsversonen av svaret
  - as.integer(10/3) = 3
    - gir oss verdien i heltall
    
### Strings

- noen funskjoner for strenger
  - paste(String1,String2, sep = " ") 
    - plasserer to strenger sammen
  - nhar(String) gir oss lengden til Strengen

- Stringr - pakken gir oss flere funskjoner om strenger


## Vektorer

- Konstruerer vektorer ved r = c($e_1,e_2,....,e_n)$)
- Oprasjoner komponeneter virker
**Multiplikasjon**
  - r*r - komponentene går mot hvareande
  - r%*%r gir skalarproduktet
  
- lage en range
  - 1:5
  - seq(1,11,by = 2) #making an sequence

- Vektorer av like tall rep(1,10) 
  - Kan også replikere vektorer rep(c(1,2), each = 5) or rep(c(1,2),times = 5)
  
- Random vektorer
  - rnorm
  - runiform
  
Utplukket i vektorer

- En vektor a, a[1] gir oss det første elementet
- For å få elementene 3-5, a[3:5]

  - use = c(2,6,8) 
    - a[use] - gir oss det 2, 6 og 8 elementet
  - use = c(T,T,F)
    - a[use] = gir oss 1 og 2 element, men ikke tredje


# Utvide R

## Bruke en pakke
- install.packages 
- library()
  - de nye komandoene blir nå tilgjenlig

# Data-frame = tibbls

- data = data.frame(age,gender,income)
  - Hver rad er en observasjon

- read.file
  - leser pene filer
- read.csv 
  - leser delt med comma (sep = "")
- read.delim
- Header = TRUE
  - Dersom det er overskrifter til kolonnene
  
  
# Betingelser

- Kjøre koden ved gitte betingelser
- Bruke if statements
  - if (condition) { 
    code ...}
  
- condition er et logisk statement (true/false)
  - logiske statements
    - if (x == 0){ 
      code ...}
      
- Ved flere betingsler har vi 
  - if both A and B are true : A & B
  - if either A or B are true : A | B 
  - if A not is true : !A
  - En av dem er sanne : xor(A,B)
  
- Bruke pransetser til å kombinere komplekse utrykk

## Logiske vektorer

- x == 0 
  - gir oss en bools vektor om hvorhvidt dette er sant

- Et utsagn A
  - any(A) : dersom en av objektene er sanne 
  - all(A) : dersom alle objentene er sanne
  


