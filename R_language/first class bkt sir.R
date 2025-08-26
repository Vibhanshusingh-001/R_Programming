# Load DESeq2
library(DESeq2)

# Load the count matrix and metadata
count_data <- read.csv("count_matrix.csv", row.names = 1)
col_data <- read.csv("meta_data.csv", row.names = 1)

# Ensure the sample names in col_data match the column names in count_data
# Reorder if necessary
if (!all(colnames(count_data) == rownames(col_data))) {
  col_data <- col_data[match(colnames(count_data), rownames(col_data)), ]
}

# Convert condition column to a factor
col_data$condition <- factor(col_data$condition)

# Create the DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = count_data, 
                              colData = col_data, 
                              design = ~ condition)

# Prefilter low-count genes (optional, but recommended)
dds <- dds[rowSums(counts(dds)) > 10, ]

# Run the DESeq2 analysis
dds <- DESeq(dds)

# Extract results
results_table <- results(dds, contrast = c("condition", "test", "control"))

# Save results to a CSV file
write.csv(as.data.frame(results_table), file = "deseq2_results.csv")

# Perform variance stabilizing transformation (VST) for visualization
vsd <- vst(dds, blind = FALSE)

# Generate a PCA plot
plotPCA(vsd, intgroup = "condition")

# Plot MA-plot
plotMA(results_table, ylim = c(-2, 2))

# Summary of results
summary(results_table)





# Transform the data for PCA
vsd <- vst(dds, blind = FALSE)

# Plot PCA
plotPCA(vsd, intgroup = "condition") + 
  ggtitle("PCA Plot")


# Calculate sample distances
sample_dist <- dist(t(assay(vsd)))
sample_dist_matrix <- as.matrix(sample_dist)

# Heatmap
library(pheatmap)
pheatmap(sample_dist_matrix, 
         annotation_col = as.data.frame(col_data), 
         main = "Sample Distance Heatmap")

# Prepare data for the volcano plot
results_table <- as.data.frame(results_table)
results_table$Significant <- results_table$padj < 0.05 & abs(results_table$log2FoldChange) > 1

library(ggplot2)
ggplot(results_table, aes(x = log2FoldChange, y = -log10(padj), color = Significant)) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("pink", "red")) +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-Log10 Adjusted p-value") +
  theme_minimal()

# Select top 20 significant genes
top_genes <- head(order(results_table$padj, na.last = NA), 20)

# Extract normalized counts
normalized_counts <- assay(vsd)[top_genes, ]

# Heatmap
pheatmap(normalized_counts, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         annotation_col = as.data.frame(col_data),
         main = "Top Differentially Expressed Genes")



# Example: Plot expression of a single gene
gene_of_interest <- "LOC729737"  # Replace with a specific gene ID
gene_counts <- plotCounts(dds, gene = gene_of_interest, intgroup = "condition", returnData = TRUE)

# Boxplot
ggplot(gene_counts, aes(x = condition, y = count)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.2, alpha = 0.6) +
  labs(title = paste("Expression of", gene_of_interest), y = "Normalized Counts") +
  theme_minimal()

# Extract top 10 upregulated and downregulated genes
top_up <- results_table[order(results_table$log2FoldChange, decreasing = TRUE), ][1:10, ]
top_down <- results_table[order(results_table$log2FoldChange), ][1:10, ]

# Combine and plot
top_genes <- rbind(top_up, top_down)
top_genes$gene <- rownames(top_genes)

ggplot(top_genes, aes(x = reorder(gene, log2FoldChange), y = log2FoldChange, fill = log2FoldChange > 0)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  scale_fill_manual(values = c("blue", "red")) +
  labs(title = "Top Differentially Expressed Genes", y = "Log2 Fold Change") +
  theme_minimal()


# Histogram of p-values
ggplot(results_table, aes(x = pvalue)) +
  geom_histogram(bins = 30, fill = "blue", alpha = 0.7) +
  labs(title = "P-value Distribution", x = "p-value", y = "Frequency") +
  theme_minimal()













