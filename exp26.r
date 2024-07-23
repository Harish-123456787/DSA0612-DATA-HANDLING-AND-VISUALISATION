# Install necessary library if not already installed
install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Create the data frame
performance_data <- data.frame(
  Month = c("Jan", "Jan", "Jan", "Feb", "Feb", "Feb", "Mar", "Mar", "Mar"),
  Employee = c("A", "B", "C", "A", "B", "C", "A", "B", "C"),
  Score = c(85, 90, 78, 88, 92, 80, 90, 94, 82)
)

# Histogram plot
ggplot(performance_data, aes(x = Score, fill = Employee)) +
  geom_histogram(position = "dodge", binwidth = 2) +
  labs(title = "Monthly Performance Scores of Employees",
       x = "Performance Score",
       y = "Frequency",
       fill = "Employee") +
  theme_minimal() +
  scale_fill_manual(values = c("A" = "blue", "B" = "red", "C" = "green"))
