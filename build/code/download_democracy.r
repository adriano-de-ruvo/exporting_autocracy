# Load required packages
library(ERT)     # Package containing the Episodes of Regime Transformation (ERT) dataset
library(dplyr)   # Package for data manipulation

# Access the ERT dataset 
raw_democracy_1900_2023 <- episodes

# Select the relevant variables and filter years
raw_democracy_1900_2023 <- raw_democracy_1900_2023 %>%
  select(country_text_id, year, dem_ep, aut_ep) %>%
  filter(year <= 2023)
  
# Save the processed data to a CSV file
write.csv(raw_democracy_1900_2023, "build/temp/raw_democracy_1900_2023.csv", row.names = FALSE)

# Clean up memory
rm(raw_democracy_1900_2023)


