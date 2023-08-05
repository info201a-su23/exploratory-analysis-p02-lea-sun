library(ggplot2)

disorders <- c("Schizophrenia", "Depressive Disorder", "Anxiety Disorder", "Bipolar Disorder", "Eating Disorders")
prevalence <- c(0.3, 3.4, 3.8, 0.5, 0.2)

data <- data.frame(Disorder = disorders, Prevalence = prevalence)

ggplot(data, aes(x = Disorder, y = Prevalence, fill = Disorder)) +
  geom_bar(stat = "identity") +
  labs(x = "Mental Health Disorders", y = "Prevalence (%)") +
  ggtitle("Prevalence of Mental Health Disorders Worldwide") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
