# Exporting Autocracy

## Research Question
Chinese Trade Expansion and Democratic Retreat
![Panel A: Historical Trends](analysis/output/figure_2.pdf)
![Panel B: Recent Correlation](analysis/output/figure_3.pdf)

Over the past three decades, the world economy has witnessed the irresistible rise of China as a global trade power. Since opening up to foreign trade and implementing free-market reforms, China has moved rapidly from the periphery to the very top of the world trade hierarchy. [^1] China’s spectacular economic advancement and trade openness has not led to substantial changes in the structure of its domestic political regime, which has continued to take on the features of a solid autocracy. [^2]

During the same period of time, the wave of democratization that had swept the world since the end of the Cold War has lost momentum, leading many countries to slow down their democratization process or even recede into autocratic terrain. While being widespread, this trend is relatively new in recent history. In the past decade, for the first time since World War II, countries experiencing episodes of autocratization have persistently outnumbered those that were democratizing (see Panel A above). As shown in Panel B above, Chinese trade expansion and the erosion of democracy have advanced hand in hand in the past decades, but are these phenomena related? Can China’s rise as a commercial superpower and autocratic outpost explain part of the ongoing democratic recession?

I would like to study whether China’s trade growth has contributed to the decline of democracy across the world. More generally, I aim to explore the possibility that trade, acting both as a shock to different institutional settings and as a source of integration among them, is able to influence their dynamics.

---

[^1]: According to the United Nations Conference on Trade and Development Statistics, China overtook the United States as the world’s largest trading nation in 2013 and has steadily ranked first and second in global shares of exports and imports, respectively, since 2009 ([UNCTAD 2020 Handbook](https://unctad.org)). According to IMF’s Direction of Trade Statistics database, as of 2018, almost two-thirds of world countries trade more with China than the United States ([IMF Statistics Department, 2010](https://data.imf.org)).

[^2]: The World Bank describes China’s growth as “the fastest sustained expansion by a major economy in history”. Between 1991 and 2020, real annual GDP growth averaged 9.3%. Freedom House’s 2022 country report continues to place China among the lowest ranks in terms of political rights and civil liberties, further stating that “China’s authoritarian regime has become increasingly repressive in recent years” ([Freedom House 2022](https://freedomhouse.org)).




Over the past three decades, the world economy has witnessed the irresistible rise of China as a global trade power. Since opening up to foreign trade and implementing free-market reforms, China has moved rapidly from the periphery to the very top of the world trade hierarchy.1 China’s spectacular economic advancement and trade openness has not led to substantial changes in the structure of its domestic political regime, which has continued to take on the features of a solid autocracy.2

During the same period of time, the wave of democratization that had swept the world since the end of the Cold War, has lost momentum, leading many countries to slow down their democratization process or even recede into autocratic terrain. While being widespread, this trend is relatively new in recent history. In the past decade, for the first time since World War II, countries experiencing episodes of autocratization have persistently outnumbered those that were democratizing (see Panel A above). As shown in Panel B above, Chinese trade expansion and the erosion of democracy have advanced hand in hand in the past decades, but are these phenomena related? Can China’s rise as a commercial superpower and autocratic outpost explain part of the ongoing democratic recession?

I would like to study whether China’s trade growth has contributed to the decline of democracy across the world. More generally, I aim to explore the possibility that trade, acting both as a shock to different institutional settings and as a source of integration among them, is able to influence their dynamics.






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