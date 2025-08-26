# data importing ---> csv (comma ,seprated,values)

getwd()#--------> to know current working directory
setwd("C:\\Users\\vibha\\Downloads")#--------> to set working directory (by giving the directory name)
getwd()

v <- c(11,25,16,85,15,98,75,46,35,15,24,36)
sort(v)# ascending order me arrange karta hai
sort(v,decreasing = F)# descending order me arrange karega
sort(v,decreasing = T)
order(v)#vector ke component ki indexing bata dega

rank(v)#indexing
v[order(v)]#indexing


stores <- read.csv("C:\\Users\\vibha\\Downloads\\people-100.csv")
stores
View(stores)

print(is.data.frame(stores))

print(ncol(stores))
print(nrow(stores))

stores1 <- read.csv("C:\\Users\\vibha\\Downloads\\people-100.csv")
stores1
stores2 <- read.table(file = "people-100.csv",header = T,sep=",")
stores2
# some of the functions related to the dataframe
View(stores1)
fix(stores)# data editor file open 
str(stores)#shows the structure of data frame
summary(stores)#summmary of your data
names(stores)#all the variables name
nrow(stores)
ncol(stores)
length(stores)# length me  hame columns ka pata chalata hai
dim(stores)# shows the dimension of data frame-------> kitane rows aur columns hai ye hame batayega
colnames(stores)# shows the column name in dataframe
head(stores)# shows the first 6 rows of dataframe
tail(stores)# shows the last 6 rows of dataframe
subset(stores)# to create subsets of a Data frame.


# operations --------------------------------------------------------------


# how to operate dataframe ( r factor)------------------------------------------------


# manipulation ------------------------------------------------------------


names(stores)
stores2 <- stores[c(1:4,8,5:9)]# 8th number ke variable ko 5th number ka 
# banana h 1:4 aur 5:9 as it is rahenge matlab unaki numbering nahi change hogi
names(stores2)
stores2 <- stores[c(1:10),c(1:4)]# 1st and 10th tak rows chahiye phir 1st aur 4th tak hi column chahiye
names(stores2)
stores2 <- stores[c(1:10),]#[c(1:10),]---------->rows and column ka hai game
View(stores2)
names(stores)
grep("year",colnames(stores))# variable ki position janane ke liye use hota hai
names(stores)
grep("units",colnames(stores))


# dollar sign for acessing the variable name 

# creation of new variable
d1 <- stores$Units
d1
names(stores)
View(stores)
stores$totalcost=stores$Variable_name*stores$Value+stores$Industry_name_NZSIOC
View(stores)
View(stores$totalcost)






























































