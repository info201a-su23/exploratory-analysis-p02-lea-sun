library(ggplot2)
library(dplyr)

Ages <- c("10 to 14 yr olds", "30 to 34 yr olds", "70 yr olds")
Prevalence <- c(2.698861, 6.201451 ,3.815748)

data <- data.frame(Ages = Ages, Prevalence = Prevalence)

chart1 <- ggplot(data, aes(x = Ages, y = Prevalence, fill = Ages, colour = Ages )) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Ages", y = "Prevalence of Depression (%)") +
  ggtitle("The difference of depression rates between age groups in the United States (2017)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(chart1)



  
  