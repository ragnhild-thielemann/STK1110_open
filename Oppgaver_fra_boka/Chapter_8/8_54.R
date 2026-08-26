
n = 16
S = 0.8483

u = qchisq(0.975,15)
l = qchisq(0.025,15)

intervall = (S**2*(n-1))*c(1/u,1/l)
print(intervall)