# Install the necessary library if not already installed
install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Create the data frame
temperature_data <- data.frame(
  Week = as.Date(c('2023-01-01', '2023-01-01', '2023-01-01', 
                   '2023-01-08', '2023-01-08', '2023-01-08', 
                   '2023-01-15', '2023-01-15', '2023-01-15')),
  City = c('New York', 'Los Angeles', 'Chicago',
           'New York', 'Los Angeles', 'Chicago',
           'New York', 'Los Angeles', 'Chicago'),
  Average_Temperature = c(-2, 15, -5, 0, 17, -3, 2, 18, -2)
)

# Plotting the line plot
ggplot(temperature_data, aes(x = Week, y = Average_Temperature, color = City, group = City)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Weekly Average Temperature Comparison",
       x = "Week",
       y = "Average Temperature (°C)") +
  theme_minimal() +
  scale_x_date(date_labels = "%b %d, %Y", date_breaks = "1 week") +
  scale_color_manual(values = c("New York" = "blue", "Los Angeles" = "red", "Chicago" = "green"))
