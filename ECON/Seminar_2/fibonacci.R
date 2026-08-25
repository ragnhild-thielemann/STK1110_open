
terms = 10

fib = c()

# i R kan man ikke telle baklengs
for (i in 1:terms){
  if (i == 1 | i == 2){
    fib = c(fib,1)}
  else{
      new = fib[length(fib)] + fib[length(fib)-1]
      fib = c(fib,new)
      }
  
}

print(fib)

f = function(n){
  if (n == 1 | n==2){
    return (1)
    
  }
  else{
    return (f(n-1)+f(n-2))
  }
}

print(f(10))