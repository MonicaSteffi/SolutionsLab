
library(dplyr)
library(readr)
microbiome <- read_csv("data/microbiome_data.csv")
diet <- read_csv("data/dietary_data.csv")
merged <- microbiome %>% inner_join(diet, by="participant_id") %>% drop_na()
write_csv(merged, "data/merged_data.csv")
cat("Data preprocessing complete\n")
