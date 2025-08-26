
library(tidyverse)
library(ggplot2)


# cellular component ------------------------------------------------------

# Replace with your actual file path
enrichr_data <- read_csv("KEGG_2021_Human_table.csv")


head(enrichr_data)

colnames(enrichr_data)


library(janitor)

# Clean the column names
enrichr_data <- enrichr_data %>% clean_names()

# Now the column will be 'adjusted_p_value'
top_terms <- enrichr_data %>%
  arrange(adjusted_p_value) %>%
  slice(1:10)






#library(ggplot2)

#ggplot(top_terms, aes(x = reorder(term, -combined_score), y = combined_score)) +
#  geom_bar(stat = "identity", fill = "maroon") +
#  coord_flip() +
#  labs(title = "KEGG 2021 Human", x = "Terms", y = "Combined Score") +
#  theme_minimal()





# ggplot(top_terms, aes(x = combined_score, y = reorder(term, combined_score))) +
#   geom_point(aes(size = -log10(adjusted_p_value), color = combined_score)) +
#   scale_color_gradient(low = "blue", high = "maroon") +
#   labs(
#     title = "Dot Plot of Enriched Terms(KEGG )",
#     x = "Combined Score",
#     y = "Terms",
#     size = "-log10(Adj P-value)"
#   ) +
#   theme_minimal()


# bubble ------------------------------------------------------------------

# Load libraries
library(tidyverse)
library(janitor)




# Read the Enrichr KEGG table
kegg_data <- read_csv("KEGG_2021_Human_table.csv")

# Clean column names to ensure consistency
kegg_data <- kegg_data %>% clean_names()

# View column names to verify
colnames(kegg_data)

# Select top 15 pathways based on adjusted p-value
top_kegg <- kegg_data %>%
  arrange(adjusted_p_value) %>%
  slice(1:10)


# Bubble plot visualization
ggplot(top_kegg, aes(x = combined_score, y = reorder(term, combined_score))) +
  geom_point(aes(size = -log10(adjusted_p_value), color = combined_score), alpha = 0.8) +
  scale_color_gradient(low = "skyblue", high = "darkblue") +
  scale_size_continuous(range = c(3, 10)) +
  labs(
    title = "KEGG",
    x = "Combined Score",
    y = "GO term",
    size = "-log10(Adjusted P-value)",
    color = "Combined Score"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.y = element_text(size = 15),
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    legend.position = "right"
  )






ggplot(top_kegg, aes(x = reorder(term, combined_score), y = combined_score, fill = -log10(adjusted_p_value))) +
  geom_bar(stat = "identity", color = "black", width = 0.7) +
  coord_flip() +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  labs(
    title = "Top KEGG Pathway Enrichment",
    x = "KEGG Pathways",
    y = "Combined Score",
    fill = "-log10(Adj P-value)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.y = element_text(size = 12),
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold")
  )

