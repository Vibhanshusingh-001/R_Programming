# vector me ek hi tarah ke datatypes ko bas rakh sakte h

#list----using list() function

vec<-c(8,9,4,7,6)
char_vect<-c("ram","shayam","mohan","sohan","rohan")
logic_vec<-c(TRUE,FALSE,TRUE,FALSE,TRUE)
list1<-list(vec,char_vect,logic_vec)
list1

list2<-list("ram","sohan",c(1,2,3,4,5),TRUE,FALSE,25L,26.35)
list2


# naming of list
list3<-list(c("ram","syam","mohan"),c(15,36,96),c("btech","ba","b.sc"))
list3
names(list3)<-c("students","marks","courses")
list3
# accesing the list 
print(list3[3])
print(list3["marks"])
print(list3$marks)

#unlist----->convert list into vector

list3<-list(5:9)
list3
list4<-list(14:19)
list4




v1<-unlist(list3)
v2<-unlist(list4)
res<-v1+v2
res

class(v1)
typeof(v1)
list3<-list(5:9)
list4<-list(14:18)
mer<-list(list3,list4)
mer






