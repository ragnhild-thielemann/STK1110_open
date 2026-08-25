
data = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe7_04.txt", header = TRUE)

X = data[data$mf == "female",]
Y = data[data$mf == "male",]

mu_x = mean(X[,1])
mu_y = mean(Y[,1])
print(mu_x)
mu = mu_x - mu_y
print(mu) #forvenitngsrett estimat på forskjellen i iq. Ser at menn dummere

var_x = var(X[,1])
var_y = var(Y[,1])

var = var_x/nrow(X) + var_y /nrow(Y)

print(var)

forhold = sd(X[,1])/sd(Y[,1])

print(forhold)
print(sqrt(var))

#Vi skal finne et punktestimat på differansen mellom en tilfeldig jente og en tilfeldig gutt. 
#Estimatoren vår blir da X-Y, som da har varians sigma_x^2 - sigma_y^2

st_prediksjon = sqrt(var_x + var_y)
print(st_prediksjon)