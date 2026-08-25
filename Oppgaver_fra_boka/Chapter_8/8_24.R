
library(tidyverse)

data_ = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe8-24.txt",header = TRUE)

#bruker en data_frame til å lage qq-plottet
ggplot(data_) +
  geom_qq(aes(sample = data_[,1])) +
  geom_qq_line(aes(sample = data_[,1])) + labs(x = "quantiles",y = "sample", title = "QQ-plot")

#lage et 0.95-prosent coefesidensintervall

m = mean(data)
s = var(data)

intervall = m + sqrt(s/n)*c(-1.96,1.96)
print(intervall) #gir oss da et tosidig koefesiensintervall

