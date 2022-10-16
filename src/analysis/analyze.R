# load packages
library(readr)
library(ggplot2)
library(car)
library(emmeans)
library(effectsize)
library(haven)

# set correct working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("../../gen/data-preparation/output")

# Read csv all_cities_merged
all_cities_merged <- read_csv("all_cities_merged.csv")

pdf("../../analysis/output/ANOVA_analysis.pdf")

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

# Partial eta squared
eta_squared(Anova(Price_numeric_aov1, type=3), ci=0.95, partial = TRUE)

dev.off()

