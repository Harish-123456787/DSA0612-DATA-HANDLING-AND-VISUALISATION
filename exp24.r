# Install necessary libraries if not already installed
install.packages("ggplot2")
install.packages("reshape2")

# Load the libraries
library(ggplot2)
library(reshape2)

# Create the data frame
sales_data <- data.frame(
  Month = factor(c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'),
                 levels = c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov')),
  Product_A_Sales = c(500, 600, 700, 800, 750, 850, 900, 950, 1000, 1050, 1100),
  Product_B_Sales = c(300, 320, 350, 400, 420, 450, 480, 500, 550, 580, 600),
  Product_C_Sales = c(200, 250, 300, 350, 400, 420, 450, 470, 500, 530, 550)
)

# Melt the data for plotting
sales_data_melted <- melt(sales_data, id.vars = "Month", 
                          variable.name = "Product", 
                          value.name = "Sales")

# Rename the products for better readability
sales_data_melted$Product <- factor(sales_data_melted$Product, 
                                    levels = c("Product_A_Sales", "Product_B_Sales", "Product_C_Sales"),
                                    labels = c("Product A", "Product B", "Product C"))

# Violin plot
ggplot(sales_data_melted, aes(x = Product, y = Sales, fill = Product)) +
  geom_violin(trim = FALSE) +
  geom_jitter(width = 0.1) +
  labs(title = "Sales Performance of Products Over a Year",
       x = "Product",
       y = "Sales") +
  theme_minimal() +
  scale_fill_manual(values = c("Product A" = "blue", "Product B" = "red", "Product C" = "green"))
