months=array(c("jan","feb","mar","apr","mar","apr","may","jun","jly","aug","sep","oct","nov","dec"),dim=(c(3,4)))
months
#compare it to the simple list function
months1=c("jan","feb","mar","apr","mar","apr","may","jun","jly","aug","sep","oct","nov","dec")
months1
months[2,4]

# take a look into matrix
months2=matrix(data=c("jan","feb","mar","apr","mar","apr","may","jun","jly","aug","sep","oct","nov","dec"),nrow=3,ncol=4)
months2
#making a 3d array
array3d=array(c(2,3,4,5,10,12,14,16,18,20,22,1,26,28,30,32,34,36,38),dim = c(3,3,2))
print(array3d)
array3d[1,2,3]