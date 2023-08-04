# File that groups data by country, finds the mean depression of each country,
# and sorts the table in descending order based on the mean depression rate.
library(dplyr)

# Group the data by country and calculate the mean depression rate for each
country_means <- depressionrates %>%
  group_by(entity) %>% 
  summarise(mean_depression_rate = mean(all_ages, na.rm = TRUE)) %>%
  mutate(mean_depression_rate = round(mean_depression_rate, 2))

# Rename the columns
colnames(country_means) <- c("Country", "Mean Depression Rate")

# Sort mean rates in descending order
country_means <- country_means %>%
  arrange(desc(`Mean Depression Rate`))


