
# R syntax: Data frame and list -------------------------------------------
getwd()
setwd("C:/Users/vibha/Documents/GitHub/NGS_Data_analysis_Biostatistics")
#Data Frames are generic data objects of R which are used to store the tabular data. They are two-dimensional, heterogeneous data structures. 
#A data frame is a table-like structure where each column can have different data types. It is similar to an Excel sheet or SQL table.

#create an R data frame use data.frame() function 
#Syntax
students <- data.frame( Name = c("Alice", "Bob", "Charlie"), Age = c(22, 24, 23), Marks = c(85, 90, 88), Passed = c(TRUE, TRUE, FALSE) )
print(students)
#Accessing Data in a Data Frame
#In R, the $ operator is used to access a specific column of a data frame or list.
students$Name # Access the "Name" column 
students[1, ] # Access first row 
students[, 2] # Access second column

#Common Data Frame Functions
dim(df) #Get dimensions (rows, columns)
#for e.g 
df <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                 Age = c(22, 24, 23),
                 Marks = c(85, 90, 88))

dim(df) 
#Similarly We can perform for others below
nrow(df) #Get number of rows
ncol(df) #Get number of columns
str(df)	 #Structure of the data frame
summary(df)	#Summary statistics

#another example
# creating a data frame
friend.data <- data.frame(
  friend_id = c(1:5), 
  friend_name = c("Sachin", "Sourav", 
                  "Dravid", "Sehwag", 
                  "Dhoni"),
  stringsAsFactors = FALSE
)

# Expanding data frame
friend.data$location <- c("Kolkata", "Delhi", 
                          "Bangalore", "Hyderabad",
                          "Chennai")
resultant <- friend.data
# print the modified data frame
print(resultant)


# Lists -------------------------------------------------------------------


#A list in R, however, comprises of elements, vectors, data frames, variables, or lists that may belong to different data types. 
#A list in R programming is a generic object consisting of an ordered collection of objects. Lists are one-dimensional, heterogeneous data structures that mean a list can be a list of vectors, a list of matrices, a list of characters, a list of functions, and so on. 
#A list is a vector but with heterogeneous data elements. A list in R is created with the use of the list() function. R allows accessing elements of an R list with the use of the index value. In R, the indexing of a list starts with 1 instead of 0.

#Creating a List
my_list <- list(Name = "Alice", Age = 22, Scores = c(80, 90, 85))
print(my_list)
#Accessing Elements in a List
my_list$Name # Access element using $
my_list[[2]]  # Access second element

#Removing a Column from a Data Frame
#You can remove a column in R using different methods. 
#Method 1: Using NULL
df <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                 Age = c(22, 24, 23),
                 Marks = c(85, 90, 88))
df$Marks <- NULL  # Removes the "Marks" column
print(df)
#Method 2: Using subset()
df <- subset(df, select = -Age)  # Removes "Age" column
print(df)
#Adding a Column to a Data Frame
df$Grade <- c("A", "B", "A")
print(df)
#Modifying an Existing Column
df$Marks <- df$Marks + 5
print(df)



#Using attach() Instead of $ in R
#attach() allows us to access column names without using $
#The attach() function adds a data frame to R's search path, allowing us to reference its variables directly without using $
#Using attach()
attach(df)  # Attach the data frame
mean(Marks)  # Now we can use "Marks" directly 
#which means no need to write df$Marks, we can simply use Marks. 





