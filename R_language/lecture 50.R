
# volcano plot ------------------------------------------------------------
head(res$log2FoldChange)

head(res$padj)

head(res2$pvalue)

xval=res2$log2FoldChange
yval=-log10(res2$padj)

plot(xval,yval)


plot(xval,yval,ylim=c(0,10))
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3))
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3),xlab="lof2fold change ",ylab="-log10(p.adjusted)",main="volcano plot")
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3),xlab="lof2fold change ",ylab="-log10(p.adjusted)",main="volcano plot",cex.lab=1.4,cex.main=1.6)
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3),xlab="lof2fold change ",ylab="-log10(p.adjusted)",main="volcano plot",cex.lab=1.4,cex.main=1.6,cex.axis=1.2)
abline(h=1,lwd=2,lty=2,col="blue")
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3),xlab="lof2fold change ",ylab="-log10(p.adjusted)",main="volcano plot",cex.lab=1.4,cex.main=1.6,cex.axis=1.2,pch=16,col=rgb(0.3,0.3,0.3,0.3))
plot(xval,yval,ylim=c(0,10),xlim=c(-3,3),xlab="lof2fold change ",ylab="-log10(p.adjusted)",main="volcano plot",cex.lab=1.4,cex.main=1.6,cex.axis=1.2,pch=16,col="white")
abline(h=1,lwd=2,lty=2,col="blue")

points(xval[which(yval<=1)],yval[which(yval<=1)],pch=16,col=rgb(0.3,0.3,0.3,0.3))
points(xval[which(yval>1)],yval[which(yval>1)],pch=16,col=rgb(0.5,0.3,0.3,0.5))
dev.copy2pdf(file="volcano.pdf")



# heatmap -----------------------------------------------------------------

library(gplots)
tt=read.table("GSE164073_raw_counts_GRCh38.p13_NCBI.txt")
tt2=as.matrix(tt[-1])
heatmap.2(tt2)




# If tt2 is a data frame, convert it to a numeric matrix
tt2_matrix <- as.matrix(tt2)

# Ensure the matrix is numeric by coercing data
tt2_matrix <- apply(tt2_matrix, 2, as.numeric)

# Generate the heatmap

heatmap.2(tt2_matrix)





heatmap.2(tt2,trace = "none")

heatmap.2(tt2,trace = "none",scale = "row")




# functional enrichment analysis ------------------------------------------

 library(gprofiler2)
enrichres <-gost(
  query=c("102466751","107985721","100288069","105378580 "),
  organism = "scerevisiae",
  ordered_query = FALSE,
  multi_query = FALSE,
  significant = TRUE,
  exclude_iea = FALSE,
  measure_underrepresentation = FALSE,
  evcodes = FALSE,
  user_threshold = 0.05,
  correction_method = c("g_SCS"),
  domain_scope = c("annotated"),
  custom_bg = NULL,
  numeric_ns = "",
  sources = NULL,
  as_short_link = FALSE,
  highlight = FALSE
)
names(enrichres)
head(enrichres,5)



