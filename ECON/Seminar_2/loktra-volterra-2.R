
#bruker bare samme koden som fra forrige gang
library(tidyverse)
T = 200
R_v = c()
F_v = c()
R_1 = 80
F_1 = 20
a = 0.07
b = 0.002
c = 0.2
d = 0.0025
T_v = c(1)

R_v = c(R_v,R_1)
F_v = c(F_v,F_1)

for (i in 2:T){ 
  if (i<80){
  R_new = (1+a)*(R_v[length(R_v)] - b*R_v[length(R_v)]*F_v[length(F_v)])
  R_v = c(R_v,R_new)
  F_new = (1-c)*F_v[length(F_v)] + d*R_v[length(R_v)] *F_v[length(F_v)]
  F_v = c(F_v,F_new)
  T_v = c(T_v,i)}
  else{
    R_new = ((1+a)*(R_v[length(R_v)] - b*R_v[length(R_v)]*F_v[length(F_v)]))*0.3
    R_v = c(R_v,R_new)
    F_new = (1-c)*F_v[length(F_v)] + d*R_v[length(R_v)] *F_v[length(F_v)]
    F_v = c(F_v,F_new)
    T_v = c(T_v,i)
  }
}

lv = data.frame(Tid = T_v,Fox  = F_v , Rabbit = R_v)
s = ggplot(lv) + geom_point(aes(x = Tid, y = Fox, color = "Fox")) + geom_point(aes(x = Tid, y = Rabbit,color = "Rabbit")) + labs(x = "Time", y = "Antall i bestanden", title = "Lotka-volterra")
ggsave("dode_harer.png", plot = s)