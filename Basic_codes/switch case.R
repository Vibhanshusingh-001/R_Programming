# switch case do tarah se implement kiya jata hai based on matching value and index value
#switch(expression,case1,case2,case3)

#implementation based on index value 
a<-switch(2,
          "vibhu",
          "singh",
          "dadu",
          "gaharwar"
          
          )
print(a)

# implementation based on matching value 
 
x<-"26"
y<-switch(x,
          "26"="vibhu",
          "25"="dadu",
          "36"="gaharwar",
          "29"="aakash"
          )
print(y)