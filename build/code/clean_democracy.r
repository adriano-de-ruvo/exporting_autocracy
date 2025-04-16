# Load required packages
library(dplyr)   # Package for data manipulation

# Read the raw democracy data
democracy_data <- read.csv("build/temp/raw_democracy_1900_2023.csv")

# Compute the number of democratization and autocratization episodes per year
democracy_data <- democracy_data %>%
  group_by(year) %>%
  summarise(
    dem_ep = sum(dem_ep, na.rm = TRUE),
    aut_ep = sum(aut_ep, na.rm = TRUE)
  )

# Save the processed data to a CSV file
write.csv(democracy_data, "build/output/democracy_data.csv", row.names = FALSE)
write.csv(democracy_data, "analysis/input/democracy_data.csv", row.names = FALSE)

# Clean up memory
rm(democracy_data)