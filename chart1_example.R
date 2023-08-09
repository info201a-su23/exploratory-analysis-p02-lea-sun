library(ggplot2)
library(dplyr)

Country <- c("United States", "Afghanistan")
Prevalence <- c(3.098053, 4.424521)

data <- data.frame(Country = Country, Prevalence = Prevalence)

chart1 <- ggplot(data, aes(x = Country, y = Prevalence, fill = Country, colour = Country )) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Country", y = "Prevalence of Depression (%)") +
  ggtitle("Comparison of Depression of the two Countries by age group 20-24 years") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(chart1)



  
  