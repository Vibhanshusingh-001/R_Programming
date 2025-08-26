getwd()

tab <- read.table("GSE164073_raw_counts_GRCh38.p13_NCBI.tsv")
head(tab)
tail(tab)
summary(tab)
View(tab)





# Convert the entire data frame to numeric
tab <- data.frame(lapply(tab, function(x) as.numeric(as.character(x))))

# Optionally, remove rows with NA values
tab <- na.omit(tab)



tab$V2 <- as.numeric(tab$V2)

hist(tab$V2)
hist(tab$V15)

hist(tab$V2,probability = FALSE,xlim = c(0,60000))
hist(tab$V3, probability = TRUE, xlim = c(0, 60000))



hist(tab$V3, probability = TRUE, xlim = c(0, 50000),breaks = 100)
hist(tab$V3, probability = TRUE, xlim = c(0, 50000),breaks = 200)
hist(tab$V1, probability = TRUE, xlim = c(0, 80000),breaks = 10000)


# to make the the line where count is -------------------------------------

hist(tab$V2, probability = TRUE, xlim = c(0, 500000),breaks = 100,xlab = "raw count")
hist(tab$V2, probability = TRUE, xlim = c(0, 100000),breaks = 100,xlab = "raw count")
abline(v=10000,col="pink",lwd=5,lty=5)



# how could corelation between counts -------------------------------------

plot(tab$V3,tab$V6)
plot(tab$V3,tab$V6,log = "xy")
plot(tab$V3,tab$V6,log = "xy",pch=16,col=rgb(0,0,0.5,0.5))
abline(plot(tab$V3,tab$V6,log = "xy",pch=16,col=rgb(0,0,0.2,0.1)))
plot(tab$V3,tab$V6,log = "xy",pch=46,col=rgb(0,0,0.2,0.5),xlab = "v3",ylab = "v6",cex.lab=1)
plot(tab$V3,tab$V6,log = "xy",pch=16,col=rgb(0,0,0.2,0.5),xlab = "v3",ylab = "v6",cex.lab=1)
abline(a=0,b=1,lwd=2,lty=2,col="orange")


# corelation test ---------------------------------------------------------

val <- cor.test(tab$V4,tab$V7)
val
val$parameter
val$statistic


val <- cor.test(tab$V4,tab$V7,method = "spearman")
val
















