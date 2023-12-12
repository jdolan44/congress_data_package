# Congress Data Package
 Author: JTD
 
 Description: data package for DS201 semester project.
 
 The final report can be found [here](reports/final_report.qmd).
 
 The final presentation can be found [here](reports/presentation.qmd).

##File Description:

The Exploratory Data Analysis for this project can be found [here](congress_data_EDA.qmd).

All raw, uncleaned data can be found in the [raw_data](./raw_data) folder. The cleaned data can be found in the [data](./data) folder. The cleaning script for this data set can be found [here](./R/clean_congress_data.R).


 
 ## Data Sheet
 
### 1. Data Sources 

the raw data is freely available to the public, obtained from 
[this site](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/CI2EPI).
It was published in 2016 by Ella Foster-Molina, affiliated with the University of Rochester.

It contains census data on each congressional district from years 1972-2013, as well as personal characteristics of the house member representing that district.

More information about the raw dataset can be found [here](raw_data/codebook.pdf), along with a codebook for the raw data.

### 2. Data Format

All data for this project is formatted in CSV files.

### 3. Data Structure

All data is tabular. the `congress_data` table has 9,405 rows and 72 columns. The `session_data` table has 21 rows and 5 columns. More details on each column 
can be found in the [codebook](raw_data/codebook.pdf).

### 4. Data Issues

Some large amounts of data are missing because of privacy issues. here is a list of columns with missing data, followed by the congress numbers that the data is available for.

- comPower (109-113)
- chair (109-113)
- rank (109-113)
- comName (109-113)
- numCom (109-113)
- rankChair (109-113)
- prcntExAliens (103-113)
- prcntMulti (103-113)
- prcntOld (98-113)
- medianAge (103-113)
- abroadPrcnt (98-113)
- meanIncome (98-113)
- medianIncome (98-113)
- cookLeanDem (109-113)
- prcntBlackNotHisp (98-113)
- prcntWhite (98-113)


### 5. Data Cleaning

The cleaning script used for the data can be found [here](../R/clean_congress_data.R).

The script pulls the raw data and saves the new tables to the `data` folder.

Here is a list of changes made to the raw data:

- removes 8 rows of corrupted data.
- changes some party names for consistency.
- creates a new table for session characteristics. in the raw data, session
characteristics are saved in every row, which is unnecessary. Session characteristics 
are moved into a new table, `session_data`.
