
library(ggplot2)
data <- read_csv("data/merged_data.csv")
ggplot(data, aes(x=diet_group, y=shannon_diversity, fill=diet_group)) +
  geom_boxplot() + theme_minimal() +
  labs(title="Alpha Diversity by Diet Group", x="Diet Group", y="Shannon Diversity") +
  ggsave("reports/alpha_diversity_boxplot.png")
