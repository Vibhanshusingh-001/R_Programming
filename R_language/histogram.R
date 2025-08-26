
# histogram (frequency)(no gaps between bars)---------------------------------------------------------------

# A histogram contains a rectangular area to display the statistical information which is proportional
# to the frequency of a variable and its width in successive numerical intervals. A graphical representation 
# that manages a group of data points into different specified ranges.
# It has a special feature that shows no gaps between the bars and is similar to a vertical bar graph.


# Syntax: hist(v, main, xlab, xlim, ylim, breaks, col, border)

# Parameters: 

#   v: This parameter contains numerical values used in histogram.
# main: This parameter main is the title of the chart.
# col: This parameter is used to set color of the bars.
# xlab: This parameter is the label for horizontal axis.
# border: This parameter is used to set border color of each bar.
# xlim: This parameter is used for plotting values of x-axis.
# ylim: This parameter is used for plotting values of y-axis.
# breaks: This parameter is used as width of each bar.




v <- c(15,26,48,36,12,43,69,78,85,25,36)
hist(v,xlab="weight",ylab="frequency",col="navyblue",border="red")


# use of xlim and ylim ----------------------------------------------------

v <- c(15,26,48,36,12,43,69,78,85,25,36)
hist(v,xlab="weight",ylab="frequency",col="purple",border="red",xlim=c(0,100),ylim=c(0,6),breaks=5)










