library(readr)
library(dplyr)
library(tidyr)
library(tidyverse)

# set the correct working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("../../data")

#READ THE CSV FILES---------------------------------------
city_ams <- read_csv("thenetherlandsnorthhollandamsterdam.csv")
city_lisbon <- read_csv("portugallisbonlisbon.csv")
city_ghent <- read_csv("belgiumvlgghent.csv")
city_vienna <- read_csv("austriaviennavienna.csv")
city_melbourne <- read_csv("australiavicmelbourne.csv")
city_northernrivers <- read_csv("australianswnorthernrivers.csv")
city_sydney <- read_csv("australianswsydney.csv")
city_westernaus <- read_csv("australiawawesternaustralia.csv")

#CLEAN DATAFRAME-----------------------------------------
# AGGREGATE
# Remove sign from price and make it numeric
city_ams <- city_ams %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_lisbon <- city_lisbon %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_ghent <- city_ghent %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_vienna <- city_vienna %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_melbourne <- city_melbourne %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_northernrivers <- city_northernrivers %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_sydney <- city_sydney %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))
city_westernaus <- city_westernaus %>% mutate(price_numeric = as.numeric(gsub('[$]|[,]', '', price)))

# Taking the mean per day
city_ams <- city_ams %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_lisbon <- city_lisbon %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_ghent <- city_ghent %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_vienna <- city_vienna %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_melbourne <- city_melbourne %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_northernrivers <- city_northernrivers %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_sydney <- city_sydney %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))
city_westernaus <- city_westernaus %>%group_by(date)%>%summarise_at(vars(price_numeric),funs(mean(.,na.rm=TRUE)))

#ADDING CITY AND HEMISPEHERE COLUMNS
# Add column City and Hemisphere
city_ams<- city_ams %>%
  add_column(City = "Amsterdam") %>% add_column(Hemisphere = "North")

city_lisbon<- city_lisbon %>%
  add_column(City = "Lisbon") %>% add_column(Hemisphere = "North")

city_ghent<- city_ghent %>%
  add_column(City = "Ghent") %>% add_column(Hemisphere = "North")

city_vienna<- city_vienna %>%
  add_column(City = "Vienna") %>% add_column(Hemisphere = "North")

city_melbourne <- city_melbourne %>%
  add_column(City = "Melbourne") %>% add_column(Hemisphere = "South")

city_northernrivers <- city_northernrivers %>%
  add_column(City = "Northern Rivers") %>% add_column(Hemisphere = "South")

city_sydney <- city_sydney %>%
  add_column(City = "Sydney") %>% add_column(Hemisphere = "South")

city_westernaus<- city_westernaus %>%
  add_column(City = "Western Australia") %>% add_column(Hemisphere = "South")

#MERGE DATA FRAMES in North cities and South cities----------------------------------------
merged_cities_north <- rbind(city_ams, city_lisbon, city_ghent, city_vienna)
merged_cities_south <- rbind(city_melbourne, city_northernrivers, city_sydney, city_westernaus)

#CONVERTING DATE INTO SEASONS
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

# Write csv files

write.csv(merged_cities_north, file.path('../gen/data-preparation/input', "merged_cities_north.csv"))
write.csv(merged_cities_south, file.path('../gen/data-preparation/input', "merged_cities_south.csv"))

