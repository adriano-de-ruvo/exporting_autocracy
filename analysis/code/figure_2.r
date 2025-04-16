# Load required packages
library(ggplot2) # Package visualizations

# Read the processed democracy data
democracy_data <- read.csv("analysis/input/democracy_data.csv")

# Create a line plot showing trends in democratic and autocratic episodes over time
figure_2 <- ggplot(democracy_data, aes(x = year)) +
  geom_line(aes(y = dem_ep, color = "Democratization")) +
  geom_line(aes(y = aut_ep, color = "Autocratization")) +
  labs(x = "Year", y = "Number of countries", color = NULL) +
  scale_x_continuous(breaks = seq(1900, 2025, by = 20)) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    legend.text = element_text(size = 14),       # Increase legend text size
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),  # Increase x-axis label size
    axis.title.y = element_text(size = 16, margin = margin(r = 10)),  # Increase y-axis label size
    axis.text = element_text(size = 12)          # Increase axis tick labels
  )

# Save the plot as PDF and PNG file
ggsave("analysis/output/figure_2.pdf", plot = figure_2)
ggsave("analysis/output/figure_2.png", plot = figure_2)
