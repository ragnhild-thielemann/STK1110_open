

library(readr)
library(tidyverse)
pwt = read.csv("pwt.csv", head = TRUE)

pwt = pwt[pwt$year>=1970,]

gdp_nor = pwt[pwt$country == "Norway",]
gdp_nor = data.frame(gdp_nor$year,gdp_nor$gdp)

p = ggplot(gdp_nor,aes(x = gdp_nor.year, y = gdp_nor.gdp)) + geom_point() + labs(x = "Year",y = "GDP",title = "GDP in Norway")
ggsave("GDP_norway.png",plot = p)

#grow rates for china
china_70_00 = pwt |> filter(country == "China" & year <= 2000 & year >= 1970) |> mutate(growrate = (gdp - lag(gdp))/lag(gdp))

print(pwt)

china_70_00 = china_70_00 |> filter(year > 1970)

china_70_00$growrate[1] = 0

p = ggplot(china_70_00) + geom_point(aes(x = year, y = growrate)) + labs(x = "year", y = "growrate", title = "Kinesisk vekst")
ggsave("kinas_vekst.png",plot = p)

qnorm(1-0.01/2)
pnorm(2.236)