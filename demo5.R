data<-readRDS("C:/Users/mouni/Downloads/Causal_Data_Science_Data/Causal_Data_Science_Data/customer_sat.rds")

n <- 1e+03

# draw and create variables with specific dependencies
#subscription <- rbinom(n, 2, 0.5)
#follow_ups <- rnorm(n) + subscription
#satisfaction <- education * 2 + rnorm(n) - character * 0.3

# rescale to realistic values
satisfaction <- sample(20:80,1) + scales::rescale(satisfaction, to = c(0, 80))
follow_ups <- scales::rescale(follow_ups, to = c(0, 10))
subscription <- factor(subscription, labels = c("Elite", "Premium+", "Premium"))

# create tibble
df <- tibble(
  satisfaction,
  follow_ups,
  subscription
)

# Not conditioning on education
simps_not_cond <- ggplot(df, aes(x = follow_ups, y = satisfaction)) +
  geom_point(alpha = .8) +
  stat_smooth(method = "lm", se = F)

# Conditioning on education  
simps_cond <- ggplot(df, aes(x = follow_ups, y = satisfaction, color = subscription)) +
  geom_point(alpha = .8) +
  stat_smooth(method = "lm", se = F) +
  theme(legend.position = "right")

# Plot both plots
simps_not_cond
simps_cond