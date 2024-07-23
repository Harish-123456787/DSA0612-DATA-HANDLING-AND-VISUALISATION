# Install necessary libraries if not already installed
install.packages("ggplot2")
install.packages("hexbin")

# Load the libraries
library(ggplot2)
library(hexbin)

# Create the data frame
engagement_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', 
                   '2023-01-04', '2023-01-05', '2023-01-06', '2023-01-07')),
  Likes = c(150, 200, 250, 300, 350, 400, 450),
  Comments = c(20, 25, 30, 35, 40, 45, 50),
  Shares = c(30, 35, 40, 45, 50, 55, 60)
)

# Melt the data for plotting
engagement_data_melted <- reshape2::melt(engagement_data, id.vars = "Date")

# Hexbin plot for Likes vs Comments
ggplot(engagement_data, aes(x = Likes, y = Comments)) +
  geom_hex(bins = 10) +
  labs(title = "Hexbin Plot of Likes vs Comments",
       x = "Likes",
       y = "Comments") +
  theme_minimal() +
  scale_fill_continuous(type = "viridis")

# Hexbin plot for Likes vs Shares
ggplot(engagement_data, aes(x = Likes, y = Shares)) +
  geom_hex(bins = 10) +
  labs(title = "Hexbin Plot of Likes vs Shares",
       x = "Likes",
       y = "Shares") +
  theme_minimal() +
  scale_fill_continuous(type = "viridis")

# Hexbin plot for Comments vs Shares
ggplot(engagement_data, aes(x = Comments, y = Shares)) +
  geom_hex(bins = 10) +
  labs(title = "Hexbin Plot of Comments vs Shares",
       x = "Comments",
       y = "Shares") +
  theme_minimal() +
  scale_fill_continuous(type = "viridis")
