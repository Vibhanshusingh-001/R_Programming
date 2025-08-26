# Load necessary libraries
library(DESeq2)
library(ggplot2)

# Load count data and metadata
counts <- read.csv("count_matrix_hiv.CSV", row.names = 1)
metadata <- read.csv("meta_data_hiv.CSV", row.names = 1)

# Ensure metadata has correct factor levels
metadata$condition <- factor(metadata$condition, levels = c("control", "treated"))


counts[is.na(counts)] <- 0

metadata <- metadata[!is.na(metadata$condition), ]
counts <- counts[, rownames(metadata)]  # Ensure counts match filtered metadata

print(colnames(counts))
print(rownames(metadata))




# Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = counts, colData = metadata, design = ~ condition)

# Run DESeq2
dds <- DESeq(dds)

# Get results and order by adjusted p-value
res <- results(dds)
res <- res[order(res$padj), ]

# Convert to data frame and filter out NA values
res_df <- as.data.frame(res)
res_df <- na.omit(res_df)

# Add a column for significance classification
res_df$threshold <- "Not Significant"
res_df$threshold[res_df$log2FoldChange > 1 & res_df$padj < 0.05] <- "Upregulated"
res_df$threshold[res_df$log2FoldChange < -1 & res_df$padj < 0.05] <- "Downregulated"

# Create volcano plot
ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = threshold)) +
  geom_point(alpha = 0.8) +
  scale_color_manual(values = c("blue", "grey", "red")) +
  theme_minimal() +
  xlab("log2 Fold Change") +
  ylab("-log10(padj)") +
  ggtitle("Volcano Plot") +
  theme(legend.title = element_blank())
