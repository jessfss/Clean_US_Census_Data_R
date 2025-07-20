# Cleaning US Census Data

# Load libraries
library(readr)
library(dplyr)
library(tidyr)

# Load CSV files matching pattern
files <- list.files(pattern = "states_.*csv")
df_list <- lapply(files, read_csv)
us_census <- bind_rows(df_list)

# Inspect data (optional)
colnames(us_census)
str(us_census)
head(us_census)

# Drop first meaningless column (assuming it's the first column)
us_census <- us_census %>% select(-X1)
head(us_census)

# Separate GenderPop column into male_pop and female_pop
us_census <- us_census %>%
  separate(GenderPop, c('male_pop', 'female_pop'), '_')
head(us_census)

# Clean race percentage columns, Income, male_pop, and female_pop
us_census <- us_census %>%
  mutate(across(c(Hispanic, White, Black, Native, Asian, Pacific),
                ~ as.numeric(gsub("%", "", trimws(.))) / 100),
         Income = as.numeric(gsub("\\$", "", trimws(Income))),
         male_pop = as.numeric(gsub("M", "", trimws(male_pop))),
         female_pop = as.numeric(gsub("F", "", trimws(female_pop)))
  )
head(us_census)

# Check for duplicate rows
us_census %>%
  duplicated() %>%
  table()

# Remove duplicate rows
us_census <- us_census %>%
  distinct()

# Confirm duplicates removed
us_census %>%
  duplicated() %>%
  table()

# Write cleaned data to CSV
write_csv(us_census, "us_census_cleaned.csv")

