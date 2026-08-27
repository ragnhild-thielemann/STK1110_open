# Simulerte terningkast for å illustrere store talls lov

n = 100 
terning_som_kastes = sample(1:6, n , replace = TRUE) #trekker med tilbakelegging n terninger

oppsamling = cumsum(terning_som_kastes)
print(oppsamling/(1:n))
