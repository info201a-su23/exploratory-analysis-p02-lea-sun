library(ggplot2)

conditions <- c("Major Depression", "Bipolar Disorder", "Eating Disorder", "Anxiety Disorders")

prevalence <- c(35.40, 12.90, 15.20, 44.20)

data <- data.frame(Condition = conditions, Prevalence = prevalence)

ggplot(data, aes(x = Condition, y = Prevalence, fill = Condition)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Mental Health Conditions", y = "Prevalence (%)") +
  ggtitle("Prevalence of Mental Health Conditions Worldwide") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
