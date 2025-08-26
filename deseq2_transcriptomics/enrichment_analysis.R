# Load necessary libraries
library(readr)

# Read the CSV file (ensure the correct path)
deg_data <- read_csv("common_DEGs.csv")

setwd('C:/Users/vibha/Documents/GitHub/NGS_Data_analysis_Biostatistics/')

# View the first few rows
head(deg_data)
# Load annotation package
library(org.Hs.eg.db)  # Use the appropriate organism package

# Convert Gene Symbols to Entrez IDs
library(clusterProfiler)

genes <- deg_data$Gene_Symbol  # Replace with actual column name
gene_list <- bitr(genes, fromType="SYMBOL", toType="ENTREZID", OrgDb=org.Hs.eg.db)

# Merge with original data
deg_data <- merge(deg_data, gene_list, by.x="Gene_Symbol", by.y="SYMBOL")








library(clusterProfiler)

# Example: If your viral genes have KEGG IDs
kegg_results <- enrichKEGG(
  gene          = common_DEGs.csv,  # Replace with your list of gene IDs
  organism      = "hsa",  # Use "hsa" (human) if studying host response
  pvalueCutoff  = 0.05
)

# View results
head(kegg_results)

# Visualize pathways
library(enrichplot)
dotplot(kegg_results, showCategory=20)
















