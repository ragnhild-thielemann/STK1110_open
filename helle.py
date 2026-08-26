#%%

#%%

import numpy as np
import matplotlib.pyplot as plt


a = 0.3
e_1 = 0.60
e_2 = 0.5
Q = 1367.7 / 4
sigma = 5.67 *10**(-8)

def f(T,e):
    return (1-a)*Q-e*sigma*T**4

T_verdier = np.linspace(250,350,1000)
jordens_temperatur = 16 + 273
ny_likevekt = 273 + 30
plt.plot(T_verdier,f(T_verdier,e_2),color = "purple",label = "f(T) e = 0.5")
plt.plot(T_verdier,f(T_verdier,e_1),color = "hotpink",label = "f(T), e = 0.6")

plt.scatter(ny_likevekt, f(ny_likevekt,e_2),marker = "*", s = 200,color = "silver",edgecolor = "black", label = "(303,0)")

plt.scatter(jordens_temperatur, f(jordens_temperatur,e_1),marker = "*", s = 200,color = "yellow",edgecolor = "black", label = "(288,0)")
plt.grid(True)
plt.axhline(0, color='black', linewidth=1) # Vertikal linje (y-akse)
plt.title("Endring i jordens temperatur som funksjon av temperatur")
plt.xlabel("Temperatur (K)")
plt.ylabel("Temperaturendring per tidsenhet (dT/dt, K/s)")
plt.legend()

plt.show()