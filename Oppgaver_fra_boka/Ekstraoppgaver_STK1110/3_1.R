

n = 10000
mu = 1
st = sqrt(2)

X = rnorm(n,mu,st)
Y = rlnorm(n,mu,st)
#Finner loglighoodestimatorene

mu_l_X = (sum(X))/n
mu_l_Y = (sum(log(Y)))/n

print(mu_l_X)
print(mu_l_Y)

#Finner momentestimatorene 
f_m_Y = log(sum(Y)/n)
a_m_Y = log(sum(Y**2)/n)

mu_Y = (4*f_m_Y-a_m_Y)/2

print(mu_Y)

mu_X = sum(X)/n
print(mu_X)




