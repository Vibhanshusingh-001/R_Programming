# mutate function add new column to dataframe 
# create a new column called rem_proportion which is the ratio of 
# rem sleep to total amount of sleep


install.packages("magrittr")
library("magrittr")



getwd()
testa <- read.csv("people-100.csv")
View(testa)

names(testa)
testa <- testa %>% mutate(rem_propotion = sleep_rem/Sex) %>% head

#testa <- testa %>%  mutate(rem_proption=sleep_rem/Last.Name) %>% head()

names(testa)
View(testa)





# group by
# the group_by function is used to group data by one or more variables 
names(testa)

t1 <- group_by(testa,age)
View(t1)
view(testa)
# or 
testa %>% group_by(age)




















