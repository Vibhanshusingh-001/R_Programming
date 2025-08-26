#r vector function
#rep()---->used for repeating values in vector


rep(c(2,4,5),time=5)
rep(c(1,2,3),each=3)
rep(c(4,2),time=c(3,5))
rep(1:4,length.out=8)

#seq()---->function
seq(from=3,to=5,by=.2)
seq(from=5,to=3,by=-.2)
seq(from=2.75,to=1.75,length.out=100)

#all() and any() funcyion

#all---->es function me true tabhi aayega jab sari values condition satisfy kare
x <- 1:10
all(x>5)
#any---->es function me true tabhi aayega jab atleast ekbhi values condition satisfy kare
x <- 1:10
any(x>5)















