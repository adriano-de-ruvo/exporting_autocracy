# Load required packages
library(ggplot2)           # Package for visualizations
library(dplyr)             # Package for data manipulation
library(sf)                # Package for working with spatial data in SF format
library(rnaturalearth)     # Package for accessing Natural Earth map data
library(rnaturalearthdata) # Package for additional Natural Earth datasets

# Read trade data from CSV file
trade_data <- read.csv("analysis/input/chn_usa_trade_share.csv")

# Load world map data and fix ISO codes for specific countries
world <- ne_countries(scale = "medium", returnclass = "sf") %>%
  mutate(iso_a3 = case_when(
    name == "France" ~ "FRA",  
    name == "Norway" ~ "NOR",  
    TRUE ~ iso_a3              
  ))

# Define a function to create trade visualization maps for each year
make_trade_plot <- function(year) {
  # Filter trade data for the specified year
  map_data_year <- trade_data %>%
    filter(period == year)

  # Merge world map data with trade data and categorize countries
  world_map <- world %>%
    # Merge map data with trade data using ISO codes
    left_join(map_data_year, by = c("iso_a3" = "reporter_iso")) %>%
    # Create a new variable indicating trade relationships
    mutate(
      trade_status = case_when(
        iso_a3 %in% c("USA", "CHN") ~ "self",     
        more_with_china == 1 ~ "China",           
        more_with_china == 0 ~ "USA",             
        TRUE ~ NA_character_                      
      )
    )

  # Create the map visualization
  ggplot(world_map %>% filter(name != "Antarctica")) +  
    
    geom_sf(aes(fill = trade_status), color = "white", size = 1) +
    
    scale_fill_manual(
      values = c("USA" = "blue", "China" = "red", "self" = "grey70"),  
      breaks = c("China", "USA"),                                       
      labels = c("China", "USA"),                                       
      name = NULL                                                       
    ) +
  
    theme_minimal(base_size = 10, base_family = "Helvetica") +
    
    theme(
      panel.background = element_rect(fill = "white", color = NA),     
      plot.background = element_rect(fill = "white", color = NA),      
      panel.grid = element_blank(),                                    
      axis.text = element_blank(),                                     
      axis.title = element_blank(),                                    
      axis.ticks = element_blank(),                                    
      legend.position = "bottom",                                      
      legend.title = element_blank(),                                  
      legend.text = element_text(size = 12),                           
      legend.key.size = unit(1, "cm"),                                 
      legend.spacing.x = unit(0.3, "cm"),                              
      plot.caption = element_blank(),                                  
      plot.title = element_blank()                                     
    )
}

# Create maps for years 2000 and 2020
figure_1a <- make_trade_plot(2000)
figure_1b <- make_trade_plot(2020)

# Display the maps
print(figure_1a)
print(figure_1b)

# Save figures as PDF and PNG files
ggsave("analysis/output/figure_1a.pdf", plot = figure_1a)
ggsave("analysis/output/figure_1b.pdf", plot = figure_1b)
ggsave("analysis/output/figure_1a.png", plot = figure_1a)
ggsave("analysis/output/figure_1b.png", plot = figure_1b)


