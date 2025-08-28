
library(vegan)
data <- read.csv("data/merged_data.csv")
anova_result <- aov(shannon_diversity ~ diet_group, data=data)
summary(anova_result)
dist_matrix <- vegdist(data[, 2:11])
pca_res <- cmdscale(dist_matrix, eig=TRUE, k=2)
plot(pca_res$points, col=as.factor(data$diet_group), pch=19)
