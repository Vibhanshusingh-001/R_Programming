
# Creation of vectors using c(), seq(), rep() -----------------------------


# Create a numeric vector
numeric_vector <- c(1, 2.5, 4, 5)
# Create a character vector
character_vector <- c("apple", "banana", "cherry")
# Create a vector of numbers from 1 to 10
numbers <- 1:10 
#seq() function Syntax: seq(from, to, by)
# Create a vector of numbers from 1 to 10 with a step of 2
even_numbers <- seq(from = 1, to = 10, by = 2)
# Create a vector of 10 evenly spaced numbers between 0 and 1
spaced_numbers <- seq(from = 0, to = 1, length.out = 10)

#rep()  function Purpose: Repeats elements Syntax: rep(x, times) or rep(x, each)
# Repeat the number 5 three times 
repeated_number <- rep(5, times = 3)
# Repeat each element of a vector twice 
repeated_vector <- rep(c(1, 2, 3), each = 2)
#vector() function: Purpose: Creates an empty vector of a specific type #Syntax: vector(mode, length)
# Create an empty numeric vector of length 5 
empty_numeric_vector <- vector(mode = "numeric", length = 5)
#Combining methods e.g 
my_vector <- c(seq(1, 5), rep(0, 3), c("a", "b"))

# Access and modify e.g. 
vec[2] <- 10
vec[1:3]

# Vectorized operation
result <- vec * 2

#Matrices: creation using matrix(), binding vectors with cbind() and rbind()
#Matrix indexing, operations, and basic functions (dim(), nrow(), ncol())


# Matrices
mat <- matrix(1:6, nrow = 2, ncol = 3)
rbinded <- rbind(c(1, 2, 3), c(4, 5, 6)) #binds by rows
cbinded <- cbind(c(1, 2), c(3, 4)) #binds by columns

matrix_name[row, column]  #Accesses the element at the specified row and column. 
matrix_name[row, ] #Accesses the entire row. 
matrix_name[, column] #Accesses the entire column. 
matrix_name[row_indices, column_indices] #Accesses a subset of elements.

#dim(matrix) Returns the dimensions of the matrix (number of rows and columns).
#nrow(matrix) Returns the number of rows.
#ncol(matrix) Returns the number of columns
# Access the first two rows and the last two columns
my_matrix <- matrix(1:9, nrow = 3) #example
print(dim(my_matrix))
print(nrow(my_matrix))
print(ncol(my_matrix))
print(my_matrix[1:2, 2:3])



