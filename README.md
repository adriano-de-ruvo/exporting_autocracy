# Exporting Autocracy

## Research Question
Over the past three decades, the world economy has witnessed the irresistible rise of China as a global trade power. Since opening up to foreign trade and implementing free-market reforms, China has moved rapidly from the periphery to the very top of the world trade hierarchy. [^1] China’s spectacular economic advancement and trade openness has not led to substantial changes in the structure of its domestic political regime, which has continued to take on the features of a solid autocracy. [^2]

During the same period of time, the wave of democratization that had swept the world since the end of the Cold War has lost momentum, leading many countries to slow down their democratization process or even recede into autocratic terrain. While being widespread, this trend is relatively new in recent history. In the past decade, for the first time since World War II, countries experiencing episodes of autocratization have persistently outnumbered those that were democratizing. Chinese trade expansion and the erosion of democracy have advanced hand in hand in the past decades, but are these phenomena related? Can China’s rise as a commercial superpower and autocratic outpost explain part of the ongoing democratic recession?

I would like to study whether China’s trade growth has contributed to the decline of democracy across the world. More generally, I aim to explore the possibility that trade, acting both as a shock to different institutional settings and as a source of integration among them, is able to influence their dynamics.

---

[^1]: According to the United Nations Conference on Trade and Development Statistics, China overtook the United States as the world’s largest trading nation in 2013 and has steadily ranked first and second in global shares of exports and imports, respectively, since 2009 ([UNCTAD 2020 Handbook](https://unctad.org)). According to IMF’s Direction of Trade Statistics database, as of 2018, almost two-thirds of world countries trade more with China than the United States ([IMF Statistics Department, 2010](https://data.imf.org)).

[^2]: The World Bank describes China’s growth as “the fastest sustained expansion by a major economy in history”. Between 1991 and 2020, real annual GDP growth averaged 9.3%. Freedom House’s 2022 country report continues to place China among the lowest ranks in terms of political rights and civil liberties, further stating that “China’s authoritarian regime has become increasingly repressive in recent years” ([Freedom House 2022](https://freedomhouse.org)).


## Project Structure

This repository contains a small preliminary exploration of the research question. Hopefully it can serve as a basis for future research. 

The project is organized into two main directories:

### 1. build

This directory contains code for data acquisition, cleaning, and preparation:

- **`code/`**: Scripts for data collection and processing
  - `build_main.r`: Constructs the datasets used for the analysis by running in sequence all the scripts in the build pipeline.
  - `download_trade.r`: Downloads international trade data using the UN Comtrade API. The required API token can be obtained [here](https://uncomtrade.org/docs/api-subscription-keys/). Follow the explanations and once you are signed up, select the `comtrade - v1` product, which is the free API
  - `download_democracy.r`: Downloads the Episodes of Regime Transformation (ERT) dataset from the [V-Dem Project](https://www.v-dem.net). No token is required. 
  - `clean_trade.r`: Processes trade data, creating the main measure of trade used in the analysis by averaging four flows: imports and exports reported by each country in a given country-pair
  - `clean_democracy.r`: Aggregates democratization and autocratization episodes by year
  - `merge_trade_democracy.r`: Combines democracy and trade datasets for analysis

- **`input/`**: Empty at the momennt since raw data sources are automatically downloaded
- **`output/`**: Processed datasets ready for analysis
- **`temp/`**: Temporary files generated during processing

### 2. analysis

This directory contains the code performing the analysis and visualization outputs:

- **`code/`**: Analysis and visualization scripts
  - `analysis_main.r`: Runs all analysis scripts
  - `figure_1.r`: Creates maps showing countries' trade relationships with China vs. USA
  - `figure_2.r`: Generates time trends of democratic and autocratic episodes over time
  - `figure_3.r`: Generates a plot showing the correlation of interest

- **`input/`**: Analysis-ready datasets (copied from build/output)
  - `chn_usa_trade_share.csv`: Comparison of country-level trade with China vs. USA relative to total trade
  - `democracy_data.csv`: Yearly counts of democratization and autocratization episodes
  - `trade_democracy_data.csv`: Combined dataset of trade and democratic indicators

- **`output/`**: Generated figures
  - `figure_1a.pdf` & `figure_1b.pdf`: Maps visualizing global trade relationships
  - `figure_2.pdf`: Visualization of democracy and autocracy trends over time
  - `figure_3.pdf`: Plot showing correlation between China's trade share and autocratization episodes

- **`temp/`**: Empty at the moment

## Data Flow

1. **Data Acquisition**: Raw data is downloaded by scripts in code
2. **Data Processing**: Raw data is cleaned and transformed into analysis-ready datasets
3. **Data Analysis**: Processed data is used to generate visualizations and insights
4. **Output Generation**: Final figures are saved to output

The project uses the renv package to manage dependencies. To reproduce this analysis, first activate the renv environment by running:

```r
source("renv/activate.R")
```

Then run the build and analysis pipelines:

```r
source("build/code/build_main.r")
source("analysis/code/analysis_main.r")

