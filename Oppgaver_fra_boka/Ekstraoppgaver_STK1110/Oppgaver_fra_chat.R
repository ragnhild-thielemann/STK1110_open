data_eks = c(1.2,0.8,2.1,0.4,1.7,3.5,0.9,1.1,2.8,0.6)


n = length(data_eks)


ml = n/sum(data_eks)
print(ml)
a = 0.05
konstant = 
intervall = (1/(2*sum(data_eks)))*(c(qchisq(a/2,2*n),qchisq(1-a/2,2*n)))

print(intervall)

# lager en LR-test

h_0 = 0.1 #nullhypotese

test_observator = 2*n*log(ml)-2*n*log(h_0)-2*(ml-h_0)*sum(data_eks)
test = 2*h_0*sum(data_eks)
pchisq(test,2*n)

LR_forkatsining =1-pchisq(test_observator,1)
print(LR_forkatsining)


verdi = pf(5.57,4,28)
print(verdi)