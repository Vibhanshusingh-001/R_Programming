library(ggplot2)
library(readr)
library(dplyr)

# Read the tab-separated file from Abricate
data <- read_tsv("abricate_summary.txt")

# Basic bar plot of gene counts
ggplot(data, aes(x=Gene, y=Count, fill=Sample)) +
  geom_bar(stat="identity") +
  theme_minimal() +
  labs(title="Gene Distribution Across Samples", x="Gene", y="Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
