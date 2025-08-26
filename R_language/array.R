#array()------->is data object to store data in more than two dimension

#array()----array(data,dim,dimnames)
#dim(2,2,3)-------->(row,column,matrix)

v1 <- c(45,58,69)
v2<-c(95,36,98)
v3 <-array(c(v1,v2),dim=c(3,3,2))
print(v3)


# naming of matrix
a1 <- c(59,36,98,45)
a2 <- c(89,58,74,85,25)
row_name <- c("r1","r2","r3")
col_name <- c("c1","c2","c3")
mat_name <- c("mat1","mat2")
a3 <- array(c(a1,a2),dim = c(3,3,2),dimnames =list(row_name,col_name,mat_name) )
print(a3)

#accesing the array


print(a3[,,2])
print(a3[,2,2])
print(a3[2,,])
print(a3[1,,1])
print(a3[1,2,2])




# addition and substraction on matrix

total <- v3+a3
print(total)






