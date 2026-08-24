---
title: "README"
output: html_document
---

# Eksempel 12.16

I denne oppgaven skal vi se på korrelasjonen mellom høyde og spenn fra fingerspiss til fingerspiss.

# Oppgave 12.83

Denne oppgaven tar for seg multippel linjær regresjon. Vi har følgene variabler i datasettet [data](https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe12-83.txt)


# Analyse av resulatene ved ulike universiteter

Datasettet [Data] (https://github.com/ragnhild-thielemann/STK1110_open/blob/main/uni.csv) har følgene variabler:

$$
Y = b_0 + b_1 \cdot x_1 + b_2 \cdot x_2 + \epsilon 
$$


|Variabel| Forklaring|Estimat|St.avvik|p-verdi|
|-|-|-|-|-|
|y|Andelen som fullfører etter seks år|
|b_0|Konstantledd|-111.22|33.4|0.004|
|x1| 0 hvis offentig, 1 hvis privat|-13.3|4.64|0.010|
|x2| SAT-scoren til universitetet|0.164|0.03289|0.000108|
|$\epsilon$| Feilleddet til regresjonsmodellen|9.48||
|$R^2$|Hvor mye av feilleddene som fanges opp av modellen|0.605|||
Vi ser at alle variablene er sigifikante. 
Ved kjøring av  koden, får vi også at korrelasjonen er 0.394 mellom STAT-scoren og hvorhvit universitetet er offentlig eller privat. 

