# Load required libraries
library(dplyr)
library(tidyr)

# Read the raw trade data CSV file
trade_data <- read.csv("build/temp/raw_trade_data_2000_2023.csv")

# Step 1: Create symmetric trade pairs to ensure bidirectional analysis
trade_data <- trade_data %>%
  # Create unique country pairs regardless of reporter/partner order
  mutate(
    iso_min = pmin(reporter_iso, partner_iso),
    iso_max = pmax(reporter_iso, partner_iso),
    desc_min = ifelse(reporter_iso == iso_min, reporter_desc, partner_desc),
    desc_max = ifelse(reporter_iso == iso_max, reporter_desc, partner_desc),
    pair_id = paste0(iso_min, "_", iso_max)
  ) %>%
  # Average trade values for same country pairs
  group_by(pair_id, period, iso_min, desc_min, iso_max, desc_max) %>%
  summarise(trade = mean(primary_value), .groups = "drop")

# Step 2: Create a bidirectional dataset for all country pairs
trade_data <- trade_data %>%
  # Create records with min country as reporter
  mutate(
    reporter_iso = iso_min,
    reporter_desc = desc_min,
    partner_iso = iso_max,
    partner_desc = desc_max
  ) %>%
  select(period, reporter_iso, reporter_desc, partner_iso, partner_desc, trade) %>%
  # Add records with max country as reporter
  bind_rows(
    trade_data %>%
      mutate(
        reporter_iso = iso_max,
        reporter_desc = desc_max,
        partner_iso = iso_min,
        partner_desc = desc_min
      ) %>%
      select(period, reporter_iso, reporter_desc, partner_iso, partner_desc, trade)
  )

# Step 3: Calculate China vs USA trade share comparisons for 2000 and 2020
chn_usa_trade_share <- trade_data %>%
  # Calculate each country's share of a reporter's total trade
  group_by(reporter_iso, period) %>%
  mutate(
    trade_total = sum(trade, na.rm = TRUE),
    trade_share = trade / trade_total
  ) %>%
  ungroup() %>%
  # Filter only for USA and China partners in 2000 and 2020
  filter(
    partner_iso %in% c("USA", "CHN"),
    period %in% c(2000, 2020)
  ) %>%
  # Calculate mean trade share by reporter, period and partner
  group_by(period, reporter_iso, reporter_desc, partner_iso) %>%
  summarise(trade_share = mean(trade_share, na.rm = TRUE), .groups = "drop") %>%
  # Reshape to wide format to compare USA vs China directly
  pivot_wider(
    names_from = partner_iso,
    values_from = trade_share,
    names_prefix = "share_"
  ) %>%
  # Flag countries trading more with China than USA
  mutate(
    more_with_china = ifelse(share_CHN > share_USA, 1, 0)
  )

# Save the China vs USA comparison data
write.csv(chn_usa_trade_share, "build/output/chn_usa_trade_share.csv", row.names = FALSE)
write.csv(chn_usa_trade_share, "analysis/input/chn_usa_trade_share.csv", row.names = FALSE)

# Step 4: Calculate China's global trade share over time
chn_trade_share <- trade_data %>%
  # Sum trade by reporter and period
  group_by(period, reporter_iso, reporter_desc) %>%
  summarise(trade = sum(trade, na.rm = TRUE), .groups = "drop") %>%
  # Calculate total global trade by period
  group_by(period) %>%
  mutate(total_trade = sum(trade, na.rm = TRUE)) %>%
  ungroup() %>%
  # Calculate China's share of global trade
  mutate(trade_share = trade / total_trade) %>%
  filter(reporter_iso == "CHN")

# Save China's global trade share data
write.csv(chn_trade_share, "build/temp/chn_trade_share.csv", row.names = FALSE) 

# Clean up environment
rm(trade_data, chn_usa_trade_share, chn_trade_share)


