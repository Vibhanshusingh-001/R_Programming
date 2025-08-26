
# line graph --------------------------------------------------------------

# A line graph is a chart that is used to display information in the form of a series of data points.
# It utilizes points and lines to represent change over time. Line graphs are drawn by plotting different
# points on their X coordinates and Y coordinates, then by joining them together through a line from beginning to end. 
# The graph represents different values as it can move up and down based on the suitable variable.


# 
# 
# Syntax: plot(v, type, col, xlab, ylab)
# 
# Parameters:
#   
#   v: This parameter is a contains only the numeric values
# type: This parameter has the following value: 
#   “p” : This value is used to draw only the points.
# “l” : This value is used to draw only the lines.
# “o”: This value is used to draw both points and lines
# xlab: This parameter is the label for x axis in the chart.
# ylab: This parameter is the label for y axis in the chart.
# main: This parameter main is the title of the chart.
# col: This parameter is used to give colors to both the point



v <- c(18,20,63,83,69,70,56,48,12,25,37)
plot(v)

plot(v,xlab = "weight",ylab = "frequency",col="orange",type = "0")



# linechart containg multiple lines ---------------------------------------

x <- c(12,25,34,56,45,89,78)
y <- c(20,30,40,50,60,70,80)
z <- c(36,45,92,45,85,65,23)

plot(x,type = "l",col="green",xlab = "month",ylab = "temprature")
plot(x,type = "o",col="green",xlab = "month",ylab = "temprature")
lines(z,type = "p",col="black")
lines(z, type= "l",col="blue")



























