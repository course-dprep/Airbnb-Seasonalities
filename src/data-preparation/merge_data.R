#MERGE THE TWO DATA FRAMES----------------------------------------
merged_cities_north_south <- rbind(merged_cities_north, merged_cities_south)
View(merged_cities_north_south)

# Remove .,$ for merged data set
merged_cities_north_south$adjusted_price <- gsub(",", "", merged_cities_north_south$adjusted_price)
merged_cities_north_south$adjusted_price <- gsub("\\$", "", merged_cities_north_south$adjusted_price)
merged_cities_north_south$adjusted_price <- round(as.numeric(merged_cities_north_south$adjusted_price, digits = 0))

#Mapping the "season" variable into numeric values which allows for analyses to be performed 
mapping <- c("winter" = 1, "spring" = 2, "summer" = 3, "autumn" = 4)
merged_cities_north_south$seasons_numeric<- mapping[merged_cities_north_south$seasons]

#dummy coding the "hemisphere" variable 
install.packages("fastDummies")
library(fastDummies)
merged_cities_north_south <- dummy_cols(merged_cities_north_south, select_columns = 'Hemisphere')

# NEW DATAFRAMES WITH SEASONS SEPERATELY-----------------------------
# Order the seasons alphabetically
merged_cities_north_south <- merged_cities_north_south[order(merged_cities_north_south$seasons),]

# Autumn
Amsterdam_Autumn <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'autumn')
Lisbon_Autumn <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'autumn')
Prague_Autumn <- subset(merged_cities_north_south, City == 'Prague' & seasons == 'autumn')
Vienna_Autumn <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'autumn')
Melbourne_Autumn <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'autumn')
Northernrivers_Autumn <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "autumn")
Sydney_Autumn <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'autumn')
Westernaus_Autumn <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'autumn')

# Merge autumn
merged_cities_Autumn <- rbind(Amsterdam_Autumn, Lisbon_Autumn, Prague_Autumn, Vienna_Autumn, Melbourne_Autumn, Northernrivers_Autumn, Sydney_Autumn, Westernaus_Autumn)
View(merged_cities_Autumn)

# Spring
Amsterdam_Spring <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'spring')
Lisbon_Spring <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'spring')
Prague_Spring <- subset(merged_cities_north_south, City == 'Prague' & seasons == 'spring')
Vienna_Spring <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'spring')
Melbourne_Spring <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'spring')
Northernrivers_Spring <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "spring")
Sydney_Spring <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'spring')
Westernaus_Spring <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'spring')

# Merge spring
merged_cities_Spring <- rbind(Amsterdam_Spring, Lisbon_Spring, Prague_Spring, Vienna_Spring, Melbourne_Spring, Northernrivers_Spring, Sydney_Spring, Westernaus_Spring)
View(merged_cities_Spring)

# Summer
Amsterdam_Summer <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'summer')
Lisbon_Summer <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'summer')
Prague_Summer <- subset(merged_cities_north_south, City == 'Prague' & seasons == 'summer')
Vienna_Summer <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'summer')
Melbourne_Summer <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'summer')
Northernrivers_Summer <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "summer")
Sydney_Summer <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'summer')
Westernaus_Summer <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'summer')

# Merge summer
merged_cities_Summer <- rbind(Amsterdam_Summer, Lisbon_Summer, Prague_Summer, Vienna_Summer, Melbourne_Summer, Northernrivers_Summer, Sydney_Summer, Westernaus_Summer)
View(merged_cities_Summer)

# Winter
Amsterdam_Winter <- subset(merged_cities_north_south, City == 'Amsterdam' & seasons == 'winter')
Lisbon_Winter <- subset(merged_cities_north_south, City == 'Lisbon' & seasons == 'winter')
Prague_Winter <- subset(merged_cities_north_south, City == 'Prague' & seasons == 'winter')
Vienna_Winter <- subset(merged_cities_north_south, City == 'Vienna' & seasons == 'winter')
Melbourne_Winter <- subset(merged_cities_north_south, City == 'Melbourne' & seasons == 'winter')
Northernrivers_Winter <- subset(merged_cities_north_south, City == 'Northern Rivers' & seasons == "winter")
Sydney_Winter <- subset(merged_cities_north_south, City == 'Sydney' & seasons == 'winter')
Westernaus_Winter <- subset(merged_cities_north_south, City == 'Western Australia' & seasons == 'winter')

# Merge Winter
merged_cities_Winter <- rbind(Amsterdam_Winter, Lisbon_Winter, Prague_Winter, Vienna_Winter, Melbourne_Winter, Northernrivers_Winter, Sydney_Winter, Westernaus_Winter)
View(merged_cities_Winter)

# Merge every data frame
all_cities_merged <- rbind(merged_cities_Autumn, merged_cities_Spring, merged_cities_Summer, merged_cities_Winter)
View(all_cities_merged)

# Write csv files
write.csv(all_cities_merged, "all_cities_merged.csv")


