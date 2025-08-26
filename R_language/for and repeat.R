#for loop

for (val in 1:10) {
  print(paste("number:,",val))
  # paste for concatanation of string
  
}


f<-c("mango","banana","apple","pomgranate","orange","watermalon")
for (i in f) {
  print(i)
  print(f)
  
}




#repeat
# repeat -------------------> loop without any condition

a<-c("atul","singh","gaharwar","vibhu","singh","dadu")
x<-2
repeat{
  x<-x+1
  if(x>5){
    break
  }
  print(a)
}






