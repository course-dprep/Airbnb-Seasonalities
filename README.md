# How seasonality affects the Airbnb prices in the various cities situated in different hemispheres

## Motivation

The vacation seasons is one of the most busy time periods for Airbnb hosts, 
with an large influx of tourists traveling to popular vacation spots to spend their holidays, increasing the demand therefore the prices. 
Nevertheless, the vacation seasons differ depending on the hemisphere. 
This project aims to compare the price of Airbnb between various cities across the globe situated in two different hemispheres, 
to determine the effect of seasonality on the price of Airbnb in these cities.
-->NEEDS ADDITIONAL INFO<--

## Research question

How does the effect of seasonalities differ for Airbnbs that reside in the Northern and Southern hemisphere, considering the difference in summer and winter season timings due to their geographical location?
-->WE SHOULD THINK ABOUT THIS, IS THIS GOOD?<--

## Data
For this research project Airbnb data will be used, accessed through Inside Airbnb.The datasets used in this project are all based on the listings in (Northern Hemispehere) Lisbon, Amsterdam, Prague and Paris, and (Southern Hemispehere) Rio de Janeiro, Buenos Aires, Mexico City and Santiago.

## Methods and results
In this chapter we will give a brief overview of the methods that have been applied, followed by the results from the ANOVA test and ends with the conclusion to our research question.

### Method:
1. Data will be acquired from [Inside Airbnb](http://insideairbnb.com/)
2. Data cleaning/auditing will be performed as required
3. Regression analysis will be performed on the date and prices
4. Automate and refine this process

### Results:


### Conclusion:



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
	│   ├── data-preparation
	│   └── paper
	└── src
 	   ├── analysis
 	   ├── data-preparation
 	   └── paper
    

## Running instructions

## More resources

## About

This research is carried out in implementation of the course Data Preparation and Workflow Management. This is a part of the Master program of Marketing Analytics for the course Data Preparation and Workflow Management at Tilburg University. The following authors contributed to this research:

Zhiyong Zhou
Marieke Beerens
Marlou Klute
Kim Gresnigt
Mevludin Ademovic



---------------------------------------------------------------------------------------------------

# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
