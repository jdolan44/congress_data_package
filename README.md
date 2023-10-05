# Congress Data Package
 Author: JTD
 
 Description: data package for DS201 semester project.
 
 ## Data Sheet
 
### 1. Data Sources 

the raw data is freely available to the public, obtained from 
[this site](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/CI2EPI).
It was published in 2016 by Ella Foster-Molina, affiliated with the University of Rochester.

It contains census data on each congressional district from years 1972-2013, as well as personal characteristics of the house member representing that district.

More information about the dataset can be found [here](raw_data/codebook.pdf), along with a codebook for the raw data.

### 2. Data Format

All data for this project is formatted in CSV files.

### 3. Data Structure

All data is tabular. the `congress_data` table has 9,405 rows and 72 columns. The `session_data` table has 21 rows and 5 columns.

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


### 5. Data Cleaning