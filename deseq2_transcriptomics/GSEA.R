library(tidyverse)
library(ggplot2)






# Replace with your actual file path
enrichr_data <- read_csv("GO_Molecular_Function.csv")


head(enrichr_data)

colnames(enrichr_data)


library(janitor)

# Clean the column names
enrichr_data <- enrichr_data %>% clean_names()

# Now the column will be 'adjusted_p_value'
top_terms <- enrichr_data %>%
  arrange(adjusted_p_value) %>%
  slice(1:10)






library(ggplot2)

ggplot(top_terms, aes(x = reorder(term, -combined_score), y = combined_score)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top Enriched Terms", x = "Terms", y = "Combined Score") +
  theme_minimal()





ggplot(top_terms, aes(x = combined_score, y = reorder(term, combined_score))) +
  geom_point(aes(size = -log10(adjusted_p_value), color = combined_score)) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(
    title = "Dot Plot of Enriched Terms",
    x = "Combined Score",
    y = "Terms",
    size = "-log10(Adj P-value)"
  ) +
  theme_minimal()




