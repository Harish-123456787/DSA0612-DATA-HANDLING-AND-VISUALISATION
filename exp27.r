# Install necessary libraries if not already installed
install.packages("plotly")

# Load the plotly library
library(plotly)

# Create the data frame
financial_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  Stock_Price = c(100, 102, 98, 105, 108),
  Volume_Traded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  Market_Cap = c(500, 510, 490, 525, 540)
)

# 3D Scatter Plot: Volume Traded vs. Market Cap vs. Stock Price
scatter_plot <- plot_ly(financial_data, x = ~Volume_Traded, y = ~Market_Cap, z = ~Stock_Price, 
                        type = 'scatter3d', mode = 'markers', 
                        marker = list(size = 5, color = ~Stock_Price, colorscale = 'Viridis', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Stock Price, Volume Traded, and Market Cap",
         scene = list(xaxis = list(title = 'Volume Traded'),
                      yaxis = list(title = 'Market Cap'),
                      zaxis = list(title = 'Stock Price')))

# 3D Surface Plot: Market Cap vs. Stock Price and Volume Traded
surface_plot <- plot_ly(financial_data, x = ~Stock_Price, y = ~Volume_Traded, z = ~Market_Cap, 
                        type = 'surface') %>%
  layout(title = "3D Surface Plot of Market Cap vs. Stock Price and Volume Traded",
         scene = list(xaxis = list(title = 'Stock Price'),
                      yaxis = list(title = 'Volume Traded'),
                      zaxis = list(title = 'Market Cap')))

# 3D Scatter Plot: Stock Price vs. Volume Traded vs. Market Cap
scatter_plot_price_vs_volume <- plot_ly(financial_data, x = ~Volume_Traded, y = ~Stock_Price, z = ~Market_Cap, 
                                        type = 'scatter3d', mode = 'markers', 
                                        marker = list(size = 5, color = ~Market_Cap, colorscale = 'Blues', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Stock Price vs. Volume Traded",
         scene = list(xaxis = list(title = 'Volume Traded'),
                      yaxis = list(title = 'Stock Price'),
                      zaxis = list(title = 'Market Cap')))

# 3D Scatter Plot: Stock Price vs. Market Cap vs. Volume Traded
scatter_plot_price_vs_cap <- plot_ly(financial_data, x = ~Market_Cap, y = ~Stock_Price, z = ~Volume_Traded, 
                                      type = 'scatter3d', mode = 'markers', 
                                      marker = list(size = 5, color = ~Volume_Traded, colorscale = 'Reds', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Stock Price vs. Market Cap",
         scene = list(xaxis = list(title = 'Market Cap'),
                      yaxis = list(title = 'Stock Price'),
                      zaxis = list(title = 'Volume Traded')))

# Print the plots
scatter_plot
surface_plot
scatter_plot_price_vs_volume
scatter_plot_price_vs_cap
