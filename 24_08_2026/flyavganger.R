
library(tidyverse)
library(nycflights13) #har importert pakken, og bruker nå dette biblioteket, der det er et innebygd datasett


#Vi ønsker å lage nye dataframes, der vi betinger variablene i framen vår

b = flights |> 
  filter(dep_delay > 120) #dette er alle linjene i framen, der forsinkelesen er over 120 minutter

a = flights |> filter(dep_delay > 120) |> filter(dep_time > 900) #kan legge ved flere betingelser

#skal finne alle flyene som dro første januar

januar1 = flights |> filter(month %in% c(1,2))

print(januar1)

sortert_dato = flights |> arrange(year,month, day)



delay = flights |> filter(dep_delay>(60*2))

f = ggplot(delay , mapping = aes(x = dep_delay, y = arr_delay))  + geom_point() + labs(x = "Depature", y = "Arrival", title = "Korrelerte forsinkelser")
ggsave("cor_forsinkelser.png",plot = f)

#Forsiknet, men klarte å ta igjen -> tar det dobbelt
a = flights |> filter(dep_delay> 120 & arr_delay < (dep_delay-30)) 


a = flights |> arrange(desc(dep_delay))


#flyr til Houston

a = flights |> filter(dest == "HOU" | dest == "IAH")


#sortere fra seneste til tidligste flyvning
tidlig = flights |> arrange((dep_time))

#henter ut det første flyet
tidlig[-1,]