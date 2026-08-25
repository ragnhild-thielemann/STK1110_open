

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
gdp_1970 = (pwt$gdp[pwt$year == 1970])
gdp_2000 = (pwt$gdp[pwt$year == 2000])


a = pwt$country[pwt$year== "1970"]
print(a)
growth = data.frame( "Land" = a, "1970" = gdp_1970 ,"2000" =  gdp_2000)


#lager en vektor med logaritmen til gdp. Dette blir lagt til som en ekstra kolonne
pwt$lgdp = log(pwt$gdp)
growth = growth |> mutate("growth" = (growth[,2] - growth[,3])/growth[,3])
print(growth$X1970)

#tar logaritmen av de to, og setter disse som kolonnene i data-framen
growth$X1970 = log(growth$X1970)
growth$X2000 = log(growth$X2000)

p = ggplot(growth) + geom_point(aes(x = X1970, y = growth)) + labs(x = "Logaritmen av BNP - 1970" , y = "vekst 1970-2000" , title = "Vekst som funksjon av BNP")

ggsave("Vekst_BNP.png", plot = p)

#lager en dummyvariabel som en egen kolonne, om hvorhvidt gdp vokser eller ikke
pwt_growth = pwt |> mutate("vekst" = ifelse((gdp-lag(gdp))/lag(gdp)<0,0,1))


#finner forveningsrverdien til antallet år det har vært vekst i bnp , na.rm = TRUE -> garanterer at det er et datapunkt der.
pwt_fraction = pwt_growth |> group_by(country) |> summarise(mean(vekst, na.rm = TRUE))

