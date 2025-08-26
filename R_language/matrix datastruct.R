# matrix---> two diamensional data ko store kiya jata hai

#matrix()------>matrix(data,nrow,ncol,byrow,dimnames)

mat <- matrix(data=2:14,nrow = 4,ncol = 4,byrow = FALSE)
mat
#byrow-->agar true hai to arrangement by row hogi nhi to agr false hai to aarangement by column hogi
m1 <- matrix(data = 1:15,nrow = 3,byrow = FALSE)
m1

m2 <- matrix(data = 5:20,ncol = 4,byrow = FALSE)
m2

a1 <- c(1,2,3,4,5,6)
a2 <- c(6,5,4)
ncol_name <- c("c1","c2","c3")
nrow_name <- c("r1","r2","r3")
a3 <- matrix(data=c(a1,a2),nrow = 3,ncol = 3,byrow = FALSE,dimnames = list(nrow_name,ncol_name))
a3


# how to acess matrix

print(a3[1,2])
print(a3[2,])
print(a3[,2])


#manipulation inside matrrix

a3[2,3] <- 0
a3
a3[2,2] <- 0
a3
a3[a3>5] <- 0
a3
# rbind() and cbind()----->are used to add column and rows

a3
rbind(m1,c(2,2,5))

cbind(m2,c(3,6,9))

# transpose of matrix
a3
t(a3)

# operation on matrix


m1 <- matrix(data = 1:6,nrow = 3,ncol = 3)
m1

m2 <- matrix(data = 6:9,nrow=3,ncol = 3)
m2

sum <- m1+m2
sum













