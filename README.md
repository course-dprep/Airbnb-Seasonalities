# How seasonality affects the Airbnb prices in the various cities situated in different hemispheres

![image](https://user-images.githubusercontent.com/112617983/195584820-e35714a4-8742-4796-b81f-1742badee8ce.jpeg)

This project gives an insight into how the hemisphere (north and south) affects the price of an Airbnb listing. 

## Research motivation

With rising inflation across the globe and small interest rates on savings, people are looking for other ways to invest their money effectively to make sure their money doesn't slowly evaporate due to inflation. One of the options is by buying a second house which they could rent out for additional income as well. If you want to use your second house to earn additional income, the main question becomes where the best place is to set up your second house. Many accommodations are dependent on seasonal or holiday periods. That is why we will investigate which place has the most (or least) price fluctuation between seasons, so that people can choose where it would be the most convenient for them personally to rent out a second house via Airbnb.


Our research question will therefore be: what effect does seaonality have on the price of Airbnb, and how does this effect differ for the northern hemisphere versus southern hemisphere?
 

We chose four cities in the Northern Hemisphere (Amsterdam, Lisbon, Paris, Ghent) and four cities in the Southern Hemisphere (Melbourne, Northern Rivers, Sydney, Western Australia). Four cities in Europe and four cities in Australia. We have chosen Europe and Australia because those cities are the most comparable in terms of prices. This makes it best to compare which locations are most seasonally bound. 


## Data
For this research project Airbnb data will be used, accessed through Inside Airbnb.The datasets used in this project are all based on the listings in (Northern Hemispehere) Lisbon, Amsterdam, Ghent and Paris, and (Southern Hemispehere) Melbourne, Northern Rivers, Sydney, Western Australia.

## Methods and results
In this chapter we will give a brief overview of the methods that have been applied, followed by the results from the ANOVA test and ends with the conclusion to our research question.



### Method:
1. Data will be acquired from [Inside Airbnb](http://insideairbnb.com/)
2. Data cleaning/auditing will be performed as required
3. Regression analysis will be performed on the date and prices
4. Automate and refine this process

### Results:
Before a ANOVA test can be performed, several assumptions need to be tested. Starting with the Levenetest (testing for homoscedasticity) which shows a value of around 2.2 meaning that the probability of the variances being not equal is very high.  When performing the ANOVA the p-value is larger then alpha meaning that the differences between the means are not statistically significant which states that there is not enough evidence to reject the null hypothesis. 
 

### Conclusion:
When grouping the cities related to the Northern Hemisphere and Southern Hemisphere together there are less price fluctations in the Northern Hemisphere cities compared to the Southern Hemisphere cities. This is shown through the boxplot and barchart as well as the results related to the ANOVA analysis. Therefore it can be concluded that the Northern Hemisphere is best for stable income throughout the year compared to the Southern Hemisphere. However the outcome of the ANOVA test showed that the outcome was not statistically significant which means that there was not enough evidence to support this conclusion of there being variances between the Northern and Soutern Hemisphere cities. 


## Repository overview

### Repository contents

The raw data used is contained in a folder called "data".

The source code is stored in a folder called "src".

The generated files are stored in the generated folder "gen".

Within the "gen" folder there are separate folders for the data preparation and the data analysis stages, as well as the final deliverable of the project; namely, "data-preparation", "analysis", and "paper".

Any temporary files will be stored in "temp".

Any final products from the various stages in the pipeline will be stored in the "output" folder.

Any files related to issues with the data or the model estimation will be stored in the "audit folder".

### Repository structure

	├── README.md
	├── data
	├── gen
	│   ├── analysis
	│   └── data-preparation
	└── src
 	   ├── analysis
 	   └── data-preparation
	   
## Dependencies
Please follow the installation guide on http://tilburgsciencehub.com/.
- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
For R, make sure you have installed and loaded below packages:
```
library(ggplot2)
library(car)
library(emmeans)
library(effectsize)
library(readr)
library(dplyr)
library(tidyr)
library(tidyverse)
library(haven)
```
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)    

## Running instructions
We recommend the following instructions for people that are interested in running the code:
1. Fork this repository
2. Open your command line / terminal and run the following: 
```git clone https://github.com/{your username}/Airbnb-Seasonalities.git```
3. Set your working directory to working directory and run the following command: 
make
4. When make has succesfully run all the code, it will generate <--add file name-->. 


## More resources

## About

This research is carried out in implementation of the course Data Preparation and Workflow Management. This is a part of the Master program of Marketing Analytics at Tilburg University. The following authors contributed to this research:

[Zhiyong Zhou](https://github.com/zhiyongzhou0125)

[Marieke Beerens](https://github.com/MariekeBeerens)

[Marlou Klute](https://github.com/MarlouKlute)

[Kim Gresnigt](https://github.com/Kim-data1998)

[Mevludin Ademovic](https://github.com/MevludinAdemovic)
