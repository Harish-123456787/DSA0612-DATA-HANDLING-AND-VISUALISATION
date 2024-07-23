# Install necessary libraries if not already installed
install.packages("plotly")
install.packages("dplyr")

# Load the libraries
library(plotly)
library(dplyr)

# Create the data frame
academic_data <- data.frame(
  Student = c("A", "B", "C", "D", "E"),
  Math_Score = c(85, 72, 90, 78, 88),
  Science_Score = c(78, 85, 80, 75, 82),
  Attendance = c(95, 92, 98, 85, 93)
)

# 3D Scatter Plot: Math Score vs. Science Score vs. Attendance
scatter_plot <- plot_ly(academic_data, x = ~Math_Score, y = ~Science_Score, z = ~Attendance,
                        type = 'scatter3d', mode = 'markers',
                        marker = list(size = 10, color = ~Attendance, colorscale = 'Viridis', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Science Score, Math Score, and Attendance",
         scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Attendance (%)')))

# 3D Surface Plot: Science Score vs. Math Score and Attendance
surface_plot <- plot_ly(academic_data, x = ~Math_Score, y = ~Attendance, z = ~Science_Score,
                        type = 'surface') %>%
  layout(title = "3D Surface Plot of Science Score vs. Math Score and Attendance",
         scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Attendance (%)'),
                      zaxis = list(title = 'Science Score')))

# 3D Scatter Plot: Science Score vs. Math Score, colored by Attendance
scatter_plot_math_vs_science <- plot_ly(academic_data, x = ~Math_Score, y = ~Science_Score, z = ~Attendance,
                                        type = 'scatter3d', mode = 'markers',
                                        marker = list(size = 10, color = ~Attendance, colorscale = 'Blues', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Science Score vs. Math Score, colored by Attendance",
         scene = list(xaxis = list(title = 'Math Score'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Attendance (%)')))

# 3D Scatter Plot: Science Score vs. Attendance, colored by Math Score
scatter_plot_attendance_vs_science <- plot_ly(academic_data, x = ~Attendance, y = ~Science_Score, z = ~Math_Score,
                                              type = 'scatter3d', mode = 'markers',
                                              marker = list(size = 10, color = ~Math_Score, colorscale = 'Reds', showscale = TRUE)) %>%
  layout(title = "3D Scatter Plot of Science Score vs. Attendance, colored by Math Score",
         scene = list(xaxis = list(title = 'Attendance (%)'),
                      yaxis = list(title = 'Science Score'),
                      zaxis = list(title = 'Math Score')))

# Print the plots
scatter_plot
surface_plot
scatter_plot_math_vs_science
scatter_plot_attendance_vs_science
