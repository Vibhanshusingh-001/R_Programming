
names(mtcars)
View(mtcars$drat)

# boxplot -----------------------------------------------------------------


boxplot(mtcars$drat,
        main="box plot",
        xlab="x",
        ylab="y",
        horizontal = TRUE,
        notch = FALSE,
        col="green",
        border = "pink"
        )

boxplot(hp~cyl,data=mtcars,main="boxplot",xlab = "x- axis",
        ylab = "y-axis",varwidth=TRUE,col="green","red","blue",border="yellow",notch=FALSE)




# histogram ---------------------------------------------------------------
v1 <- c(12,12,15,12,14,51,54,12,58,54,57,93,25,15,47,21,35,25,14,85,69,85,64,75,48,15,69,54,52,82,25)
hist(v1,xlab = "x-axis",ylab = "y-axis",col = "red",main = "histogram with no gaps betwwen bars",border = "pink")


v2 <- c(12,12,15,12,14,51,54,12,58,54,57,93,25,15,47,21,35,25,14,85,69,85,64,75,48,15,69,54,52,82,25)

hist(v2,xlab = "x-axis",ylab = "y-axis",main ="histogram frequency",col="red",border = "brown",
     xlim = c(0,100),ylim = c(0,6),breaks = 10)


# scatterplot -------------------------------------------------------------
View(mtcars)
names(mtcars)
plot(x=mtcars$mpg,y=mtcars$gear,main="scatter plot",xlab = "milage",ylab="gear",
     col="black",xlim = c(15,30),ylim =c(3,5) )



# scatter plot using ggplot2 package --------------------------------------
library(ggplot2)

ggplot(mtcars,aes(x=mpg,y=cyl))+geom_point()


ggplot(mtcars,aes(x=mpg,y=cyl))+geom_point(aes(factor(gear)))


# barplot -----------------------------------------------------------------
a1 <- c(12,16,14,18,19,20,25,26)
m2 <- c("jan","feb","mar","apr","may","june","july","aug")
barplot(names.arg = m2,a1,main="revenue per month",xlab="months",ylab = "revenue",col = "red",border="green")



# bar graph ---------------------------------------------------------------

months=c("jan","feb","mar")
regions=c("east","west","north")
values=matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,ncol = 3)

barplot(values,xlab="months",ylab = "revenue",main = "revenue graph",col=c("green","blue","purple"),
        names.arg = months)
legend("topleft",regions,fill =c("red","yellow","skyblue"),cex = .52)



# linegraph ---------------------------------------------------------------
library(plotrix)
a1 <- c(12,16,14,18,19,20,25,26)
plot(a1,type = "p",col="darkgreen",main="line graph",xlab ="revenue",ylab="freq" )


x <- c(12,16,14,18,19,20,25,26)
y <- c(12,58,54,57,93,25,15,47)
z <- c(12,12,15,12,14,51,54,12)
lines(z,type = "p",col="darkgreen")

plot(x,xlab = "weight",ylab = "frequency",type = "l",main = "linegraph")
plot(y,xlab = "weight",ylab = "frequency",type = "o",main = "linegraph")
plot(z,xlab = "weight",ylab = "frequency",type = "p",main = "linegraph")



