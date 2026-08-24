library(readr)
library (tidyverse)
data = read.csv("C:/Users/ragnh/OneDrive/Dokumenter/GitHub/STK1110_open/24_08_2026/privat_S.csv", sep = ";", header = TRUE)


privat = ggplot(data, aes(x = Periode)) + geom_bar() + labs(x = "Periode", y = "Antall forslag", title = "Private forslag i stortinget")

ggsave("private_forslag.png", plot = privat)
view(data)
