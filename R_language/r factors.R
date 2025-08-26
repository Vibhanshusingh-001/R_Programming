# r factors

# categorial data----->jis variable ki value fix ho
# for example grnder->m/f 
# categorial variable do tarah ke hote hai 
# nominal--> jisame order fix nhi hota
# ordinal--> jisame order fix hota hai


# r factors is to store categorial data as levels. it can store both character and integer 
#factors have lebels which are associated with the unique integers stored in it . it contains predefined set value known as lecels and 
# defult r always sorts levels in  alphabatical oreder

# attribute of factors-->
#x
#levels
#lebels
#exclude
#ordered
#nmax

dir <- c("east","west","north","south")
is.factor(dir)
factor(dir)
dira <- c("east","west","north","north")
factor(dira)

factor(dir,levels = c("east","west","north","south"),labels = c("e","w","n","s"))
factor(dir,levels = c("east","west","north","south"),exclude =  c("north"))

#gl()----> for how to genrate levels in factors
#gl()----->n,k,labels

v1 <- gl(3,4,labels=c("ram","sohan","mohan"))
v1#3 ka matlab kitane levels banana chahte ho aur 4 ka matlab hai un levels ki kitani copies banana chahte ho


#acessing the factors

dat <- factor(dir <- c("east","west","north","south"))

v2 <- dat[c(2)]
v2

dir <-c ("east","west","north","south")
data <- factor(dir)
data
data[3]




#functions in used in factors

#as.factors------to convert into factor
#as.ordered()----to convert into order

#is.factor()---->if the factor is ordered and return bulian value true and false
#is.ordered()---->if the factor is orderd or not











