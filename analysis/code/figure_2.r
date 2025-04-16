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
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )

# Save the plot as a PDF file
ggsave("analysis/output/figure_2.pdf", plot = figure_2)



