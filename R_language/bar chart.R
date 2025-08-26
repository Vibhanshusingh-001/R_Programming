# r bar chart

# A bar chart is a graphical representation used to display and compare 
# discrete categories of data through rectangular bars. The length or height of each bar is 
# proportional to the values that they represent, 
# making it easy to interpret and compare different data sets at a glance.


#barplot(vector,x,y,main,names.arg = ,col = )

# Parameters:
   
#   H: This parameter is a vector or matrix containing numeric values which are used in bar chart.
# xlab: This parameter is the label for x axis in bar chart.
# ylab: This parameter is the label for y axis in bar chart.
# main: This parameter is the title of the bar chart.
# names.arg: This parameter is a vector of names appearing under each bar in bar chart.
# col: This parameter is used to give colors to the bars in the graph.

h1 <- c(82,46,66,23,41)
barplot(h1)

h2 <- c(12,35,54,32,15)
m2 <- c("jan","feb",'mar','apr',"may")
barplot(h2,names.arg=m2,xlab="month",ylab="revenue",col=("yellow"),main="revenue bar chart",border="red")


# group bar chart and stacked bar chart
#agar bar ke bhi ander condition deni hai to phir matrix ka use karna padega
# legend ye batata hai ki graph kya represent kar raha hai

months <- c("jan","feb",'mar','apr',"may","june")
regions <- c("east","west","north","south","northeast")
revenue <- c(15,13,12,15,45)
values <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 6)


barplot(values,xlab="months",ylab="revenue",main="total revenue ",names.arg=months,col = c("pink","blue","brown","red"))
legend("topleft",regions,cex = .52,fill=c("pink","blue","brown"))


