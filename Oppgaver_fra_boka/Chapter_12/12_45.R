
library(readr)

data = read.csv("f.csv", sep = " ", header = F)

x_values = data |> filter(data$V1 == "x")
y_values = data |> filter(data$V1 == "y")

print(x_values)

vektor_xverdier = c()
vektor_yverdier = c()
for (i in 1: nrow(x_values)){
  vektor_xverdier = c(vektor_xverdier, as.double(x_values[i,2:9]))
  vektor_yverdier = c(vektor_yverdier, as.double(y_values[i,2:9]))
  
}

#skal så finne første og andre-moment
print(vektor_xverdier)
sum_x = sum(vektor_xverdier)
print(vektor_xverdier)
print(vektor_yverdier)

sum_y = sum(vektor_yverdier)
n = length(vektor_xverdier)
s_xx = sum(vektor_xverdier**2)-n*(sum_x/n)**2
s_xx = sum(vektor_yverdier**2)-n*(sum_y/n)**2

s_xy = sum(vektor_xverdier*vektor_yverdier) - n*(sum_y/n)*(sum_x/n)
a = vektor_xverdier*vektor_yverdier
print(a)

a_1 = 0.05
a_2 = 1-0.99
a = qt(1-a_1/2,8)
print(a)
b = qt(1-a_2/2,8)
print(b)
