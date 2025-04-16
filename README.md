# Exporting Autocracy
Can China's rise as a commercial superpower and autocratic outpost explain part of the ongoing democratic recession?

This repository contains a comprehensive research project analyzing the relationship between China's rise as a commercial superpower and trends in global democratization/autocratization episodes.

## Project Structure

The project is organized into three main directories:

### 1. build

This directory contains code for data acquisition, cleaning, and preparation:

- **`code/`**: Scripts for data collection and processing
  - `build_main.r`: Orchestrates the build pipeline by running all scripts in sequence
  - `download_trade.r`: Downloads international trade data (2000-2023) using API calls
  - `download_democracy.r`: Retrieves Episodes of Regime Transformation (ERT) dataset
  - `clean_trade.r`: Processes trade data, creates symmetric trade pairs, and produces China-US trade share metrics
  - `clean_democracy.r`: Aggregates democratization and autocratization episodes by year
  - `merge_trade_democracy.r`: Combines democracy and trade datasets for analysis

- **`input/`**: Raw input data (populated by download scripts)
- **`output/`**: Processed datasets ready for analysis
- **`temp/`**: Temporary files generated during processing

### 2. analysis

This directory contains analytical code and visualization outputs:

- **`code/`**: Analysis and visualization scripts
  - `analysis_main.r`: Orchestrates all analysis scripts
  - `figure_1.r`: Creates maps showing countries' trade relationships with China vs. USA
  - `figure_2.r`: Generates trend lines of democratic and autocratic episodes over time
  - `figure_3.r`: Creates a dual-axis plot combining China's trade share and autocratization trends

- **`input/`**: Analysis-ready datasets (copied from build/output)
  - `chn_usa_trade_share.csv`: Comparison of country-level trade with China vs. USA
  - `democracy_data.csv`: Yearly counts of democratization and autocratization episodes
  - `trade_democracy_data.csv`: Combined dataset of trade and democratic indicators

- **`output/`**: Generated figures
  - `figure_1a.pdf` & `figure_1b.pdf`: Maps visualizing global trade relationships
  - `figure_2.pdf`: Visualization of democracy and autocracy trends over time
  - `figure_3.pdf`: Dual-axis plot showing relationship between China's trade share and autocratization episodes

- **`temp/`**: Temporary files generated during analysis

### 3. renv

Environment management using the renv package to ensure reproducibility:

- `.gitignore`: Specifies files to be ignored by git
- activate.R: Script to set up the R environment with required packages
- `settings.json`: Configuration for the renv environment
- `library/`: Contains installed R packages specific to this project
- `staging/`: Temporary staging area for package installations

## Key Files

- README.md: Project overview and documentation
- renv.lock: Tracks exact package versions for reproducibility
- LICENSE: Project license

## Data Flow

1. **Data Acquisition**: Raw data is downloaded by scripts in code
2. **Data Processing**: Raw data is cleaned and transformed into analysis-ready datasets
3. **Data Analysis**: Processed data is used to generate visualizations and insights
4. **Output Generation**: Final figures are saved to output

## Research Question

This project examines whether China's growing global trade influence correlates with increases in autocratization episodes worldwide, potentially contributing to what scholars have termed the "democratic recession."

## Dependencies

The project uses the renv package to manage dependencies. Key packages include:
- `dplyr` and `tidyr` for data manipulation
- `ggplot2` for visualization
- `sf`, `rnaturalearth`, and `rnaturalearthdata` for geographical mapping
- `ERT` for accessing the Episodes of Regime Transformation dataset

To reproduce this analysis, first activate the renv environment by running:

```r
source("renv/activate.R")
```

Then run the build and analysis pipelines:

```r
source("build/code/build_main.r")
source("analysis/code/analysis_main.r")


adriano-de-ruvo: Please write it in markdown so I can copy it in the README.md file

GitHub Copilot: # Exporting Autocracy

Can China's rise as a commercial superpower and autocratic outpost explain part of the ongoing democratic recession?

## Project Structure

This repository contains a comprehensive research project analyzing the relationship between China's rise as a commercial superpower and trends in global democratization/autocratization episodes.

### 1. build

This directory contains code for data acquisition, cleaning, and preparation:

- **`code/`**: Scripts for data collection and processing
  - `build_main.r`: Orchestrates the build pipeline by running all scripts in sequence
  - `download_trade.r`: Downloads international trade data (2000-2023) using API calls
  - `download_democracy.r`: Retrieves Episodes of Regime Transformation (ERT) dataset
  - `clean_trade.r`: Processes trade data, creates symmetric trade pairs, and produces China-US trade share metrics
  - `clean_democracy.r`: Aggregates democratization and autocratization episodes by year
  - `merge_trade_democracy.r`: Combines democracy and trade datasets for analysis

- **`input/`**: Raw input data (populated by download scripts)
- **`output/`**: Processed datasets ready for analysis
- **`temp/`**: Temporary files generated during processing

### 2. analysis

This directory contains analytical code and visualization outputs:

- **`code/`**: Analysis and visualization scripts
  - `analysis_main.r`: Orchestrates all analysis scripts
  - `figure_1.r`: Creates maps showing countries' trade relationships with China vs. USA
  - `figure_2.r`: Generates trend lines of democratic and autocratic episodes over time
  - `figure_3.r`: Creates a dual-axis plot combining China's trade share and autocratization trends

- **`input/`**: Analysis-ready datasets (copied from build/output)
  - `chn_usa_trade_share.csv`: Comparison of country-level trade with China vs. USA
  - `democracy_data.csv`: Yearly counts of democratization and autocratization episodes
  - `trade_democracy_data.csv`: Combined dataset of trade and democratic indicators

- **`output/`**: Generated figures
  - `figure_1a.pdf` & `figure_1b.pdf`: Maps visualizing global trade relationships
  - `figure_2.pdf`: Visualization of democracy and autocracy trends over time
  - `figure_3.pdf`: Dual-axis plot showing relationship between China's trade share and autocratization episodes

- **`temp/`**: Temporary files generated during analysis

### 3. renv

Environment management using the renv package to ensure reproducibility:

- `.gitignore`: Specifies files to be ignored by git
- `activate.R`: Script to set up the R environment with required packages
- `settings.json`: Configuration for the renv environment
- `library/`: Contains installed R packages specific to this project
- `staging/`: Temporary staging area for package installations

## Data Flow

1. **Data Acquisition**: Raw data is downloaded by scripts in code
2. **Data Processing**: Raw data is cleaned and transformed into analysis-ready datasets
3. **Data Analysis**: Processed data is used to generate visualizations and insights
4. **Output Generation**: Final figures are saved to output

## Research Question

This project examines whether China's growing global trade influence correlates with increases in autocratization episodes worldwide, potentially contributing to what scholars have termed the "democratic recession."

## Dependencies

The project uses the renv package to manage dependencies. Key packages include:
- `dplyr` and `tidyr` for data manipulation
- `ggplot2` for visualization
- `sf`, `rnaturalearth`, and `rnaturalearthdata` for geographical mapping
- `ERT` for accessing the Episodes of Regime Transformation dataset

To reproduce this analysis, first activate the renv environment by running:

```r
source("renv/activate.R")
```

Then run the build and analysis pipelines:

```r
source("build/code/build_main.r")
source("analysis/code/analysis_main.r")
