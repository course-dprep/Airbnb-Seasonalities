# Load csv file
library(readr)
all_cities_merged <- read_csv("all_cities_merged.csv")
View(all_cities_merged)
summary(all_cities_merged)

# Make City and seasons factors
all_cities_merged$City <- as_factor(all_cities_merged$City)
all_cities_merged$seasons <- as_factor(all_cities_merged$seasons)

# Visualization

library(ggplot2)
ggplot(all_cities_merged, aes (x=price_numeric, y=seasons, fill=City)) + geom_col(position="dodge")

