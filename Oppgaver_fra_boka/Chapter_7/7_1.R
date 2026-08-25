data = read.table("https://www.uio.no/studier/emner/matnat/math/STK1110/data/exe7_01.txt",header = TRUE)
#beregner empirisk gjennomsnitt som estimat for mu
n = nrow(data) #teller antall rader
mu_empirisk_gjennomsnitt = (sum(data[,1]))
print(mu_empirisk_gjennomsnitt/n)


#median
 #kan leses direkte med medianen,  eller ved å finne 0.5-kvantilen. 


mu_median = median(data[,1])
a = quantile(data[,1],0.5) #vi leser av kolonne 1 i data-framen
print(a)
print(mu_median)

#standardavvik
s = sd(data[,1])

#sorterer ut alle som har høy nok iq for å komme inni mensa
high_iq = data[data[,1]>100,]
#skal finne forventingsverdien av disse
f_high_iq = mean(high_iq)
print(f_high_iq)

#finner koefeisienten for variasjon

coef = s/mu_empirisk_gjennomsnitt
print(coef) #vi ser at denne er relativt liten