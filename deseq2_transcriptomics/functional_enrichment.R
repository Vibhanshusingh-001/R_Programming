
library(clusterProfiler)
library(org.Hs.eg.db)  # Change if using a different organism
library(enrichplot)
library(ggplot2)
library(readr)

# Read CSV file containing differentially expressed genes
deg_data <- read_csv("common_DEGs.csv")

# Extract gene symbols
genes <- deg_data$Gene_Symbol  # Ensure this matches your column name

gene_list <- bitr(genes, fromType="SYMBOL", toType="ENTREZID", OrgDb=org.Hs.eg.db)

# Extract only Entrez IDs
entrez_ids <- gene_list$ENTREZID


# KEGG --------------------------------------------------------------------
kegg_res <- enrichKEGG(gene = entrez_ids, 
                       organism = "hsa",  
                       pAdjustMethod = "BH",
                       pvalueCutoff  = 0.2)

if (nrow(as.data.frame(kegg_res)) > 0) {
  dotplot(kegg_res, showCategory=10) + ggtitle("KEGG Pathways for Tissue-Specific DEGs")
} else {
  print("No KEGG enrichment found. Try a different pathway analysis method.")
}



# biological process ------------------------------------------------------


ego <- enrichGO(
  gene          = entrez_ids,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "BP",  # "BP" for Biological Process, "MF" for Molecular Function
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.05
)

dotplot(ego, showCategory=10) + ggtitle("GO Cellular Pathways for Tissue-Specific DEGs")



# molecular function ------------------------------------------------------


ego <- enrichGO(
  gene          = entrez_ids,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "MF",  # "BP" for Biological Process, "MF" for Molecular Function
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.05
)

dotplot(ego, showCategory=10) + ggtitle("GO Cellular Pathways for Tissue-Specific DEGs")




# cellular component ------------------------------------------------------



ego <- enrichGO(
  gene          = entrez_ids,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "CC",  # "BP" for Biological Process, "MF" for Molecular Function
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.1,
  qvalueCutoff  = 0.1
)

dotplot(ego, showCategory=10) + ggtitle("GO Cellular Pathways for Tissue-Specific DEGs")




























# Install required packages if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install Bioconductor packages
BiocManager::install(c("enrichplot", "ReactomePA"))

# Load the necessary libraries
library(clusterProfiler)
library(org.Hs.eg.db)  # For human gene annotation
library(enrichplot)     # For enrichment visualization
library(ggplot2)        # For custom plots
library(DOSE)           # For additional enrichment analysis
library(ReactomePA)     # For Reactome pathway analysis


# Read DEGs from CSV file (Ensure the CSV contains a column named "gene_symbol")
deg_data <- read.csv("common_DEGs.csv", stringsAsFactors = FALSE)

# Extract gene symbols
gene_list <- deg_data$gene_symbol

# Convert gene symbols to Entrez IDs
gene_entrez <- bitr(gene_list, fromType = "SYMBOL",
                    toType = "ENTREZID", 
                    OrgDb = org.Hs.eg.db)

# Check the mapped IDs
head(gene_entrez)


ego <- enrichGO(gene          = gene_entrez$ENTREZID,
                OrgDb         = org.Hs.eg.db,
                keyType       = "ENTREZID",
                ont           = "BP",  # Options: BP (Biological Process), MF (Molecular Function), CC (Cellular Component)
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                qvalueCutoff  = 0.05,
                readable      = TRUE)

# Check if enrichment results exist
if (nrow(as.data.frame(ego)) == 0) {
  print("No significant GO enrichment found. Try adjusting parameters.")
}


kk <- enrichKEGG(gene         = gene_entrez$ENTREZID, 
                 organism     = "hsa",  
                 pAdjustMethod = "BH",
                 pvalueCutoff  = 0.05)

# Check if enrichment results exist
if (nrow(as.data.frame(kk)) == 0) {
  print("No significant KEGG enrichment found. Try adjusting parameters.")
}


barplot(ego, showCategory=10) + ggtitle("GO Enrichment Bar Plot")
barplot(kk, showCategory=10) + ggtitle("KEGG Enrichment Bar Plot")

emapplot(ego, showCategory=10) + ggtitle("GO Enrichment Network Plot")
emapplot(kk, showCategory=10) + ggtitle("KEGG Enrichment Network Plot")


dotplot(ego, showCategory=10) + ggtitle("GO Enrichment Dot Plot")
dotplot(kk, showCategory=10) + ggtitle("KEGG Enrichment Dot Plot")








kk <- enrichKEGG(gene         = gene_entrez$ENTREZID, 
                 organism     = "hsa",  
                 pAdjustMethod = "BH",
                 pvalueCutoff  = 0.1)  # Increase to 0.1 to be less strict

if (nrow(as.data.frame(kk)) > 0) {
  dotplot(kk, showCategory=10) + ggtitle("KEGG Pathways for Tissue-Specific DEGs")
} else {
  print("Still no KEGG enrichment found. Trying Reactome...")
}



library(ReactomePA)

reactome_res <- enrichPathway(gene = gene_entrez$ENTREZID,
                              pvalueCutoff = 0.1,
                              readable = TRUE)

if (nrow(as.data.frame(reactome_res)) > 0) {
  dotplot(reactome_res, showCategory=10) + ggtitle("Reactome Pathway Enrichment")
} else {
  print("No Reactome enrichment found. Your genes may not belong to known pathways.")
}













