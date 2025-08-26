hspA=list(gene="hsp1a",amino.acids=650,nucleotideds=550)
print(hspA)


#lets pull out just the gene 
hspA$gene
#lets pull out the amino acids
hspA$amino.acids
#lets pull out the nucleotides
hspA$nucleotideds

#let's ceate three list and combine them into data frame 

gene=c("hspa1","hspa2","hspa3","hspa4","hspa5","hspa6")
amino.acids=c(125,365,254,654,158,369)
nucleotides=c(2400,2600,2500,2500,3600,2900)

hsp=data.frame(gene,amino.acids,nucleotides)
print(hsp)
#just pull out the gene from dataframe 
hsp$gene
#let's pull out the nucleotides from  data frame 
hsp$nucleotides
#let's search for specific amino acids 
hsp$amino.acids[hsp$gene=="hspa6"]


