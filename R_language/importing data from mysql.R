# 

# importing mysql database data -------------------------------------------

# using rmysql package

# dbgetquery: sends the queries and fetches results as the data frame

# dbsendquery: only sends the query and returns an object of class 
# inheriting from "DBIresult" , this object of class can be used to fetch the required result

#dbclearresult removes the result from cache memory

# fetch: returns few or all rows that were asked in query 
# the output of fetch function is a list

# dbhascompleted is used to check is all the rows are retrived 

# dbreadtable and dbwritetable functions are used to read and write the tables
#in database from an r dataframe

library("RMySQL")

con <- dbConnect(MySQL(),
                 username ="root",
                 password ="",
                 host="localhost",
                 port =3306,
                 dbname = "registration_form"
                
                 
)#con naam ke variable ki madad se ham mysql database se data nikalate hai

con <- dbConnect(MySQL(),
                 username ="root",
                 dbname ="registration_form"
                 
                 
                 
)

dbListTables(con)

dbListFields(con,"details")

rs <- dbSendQuery(con,"select* from details")
rs
data1 <- dbGetQuery(con,"select * from details")

data <- fetch(rs,n = 4)
View(data)






































