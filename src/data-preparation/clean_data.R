library(dplyr)
library(tidyr)
library(tidyverse)

#read the csv file of the city
city_north <- read_csv("lisbon.csv")
View(city_north)

#drops unecessary columns in the dataframe
drops <- c("date", "adjusted_price")
city_north <- subset(city_north, select = drops)
View(city_north)

#function to assign seasons to months depending on the hemisphere
time2season <- function(x, hemisphere="north") {

  #gets the month from the dataframe
  months <- format(x, "%m")
  
  #determine the season depending on the month and hemisphere
  if (hemisphere=="north") {
    winter <- which( months %in% c("12", "01", "02") )
    spring <- which( months %in% c("03", "04", "05") )
    summer <- which( months %in% c("06", "07", "08") )
    autumm <- which( months %in% c("09", "10", "11") ) 
  } else if (hemisphere=="south") {
    winter <- which( months %in% c("05", "06", "07") )
    spring <- which( months %in% c("08", "09", "10") )
    summer <- which( months %in% c("11", "12", "01") )
    autumm <- which( months %in% c("02", "03", "04") ) 
  } 
  
  #creates of the output
  seasons <- rep(NA, length(x))
  
  seasons[winter] <- "winter"
  seasons[spring] <- "spring"
  seasons[summer] <- "summer"
  seasons[autumm] <- "autumm"

  return(seasons)
  
} 

#adds a season column with season depending on the date and hemisphere
city_north$season <- time2season(city_north$date, "north")

#export the data
write.csv(city_north, "D:/OneDrive/Tilburg/MMA/DPWM/projects/city_north_cleaned", row.names = FALSE)



city_south <- read_csv("rio.csv")
View(city_south)

#drops unecessary columns in the dataframe
drops <- c("date", "adjusted_price")
city_south <- subset(city_south, select = drops)
View(city_south)

city_south$season <- time2season(city_south$date, "south")

write.csv(city_south, "D:/OneDrive/Tilburg/MMA/DPWM/projects/city_south_cleaned", row.names = FALSE)
