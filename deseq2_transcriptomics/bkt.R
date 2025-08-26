
# vector ------------------------------------------------------------------

# vector - containing the same type of data 
# it can hold the element of diferent classes 

vibhu<- c ("red","green","yellow")
print(vibhu)

print(class(vibhu))



vibhu<- c (15,25,63)
print(vibhu)

print(class(vibhu))




vibhu<- c (15L,52L,63L)
print(vibhu)

print(class(vibhu))

print(typeof(vibhu))

print(length(vibhu))

vibha<-c(c("atul","singh","singh"),c("priya","tiwari"))
print(vibha)


print(vibha[1])






# list --------------------------------------------------------------------


# list---> contain many diferent type of element 

list1<-list(c("15","65","69"),45,"vb","15")
print(list1)





# matrics -----------------------------------------------------------------

# it is two diamensional rectangular data set

MAT<-matrix(c(25,36,2,62,5,25),nrow=2,ncol = 3,byrow = FALSE)
print(MAT)










# arrays ------------------------------------------------------------------

#arrays can be any number of diamension 

a<-array(c("green","yellow"),dim=c(3,4,4))
a


#dim = c(3, 3, 2) → Specifies the dimensions of the array:
#3 rows
#3 columns
#2 layers (or slices)





# factors -----------------------------------------------------------------

# created using vector 
# it stores the vectores along with the distinct values of the elements in the vector as lavels 



apple_color<-c("red","green","pink","red","green","pink","navy","lavender")
factor_apple <-factor(apple_color)
factor_apple

print(nlevels(factor_apple))




# data frame --------------------------------------------------------------

# Create a dataframe with three columns
df <- data.frame(
  ID = 1:5, 
  Name = c("Alice", "Bob", "Charlie", "David", "Emma"), 
  Score = c(85, 90, 78, 92, 88)
)

# Print the dataframe
print(df)




print("vibhu")
cat("vibhu")
ls()


rm(attenu)

getwd()


setwd("C:/Users/vibha/Documents")

b<-read.csv("output.csv")
b


#na.omit()------------------------> to remove missing values 

str(vibhu)
str(vibha)





# Create a dataframe with three columns
df <- data.frame(
  ID = 1:5, 
  Name = c("Alice", "Bob", "Charlie", "David", "Emma"), 
  Score = c(85, 90, 78, 92, 88)
)

# Print the dataframe
print(df)

names(df)# report column names 
row.names(df)# report row names




#read.table("file.txt",header=T,sep = "\t")

# header tells that column have tiles 
# sep-> tells that file is tab delimited 


df$Name
df[,2]# to get secod column

df[2,]

df[1,2]


# Create a dataframe with three columns
df <- data.frame(
  ID = 1:5, 
  Name = c("Alice", "Bob", "Charlie", "David", "Emma"), 
  Score = c(85, 90, 78, 92, 88)
)

# Print the dataframe
print(df)

names(df)# report column names 
row.names(df)# report row names




df[which(df$Score>85)]
write.table(df,"df.txt",sep="\t")


sink("output.txt")

a<-data("mtcars")
b<-head(mtcars,5)
print(b)
summary(a)








# Generate random data
set.seed(123)
x <- rnorm(50)  # 50 random values from a normal distribution

# Create a histogram
hist(x, main="Histogram with Rug Plot", col="lightblue", border="black")

# Add rug plot
rug(x, col="red", lwd=2)

plot(density(x), main="Density Plot with Rug")
rug(x, col="blue")









# Create a scatter plot
plot(1:10, 1:10, type = "l", col = "blue", main = "Using points() in R")

# Add red points to the plot
points(1:10, 1:10, col = "red", pch = 16, cex = 1.5)












# Create a dataframe
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 28),
  Score = c(85, 90, 78)
)

# Accessing columns normally
mean(df$Score)  # Output: 84.33333

# Using attach()
attach(df)

# Now we can refer to "Score" directly
mean(Score)  # Output: 84.33333

# Detach the dataframe to avoid conflicts
detach(df)

a<-seq(10,100)
a


