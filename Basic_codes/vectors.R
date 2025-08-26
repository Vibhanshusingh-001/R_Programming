# data structure is a way to store data in a memory
#array
#vector
#array
#list
#matrix
#data frames

#element of vector is known as component
#vector are two type ---->atomic vecrtor and list

a<-c(4,3,6,9,8)
a
b<-c(4,5,5,6,7)
b
print(sum(a,b))


a<-c(15,65,36,28,94)
a
b<--3:5
b


sequ<-seq(1,5,length.out=7)# length out ka use karate hai values me gap laane ke liye
sequ

x<-seq(1,3,by=.5)
x

# atomic vector----numric vector,integear vector,character vector


a<-c(45L,36L,36L,65L)
print(class(a))
#numeric to integer
q<-c(15,65,36,28,94)
q<-as.integer(q)
print(class(q))

#caharacter
b<-c(45,14,36,65)
b<-as.character(b)
a<-c("ram","shyam","mohan")
print(class(a))


char.vec<-c("ram"=15,"shayam"=36,"mohan"=69)
char.vec[1:3]

# agar hame kisi ko khojana hai indexing ki madad se tab hame sqaure braket use karna hota h
a1<-c(1,2,3,4,5)
a1[c(TRUE,FALSE,TRUE,FALSE,FALSE)]
# isame jo true honge wahi bas print kar ke dega



#vector operation
a1<-c(45,14,36,65)
a2<-c(15,65,36,28)
a1+a2
print(sum(a1,a2))

a3<-c("ram","syam","mohan","sohan")
a1<-c(45,14,36,65)
a4<-c(a1,a3)
a4


a2<-c("ram","shayam","mohan","sohan")
a2[3]
a2[7]
f
a2[2:4]
a2[c(2,3,2,1,4)]

#naming of vector
z<-c("ram","atul","mohan")
z
names(z)=c("y1","y2","y3")
z
print["y1"]








