library(readr)
library(tidyverse)
fil = read.csv("orkester.csv", sep = "",header = FALSE)

#Da filen er uten overskrifter, legger jeg til overskrifter manuelt
names(fil)[1] = "orkester"
names(fil)[2] = "spilletid"

ggplot() + geom_qq(data = fil, mapping = aes(sample= spilletid)) + geom_qq_line(data = fil, mapping = aes(sample = spilletid)) + labs(x = "Quantiles", y = "Sample", title = "QQ-plot")

#For å finne et koefeddisensintervall, finner vi først empirisk stanadavvik for datasettet

s = var(fil$spilletid)
n = length(fil$spilletid) #finner antall observasjoner
a = 0.05 #koefedisengraden
u = qchisq(1-a/2,n-1) #beregner kvantiler
l = qchisq(a/2,n-1)

intervall = sqrt((s*(n-1))*c(1/u,1/l))


print(intervall) #skriver ut koefedisiensintervaller for svanadaviket

#Da hele koefedisiensintervallet ligger utenfor null, kan vi konkludere med at forskjellen mellom ulike strykere er signifikant


