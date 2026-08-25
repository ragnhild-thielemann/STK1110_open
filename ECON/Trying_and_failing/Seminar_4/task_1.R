
library(readr)
library(tidyverse)

#leser inn filen som en dataframe
co2 = read_excel("co2.xlsx",col_names = TRUE)

#filtrerr ut USA
data_USA = co2 |> filter(Code == "USA")
data_china = co2 |> filter(Code == "CHN")

co2_USA_kina = ggplot() + geom_smooth(data = data_USA, aes(x = Year, y = co2,color = "USA")) + geom_smooth(data = data_china , aes(x = Year, y = co2, color = "China") ) + labs(x = "year", y = "utslipp", title = "BNP over tid")

ggsave("co2_USA_kina.png",plot = co2_USA_kina)

#lager en ny variabel for økning i utslipp
#legger til den nye kolonnen i det eksisterende datasettet

co2 = co2 |> mutate("growth" = (co2-lag(co2))/lag(co2)) #finner margianltettheten ved å finne differenasen på den kummulative fordelingen
ggplot() + geom_smooth(data = co2[co2$Code== "USA",], aes(x = Year, y = growth, color = "USA")) + geom_smooth(data = co2[co2$Code == "CHN",] , aes(x = Year, y = growth, color = "China") ) + labs(x = "year", y = "utslipp", title = "Vekst i Co2")

#skal finne total vekst i BNP for hele verden. Dette lages som en ny insans, som en måte å utvide datasettet vårt på

global = co2 |> summarize(.by = Year, mean_co2 = sum(co2,na.rm = TRUE)) #garnaterer at det er et element der
#blir da bare en totuppelet data_frame, der vi har verdens totale kummulative utslipp i de to årene

#Dette skal da plottes som en total plot
ggplot(global) + geom_point(aes(x = Year,mean_co2)) + labs(x = "year", y =  "Utslipp",title = "Verdens totale utslipp")
p = ggplot(global) + geom_point(aes(x = Year,mean_co2)) + labs(x = "year", y =  "Utslipp",title = "Verdens totale utslipp")
ggsave("totale_utslipp.png",plot = p)

us = co2 |> filter(Code == "USA") |> select(Year, co2_usa = co2) #lager usa bare som en tuppel med år og utslipp i usa

china = co2 |> filter(Code == "CHN") |> select(Year, co2_china = co2)

global_us = left_join(global,us) #legger til usas utslipp spesefikt for de ulike årene
global_us_china = left_join(global_us,china) #legger ved kinas utslipp spesefikt for de ulike årene

global_us_china = global_us_china |> mutate(us_andel = ((co2_usa)/mean_co2)) |> mutate(china_andel = (co2_china)/mean_co2) #tar prosenen av verdens totale utslipp som variat



p = ggplot() + geom_point(data = global_us_china, aes(x = Year, y = us_andel,color = "USA")) + geom_point(data = global_us_china, aes(x = Year, y = china_andel,color = "China")) + labs(x = "Year", y = "Andel (1 tilsvarer 100%)", title = "Andel av verdens totale utslipp") 
ggsave("USA_mot_kina.png",plot = p)