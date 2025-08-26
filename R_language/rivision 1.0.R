list_1 <- list(gene="hsp",aminoacid=2541,nucleotides=3654)
list_1




gene <- c("hsp1a","hsp2a","hsp3a","hsp4a","hsp5a")
amino <- c("val","leu","ala","glu","asp")
nucleo <- c(456,457,458,458,459)
protein <- c("insulin","pectin","globin","lecctose","maltose")
list_2 <- data.frame(gene,amino,nucleo, protein)
list_2


# rbind and cbind

x <- c(12,13,14,15)
rbind(list_2,x)

y <- c("molecule")
cbind(list_2,y)


# to pull out perticular element -----> use dollar $

list_2$gene
list_2$amino
list_2$protein


# functions ---------------------------------------------------------------




































