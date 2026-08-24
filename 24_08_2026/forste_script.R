

library(readr)
library (tidyverse)
data = read.csv("C:/Users/ragnh/OneDrive/Dokumenter/GitHub/STK1110_open/S.csv", sep = ";", header = TRUE)


#Det første jeg vil gjøre er å finne kjønnsfordelingen på Stortinget

#da vi har  norske bokstaver, må vi endre på variabelnavnene
names(data)[5] = "ar"
names(data)[4] <- "Kjonn"


ar_fordeling = ggplot(data,aes(x = ar)) + geom_bar() + labs(x = "Fodselsar", y = "Antall", title = "Aldersfordeling")
ggsave("Aldersfordeling.png",plot = ar_)