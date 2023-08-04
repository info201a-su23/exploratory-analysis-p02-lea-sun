# File that computes 5 pertinent and meaningful values from
# mental health dataset
# A function that takes in a dataset and returns a list of info about it:
library(tidyverse)
library(stringr)

summary_info <- list()

# Find number of unique locations
summary_info$num_unique_locations <- depressionrates %>%
  pull(entity) %>%
  unique() %>%
  length()

# Find range of years in dataset
summary_info$year_range <- depressionrates %>%
  pull(year) %>%
  range(na.rm=TRUE) %>%
  paste(collapse = "-")

# Find range of ages in dataset
summary_info$age_range <- depressionrates %>%
  names() %>%
  str_extract("\\d+") %>%
  as.numeric() %>%
  range(na.rm = TRUE) %>%
  paste(collapse = "-")

# Find location with highest proportion of depression across all ages
highest_rate <- depressionrates %>%
  pull(all_ages) %>%
  max() 

summary_info$highest_rate_location <- depressionrates %>%
  filter(highest_rate==all_ages) %>%
  pull(entity)

# Find age group with highest proportion of depression
summary_info$highest_age_group <- depressionrates %>%
  select(matches("^\\d")) %>%
  colMeans(na.rm = TRUE) %>%
  which.max() %>%
  names()

summary_info$highest_age_group <- gsub("_", " ",summary_info$highest_age_group)


