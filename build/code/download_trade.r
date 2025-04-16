# Load required packages
library(comtradr)  # Package to interface with UN Comtrade API
library(dplyr)     # Package for data manipulation

# Set your Comtrade API key for authentication
set_primary_comtrade_key("6f7b408dc2f44a9e918fd59655391f8a")

# Create an empty list to store trade data for each year
trade_2000_2023 <- list()

# Loop through years 2000 to 2023
for (year in 2000:2023) {
  # Display progress message for current year
  cat("Downloading trade data for year:", year, "\n")
  
  # Download trade data from Comtrade API for current year
  yearly_data <- ct_get_data(
    type = "goods",                                 # Get goods trade (not services)
    frequency = "A",                                # Annual data
    commodity_classification = "HS",                # Harmonized System classification
    commodity_code = "TOTAL",                       # Get total trade (all commodities)
    flow_direction = c("Import", "Export"),         # Get both import and export flows ()
    reporter = "all_countries",                     # Data for all reporting countries
    partner = "all_countries",                      # Data for all partner countries
    start_date = year,                              # Start of time period (current year in loop)
    end_date = year,                                # End of time period (same as start)
    process = TRUE,                                 # Process API response data
    tidy_cols = TRUE,                               # Clean column names
    verbose = FALSE,                                # Suppress detailed messages
    primary_token = get_primary_comtrade_key(),     # Use the API key set earlier
    mode_of_transport = "TOTAL modes of transport", # Include all transport modes
    partner_2 = "World",                            # Include world as partner
    customs_code = "C00",                           # Standard customs procedure code
    update = FALSE,                                 # Don't update existing data
    #requests_per_second = 10/60,                   # Rate limit ()
    extra_params = NULL,                            # No extra parameters
    cache = FALSE                                   # Don't cache results
  )
  
  # Store the yearly data in the list, using year as the key
  trade_2000_2023[[as.character(year)]] <- yearly_data
}

# Combine all yearly data frames into a single data frame
raw_trade_data_2000_2023 <- bind_rows(trade_2000_2023)

# Select only the columns of interest from the combined data
raw_trade_data_2000_2023 <- raw_trade_data_2000_2023 %>%
  select(period, reporter_code, reporter_iso, reporter_desc, 
  flow_desc, partner_code, partner_iso, partner_desc, primary_value)

# Save the processed data to a CSV file
write.csv(raw_trade_data_2000_2023, "build/temp/raw_trade_data_2000_2023.csv", row.names = FALSE)

# Clean up memory
rm(year, yearly_data, trade_2000_2023, raw_trade_data_2000_2023)



