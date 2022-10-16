library(readr)
library(dplyr)
library(tidyr)
library(tidyverse)
library(fastDummies)

# Set the correct working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("../../gen/data-preparation/input")

merged_cities_north <- read.csv("merged_cities_north.csv")
merged_cities_south <- read.csv("merged_cities_south.csv")

#MERGE NORTH AND SOUTH DATA FRAMES---------------------------------------
merged_cities_north_south <- rbind(merged_cities_north, merged_cities_south)

# Mapping the "season" variable into numeric values which allows for analyses to be performed 
mapping <- c("winter" = 1, "spring" = 2, "summer" = 3, "autumn" = 4)
merged_cities_north_south$seasons_numeric<- mapping[merged_cities_north_south$seasons]

# Dummy coding of the "hemisphere" variable 
merged_cities_north_south <- dummy_cols(merged_cities_north_south, select_columns = 'Hemisphere')

#MAKING SEPERATE DATA FRAMES FOR SEASONS AND MERGE THEM
# Autumn
amsterdam_autumn <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'autumn')
lisbon_autumn <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'autumn')
ghent_autumn <- subset(merged_cities_north_south, City == 'Ghent' & seasons == 'autumn')
vienna_autumn <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'autumn')
melbourne_autumn <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'autumn')
northernrivers_autumn <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "autumn")
sydney_autumn <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'autumn')
westernaus_autumn <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'autumn')

# Merge autumn
merged_cities_autumn <- rbind(amsterdam_autumn, lisbon_autumn, ghent_autumn, vienna_autumn, melbourne_autumn, northernrivers_autumn, sydney_autumn, westernaus_autumn)

# Spring
amsterdam_spring <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'spring')
lisbon_spring <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'spring')
ghent_spring <- subset(merged_cities_north_south, City == 'Ghent' & seasons == 'spring')
vienna_spring <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'spring')
melbourne_spring <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'spring')
northernrivers_spring <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "spring")
sydney_spring <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'spring')
westernaus_spring <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'spring')

# Merge spring
merged_cities_spring <- rbind(amsterdam_spring, lisbon_spring, ghent_spring, vienna_spring, melbourne_spring, northernrivers_spring, sydney_spring, westernaus_spring)

# Summer
amsterdam_summer <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'summer')
lisbon_summer <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'summer')
ghent_summer <- subset(merged_cities_north_south, City == 'Ghent' & seasons == 'summer')
vienna_summer <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'summer')
melbourne_summer <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'summer')
northernrivers_summer <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "summer")
sydney_summer <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'summer')
westernaus_summer <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'summer')

# Merge summer
merged_cities_summer <- rbind(amsterdam_summer, lisbon_summer, ghent_summer, vienna_summer, melbourne_summer, northernrivers_summer, sydney_summer, westernaus_summer)


# Winter
amsterdam_winter <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'winter')
lisbon_winter <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'winter')
ghent_winter <- subset(merged_cities_north_south, City == 'Ghent' & seasons == 'winter')
vienna_winter <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'winter')
melbourne_winter <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'winter')
northernrivers_winter <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "winter")
sydney_winter <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'winter')
westernaus_winter <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'winter')

# Merge Winter
merged_cities_winter <- rbind(amsterdam_winter, lisbon_winter, ghent_winter, vienna_winter, melbourne_winter, northernrivers_winter, sydney_winter, westernaus_winter)

# Merge every data frame
all_cities_merged <- rbind(merged_cities_autumn, merged_cities_spring, merged_cities_summer, merged_cities_winter)


# Write csv files
write.csv(all_cities_merged, file.path('../output',"all_cities_merged.csv"))








