# Install necessary libraries if not already installed
install.packages("plotly")
install.packages("dplyr")

# Load the libraries
library(plotly)
library(dplyr)

# Create the data frame
environmental_data <- data.frame(
  Location = c("A", "B", "C", "D", "E"),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2_Levels = c(400, 450, 420, 380, 430)
)

# 3D Scatter Plot: Temperature vs. Humidity vs. CO2 Levels
scatter_plot <- plot_ly(environmental_data, x = ~Temperature, y = ~Humidity, z = ~CO2_Levels,
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 10, color = ~CO2_Levels, colorscale = 'Viridis', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of CO2 Levels, Temperature, and Humidity",
         scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')))

# 3D Surface Plot: CO2 Levels vs. Temperature and Humidity
surface_plot <- plot_ly(environmental_data, x = ~Temperature, y = ~Humidity, z = ~CO2_Levels,
                        type = 'surface') %>%
  layout(title = "3D Surface Plot of CO2 Levels vs. Temperature and Humidity",
         scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'Humidity (%)'),
                      zaxis = list(title = 'CO2 Levels (ppm)')))

# 3D Scatter Plot: CO2 Levels vs. Temperature, colored by Humidity
scatter_plot_temp_vs_co2 <- plot_ly(environmental_data, x = ~Temperature, y = ~CO2_Levels, z = ~Humidity,
                                    type = 'scatter3d', mode = 'markers',
                                    marker = list(size = 10, color = ~Humidity, colorscale = 'Blues', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of CO2 Levels vs. Temperature, colored by Humidity",
         scene = list(xaxis = list(title = 'Temperature (°C)'),
                      yaxis = list(title = 'CO2 Levels (ppm)'),
                      zaxis = list(title = 'Humidity (%)')))

# 3D Scatter Plot: CO2 Levels vs. Humidity, colored by Temperature
scatter_plot_humidity_vs_co2 <- plot_ly(environmental_data, x = ~Humidity, y = ~CO2_Levels, z = ~Temperature,
                                        type = 'scatter3d', mode = 'markers',
                                        marker = list(size = 10, color = ~Temperature, colorscale = 'Reds', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of CO2 Levels vs. Humidity, colored by Temperature",
         scene = list(xaxis = list(title = 'Humidity (%)'),
                      yaxis = list(title = 'CO2 Levels (ppm)'),
                      zaxis = list(title = 'Temperature (°C)')))

# Print the plots
scatter_plot
surface_plot
scatter_plot_temp_vs_co2
scatter_plot_humidity_vs_co2
