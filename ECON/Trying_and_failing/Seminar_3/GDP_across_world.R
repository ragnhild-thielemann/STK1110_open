

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

#lager veksten i kina som en ny variabel
china = pwt |> filter(country == "China" & year >= 1970 & year <=2000) |> mutate("vekst" = (gdp-lag(gdp))/lag(gdp)) #mutate lager en ny kolonne i data_framen

#finner logaritmen til gdp i årenen henholdsvis 1970 og 2000
gdp_1970 = log(pwt$gdp[pwt$year == 1970])
gdp_2000 = log(pwt$gdp[pwt$year == 2000])


a = pwt$country[pwt$year== "1970"]
print(a)
pwt.growth = data.frame( "Land" = a, "1970" = gdp_1970 ,"2000" =  gdp_2000)
view(pwt.growth)

