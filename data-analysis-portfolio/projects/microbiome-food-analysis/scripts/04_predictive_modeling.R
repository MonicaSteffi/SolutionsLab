
library(randomForest)
data <- read.csv("data/merged_data.csv")
set.seed(123)
rf_model <- randomForest(diet_group ~ ., data=data[, -1], importance=TRUE)
print(rf_model)
