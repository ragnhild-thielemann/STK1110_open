
#oppgave 1
t = function(x1,y1,x2,y2){
  samme_linje = x1==x2
  samme_rad = y1==y2
  linjert = (y1-y2) == -(x1-x2)
  if (samme_linje || samme_rad || linjert){
    return (TRUE)
  } else{
    return (FALSE)
  }
}





#Oppgave 2
#Når vi skal plassere åtte dronninger, bruker vi fakultetsfunksjonen



threatened = function(x,row.numer,old.x){
  if (row.numer == 1){
    return (FALSE)
  }
  truet_vektor = c()
  for (r in 1:(row.numer-1)){
    punkt = c(old.x[r],r)
    x2 = old.x[r]
    y2 = r
    y1 = row.numer
    x1 = x
    print(c(x1,y1,x2,y2))
    
    if ((x1 == x2 )|| abs(x1-x2)==abs(y1-y2)){
      truet_vektor = c(truet_vektor,TRUE)
      
    } else {
      truet_vektor = c(truet_vektor,FALSE)
    }}

    if (any(truet_vektor)== TRUE){
      return (TRUE)
      
    
    } else{
      return(FALSE)
    }
    
      
  }
    
    


a = threatened(3,5,c(1,5,8,7))
print(a)