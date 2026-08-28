

sigma = 9

B = function(n){
  svar = qnorm(0.01) + 1/(sigma/sqrt(n))
  return (svar)
}

n_ = c(100,900,2500)

for (n in n_){
  print(pnorm(B(n)))
}