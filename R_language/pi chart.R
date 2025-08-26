# r data visualization

# data visualization is an efficient techniquie for gaining insights about data through a visual medium 
# with the help of visualization techniques, a human can easily obtain information about hidden paterns
# in data that might be negelected 

# r pie chart 
#pie-chart is a representation of values in the form of slices 
# of a circle with different colors
# the pie chart are created with the help of pie() function,
# which takes positive numbers as vector input 

pie(x,labels = ,radius = ,main = ,col = ,clockwise = )


# x is vector that contains the numeric values used in the pie chart
# labesls are used to give the description to the slices 
# radius describes the radius of the pie chart 
#col defines the colour of slice 
# main describes the title of chart 
# clockwise is a logical value that indicates he clockwise or
# anticlockwise direction in which slices are drawn


#creating data for graph
x <- c(12,35,56,75,100)
labels <- c("india","uk","japan","usa","nepal")
pie(x,labels)
pie(x,labels = ,main = "country pie chart",col = rainbow(length(x)))
# rainbow function is commonly used for creating color palettes for visualizations.
# length function is used to get length of vector
colors <- c("blue","green","pink","orange","red")
pie(x,labels = ,main = "country pie chart",col = colors)


# slice percentage & chart legend -----------------------------------------



#legend(x,y=NULL,legend = ,fill = ,col = ,bg)
#here

#x and y :are coordinates to be used to position the legand 
# legend: is the text of legand 
# fill: is the color to use for filling the boxes beside the legand text
#col: defines the color of line and points besides the legand text
#bg: is the background colour for legend box

legend("bottomleft",c("india","uk","japan","usa","nepal"),cex = 0.9,fill = colors,bg="lavender")

# r provides a plotrix package whose pie3d() function is used to create an attractive 3d pie chart,
# the parameters of pie3D() function remain same as pie() function 

library("plotrix")
x2 <- c(20,65,15,50,45)
labels2 <- c("india","srilanka","america",'nepal','bhutan')
pie_percent <- round(100*x/sum(x2),2)
pie3D(x2,labels=labels2,explode = 0.5,main="country pie chart ")

x1 <- c(20,65,15,50,45)
labels1 <- c("india","srilanka","amerika",'nepal','bhutan')
pie_percent <- round(100*x/sum(1),1)
pie3D(x1,labels=labels1,main="country pie chart",col = rainbow(length(x)))
legend("topright",c("india","srilanka","amerika",'nepal','bhutan'),cex = 0.5,fill=rainbow(length(x1)))


































