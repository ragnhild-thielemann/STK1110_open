data <- c(2.0, 1.3, 6.0, 1.9, 5.1, 0.4, 1.0, 5.3, 15.7, 0.7, 4.8, 0.9, 12.2, 5.3, 0.6)


l_e = 1/(sum(data)/length(data))
print(l_e) #loglighoodestimatoren

#lager to koefedisiensintervaller = et med t-fordeling og et med kji-fordeling

sum_x = sum(data)
n = length(data)
a = 0.1
chi_coef = (1/(2*sum_x))*c(qchisq(a/2,2*n),qchisq(1-(a/2),2*n))
h_0 = 0.35
print(chi_coef) #beholdes på 0.05-nivå, mens den forkastes på 0.1-nivå. Dermed ligger p-verdien i dette intervallet

print(qchisq(0.95, 2*n))
Test = (l_e - 0.35)/(0.35/sqrt(n))
print(Test)
Test_1 = 2*h_0*sum_x #har chi-fordeling
print(Test_1)

#finner p-verdiern

p_verdi = pchisq(Test_1,2*n)
print(1-p_verdi)

#Jeg kom til oppgave f