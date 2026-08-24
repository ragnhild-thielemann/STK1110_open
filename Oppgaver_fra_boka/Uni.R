
library(tidyverse)
data = read.csv("uni.csv", sep = ",", header = TRUE)


#oppretter en dummyvariabel
x1 = ifelse(data$Sector == "Private",0,1)
x2 = data$Median_SAT


model_tovar = lm(data$Grad_rate ~ x1 + x2)
summary(model_tovar)

model_envar = lm(data$Grad_rate~x2)

summary(model_envar)
cor(x1,x2) 
#man kan bare plotte for å finne modellantagelsene

