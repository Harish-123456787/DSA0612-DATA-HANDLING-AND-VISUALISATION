# Install necessary library if not already installed
install.packages("plotly")
install.packages("dplyr")

# Load the libraries
library(plotly)
library(dplyr)

# Create the data frame
consumer_data <- data.frame(
  Product = c("A", "B", "C", "D", "E"),
  Price = c(50, 70, 60, 45, 55),
  Rating = c(4.2, 3.8, 4.0, 4.5, 3.9),
  Age_Group = c("25-35", "35-45", "18-25", "45-55", "25-35")
)

# Convert Age Group to a numeric value
consumer_data <- consumer_data %>%
  mutate(Age_Group_Num = case_when(
    Age_Group == "18-25" ~ 1,
    Age_Group == "25-35" ~ 2,
    Age_Group == "35-45" ~ 3,
    Age_Group == "45-55" ~ 4
  ))

# 3D Scatter Plot: Price vs. Rating vs. Age Group
scatter_plot <- plot_ly(consumer_data, x = ~Price, y = ~Rating, z = ~Age_Group_Num,
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 10, color = ~Rating, colorscale = 'Viridis', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Price, Rating, and Age Group",
         scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Rating (out of 5)'),
                      zaxis = list(title = 'Age Group (numeric)')))

# 3D Surface Plot: Rating vs. Price and Age Group
surface_plot <- plot_ly(consumer_data, x = ~Price, y = ~Age_Group_Num, z = ~Rating,
                        type = 'surface') %>%
  layout(title = "3D Surface Plot of Rating vs. Price and Age Group",
         scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Age Group (numeric)'),
                      zaxis = list(title = 'Rating (out of 5)')))

# 3D Scatter Plot: Rating vs. Price, colored by Age Group
scatter_plot_price_vs_rating <- plot_ly(consumer_data, x = ~Price, y = ~Rating, z = ~Age_Group_Num,
                                        type = 'scatter3d', mode = 'markers',
                                        marker = list(size = 10, color = ~Age_Group_Num, colorscale = 'Blues', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Rating vs. Price, colored by Age Group",
         scene = list(xaxis = list(title = 'Price ($)'),
                      yaxis = list(title = 'Rating (out of 5)'),
                      zaxis = list(title = 'Age Group (numeric)')))

# Print the plots
scatter_plot
surface_plot
scatter_plot_price_vs_rating
