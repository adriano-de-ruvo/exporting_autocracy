# Load required packages
library(dplyr)  # Package for data manipulation

# Read the democracy dataset
democracy_data <- read.csv("build/output/democracy_data.csv")
# Read the trade dataset
trade_data <- read.csv("build/temp/chn_trade_share.csv")

# Harmonize column names
trade_data <- trade_data %>%
  rename(year = period)

# Merge the two datasets:
trade_democracy_data <- trade_data %>%
  inner_join(democracy_data, by = "year") %>%
  select(year, trade_share, aut_ep)

# Save the processed data to a CSV file
write.csv(trade_democracy_data, "build/output/trade_democracy_data.csv", row.names = FALSE)
write.csv(trade_democracy_data, "analysis/input/trade_democracy_data.csv", row.names = FALSE)

# Clean up memory
rm(democracy_data, trade_data, trade_democracy_data)

