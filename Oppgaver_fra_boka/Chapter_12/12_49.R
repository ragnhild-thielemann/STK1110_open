library(readr)

data = read.csv("f.csv", sep = " ", header = F)

x_verdier = data |> filter(V1 == "x")
y_verdier = data |> filter(V1 == "y")
x_vektor = c()
y_vektor = c()
n = ncol(data)
for (i in 1:nrow(x_verdier)){
  x_vektor = c(x_vektor, as.double(x_verdier[i,2:n]))
  y_vektor = c(y_vektor, as.double(y_verdier[i,2:n]))
}

print(x_vektor)

model = lm(y_vektor ~ x_vektor)

summary(model)
print(n)

kvantil = qt(0.975,18)
print(kvantil)
