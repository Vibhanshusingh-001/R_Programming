# corelation between technical replicates v3 and v6  
# preliminary  data analysis
library(DESeq2)
data <- read.table("GSE164073_raw_counts_GRCh38.p13_NCBI.tsv",header=T)
samp <- read.table("sample.txt",header=T)


datamatrix=as.data.frame(data)
sampmatrix=as.data.frame(samp)

dds <-DESeqDataSetFromMatrix(countData = datamatrix,colData = sampmatrix,design = ~bin)
dds




rld <- rlog(dds,blind = FALSE)
head(assay(rld),30)
lims <- c(-2,20)# setting limit beacuse we want to do corelation test between technical replicates 

plot(assay(rld)[,1:2],pch=16,cex=0.3,main="rlog",xlim=lims,ylim=lims)
rld




# distance based corelation -----------------------------------------------

# distances between expression pattern

library(pheatmap)
library(RColorBrewer)
# generate distance matrix

sampleDists <- dist(t(assay(rld)))
sampleDists

sampleDistmatrix <- as.matrix(sampleDists)

rownames(sampleDistmatrix) <-  paste(rld$bin,rld$sample, sep = "-")
colnames(sampleDistmatrix) <- NULL
colors <- colorRampPalette(rev(brewer.pal( 9,"BuGn")))(255)
pheatmap(sampleDistmatrix, clustering_distance_rows = sampleDists,clustering_distance_cols = sampleDists,col=colors)
# pheatmap take data from  matrix







# Required libraries
library(PoiClaClu)
library(pheatmap)
library(DESeq2)  # Assuming you're working with DESeq2

# Perform Poisson Distance Calculation
poisd <- PoissonDistance(t(counts(dds)))

# Create a Poisson distance matrix
samplePoisDistMatrix <- as.matrix(poisd$dd)
rownames(samplePoisDistMatrix) <- paste(dds$bin, dds$sample, sep = "-")  # Assuming `dds` has 'bin' and 'sample'
colnames(samplePoisDistMatrix) <- NULL

# Plot heatmap with Poisson Distance Matrix
pheatmap(samplePoisDistMatrix, 
         clustering_distance_rows = poisd$dd, 
         clustering_distance_cols = poisd$dd, 
         col = colors)

# Ensure `rld` is defined, use either:
# rld <- rlog(dds)  # or `vst` transformation
# Perform PCA plotting
plotPCA(rld, intgroup = c("bin", "sample"))



pcadata <- plotPCA(rld,intgroup=c("bin","sample"),returnData=TRUE)
percentVar <- round(100*attr(pcadata,"percentVar"))# percent variation explained by pca data
pcadata


library(ggplot2)

ggplot(pcadata,aes(PC1,PC2,color=bin,shape = bin))+geom_point(size=3)+xlab(paste0("pc1:",percentVar[1],"%variance"))+
  ylab(paste0("pc2:",percentVar[2],"% variance"))+coord_fixed()





