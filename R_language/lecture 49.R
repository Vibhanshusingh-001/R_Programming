# this will help us in differentiate b etween technical varitation and biological variation
# relative abundance between two samples or two conditions


# DGE analysis with ERCC spike -ins  --------------------------------------

#spike -ins --> synthetic rna molecules add in equal amount to all samples to minimize technical replicates

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("RUVSeq")


library(RUVSeq)

whdata <- read.table("GSE164073_raw_counts_GRCh38.p13_NCBI.txt",header = TRUE)
head(whdata)
spikes <-  rownames(whdata)[grep("ERCC",rownames(whdata))]# control genes
head(spikes)
spikes
x <- as.factor(c("G1","G2","G3","G4","G5","G1","G2","G3","G4","G5","G1","G2","G3","G4","G5","G1","G2","G3","G4"))

# as.factor <- for designing of experiment

# library(DESeq2)

set <- newSeqExpressionSet(as.matrix(whdata),phenoData=data.frame(x,row.names = colnames(whdata)))

set1 <- RUVg(set,spikes,k=1)

pData(set1)

colors=c(rep("red",4),rep("green",4),rep("blue",4),rep("chocolate",4))

plotRLE(set1,outline=FALSE,ylim=c(-2,2),col=colors)

library(DESeq2)

dds <- DESeqDataSetFromMatrix(countData = counts(set1),colData = pData(set1),design = ~w_1+x)
dds

prdds <- DESeq(dds)
prdds

res <- results(prdds)
res

summary(res)
plotMA(res,ylim=c(-5,5))
plotMA(res)


library(apeglm)

resultsNames(prdds)
res2 <- lfcShrink(prdds,coef = "bin_G4_vs_G1",type = "apeglm")
plotMA(res2)








       















