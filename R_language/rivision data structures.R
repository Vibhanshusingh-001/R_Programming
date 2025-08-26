# datastructure are different types 
# vectors--------(atomic vector) and (list)
#array
#matrics
#factors
#dataframe


#vectors and atomic vectors

a <- c(1,2,3,4,5,6)
b <- c(7,8,9,4,5,6)
c <- sum(a+b)
c


a <- 1:10
a


d <- seq(1,9)
d

a <- seq(1,25,by=2)
a

a <- c(25L,36L,65L,95L,74L,25L)
print(class(a))
print(typeof(a))



a <- c("vibhu","singh","atul","dadu","aakash","badal")
print(class(a))
print(typeof(a))


a <- c(25,36,65,95,74,25)
print(class(a))
print(typeof(a))

b <- c(1,2,3,4)
c <- c(TRUE,FALSE,TRUE,TRUE)# here true is count as 1
d <- sum(b+c)
d



b <-c(1,2,3,4)
b<- c(TRUE,FALSE,TRUE,TRUE)




a <- c("ram"=15,"syam"=25,"mohan"=36)
a
# naming of vector
a1 <- c("ram","atul","dadu")
names(a1) <- c("y1","y2","y3")
a1
a1[2]

#array ------> to store two dimensional dataset

# array(data=c(),dim=c(row,column,matrix),dimnames=c())


a1 <- c(1,2,3,4,5,6)
b1 <- c(2,3,6,5,41,2,5)
a3 <- array(data=c(a1,b1),dim = c(3,3,2))
a3

a1 <- c(1,2,3,4,5,6)
b1 <- c(2,3,6,5,41,2,5)
row_name <- c("r1","r2","r3")
col_name <- c("c1","c2","c3")
mat_name <-c("mat1","mat2") 
a3 <- array(data=c(a1,b1),dim = c(3,3,2),dimnames = list(row_name,col_name,mat_name))
a3


#acess of matrics

print(a3[1,2,2])
print(a3[,2,2])
print(a3[,,1])



#list------>in vector we can store one type of data but in list we can store multiple types of data

#list is prepared by list function

a1 <- c(15,25,36,25,14)
a2 <- c("ram","mohan","sohan")
a3 <- c(TRUE,FALSE,TRUE,TRUE)
a4 <- list(a1,a2,a3)
a4

list1 <- list(12,36,56,25,26,c("vibhu","atul","dadu"),TRUE,FALSE)
list1



list3<-list(c("ram","syam","mohan"),c(15,36,96),c("btech","ba","bsc"))
list3

# acess the list
print(list3[2])
print(list3$mohan)
print(list3[1:3])


#unlist ------->used to convert list into vector

list3<-list(c("ram","syam","mohan"),c(15,36,96),c("btech","ba","bsc"))
list3
unlist(list3)




list1 <- list(1:10)
list1

list2 <- list(11:20)
list2

v1 <- unlist(list1)
v2 <- unlist(list2)
res <- v1+v2
res


# creation of dataframe

employeedata <-data.frame(
  emp_id = c(1:5),
  emp_name = c("x","y","z","a","b"),
  emp_sal = c(122,123,124,125,126),
  start_date = as.Date(c("1/07/2024","1/07/2024","1/07/2024","1/07/2024","1/07/2024")),
  stringsAsFactors = FALSE
  
  
) 
print(employeedata)
str(employeedata)

# acessing the table

a3 <- data.frame(employeedata$emp_id,employeedata$emp_sal)
a3


print(employeedata[3,2,])# row column

print(employeedata[1:4,2])

# cbind and rbind ---->for addition of row and  column

x <- c(7,8,9,10,11)
rbind(employeedata,x)

y <- list("a","b","c")
cbind(employeedata,adress=y)



employeedata <- employeedata[-2,]# second row gayab ho gyi
employeedata
employeedata$emp_name <- NULL# jo gayab karna ho wo null kardo
employeedata



print(summary(employeedata))# for summary of the table

# matrix
# matrix----> function is used
#matrix(data=  ,nrow,ncol,byrow,dimnames)
a1 <- c(1,2,3,4,5)
a2 <- c(11,22,3,7)
a3 <- matrix(data=c(a1,a2),nrow = 3,ncol = 3,byrow = TRUE)
a3


a1 <- c(1,2,3,4,5)
a2 <- c(11,22,3,7)
nrow_name <- c("r1","r2","r3")
ncol_name <- c("c1","c2","c3")
a3 <- matrix(data=c(a1,a2),nrow = 3,ncol = 3,byrow = TRUE,dimnames = list(nrow_name,ncol_name))
a3


# manipulation inside matrix

a3[2,3] <- 0
a3
a3[2,2] <- 0
a3

a3[a3>2] <- 0
a3


#operation on matrix

a1 <- c(1,2,3,4,5)
a2 <- c(11,22,3,7)
nrow_name <- c("r1","r2","r3")
ncol_name <- c("c1","c2","c3")
mat_name <- c("mat1","mat2")
a3 <- array(data=c(a1,a2),dim = c(3,3,2),dimnames = list(nrow_name,ncol_name,mat_name))
a3

a1 <- c(1,22,31,42,55)
a2 <- c(1,2,3,7)
nrow_name <- c("r1","r2","r3")
ncol_name <- c("c1","c2","c3")
mat_name <- c("mat1","mat2")
a4 <- array(data=c(a1,a2),dim = c(3,3,2),dimnames = list(nrow_name,ncol_name,mat_name))
a4

sum <- a3+a4
sum

#operation on matrix

m1 <- matrix(data = 1:9,nrow = 3,ncol = 3)
m1
m2 <- matrix(data=11:19,nrow = 3,ncol=3)
m2
sum <- m1+m2
sum

# rbind and cbind-----> to add row  and column
rbind(a4,c(1,2,3))

cbind(a3,c(3,2,1))


# r vector function

#rep()----------->function

rep(c(1,2,3),each=3)
rep(c(2,2,4),time=5)
rep(c(1,5),length.out=8)
rep(c(1:5),length.out=8)
rep(c(4,2),time=c(3,5))


#seq()------------->function
seq(1,5,by=2.5)
seq(1,60,by=2)
seq(from=12,to=20,by=2.5)
seq(from=20,to=10,by=-2)
seq(from=5,to=50,length.out=100)

# all and any function

x <- 1:15
all(x>0)

y <- 1:20
any(y>20)




































