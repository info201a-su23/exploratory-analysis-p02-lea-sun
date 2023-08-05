library(ggplot2)

countries <- c("United States", "Albania", "Thailand", "Algeria", "Paraguay", "Guam")
prevalence <- c(5.09, 2.61, 3.81, 3.69, 2.84, 3.65)

data <- data.frame(Country = countries, Prevalence = prevalence)

ggplot(data, aes(x = Country, y = Prevalence, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(x = "Country", y = "Prevalence of Depression (%)") +
  ggtitle("Prevalence of Depression in Different Countries (2017)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
