
#R provides many built-in datasets for practice.
data()
#Using a Dataset
# Load dataset
data(mtcars)  
data(airquality)
# Explore dataset
dim(mtcars)      # Dimensions
nrow(mtcars)     # Number of rows
ncol(mtcars)     # Number of columns
str(mtcars)      # Structure of dataset
summary(mtcars)  # Summary statistics
head(mtcars, 5)  # First 5 rows
tail(df, n)  #Show last n rows

#Reading Data from External Files in R
#Real-world data is usually stored in CSV, Excel, TXT, or databases. 
#header = TRUE: First row contains column names.
#stringsAsFactors = FALSE: Prevents automatic conversion of text to factors.

df <- read.csv("data.csv", header = TRUE, stringsAsFactors = FALSE)
head(df)


#Reading an Excel File
#Requires the readxl package.
library(readxl)
df <- read_excel("data.xlsx", sheet = 1)
#Reading a Text File
df <- read.table("data.txt", header = TRUE, sep = "\t")

#Storing Data to External Files
#A CSV (Comma-Separated Values) file stores tabular data in plain text, making it easy to share across different software (Excel, Python, etc.).
#Saving Data as CSV SYNTAX
write.csv(df, "output.csv", row.names = FALSE)         #row.names = FALSE: Prevents adding row numbers.
#write.csv() → Function to write a data frame to a CSV file.
#df → The data frame you want to save.
#"output.csv" → File name for the saved CSV file.
#row.names = FALSE → Excludes row numbers from the output file (otherwise, R automatically adds row numbers).
#EXAMPLE

df <- data.frame(Name = c("Alice", "Bob", "Charlie"), Age = c(25, 30, 35), Score = c(90, 85, 88)) # Save the data frame as a CSV file 
write.csv(df, "student_data.csv", row.names = FALSE) 
# Check the file: After running the command, the CSV file will be saved in your working directory.

#Saving Data as Excel
#Since R does not have built-in Excel support, we use the writexl package to write data to an Excel file.
#Install and load writexl package (if not already installed).

library(writexl)  
write_xlsx(df, "output.xlsx") 
#EXAMPLE
# Install writexl package (if not installed)
install.packages("writexl")
# Load the package
library(writexl)
# Save the data frame as an Excel file
write_xlsx(df, "student_data.xlsx")

#Saving Data as TXT file
write.table(df, "output.txt", sep = "\t", row.names = FALSE) 
#sep = "\t" → Specifies tab (\t) as the separator between columns.
#EXAMPLE
# Save the data frame as a TXT file with tab-separated values
write.table(df, "student_data.txt", sep = "\t", row.names = FALSE)

#Exercises you can try: 
#	Create a data frame of student details (Name, Age, Score) and save it as:
# •	A CSV file
#•	An Excel file
#•	A TXT file
#	Modify the separators in write.table() (use ,, |, etc.).




#Other commands to try 
#Creating and Storing R Workspaces  
#An R workspace is an environment where all objects (data frames, variables, functions) are stored.
#Saving the Entire R Session
save.image("my_workspace.RData")  #This saves all objects in the session.
#Saving Specific Objects
save(df, my_vector, file = "my_data.RData")
#Loading an R Workspace
load("my_workspace.RData")






