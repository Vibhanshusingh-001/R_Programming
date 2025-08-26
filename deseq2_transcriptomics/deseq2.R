
# ================================
# 🔹 Step 1: Load Required Libraries
# ================================

library(DESeq2)
library(ggplot2)
library(pheatmap)
library(EnhancedVolcano)
library(dplyr)


getwd()

setwd("C:/Users/vibha/Documents/GitHub/NGS_Data_analysis_Biostatistics")
# ================================
# 🔹 Step 2: Load Count Data & Metadata
# ================================
# Load count matrices
counts_mpxv <- read.csv("count_matrix_mpxv.csv", row.names = 1, stringsAsFactors = FALSE)
meta_mpxv <- read.csv("meta_data_mpxv.csv", row.names = 1, stringsAsFactors = FALSE)

counts_hiv <- read.csv("count_matrix_hiv.csv", row.names = 1, stringsAsFactors = FALSE)
meta_hiv <- read.csv("meta_data_hiv.csv", row.names = 1, stringsAsFactors = FALSE)

# ================================
# 🔹 Step 3: Check Metadata Format & Fix Issues
# ================================
# Ensure metadata is a data frame
meta_mpxv <- as.data.frame(meta_mpxv)
meta_hiv <- as.data.frame(meta_hiv)

# Ensure metadata row names match count matrix column names
coldata_mpxv <- meta_mpxv[match(colnames(counts_mpxv), rownames(meta_mpxv)), , drop = FALSE]
coldata_hiv <- meta_hiv[match(colnames(counts_hiv), rownames(meta_hiv)), , drop = FALSE]

# Verify 'condition' column exists
if (!"condition" %in% colnames(coldata_mpxv)) stop("Error: 'condition' column missing in MPXV metadata!")
if (!"condition" %in% colnames(coldata_hiv)) stop("Error: 'condition' column missing in HIV metadata!")

# Convert 'condition' column to factor
coldata_mpxv$condition <- factor(coldata_mpxv$condition)
coldata_hiv$condition <- factor(coldata_hiv$condition)

# ================================
# 🔹 Step 4: Create DESeq2 Datasets
# ================================
# Ensure count data is integer
counts_mpxv <- round(counts_mpxv)
counts_hiv <- round(counts_hiv)

dds_mpxv <- DESeqDataSetFromMatrix(countData = counts_mpxv, colData = coldata_mpxv, design = ~ condition)
dds_hiv <- DESeqDataSetFromMatrix(countData = counts_hiv, colData = coldata_hiv, design = ~ condition)


# Replace NA values with zeros
counts_mpxv[is.na(counts_mpxv)] <- 0
counts_hiv[is.na(counts_hiv)] <- 0

# Ensure integer counts
counts_mpxv <- round(counts_mpxv)
counts_hiv <- round(counts_hiv)


counts_hiv[is.na(counts_hiv)] <- 0

# Create DESeq2 dataset
dds_mpxv <- DESeqDataSetFromMatrix(countData = counts_mpxv, colData = coldata_mpxv, design = ~ condition)
dds_hiv <- DESeqDataSetFromMatrix(countData = counts_hiv, colData = coldata_hiv, design = ~ condition)





# Filter low-count genes
dds_mpxv <- dds_mpxv[rowSums(counts(dds_mpxv)) > 10, ]
dds_hiv <- dds_hiv[rowSums(counts(dds_hiv)) > 10, ]

# Run DESeq2 analysis
dds_mpxv <- DESeq(dds_mpxv)
dds_hiv <- DESeq(dds_hiv)

# Extract results
res_mpxv <- results(dds_mpxv, contrast = c("condition", "infected", "healthy"))
res_hiv <- results(dds_hiv, contrast = c("condition", "infected", "control"))

# Sort by adjusted p-value
res_mpxv <- res_mpxv[order(res_mpxv$padj), ]
res_hiv <- res_hiv[order(res_hiv$padj), ]

# ================================
# 🔹 Step 5: Find Common Differentially Expressed Genes
# ================================
# Define cutoff for significance
logfc_cutoff <- 0.5  # More relaxed threshold
pval_cutoff <- 0.1   # Less strict p-value

# Filter significant genes
sig_mpxv <- rownames(subset(res_mpxv, padj < pval_cutoff & abs(log2FoldChange) > logfc_cutoff))
sig_hiv <- rownames(subset(res_hiv, padj < pval_cutoff & abs(log2FoldChange) > logfc_cutoff))

# Find common differentially expressed genes
common_genes <- intersect(sig_mpxv, sig_hiv)

# Save results
write.csv(common_genes, "common_DEGs.csv", row.names = FALSE)







# Get results and order by adjusted p-value
res <- results(dds_mpxv)
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
  geom_point(alpha = 0.8, size=2) +
  scale_color_manual(values = c("blue", "grey", "red")) +
  theme_minimal() +
  xlab("log2 Fold Change") +
  ylab("-log10(padj)") +
  ggtitle("Volcano Plot hiv") +
  theme(legend.title = element_blank()+geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "black")
        +geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "black"))



ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = threshold)) +
  geom_point(alpha = 0.8, size = 2) +
  scale_color_manual(values = c("Downregulated" = "blue", 
                                "Not Significant" = "grey50",
                                "Upregulated" = "red",
                                "NA" = "black")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "black") +
  geom_hline(yintercept = -log10(0.04), linetype = "dashed", color = "black") +
  labs(title = "Volcano Plot mpxv",
       x = "log2 Fold Change",
       y = "-log10(p-value)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        legend.position = "right",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_rect(fill = NA, color = "black")) +
  scale_x_continuous(limits = c(-20, 10)) +  # Adjust based on your data
  scale_y_continuous(limits = c(-0.5, 30)) 








# ================================
# 🔹 Step 6: Generate Plots
# ================================
# Volcano Plot MPXV
EnhancedVolcano(res_mpxv,
                lab = rownames(res_mpxv),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = pval_cutoff,
                FCcutoff = logfc_cutoff,
                title = "MPXV Volcano Plot",
                labSize = 3.0,
                col = c("gray", "blue", "red", "red"))

# Volcano Plot HIV
EnhancedVolcano(res_hiv,
                lab = rownames(res_hiv),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = pval_cutoff,
                FCcutoff = logfc_cutoff,
                title = "HIV Volcano Plot",
                labSize = 3.0,
                col = c("gray", "blue", "red", "red"))

# Print common genes
print("Common Differentially Expressed Genes:")
print(common_genes)





# Install required packages if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c( "VennDiagram", "ggvenn", "ggrepel"))

# Load Libraries
library(ggplot2)
library(pheatmap)
library(VennDiagram)
library(ggvenn)
library(ggrepel)


# Create a Venn Diagram
venn_list <- list(MPXV = sig_mpxv, HIV = sig_hiv)
ggvenn(venn_list, 
       fill_color = c("blue", "red"), 
       stroke_size = 1, 
       text_size = 5)





# 🔹 Step 5: Heatmap of Common Genes
# ================================
# Subset normalized expression values
normalized_counts_mpxv <- assay(vst(dds_mpxv))[common_genes, ]
normalized_counts_hiv <- assay(vst(dds_hiv))[common_genes, ]

# Combine both datasets
combined_counts <- cbind(normalized_counts_mpxv, normalized_counts_hiv)

# Plot heatmap
pheatmap(combined_counts, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE, 
         main = "Expression of most Common DEGs in MPXV & HIV")



# ================================
# 🔹 Select Top 50 Common Genes
# ================================
top_common_genes <- head(common_genes, 50)  # Select top 50 genes

# ================================
# 🔹 Extract Normalized Counts
# ================================
normalized_counts_mpxv <- assay(vst(dds_mpxv))[top_common_genes, ]
normalized_counts_hiv <- assay(vst(dds_hiv))[top_common_genes, ]

# ================================
# 🔹 Combine Data for Heatmap
# ================================
combined_counts <- cbind(normalized_counts_mpxv, normalized_counts_hiv)

# ================================
# 🔹 Plot Heatmap
# ================================
pheatmap(combined_counts, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE, 
         main = "Expression of Top 50 Common DEGs in MPXV & HIV",
         scale = "row",  # Normalize across rows (genes)
         color = colorRampPalette(c("blue", "white", "red"))(50))





# Define cutoff values
logfc_cutoff <- 1  # More stringent log2FoldChange threshold
pval_cutoff <- 0.05  # More strict p-value

# Filter top DEGs for MPXV
top_mpxv <- subset(res_mpxv, padj < pval_cutoff & abs(log2FoldChange) > logfc_cutoff)
top_mpxv <- top_mpxv[order(top_mpxv$padj), ]  # Sort by significance
top_mpxv_genes <- rownames(head(top_mpxv, 50))  # Select top 50 genes

# Filter top DEGs for HIV
top_hiv <- subset(res_hiv, padj < pval_cutoff & abs(log2FoldChange) > logfc_cutoff)
top_hiv <- top_hiv[order(top_hiv$padj), ]  # Sort by significance
top_hiv_genes <- rownames(head(top_hiv, 50))  # Select top 50 genes

# Print selected genes
print("Top 50 Differentially Expressed Genes in MPXV:")
print(top_mpxv_genes)

print("Top 50 Differentially Expressed Genes in HIV:")
print(top_hiv_genes)

# Save results
write.csv(top_mpxv, "top_50_DEGs_MPXV.csv", row.names = TRUE)
write.csv(top_hiv, "top_50_DEGs_HIV.csv", row.names = TRUE)



# Extract normalized counts for top MPXV genes
normalized_counts_mpxv <- assay(vst(dds_mpxv))[top_mpxv_genes, ]

# Plot heatmap for MPXV DEGs
pheatmap(normalized_counts_mpxv, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE, 
         main = "Top 50 Differentially Expressed Genes in MPXV",
         scale = "row",
         color = colorRampPalette(c("blue", "white", "red"))(50))



# Extract normalized counts for top HIV genes
normalized_counts_hiv <- assay(vst(dds_hiv))[top_hiv_genes, ]

# Plot heatmap for HIV DEGs
pheatmap(normalized_counts_hiv, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE, 
         main = "Top 50 Differentially Expressed Genes in HIV",
         scale = "row",
         color = colorRampPalette(c("blue", "white", "red"))(50))


