#skal lage en bootstrapping
library(boot)
library(tidyverse)
#liste over tips til en resturant. Da n er liten, må vi bruke bootstrapping
data = c(22.7, 16.3, 13.6, 16.8, 29.9, 15.9, 14.0, 15.0,
         14.1, 18.1, 22.8, 27.6, 16.4, 16.1, 19.0, 13.5,
         18.9, 20.2, 19.7, 18.2, 15.4, 15.7, 19.0, 11.5,
         18.4, 16.0, 16.9, 12.0, 40.1, 19.2)
tip_frame = data.frame(tips = data)
print(tip_frame)
#lager et qq-plot for å skjekke normalantagelsen


ggplot(tip_frame) + geom_qq(aes(sample = tips),color = "hotpink") + geom_qq_line(aes(sample = tips ),color = "blue")  +   labs(x = "z-score", y = "sample")
#Av qq-plotet ser vi at fordelingen er positivt skjev. Når vi finner median og forventningsverdi, ser vi at median < forventingsverdi, som bekreftere positiv skjevhet i fordelingen

#lager også et histogram, så den skjeve fordelingen komemr tydligere frem

ggplot(tip_frame) + geom_histogram(aes(sample(tips)), fill = "hotpink") + labs(x = "Tips", y = "Antall", title = "Data")
info = function(x){
  
  return(c(mean =  mean(x), st = sd(x),median = median(x)))
  
}

print(info(tip_frame$tips))

#Trimmed mean -> forventingsverdi der man fjerner ekstremverdiene

#Definerer en funksjon, som regner gjennomsnittet av datasettet x, og gjør gjennomsnittet av observasjonene trukket ut til bootstrapputvalget
my_mean = function(x,i){mean(x[i])}

set.seed(1) #gjør at vi får tilbakelegging av dataene våre. 

mean.boot = boot(data = tip_frame$tips,
                 statistic = my_mean,
                 R = 10000)

print(mean.boot)
print(info(tip_frame$tips))