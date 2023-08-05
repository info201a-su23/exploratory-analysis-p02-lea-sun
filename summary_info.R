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
age_group_cols <- dplyr::select(depressionrates, X20_24_years_old, 
                                X10_14_years_old, X70_years_old, 
                                X30_34_years_old, X15_19_years_old,
                                X25_29_years_old,  X50_69_years_old,
                                X15_49_years_old)

updated_col_names <- gsub("^X", "", names(age_group_cols))

names(age_group_cols) <- updated_col_names

highest_age_group <- age_group_cols%>%
  colMeans(na.rm = TRUE) %>%
  which.max() %>%
  names()

summary_info$highest_age_group_new <- gsub("_", " ", highest_age_group)




