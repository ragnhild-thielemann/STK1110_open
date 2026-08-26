

library(readxl) #importerer pakken som leser excel-filer
library(tidyverse) #Importerer biblioteket for plotting
library(countrycode)
?countrycode
#leser inn filen som en dataframe
co2 = read_excel("co2.xlsx", col_names = TRUE) #Leser inn filen, og presiserer at kolonnene har titler

#task 1)
ggplot() + geom_line(data = co2 |> filter (Code == "USA"), aes(x = Year, y = co2, color = "USA")) + geom_line(data = co2 |> filter(Code == "CHN"), aes( x = Year, y = co2 , color = "China")) + labs(x = "Year", y = "co2", title = "CO2-emmisions")

#vi gjør utvelgelsen av  data direkte i plottet, og opretter ikke egne tibbels for dette

#task 2)

#vi skal legge til en ny kolonne til datasettet, som viser hvorhvit utslippene har økt eller ikke fra det foregående året

co2 = co2 |> mutate("increase" = (co2-lag(co2)))

#task 3) 
#vi skal nå lage en tibble med de gloable kummulative utslippene i verden.

global = co2 |> summarize(.by = Year, sum(co2, na.rm = TRUE)) #grupperer på år, og garanterer at det er noe i cellene i datasettet
names(global)[2] = "Utslipp" #endrer overskrift til "utslipp"

us = co2 |> filter(Code == "USA")
names(us)[4:5]= c("Utslipp_USA", "okning_USA") #endrer navn på kolonnene, så det blir lettere å lese av
us = data.frame(Year = us$Year,us[4:5])

china = co2 |> filter(Code == "CHN")
names(china)[4:5]= c("Utslipp_China", "okning_China") #endrer navn på kolonnene, så det blir lettere å lese av
china = data.frame(Year = china$Year,china[4:5])

global = left_join(global,us)
global = left_join(global,china)
#har nå laget en tibble med all dataen
#nå skal vi lage en ny kolonne, som viser henholsvis kina og usas andel av verdens totale utslipp


global = global |> mutate("us_andel" = Utslipp_USA/Utslipp) |> mutate("kina_andel"= Utslipp_China/Utslipp)

#Viktig modellantagelse = vi ser på kummulative utslipp! Derfor skal det mye til før kina tar igjen vesten :):)

ggplot(global) + geom_line(mapping = aes(x = Year, y = us_andel,color = "USA")) + geom_line(aes(x = Year , y = kina_andel, color = "Kina")) + labs(x = "Year", y = "Prosentandel", title = "Kummulative  utslipp")
ggsave("kummulative_utslipp.png", plot = cum)

#plotter også økningen i CO2, da dette er et bedre mål på hvordan de ulike landnee er

ggplot(global |> filter(Year > 1900)) + geom_line(mapping = aes(x = Year, y = log(okning_USA),color = "USA")) + geom_line(aes(x = Year , y = log(okning_China), color = "Kina")) + labs(x = "Year", y = "Prosentandel", title = "okning i utslipp")


global = global |> mutate(continent = country(Code))
view(global)