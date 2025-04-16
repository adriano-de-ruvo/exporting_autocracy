# Load required packages
library(ggplot2)  # Package visualizations

# Read the dataset containing China's trade share and autocratization episodes
trade_democracy_data <- read.csv("analysis/input/trade_democracy_data.csv")

# Calculate a scaling factor to plot two variables with different units on the same graph
scale_factor <- mean(trade_democracy_data$trade_share, na.rm = TRUE) / 
                mean(trade_democracy_data$aut_ep, na.rm = TRUE)

# Create a time series plot with dual y-axes
figure_3 <- ggplot(trade_democracy_data, aes(x = year)) +
  geom_line(aes(y = trade_share, color = "China's share of global trade"), linewidth = 0.5) +
  geom_line(aes(y = aut_ep * scale_factor, color = "Number of countries in autocratization episodes"), 
            linewidth = 0.5) +
  scale_y_continuous(
    name = "China's share of global trade",
    sec.axis = sec_axis(~ . / scale_factor, name = "Number of countries experiencing autocratization episodes")
  ) +
  labs(x = "Year", color = NULL) +
  theme_minimal() +
  theme(
    axis.title.y.left = element_text(size = 16, margin = margin(r = 10)),
    axis.title.y.right = element_text(size = 12, margin = margin(l = 10)),
    axis.title.x = element_text(size = 16, margin = margin(t = 10)),
    axis.text = element_text(size = 12),
    legend.text = element_text(size = 14),
    legend.position = "bottom"
  )

# Save the plot as a PDF and PNG file
ggsave("analysis/output/figure_3.pdf", plot = figure_3)
ggsave("analysis/output/figure_3.png", plot = figure_3)

