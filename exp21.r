# Load necessary libraries
library(ggplot2)
library(reshape2)
library(plotly)

# Create the data frame
weather_data <- data.frame(
  Date = as.Date(c('2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05')),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  Wind_Speed = c(15, 12, 18, 20, 16)
)

# Question 1: Variation of temperature with humidity and wind speed
# Summary of data
print(weather_data)

# Question 2: Visualize the relationship between wind speed and humidity, considering temperature as the third dimension
plot1 <- ggplot(weather_data, aes(x = Wind_Speed, y = Humidity, color = Temperature)) +
  geom_point(size = 4) +
  labs(title = "Wind Speed vs Humidity with Temperature as Color", x = "Wind Speed (km/h)", y = "Humidity (%)") +
  scale_color_gradient(low = "blue", high = "red")
print(plot1)

# Convert to interactive plot
plotly::ggplotly(plot1)

# Question 3: Check for discernible patterns
cor(weather_data$Temperature, weather_data$Humidity)
cor(weather_data$Temperature, weather_data$Wind_Speed)

# Question 4: Create a 3D surface plot
# Preparing data for surface plot
surface_data <- expand.grid(
  Wind_Speed = seq(min(weather_data$Wind_Speed), max(weather_data$Wind_Speed), length.out = 100),
  Humidity = seq(min(weather_data$Humidity), max(weather_data$Humidity), length.out = 100)
)
surface_data$Temperature <- with(weather_data, 
                                  approx2(Wind_Speed, Humidity, Temperature, 
                                          xout = surface_data$Wind_Speed, 
                                          yout = surface_data$Humidity))

# Plotly 3D surface plot
plot2 <- plot_ly(surface_data, x = ~Wind_Speed, y = ~Humidity, z = ~Temperature, 
                 type = "surface") %>%
  layout(scene = list(
    xaxis = list(title = "Wind Speed (km/h)"),
    yaxis = list(title = "Humidity (%)"),
    zaxis = list(title = "Temperature (°C)"),
    title = "3D Surface Plot of Temperature with Wind Speed and Humidity"
  ))
print(plot2)

# Question 5: 3D plots of temperature against both humidity and wind speed separately
# Temperature vs Humidity 3D plot
plot3 <- plot_ly(weather_data, x = ~Humidity, y = ~Temperature, z = ~Wind_Speed, type = "scatter3d", mode = "markers") %>%
  layout(scene = list(
    xaxis = list(title = "Humidity (%)"),
    yaxis = list(title = "Temperature (°C)"),
    zaxis = list(title = "Wind Speed (km/h)"),
    title = "3D Scatter Plot: Temperature vs Humidity vs Wind Speed"
  ))
print(plot3)

# Temperature vs Wind Speed 3D plot
plot4 <- plot_ly(weather_data, x = ~Wind_Speed, y = ~Temperature, z = ~Humidity, type = "scatter3d", mode = "markers") %>%
  layout(scene = list(
    xaxis = list(title = "Wind Speed (km/h)"),
    yaxis = list(title = "Temperature (°C)"),
    zaxis = list(title = "Humidity (%)"),
    title = "3D Scatter Plot: Temperature vs Wind Speed vs Humidity"
  ))
print(plot4)

# Print the plots
print(plot2)
print(plot3)
print(plot4)
