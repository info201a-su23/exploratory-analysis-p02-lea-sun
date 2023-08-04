library(ggplot2)

x_values <- c('Children (3⁠–17 years)', 'Adults (18+ years)', 'Males (18+ years)', 'Females (18+ years)')
y_values <- c(3.2, 7.1, 5.3, 8.7)

ggplot() +
  geom_bar(aes(x = x_values, y = y_values), stat = 'identity', fill = 'blue') +
  labs(x = "Population", y = "Prevalence of Depression (%)") +
  ggtitle("Prevalence of Depression in Different Populations") +
  theme_minimal()
