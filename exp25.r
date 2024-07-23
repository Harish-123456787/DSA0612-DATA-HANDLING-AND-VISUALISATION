# Install necessary libraries if not already installed
install.packages("ggplot2")
install.packages("reshape2")
install.packages("tidyr")

# Load the libraries
library(ggplot2)
library(reshape2)
library(tidyr)

# Create the data frame
satisfaction_data <- data.frame(
  Category = c("Product Quality", "Customer Service", "Value for Money"),
  Very_Dissatisfied = c(5, 10, 8),
  Dissatisfied = c(15, 20, 12),
  Neutral = c(25, 30, 28),
  Satisfied = c(35, 25, 32),
  Very_Satisfied = c(20, 15, 20)
)

# Print the original data frame for verification
print(satisfaction_data)

# Melt the data for plotting using reshape2
try({
  satisfaction_data_melted <- melt(satisfaction_data, id.vars = "Category")
  print(satisfaction_data_melted)
}, silent = TRUE)

# Alternative using tidyr if reshape2 fails
if (!exists("satisfaction_data_melted")) {
  satisfaction_data_melted <- pivot_longer(satisfaction_data, 
                                           cols = starts_with("Very"),
                                           names_to = "Satisfaction_Level",
                                           values_to = "Count")
  print(satisfaction_data_melted)
}

# Rename the levels for better readability
satisfaction_data_melted$Satisfaction_Level <- factor(satisfaction_data_melted$Satisfaction_Level, 
                                                      levels = c("Very_Dissatisfied", "Dissatisfied", "Neutral", "Satisfied", "Very_Satisfied"),
                                                      labels = c("Very Dissatisfied", "Dissatisfied", "Neutral", "Satisfied", "Very Satisfied"))

# Stacked bar plot
ggplot(satisfaction_data_melted, aes(x = Category, y = Count, fill = Satisfaction_Level)) +
  geom_bar(stat = "identity") +
  labs(title = "Customer Satisfaction Survey Results",
       x = "Category",
       y = "Count",
       fill = "Satisfaction Level") +
  theme_minimal() +
  scale_fill_manual(values = c("Very Dissatisfied" = "red", "Dissatisfied" = "orange", "Neutral" = "yellow", "Satisfied" = "lightgreen", "Very Satisfied" = "green"))
