
data = c(0.92, 0.79, 0.90, 0.65, 0.86, 0.47, 0.73, 0.97, 0.94, 0.77)

e_x = mean(data)
l_x = mean(log(data))
moment = (1-2*e_x)/(e_x-1)

ll = -(1/l_x)-1

print(moment)
print(ll)

#vise at funksjonsverdien for log-likhoodestimatoren er større enn for momentmetoden
funk = function(estimator){
  verdi = log(estimator + 1) + l_x
  return (verdi)
}

funk(moment)
funk(ll)
