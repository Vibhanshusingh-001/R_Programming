#r dataframe
# a dataframe is an array. unlike an array
#the data we store in the columns of the data frame can be of various types
# a data frame is a two dimensional array like structure or
#a table in which a column contains a values of one variable ,
#and rows contains one set of values from each column 
#a data frame is a special case of the list in which each 
#component has equal length




emp.data <- data.frame(
  employee_id = c(1:5),
  employee_name = c("ram","syam","mohan","ramu","sanu"),
  sal = c(125.5,254.6,659.6,326.9,657.7),
  starting_date = as.Date(c("2024/01/01","2024/01/01","2024/01/01","2024/01/01","2024/01/01")),
  stringsAsFactors = FALSE# to convert strings into factors
  
  
  
)
print(emp.data)
str(emp.data)

f1 <- data.frame(emp.data$employee_id,emp.data$sal)
f1
f2 <- emp.data[3:5,]
f2
f5 <- emp.data[4:5,]#sequence
f5
f3 <- emp.data[c(2,4)]#row,column
f3

# cbind() and rbind()
x <- list(6,"manish",425.5,"2014/08/05")
rbind(emp.data,x)
emp.data

y <- c("jodhpur","mirzapur","lahangpur","lalapur","dhopapur")
cbind(emp.data,adress=y)

emp.data <- emp.data[-2,]
emp.data
emp.data$employee_name <- NULL
emp.data
print(summary(emp.data))


hspA=list(gene="hsp1a",amino.acids=650,nucleotideds=550)
print(hspA)


#lets pull out just the gene 
hspA$gene
#lets pull out the amino acids
hspA$amino.acids
#lets pull out the nucleotides
hspA$nucleotideds

#let's ceate three list and combine them into data frame 

gene=c("hspa1","hspa2","hspa3","hspa4","hspa5","hspa6")
amino.acids=c(125,365,254,654,158,369)
nucleotides=c(2400,2600,2500,2500,3600,2900)

hsp=data.frame(gene,amino.acids,nucleotides)
print(hsp)
#just pull out the gene from dataframe 
hsp$gene
#let's pull out the nucleotides from  data frame 
hsp$nucleotides
#let's search for specific amino acids 
hsp$amino.acids[hsp$gene=="hspa6"]




















