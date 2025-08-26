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
list3<-list(c("ram","syam","mohan"),c(15,36,96),c("btech","ba","bsc"))
list3
names(list3)<-c("students","marks","courses")
# names------>Function to get or set the names of an object
list3
# accesing the list 
print(list3[2])
print(list3["marks"])
print(list3$marks)

#unlist----->convert list into vector

list3<-list(5:9)#numbers ki list banane ke liye ham esaka use karate h
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


# list lecture ------------------------------------------------------------
a1 <- list(25,36,78,95,"vibhu",TRUE,56+2i,c("students","marks","courses"))
print(a1[4])
print(a1[5])
print(a1[8])
class(a1)
typeof(a1)
str(a1)

typeof(a1[1])#TYPE OF OBJECT
typeof(a1[[1]])# datatype


a2 <- list(rank=c(1,22,3),logical=c(TRUE,FALSE),month=c("jan","feb","mar"),"roll")
print(a2)
names(a2)
print(a2[2])
print(a2[4])
class(a2)
typeof(a2)
str(a2)
print(names(a3)<- c("a","b","c"))



a3 <- list(rank=c(1,22,3),logical=c(TRUE,FALSE),month=c("jan","feb","mar"),"roll")
print(a3)
print(a3$rank[c(1,3)])
a3$rank[[1]]

typeof(a3[1])#TYPE OF OBJECT
typeof(a3[[1]])# datatype




























