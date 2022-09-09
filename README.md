# Airbnb Seasonalities: Lisbon vs Rio de Janeiro

How does the effect of seasonalities differ for Airbnbs that reside in the Northern and Southern hemisphere, based on Lisbon, Portugal and Rio de Janeiro, Brazil?

## Motivation

The vacation seasons is one of the most busy time periods for Airbnb hosts, 
with an large influx of tourists traveling to popular vacation spots to spend their holidays, increasing the demand therefore the prices. 
Nevertheless, the vacation seasons differ depending on the hemisphere. 
This project aims to compare the price of Airbnb between the two cities, Lisbon and Rio de Janeiro, 
situated in two different hemispheres, to determine the effect of seasonality on the price of Airbnb in these cities.

## Methods and results

Method:
1. Data will be acquired from [Inside Airbnb](http://insideairbnb.com/)
2. Data cleaning/auditing will be performed as required
3. Regression analysis will be performed on the date and prices
4. Automate and refine this process

## Repository overview
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

This repository is a project for the course Data Preparation and Workflow Management at Tilburg University.

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
