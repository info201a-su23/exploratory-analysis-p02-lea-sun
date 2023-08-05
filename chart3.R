install.packages("ggplot2")
library("ggplot2")
install.packages("tidyverse")
library("tidyverse")
install.packages("dplyr")
library("dplyr")

depression_rates_file <- read.csv("/Users/Susruthi/OneDrive/Desktop/depressionrates.csv")

usa_data <- depression_rates_file %>%
  dplyr::filter(entity == "United States")

usa_depression_rates <- usa_data %>%
  pivot_longer(cols = c("X10_14_years_old", "X15_19_years_old", "X20_24_years_old", "X25_29_years_old", "X30_34_years_old"),
               names_to = "AgeGroup", values_to = "DepressionRate")

usa_depression_rates %>%
  ggplot(aes(x = year, y = DepressionRate, color = AgeGroup)) + 
  geom_line() + 
  labs(title = "Depression Rates in the United States by Age Group Throughout the Years",
       x = "Year",
       y = "Depression Rate Percentage",
       color = "Age Group") + 
  scale_color_discrete(labels = c("X10_14_years_old" = "10-14 years old",
                                  "X15_19_years_old" = "15-19 years old",
                                  "X20_24_years_old" = "20-24 years old",
                                  "X25_29_years_old" = "25-29 years old",
                                  "X30_34_years_old" = "30-34 years old")) + 
  theme_minimal()
