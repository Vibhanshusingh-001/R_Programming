

# correction bias ---------------------------------------------------------

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")


data <- read.table("GSE164073_raw_counts_GRCh38.p13_NCBI.tsv",header=T)

library(EDASeq)
data(yeastGC)
data(yeastLength)

sub <- interaction(row.names(data),names(yeastGC))
mat <- as.matrix(data[sub, ])
print(sub)

newdata <- newSeqExpressionSet(mat,normalizedCounts = matrix(data = NA,nrow = nrow(mat),ncol = ncol(mat),dimnames = dimnames(mat)),
                               phenoData = AnnotatedDataFrame(data.frame(conditions=factor(c("G1","G2","G3","G4","G5","G1","G2","G3","G4","G5","G1","G2","G3","G4","G5","G1","G2","G3","G4")),
                                                                         row.names = colnames(data))),
                               featureData =AnnotatedDataFrame(data.frame(gc=yeastGC[sub])) )


norm <- withinLaneNormalization(newdata,"gc",which = "full",round = TRUE,offset = FALSE)

biasPlot(newdata,"gc")


norm2 <- as.data.frame(`normCounts<-`(norm))

write.table(norm2,"GSE164073_raw_counts_GRCh38.p13_NCBI.tsv",quote=F,sep="\t")
plotRLE(newData)
plotRLE(norm)

