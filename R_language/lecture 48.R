
library(DESeq2)

data <- read.table("bias_corrected.txt",header=T)
samp <- read.table("sample.txt",header=T)

head(data)
tail(samp)

datamatrix=as.data.frame(data)
sampmatrix=as.data.frame(samp)

dds <- DESeqDataSetFromMatrix(countData = datamatrix,colData = sampmatrix,design = ~bin)
dds

prdds <- DESeq(dds)
prdds

prdds$sample
prdds$bin
prdds$sizeFactor


res <- results(prdds)
res

plotMA(res)



# ma plot -----------------------------------------------------------------

library(apeglm)
resultsNames(prdds)
res2=lfcShrink(prdds,coef = "bin_G4_vs _G1",type = "apeglm")
plotMA(res2)
plotMA(res2,cex.axis=1.2,cex.lab=1,main="ma plot after lfc shrinkage")

dev.copy2pdf(file= "ma plot after lfc shrinkage.pdf")# to save file in pdf format

mcols(res,use.names = TRUE)

summary(res)

res.05 <- results(prdds,alpha = .05)
table(res.05$padj < .05)

resLFC1 <- results(prdds,lfcThreshold = 1)
table(resLFC1$padj<0.1)

resSig <- subset(res2,padj<0.1)
resSig2 <- subset(resLFC1,padj<0.1)

sort=resSig[order(resSig$log2FoldChange,decreasing = TRUE),]
sort2 <- resSig2[order(resSig2$log2FoldChange,decreasing = TRUE),]

head(resSig[order(resSig$log2FoldChange),])
head(resSig[order(resSig$log2FoldChange,decreasing = TRUE),])

topGene <- rownames(res2)[which.min(res2$padj)]

plotMA(res2,ylim=c(-5,5))

plotMA(resLFC1,ylim=c(-5,5))
topGene <- rownames(resLFC1[which.min(resLFC1$padj)])

























