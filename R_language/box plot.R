
# box plot ----------------------------------------------------------------

# A box graph is a chart that is used to display information in the form of distribution by drawing boxplots
# for each of them. This distribution of data is based on five sets 
# (minimum, first quartile, median, third quartile, and maximum).


# Syntax: boxplot(x, data, notch, varwidth, names, main)
# 
# Parameters: 
#   
#   x: This parameter sets as a vector or a formula.
# data: This parameter sets the data frame.
# notch: This parameter is the label for horizontal axis.
# varwidth: This parameter is a logical value. Set as true to draw width of the box proportionate to the sample size.
# main: This parameter is the title of the chart.
# names: This parameter are the group labels that will be showed under each boxplot.

names(mtcars)
View(mtcars)
boxplot(mtcars$hp)
boxplot(mtcars$cyl)


boxplot(mtcars$hp,main="matcars data frame",
        xlab="x",
        ylab="y",
        col="blue",
        border="brown",
        horizontal = FALSE,
        notch = TRUE
        
        )



boxplot(mtcars$hp,main="mtcars data frame",
        xlab="x",
        ylab="y",
        col="blue",
        border="brown",
        horizontal = TRUE,
        notch = TRUE
        
)
# boxplot from formula 
# the function boxplot () can also take in formulas of the form y~x 
# where, y is numeric vector which is grouped according to the value of x


names(mtcars)
boxplot(mpg ~ cyl, data = mtcars,xlab = "quantity of cylinders",ylab = "miles per gallon",
        main="r boxplot example",col="orange",border="red")

# boxplot using notch 
# in r we can draw a boxplot using a notch. it helps us to find out how the medians of different data groups match with
# each other

boxplot(mpg~cyl ,data=mtcars,
        xlab="quantity of cylinders",
        ylab="miles per gallon",
        main="boxplot example",
        notch=FALSE,
        varwidth=FALSE,# to set width of box
        col=c("green",'yellow',"red"),
        names=c("high","medium","low")
        
        
        )










