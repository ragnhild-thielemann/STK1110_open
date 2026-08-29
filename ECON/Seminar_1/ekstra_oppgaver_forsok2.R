#

t = function(x1,y1,x2,y2){
  s_r = x1 == x2
  s_c = y1 == y2
  s_n = abs(x1-x2) == abs(y1-y2)
  if (s_r | s_c | s_n){
    return (TRUE)
  } else {
    return (FALSE)
  }
}


truet = function(x,row,old_x) {
  if (row == 1){
    return (FALSE)
  }
  if (length(old_x) == 0){
    return (FALSE)
  }
  x1 = x
  y1 = row
  
  truet_vektor = c()
  for (r in 1:(row-1)){
    x2 = old_x[r]
    y2 = r
    print(c(x1,y1,x2,y2))
    if (t(x1,y1,x2,y2)==TRUE){
      truet_vektor = c(truet_vektor, TRUE)
    }else{
      truet_vektor = c(truet_vektor, FALSE)
      
    }
    
  }
  if (any(truet_vektor) == TRUE){
    return (TRUE)
  } else{
    return (FALSE)
  }
}

print(truet(5,4,c(1,4,2)))


posisjoner = c()
for (r in 1:8){
  
  posisjoner = c()
  if (truet(x,r,posisjoner)== FALSE){
    posisjoner = c(posisjoner, x)
    x = 1
  }else{
    x = x + 1
  }
}
print(posisjoner)