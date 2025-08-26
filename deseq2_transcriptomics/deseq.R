# Load DESeq2
library(DESeq2)
setwd("C:/Users/vibha/Documents/GitHub/NGS_Data_analysis_Biostatistics")
# Load the count matrix and metadata
count_data <- read.csv("counts_viswas_new.csv", row.names = 1)
col_data <- read.csv("metadata_viswas_new.csv", row.names = 1)

# Ensure the sample names in col_data match the column names in count_data
# Reorder if necessary
if (!all(colnames(count_data) == rownames(col_data))) {
  col_data <- col_data[match(colnames(count_data), rownames(col_data)), ]
}
col_data <- as.data.frame(col_data)


col_data <- data.frame(condition = col_data)  # Convert to a data frame
col_data$condition <- factor(col_data$condition) 
# Convert condition column to a factor
col_data$condition <- factor(col_data$condition)
count_data[is.na(count_data)] <- 0
count_data <- round(count_data)  # Ensure integer values
print(count_data)

str(col_data)  # Ensure condition is a factor and has no NA values
sum(is.na(col_data$condition))  # Should be 0
sum(is.na(count_data))  # Should be 0

dim(col_data)
dim(count_data)
sum(is.na(col_data$condition))
str(col_data)
str(count_data)
all(colnames(count_data) %in% rownames(col_data))

# Create the DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = count_data, 
                              colData = col_data, 
                              design = ~ condition)

# Prefilter low-count genes (optional, but recommended)
dds <- dds[rowSums(counts(dds)) > 10, ]

# Run the DESeq2 analysis
dds <- DESeq(dds)

# Extract results
results_table <- results(dds, contrast = c("condition", "control", "infected"))

# Save results to a CSV file
write.csv(as.data.frame(results_table), file = "deseq_mpxv_viswas_new.csv")

# Perform variance stabilizing transformation (VST) for visualization
vsd <- vst(dds, blind = FALSE)

# Generate a PCA plot
plotPCA(vsd, intgroup = "condition")

# Plot MA-plot
plotMA(results_table, ylim = c(-2, 2))

# Summary of results
summary(results_table)


library(ggplot2)


# Transform the data for PCA
vsd <- vst(dds, blind = FALSE)

# Plot PCA
plotPCA(vsd, intgroup = "condition") +  ggtitle("PCA Plot")
 


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
results_table$Regulation <- ifelse(results_table$padj < 0.05 & results_table$log2FoldChange > 1, "Upregulated",
                                   ifelse(results_table$padj < 0.05 & results_table$log2FoldChange < -1, "Downregulated", "Not Significant"))

library(ggplot2)

ggplot(results_table, aes(x = log2FoldChange, y = -log10(padj), color = Regulation)) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "grey")) +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-Log10 Adjusted p-value") +
  theme_minimal()


# for enhanced vocano plot 

library(ggplot2)
library(ggrepel)

# Convert to dataframe if not already
results_table <- as.data.frame(results_table)

# Define regulation status
results_table$Regulation <- ifelse(results_table$padj < 0.05 & results_table$log2FoldChange > 1, "Upregulated",
                                   ifelse(results_table$padj < 0.05 & results_table$log2FoldChange < -1, "Downregulated", "Not Significant"))

# Select top genes for labeling (most significant)
top_genes <- results_table[order(results_table$padj), ][1:10, ]

# Volcano plot
ggplot(results_table, aes(x = log2FoldChange, y = -log10(padj), color = Regulation)) +
  geom_point(alpha = 0.6, size = 2) +  # Adjust point transparency and size
  scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not Significant" = "grey")) +
  geom_text_repel(data = top_genes, aes(label = rownames(top_genes)), 
                  size = 4, box.padding = 0.5, point.padding = 0.3, max.overlaps = 10) +  # Add labels to top genes
  labs(title = "Enhanced Volcano Plot", 
       x = "Log2 Fold Change", 
       y = "-Log10 Adjusted p-value",
       color = "Regulation") +
  theme_minimal(base_size = 14) +  # Increase base font size
  theme(legend.position = "top",  # Move legend to top for better visibility
        plot.title = element_text(hjust = 0.5, face = "bold"))  # Center and bold title






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
  scale_fill_manual(values = c("yellow", "green")) +
  labs(title = "Top Differentially Expressed Genes", y = "Log2 Fold Change") +
  theme_minimal()








# Extract top 10 upregulated and downregulated genes
top_up <- results_table[order(results_table$log2FoldChange, decreasing = TRUE), ][1:10, ]
top_down <- results_table[order(results_table$log2FoldChange), ][1:10, ]

# Combine and add gene column
top_genes <- rbind(top_up, top_down)
top_genes$gene <- rownames(top_genes)

# Define colors: Red for Upregulated, Blue for Downregulated
ggplot(top_genes, aes(x = reorder(gene, log2FoldChange), y = log2FoldChange, fill = log2FoldChange > 0)) +
  geom_bar(stat = "identity", width = 0.6) +  # Adjust bar width
  coord_flip() +  # Flip coordinates for better readability
  scale_fill_manual(values = c("blue", "red"), labels = c("Downregulated", "Upregulated")) +
  labs(title = "Top 10 Upregulated and Downregulated Genes", 
       x = "Gene", 
       y = "Log2 Fold Change", 
       fill = "Regulation") +
  theme_minimal(base_size = 14) +  # Adjust font size
  theme(legend.position = "top", 
        plot.title = element_text(hjust = 0.5, face = "bold"))  # Center title



















# Histogram of p-values
ggplot(results_table, aes(x = pvalue)) +
  geom_histogram(bins = 30, fill = "orange", alpha = 0.7) +
  labs(title = "P-value Distribution", x = "p-value", y = "Frequency") +
  theme_minimal()






# Load required libraries
library(DESeq2)
library(pheatmap)
library(RColorBrewer)

# Ensure 'dds' is your DESeqDataSet object with normalized counts
vsd <- vst(dds, blind=FALSE)  # Variance Stabilizing Transformation (VST)

# Extract results and sort by adjusted p-value (most significant genes)
res <- results(dds, alpha = 0.05)
res <- res[order(res$padj, na.last = NA), ]  # Sort by adjusted p-value

# Select the top 50 differentially expressed genes
top_genes <- rownames(res)[1:50]

# Extract normalized counts for these genes
top_counts <- assay(vsd)[top_genes, ]

# Z-score normalization (mean-center and scale each row)
top_counts_scaled <- t(scale(t(top_counts)))

# Define annotation for conditions
annotation_col <- as.data.frame(colData(dds)[, "condition", drop=FALSE])

# Create the heatmap
pheatmap(
  mat = top_counts_scaled,  # Scaled expression data
  annotation_col = annotation_col,  # Condition annotations
  cluster_rows = TRUE,  # Cluster genes
  cluster_cols = TRUE,  # Cluster samples
  show_rownames = TRUE,  # Show gene names
  show_colnames = TRUE,  # Show sample names
  color = colorRampPalette(rev(brewer.pal(n=9, name="RdBu")))(100),  # Blue-red gradient
  main = "Top 50 Differentially Expressed Genes"
)
























