# Install and load packages
library(readr)
library(ggplot2)
library(car)
install.packages("emmeans")
library(emmeans)
install.packages("effectsize") 
library(effectsize)

# Read csv all_cities_merged
all_cities_merged <- read_csv("all_cities_merged.csv")
View(all_cities_merged)
summary(all_cities_merged)

# Make City and seasons factors
all_cities_merged$City <- as_factor(all_cities_merged$City)
all_cities_merged$seasons <- as_factor(all_cities_merged$seasons)

# Visualization (boxplot and barchart)
ggplot(all_cities_merged, aes (x=price_numeric, y=seasons, fill=City)) + geom_col(position="dodge")
ggplot(all_cities_merged, aes(x=price_numeric, y=seasons, fill=City))+geom_bar(stat="summary", fun="mean")

#Homoscedasticity
leveneTest(price_numeric ~ City * seasons, all_cities_merged, center=mean)

# Anova
Price_numeric_aov1 <- lm(price_numeric ~ City * seasons, all_cities_merged, contrasts=list(City=contr.sum, seasons=contr.sum))
Anova(Price_numeric_aov1, type=3)

# Multiple comparisons
emmeans(Price_numeric_aov1, pairwise ~ City * seasons, adjust="bonferroni")

# Partical eta squared
eta_squared(Anova(Price_numeric_aov1, type=3), ci=0.95, partial = TRUE)



