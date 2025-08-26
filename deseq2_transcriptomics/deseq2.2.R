# ================================
# 🔹 Step 1: Install & Load Packages
# ================================
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

BiocManager::install(c("DESeq2", "ggplot2", "pheatmap", "EnhancedVolcano"))

library(DESeq2)
library(ggplot2)
library(pheatmap)
library(EnhancedVolcano)

# ================================
# 🔹 Step 2: Load Count Data & Metadata
# ================================
# Load raw counts matrix (rows = genes, columns = samples)
counts_data <- read.csv("counts_viswas.csv", row.names = 1)  # Replace with your file

# Load metadata (must contain 'condition' column)
coldata <- read.csv("metadata_viswas.csv", row.names = 1)  # Replace with your file

# Ensure sample names match between counts data and metadata
#stopifnot(all(colnames(counts_data) == rownames(coldata)))

# ================================
# 🔹 Step 3: Create DESeq2 Dataset & Run DE Analysis
# ================================
#dds <- DESeqDataSetFromMatrix(countData = counts_data, colData = coldata, design = ~ condition)

# Run DESeq2 analysis
#dds <- DESeq(dds)

# Ensure the sample names in col_data match the column names in count_data
# Reorder if necessary
if (!all(colnames(counts_data) == rownames(coldata))) {
  coldata <- coldata[match(colnames(counts_data), rownames(coldata)), ]
}

# Convert condition column to a factor
coldata$condition <- factor(coldata$condition)
counts_data[is.na(counts_data)] <- 0
counts_data <- round(counts_data)  # Ensure integer values
print(counts_data)

# Create the DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData = counts_data, 
                              colData = coldata, 
                              design = ~ condition)

# Prefilter low-count genes (optional, but recommended)
dds <- dds[rowSums(counts(dds)) > 10, ]

# Run the DESeq2 analysis
dds <- DESeq(dds)

# Extract DE results
res <- results(dds, contrast = c("condition", "infected", "healthy"))  # Modify condition names
res <- res[order(res$padj), ]  # Sort by adjusted p-value

# Save results
write.csv(as.data.frame(res), "differential_expression_results_mpxv.csv")

# ================================
# 🔹 Step 4: Volcano Plot
# ================================
EnhancedVolcano(res,
                lab = rownames(res),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = 0.05,
                FCcutoff = 1,
                title = "Volcano Plot",
                labSize = 3.0,
                col = c("gray", "blue", "red", "red")
)

# ================================
# 🔹 Step 5: MA Plot
# ================================
plotMA(res, main = "MA Plot", ylim = c(-5, 5))

# ================================
# 🔹 Step 6: Heatmap of Top DE Genes
# ================================
# Select top 50 differentially expressed genes
topGenes <- rownames(res)[1:50]

# Extract normalized expression values
normalized_counts <- assay(vst(dds))[topGenes, ]

# Plot heatmap
pheatmap(normalized_counts, cluster_rows = TRUE, cluster_cols = TRUE, 
         show_rownames = TRUE, main = "Top 50 Differentially Expressed Genes")









