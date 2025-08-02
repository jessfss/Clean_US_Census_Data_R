# Cleaning US Census Data with R

This project demonstrates how to clean and prepare U.S. census data using R for further analysis. It involves importing, merging, transforming, and cleaning multiple `.csv` files containing demographic and income data.

This exercise was adapted from a Codecademy project on learning R. Full credit goes to [Codecademy](https://www.codecademy.com/) for the original structure and dataset.

## Overview

As a new data analyst at the Census Bureau, you're tasked with consolidating and cleaning fragmented state-level census data files into a single, analyzable dataset.

## Key Tasks

- **Import multiple CSV files** using `readr`, `dplyr`, and `tidyr`
- **Merge datasets** into one unified data frame using `bind_rows()`
- **Clean columns** by:
  - Removing symbols like `%` and `$`
  - Splitting composite columns (e.g., `GenderPop`)
  - Removing unwanted characters (`M`, `F`)
- **Convert data types** from character to numeric
- **Normalize percentage columns** to decimal format
- **Remove duplicate rows** using `distinct()`

## Requirements

- R
- R packages:
  - `readr`
  - `dplyr`
  - `tidyr`

## How to Run

1. Place all `states_*.csv` files in your working directory.
2. Open and run the corresponding R script.
3. Follow the logical cleaning steps outlined to transform the raw census data into a clean `us_census` data frame.

## Data Output

The final output is a cleaned and deduplicated data frame `us_census`, ready for statistical analysis or visualization.

To save the cleaned us_census data frame into a single CSV file in R, you can use the write_csv() function from the readr package (or write.csv() from base R).

Here’s how to do it with readr 

write_csv(us_census, "us_census_cleaned.csv")



