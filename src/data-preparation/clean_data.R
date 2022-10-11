install.packages("readr")
library(readr)
library(dplyr)
library(tidyr)
library(tidyverse)

#READ THE CSV FILES---------------------------------------

#read the csv file of Melbourne
city_Melbourne <- read_csv("melbourne.csv")
View(city_Melbourne)

#read the csv file of Northern rivers
city_Northernrivers <- read_csv("northernrivers.csv")
View(city_Northernrivers)

#read the csv file of Sydney
city_Sydney <- read_csv("sydney.csv")
View(city_Sydney)

#read the csv file of Western Australia
city_Westernaus <- read_csv("westernaus.csv")
View(city_Westernaus)


#ADD COLUMN CITY AND HEMISPHERE--------------------

#add column Melbourne and South
city_Melbourne <- city_Melbourne %>%
  add_column(City = "Melbourne") %>% add_column(Hemisphere = "South")
View(city_Melbourne)

#add column Northern Rivers and South
city_Northernrivers <- city_Northernrivers %>%
  add_column(City = "Northern Rivers") %>% add_column(Hemisphere = "South")
View(city_Northernrivers)

#add column Sydney and South
city_Sydney <- city_Sydney %>%
  add_column(City = "Sydney") %>% add_column(Hemisphere = "South")
View(city_Sydney)

#add column Western Australia
city_Westernaus<- city_Westernaus %>%
  add_column(City = "Western Australia") %>% add_column(Hemisphere = "South")
View(city_Westernaus)


#MERGE DATA FRAMES----------------------------------------
merged_cities_south <- rbind(city_Melbourne, city_Northernrivers, city_Sydney, city_Westernaus)
View(merged_cities_south)


#CLEAN DATAFRAME-----------------------------------------

#drops unecessary columns in the dataframe
drops <- c("date", "adjusted_price", "City", "Hemisphere")
merged_cities_south <- subset(merged_cities_south, select = drops)


#function to assign seasons to months depending on the hemisphere
time2season <- function(x, hemisphere="north") {
  
  #gets the month from the dataframe
  months <- format(x, "%m")
  
  #determine the season depending on the month and hemisphere
  if (hemisphere=="north") {
    winter <- which( months %in% c("12", "01", "02") )
    spring <- which( months %in% c("03", "04", "05") )
    summer <- which( months %in% c("06", "07", "08") )
    autumn <- which( months %in% c("09", "10", "11") ) 
  } else if (hemisphere=="south") {
    winter <- which( months %in% c("05", "06", "07") )
    spring <- which( months %in% c("08", "09", "10") )
    summer <- which( months %in% c("11", "12", "01") )
    autumn <- which( months %in% c("02", "03", "04") ) 
  } 
  
  #creates of the output
  seasons <- rep(NA, length(x))
  
  seasons[winter] <- "winter"
  seasons[spring] <- "spring"
  seasons[summer] <- "summer"
  seasons[autumn] <- "autumn"
  
  return(seasons)
  
} 

merged_cities_south$seasons <- time2season(merged_cities_south$date, 'south')

# Remove .,$ from merged dataset
merged_cities_south$adjusted_price <- gsub(",", "", merged_cities_south$adjusted_price)
merged_cities_south$adjusted_price <- gsub("\\$", "", merged_cities_south$adjusted_price)
merged_cities_south$adjusted_price <- round(as.numeric(merged_cities_south$adjusted_price, digits = 0))


# NEW DATAFRAMES WITH SEASONS SEPERATELY-----------------------------
# Order the seasons
merged_cities_south <- merged_cities_south[order(merged_cities_south$seasons),]

# Seperate data frame Autumn
Melbourne_Autumn <- subset(merged_cities_south, City == 'Melbourne' & seasons == 'autumn')
View(Melbourne_Autumn)
Northernrivers_Autumn <- subset(merged_cities_south, City == 'Northern Rivers' & seasons == "autumn")
View(Northernrivers_Autumn)
Sydney_Autumn <- subset(merged_cities_south, City == 'Sydney' & seasons == 'autumn')
View(Sydney_Autumn)
Westernaus_Autumn <- subset(merged_cities_south, City == 'Western Australia' & seasons == 'autumn')
View(Westernaus_Autumn)

# Add column mean of every city Autumn
Melbourne_Autumn$Mean <- mean(Melbourne_Autumn$adjusted_price)
Northernrivers_Autumn$Mean <- mean(Northernrivers_Autumn$adjusted_price)
Sydney_Autumn$Mean <- mean(Sydney_Autumn$adjusted_price)
Westernaus_Autumn$Mean <- mean(Westernaus_Autumn$adjusted_price)


# Merge autumn
merged_cities_Autumn <- rbind(Melbourne_Autumn, Northernrivers_Autumn, Sydney_Autumn, Westernaus_Autumn)
View(merged_cities_Autumn)


# Seperate data frame for Spring
Melbourne_Spring <- subset(merged_cities_south, City == 'Melbourne' & seasons == 'spring')
View(Melbourne_Spring)
Northernrivers_Spring <- subset(merged_cities_south, City == 'Northern Rivers' & seasons == "spring")
View(Northernrivers_Spring)
Sydney_Spring <- subset(merged_cities_south, City == 'Sydney' & seasons == 'spring')
View(Sydney_Spring)
Westernaus_Spring <- subset(merged_cities_south, City == 'Western Australia' & seasons == 'spring')
View(Westernaus_Spring)

# Add column mean of every city Spring
Melbourne_Spring$Mean <- mean(Melbourne_Spring$adjusted_price)
Northernrivers_Spring$Mean <- mean(Northernrivers_Spring$adjusted_price)
Sydney_Spring$Mean <- mean(Sydney_Spring$adjusted_price)
Westernaus_Spring$Mean <- mean(Westernaus_Spring$adjusted_price)

# Merge spring
merged_cities_Spring <- rbind(Melbourne_Spring, Northernrivers_Spring, Sydney_Spring, Westernaus_Spring)
View(merged_cities_Spring)


# Seperate data frame for Summer
Melbourne_Summer <- subset(merged_cities_south, City == 'Melbourne' & seasons == 'summer')
View(Melbourne_Summer)
Northernrivers_Summer <- subset(merged_cities_south, City == 'Northern Rivers' & seasons == "summer")
View(Northernrivers_Summer)
Sydney_Summer <- subset(merged_cities_south, City == 'Sydney' & seasons == 'summer')
View(Sydney_Summer)
Westernaus_Summer <- subset(merged_cities_south, City == 'Western Australia' & seasons == 'summer')
View(Westernaus_Summer)

# Add column mean of every city Summer
Melbourne_Summer$Mean <- mean(Melbourne_Summer$adjusted_price)
Northernrivers_Summer$Mean <- mean(Northernrivers_Summer$adjusted_price)
Sydney_Summer$Mean <- mean(Sydney_Summer$adjusted_price)
Westernaus_Summer$Mean <- mean(Westernaus_Summer$adjusted_price)

# Merge summer
merged_cities_Summer <- rbind(Melbourne_Summer, Northernrivers_Summer, Sydney_Summer, Westernaus_Summer)
View(merged_cities_Summer)

# Seperate data frame for Winter
Melbourne_Winter <- subset(merged_cities_south, City == 'Melbourne' & seasons == 'winter')
View(Melbourne_Winter)
Northernrivers_Winter <- subset(merged_cities_south, City == 'Northern Rivers' & seasons == "Winter")
View(Northernrivers_Winter)
Sydney_Winter <- subset(merged_cities_south, City == 'Sydney' & seasons == 'winter')
View(Sydney_Winter)
Westernaus_Winter <- subset(merged_cities_south, City == 'Western Australia' & seasons == 'winter')
View(Westernaus_Winter)

# Add column mean of every city Winter
Melbourne_Winter$Mean <- mean(Melbourne_Winter$adjusted_price)
Northernrivers_Winter$Mean <- mean(Northernrivers_Winter$adjusted_price)
Sydney_Winter$Mean <- mean(Sydney_Winter$adjusted_price)
Westernaus_Winter$Mean <- mean(Westernaus_Winter$adjusted_price)

# Merge winter
merged_cities_Winter <- rbind(Melbourne_Winter, Northernrivers_Winter, Sydney_Winter, Westernaus_Winter)
View(merged_cities_Winter)
  
