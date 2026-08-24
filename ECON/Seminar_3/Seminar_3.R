

library(readr)
library(tidyverse)
pwt = read.csv("pwt.csv", head = TRUE)

pwt = pwt[pwt$year>1970,]

gdp_nor = pwt[pwt$country == "Norway",]
gdp_nor = data.frame(gdp_nor$year,gdp_nor$gdp)

p = ggplot(gdp_nor,aes(x = gdp_nor.year, y = gdp_nor.gdp)) + geom_point() + labs(x = "Year",y = "GDP",title = "GDP in Norway")
ggsave("GDP_norway.png",plot = p)