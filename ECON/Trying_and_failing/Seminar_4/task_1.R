
library(readr)
library(tidyverse)

#leser inn filen som en dataframe
co2 = read_excel("co2.xlsx",col_names = TRUE)

#filtrerr ut USA
data_USA = co2 |> filter(Code == "USA")
data_china = co2 |> filter(Code == "CHN")

co2_USA_kina = ggplot() + geom_smooth(data = data_USA, aes(x = Year, y = co2,color = "USA")) + geom_smooth(data = data_china , aes(x = Year, y = co2, color = "China") ) + labs(x = "year", y = "utslipp", title = "CO2-utslipp")

ggsave("co2_USA_kina.png",plot = co2_USA_kina)

#lager en ny variabel for økning i utslipp
#legger til den nye kolonnen i det eksisterende datasettet

co2 = co2 |> mutate("growth" = (co2-lag(co2))/lag(co2))

co2_USA_kina_ok = ggplot() + geom_smooth(data = co2[co2$Code== "USA",], aes(x = Year, y = growth, color = "USA")) + geom_smooth(data = co2[co2$Code == "CHN",] , aes(x = Year, y = growth, color = "China") ) + labs(x = "year", y = "utslipp", title = "CO2-utslipp")
                                                                                                                                                

