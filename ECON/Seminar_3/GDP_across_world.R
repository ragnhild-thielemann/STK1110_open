

library(readr)
library(tidyverse)
pwt = read.csv("pwt.csv", head = TRUE)

pwt = pwt[pwt$year>1970,]

gdp_nor = pwt[pwt$country == "Norway",]
gdp_nor = data.frame(gdp_nor$year,gdp_nor$gdp)

p = ggplot(gdp_nor,aes(x = gdp_nor.year, y = gdp_nor.gdp)) + geom_point() + labs(x = "Year",y = "GDP",title = "GDP in Norway")
ggsave("GDP_norway.png",plot = p)

#grow rates for china
china_70_00 = pwt |> filter(pwt$country == "China" & pwt$year <2000 & pwt$year > 1970)

print(china_70_00)
vekst = function(x){
  vekst = c()
  ar = length(x)
  for (i in 1:ar){
    vekst = c(vekst,x[i+1]-x[i])}
  
  return (vekst)
}

v = (vekst(china_70_00$gdp))
ar = china_70_00$year

frame = data.frame(ar,v)
