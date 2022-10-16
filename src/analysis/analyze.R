# load packages
library(readr)
library(ggplot2)
library(car)
library(emmeans)
library(effectsize)
library(haven)

# set correct working directory
setwd("../../gen/data-preparation/output")

# Read csv all_cities_merged
all_cities_merged <- read_csv("all_cities_merged.csv")

pdf("../../analysis/output/plot.pdf")

# Make City and seasons factors
all_cities_merged$City <- as_factor(all_cities_merged$City)
all_cities_merged$seasons <- as_factor(all_cities_merged$seasons)

# Visualization (boxplot and barchart)
ggplot(all_cities_merged, aes (x=price_numeric, y=seasons, fill=City)) + geom_col(position="dodge")
ggplot(all_cities_merged, aes(x=price_numeric, y=seasons, fill=City))+geom_bar(stat="summary", fun="mean")
dev.off()

#Homoscedasticity
write.csv(leveneTest(price_numeric ~ City * seasons, all_cities_merged, center=mean), file.path('../../analysis/output', "Homoscedasticity.csv"))

# Anova
Price_numeric_aov1 <- lm(price_numeric ~ City * seasons, all_cities_merged, contrasts=list(City=contr.sum, seasons=contr.sum))
write.csv(Anova(Price_numeric_aov1, type=3), file.path('../../analysis/output', "ANOVA.csv"))

# Multiple comparisons
write.csv(emmeans(Price_numeric_aov1, pairwise ~ City * seasons, adjust="bonferroni"), file.path('../../analysis/output', "Multiple comparions.csv"))

# Partial eta squared
write.csv(eta_squared(Anova(Price_numeric_aov1, type=3), ci=0.95, partial = TRUE), file.path('../../analysis/output', "Partial eta squared.csv"))



