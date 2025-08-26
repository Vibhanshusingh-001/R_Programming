# r excel file 
# installing xlsx package 
install.packages("xlsx")

# varify the package is installed 

any(grepl("xlsx",install.packages()))

# loading the libraray into r workspace

library(xlsx)
# reading in excel file
# read.xlsx(file_name,sheet_index)

#n reading file


view(reading_data)
getwd()
setwd("C:\\Users\\vibha\\Documents")
reading_data <- read.xlsx("SampleXLSFile_38kb.xls",sheetIndex = 1)
print(reading_data)

names(reading_data)
dim(reading_data)
summary(reading_data)
View(reading_data)
names(reading_data)
max_profit <- max(reading_data$X3)
max_profit
max_profit <- min(reading_data$X35)
max_profit


a <- subset(reading_data,"Xerox 1887")
a
View(a)



# dplyr package -----------------------------------------------------------

# to manipulate data frame

getwd()
setwd("C:\\Users\\vibha\\Downloads")

test <- read.csv("people-100.csv")
View(test)
head(test)
tail(test)

install.packages("dplyr")
library("dplyr")


# important words to remember ---------------------------------------------

# select()----> select columns
# 
# filter()----> filter rows
# 
# arrange()-----> re order or arrange rows
# mutate()--------> create new columns
# summarise()----->summarise values
# group_by()----->allows for group operations in the "split -apply -combine"

names(test)

test_3 <- select(test, Index,First.Name)
head(test_3)

# to select all the columns except a specific column ,
# use the "-"(substraction) operator(also known as negative indexing)


test1 <- select(test,-First.Name)
head(select(test,-First.Name))

#to select range of columns by name , use the ":"(colon) operator

head(select(test,1:3))



 
#  to select all columns that start with the character string "sl" use function starts_with()
# 
head(select(test,starts_with("us")))

#some additional to select columns based on a specific criteria

# endswith()---> select column that end with a character string
#contains()--->select column that contain a character string
#matches()---->select columns that match a regular expression 
# one_of()---->select column names that are from group of names

# selecting rows using filter()
# filter the rows

names(test)
filter(test,User.Id >= "wo condition dedo jitana tum chahte ho jaise ">="")
 # "," ye lagake usi me do se jyada condition laga sakte ho filter karne ke liye


# ------------------------------------------------------------------------


fix(test)
names(test)
View(test)

filter(test,Job.Title %in% c("Hospital pharmacist"))

# %>% (pipe operator)--->  vector se agar koi vlaue match karani ho

install.packages("magrittr")
library("magrittr")

test %in% select(Phone,Sex) %in% head

# pipe operator: %>%
# dplyr imports this operator from another package (magrittr).
# this opeartor allows you to pipe the output from one function to the input of another function
# instead of nesting function
# reading from inside to outside
# the idea of piping is to read the function from left to right

head(select(test, Index,First.Name))

test %>% select(Phone,Sex) %>% head
test %>% head %>% select(Phone,Sex)
# head %>% select(phone,sex) test not valid becase test should in starting

# arrange or reorder rows using using arrange()
test %>% arrange(Phone) %>% head

test %>%
  select(Phone,Sex,Email) %>%
  arrange(Phone,Sex) %in%
  filter(Phone)



# create new column using mutate()
# the mutate() function will add new column to the data frame 































































































