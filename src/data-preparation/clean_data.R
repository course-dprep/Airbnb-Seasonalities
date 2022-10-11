library(dplyr)
library(tidyr)
library(tidyverse)

#READ THE CSV FILES---------------------------------------
city_Ams <- read_csv("thenetherlandsnorthhollandamsterdam.csv")
city_Lisbon <- read_csv("portugallisbonlisbon.csv")
city_Prague <- read_csv("czechrepublicpragueprague.csv")
city_Vienna <- read_csv("austriaviennavienna.csv")
city_Melbourne <- read_csv("australiavicmelbourne.csv")
city_Northernrivers <- read_csv("australianswnorthernrivers.csv")
city_Sydney <- read_csv("australianswsydney.csv")
city_Westernaus <- read_csv("australiawawesternaustralia.csv")

#ADD COLUMN CITY AND HEMISPHERE--------------------
city_Ams<- city_Ams %>%
  add_column(City = "Amsterdam") %>% add_column(Hemisphere = "North")

city_Lisbon<- city_Lisbon %>%
  add_column(City = "Lisbon") %>% add_column(Hemisphere = "North")

city_Prague<- city_Prague %>%
  add_column(City = "Prague") %>% add_column(Hemisphere = "North")

city_Vienna<- city_Vienna %>%
  add_column(City = "Vienna") %>% add_column(Hemisphere = "North")

city_Melbourne <- city_Melbourne %>%
  add_column(City = "Melbourne") %>% add_column(Hemisphere = "South")

city_Northernrivers <- city_Northernrivers %>%
  add_column(City = "Northern Rivers") %>% add_column(Hemisphere = "South")

city_Sydney <- city_Sydney %>%
  add_column(City = "Sydney") %>% add_column(Hemisphere = "South")

city_Westernaus<- city_Westernaus %>%
  add_column(City = "Western Australia") %>% add_column(Hemisphere = "South")

#MERGE DATA FRAMES in North cities and South cities----------------------------------------
merged_cities_north <- rbind(city_Ams, city_Lisbon, city_Prague, city_Vienna)
merged_cities_south <- rbind(city_Melbourne, city_Northernrivers, city_Sydney, city_Westernaus)

#CLEAN DATAFRAME-----------------------------------------
#drops unnecessary columns in the data frame
drops <- c("date", "adjusted_price", "City", "Hemisphere")
merged_cities_north <- subset(merged_cities_north, select = drops)
merged_cities_south <- subset(merged_cities_south, select = drops)

#function to assign seasons to months depending on the hemisphere
time2season <- function(x, hemisphere= 'north')  {
  
  #gets the month from the data frame
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

merged_cities_north$seasons <- time2season(merged_cities_north$date, 'north')
merged_cities_south$seasons <- time2season(merged_cities_south$date, 'south')

write.csv(merged_cities_north, "merged_north_dataset.csv")
write.csv(merged_cities_south, "merged_south_dataset.csv")
