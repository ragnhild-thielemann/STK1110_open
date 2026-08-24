

library(readr)
library (tidyverse)
data_storting = read.csv("C:/Users/ragnh/OneDrive/Dokumenter/GitHub/STK1110_open/S.csv", sep = ";", header = TRUE)


#Det første jeg vil gjøre er å finne kjønnsfordelingen på Stortinget

#da vi har  norske bokstaver, må vi endre på variabelnavnene
names(data_storting)[5] = "ar"
names(data_storting)[4] <- "Kjonn"

ar_vektor = c(data_storting$ar)
par(mfrow = (c(1,2)))
kjonn_fordeling = ggplot(data_storting,aes(x = Kjonn)) + geom_bar() + labs(x = "Kjonn", y = "Antall", title = "Kjonnsfordeling")
ar_fordeling = ggplot(data_storting,aes(x = ar)) + geom_bar() + labs(x = "Fodselsar", y = "Antall", title = "Aldersfordeling")

par(mfrow = c(1, 1))
ggsave("Aldersfordeling.png",plot = ar_fordeling)