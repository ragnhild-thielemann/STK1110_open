
library(tidyverse)

x = c(16.88, 10.23, 4.59, 6.66, 13.68, 14.23, 19.87, 9.40, 6.51, 10.95)
x_2 = sum(x**2)
sort(x)
n = length(x)
m_x = x_2/(2*n)
print(m_x)
#finner medianen av datasettet
m = sqrt(2*m_x*log(2))
print(m)