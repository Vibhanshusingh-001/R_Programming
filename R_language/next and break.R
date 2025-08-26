# next-------> jo abhi satement ka execution chal raha hai usame skip the current iteration 
#but not terminate loop until condition will false

a<-1:10;
for (val in a) {

  if (val==5){
    next
  }
  print(val)
  
}


#break-------> to terminate execution (to break the loop)

a<-1
repeat{
  print("vibhu bhai tu kaisa hai")
  if(a==5)
    break
  a<-a+1
}