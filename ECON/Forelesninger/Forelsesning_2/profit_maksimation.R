
# kostenadnee

cL = 40
cH = 20
FC = 1000 #faste kostnader

q = 60 # kvantum er 60

L_p = function(q){
  return (cL*q)
}

H_p = function(q){
  return (cH*q + FC)
}

if (L_p(q) < H_p(q)){
  C = L_p(q)
} else {
    C = H_p(q)} #else må stå på samme linje


