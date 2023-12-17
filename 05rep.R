install.packages(c("dagitty", "tidyverse"))

library(dagitty)
library(tidyverse)

# Load the data
data<-readRDS("C:/Users/mouni/Downloads/Causal_Data_Science_Data/Causal_Data_Science_Data/customer_sat.rds")

# Create a DAG explicitly
dag <- dagitty('dag {
  subscription -> follow_ups
  subscription -> satisfaction
  follow_ups -> satisfaction
}')

# Fit the model
#fit <- lm(satisfaction ~ follow_ups + subscription, data = data)

# Adjust layout for better visualization
#coordinates(dag) <- list(x = c(subscription = 1, follow_ups = 2, satisfaction = 1))
coords = list(x = c(Y = 3, Z = 2, X = 1),
              y = c(Y = 0, Z = 0, X = 0))
# Plot the DAG
plot(dag, main = "Directed Acyclic Graph (DAG) for Relationship Analysis")

# Annotate the graph with coefficients
label_adjust <- data.frame(x = c(1, 2, 1), y = c(1, 2, 3), label = c("b1", "b2", "b3"))
text(label_adjust$x, label_adjust$y, labels = label_adjust$label, col = "blue", cex = 1.5)


