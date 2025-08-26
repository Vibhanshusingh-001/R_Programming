
# scatter plot(dotted points) ------------------------------------------------------------




# A scatter plot is a set of dotted points representing individual data pieces on the horizontal and vertical axis. 
# In a graph in which the values of two variables are plotted along the X-axis and Y-axis,
# the pattern of the resulting points reveals a correlation between them.

# R – Scatter plots
# We can create a scatter plot in R Programming Language using the plot() function and ggplot2 package function
# 
# Syntax: plot(x, y, main, xlab, ylab, xlim, ylim, axes)
# 
# Parameters: 
#   x: This parameter sets the horizontal coordinates.
# y: This parameter sets the vertical coordinates.
# xlab: This parameter is the label for horizontal axis.
# ylab: This parameter is the label for vertical axis.
# main: This parameter main is the title of the chart.
# xlim: This parameter is used for plotting values of x.
# ylim: This parameter is used for plotting values of y.
# axes: This parameter indicates whether both axes should be drawn on the plot.
# 

View(mtcars)
dim(mtcars)
names(mtcars)
# fetching two columns from mtcars
data <-  mtcars[c("wt","mpg")]
data
View(data)

# plotting the chart for cars with weight between 2.5 to 5 anf milage between 15 and 30

plot(x=data$wt,y=data$mpg,xlab = "weight",ylab = "milage",
     xlim = c(2.115,3.555),ylim = c(10,40),
     main = "weight v/s milage")

# scatterplot using ggplot2


# in R there is another way for creating scatterplot i.e. with the help of ggplot2 package.
# 
# the ggplot2 package provides ggplot() and geom_point() function for creating scatter plot.the ggplot() function 
# takes a series of the input item. the first parameter is an input vector and the second is the aes() function 
# in which we add the x-axis and y-axis.

#load ggplot2 package
library(ggplot2)
names(mtcars)
# plotting the chart using ggplot() and geom_point() function
ggplot(mtcars,aes(x=drat,y=mpg)) + geom_point()#The point geom is used to create scatterplots

#Aesthetic mappings describe how variables in the data are mapped to visual 
#properties (aesthetics) of geoms.

# the aes() function inside the geom_point() function contols the colur of the group
ggplot(mtcars,aes(x=drat,y=mpg))+geom_point(aes(color=factor(gear)))
names(mtcars)

































