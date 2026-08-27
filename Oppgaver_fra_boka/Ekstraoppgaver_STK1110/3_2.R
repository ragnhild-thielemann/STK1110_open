data <- c(2.0, 1.3, 6.0, 1.9, 5.1, 0.4, 1.0, 5.3, 15.7, 0.7, 4.8, 0.9, 12.2, 5.3, 0.6)


l_e = sum(data)/length(data)
print(l_e) #loglighoodestimatoren

#lager to koefedisiensintervaller = et med t-fordeling og et med kji-fordeling

sum_x = sum(data)
n = length(data)
a = 0.1
chi_coef = (1/(2*sum_x))*c(qchisq(a/2,2*n),qchisq(1-(a/2),2*n))

print(chi_coef) #beholdes på 0.05-nivå, mens den forkastes på 0.1-nivå. Dermed ligger p-verdien i dette intervallet