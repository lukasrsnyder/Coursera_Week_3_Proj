# Coursera_Week_3_Proj

This R script titled run_analysis.R is used to transform the raw data provided in the Week 3 project folder into a tidy data set

##Assumptions
The analysis assumes that the data has been unzipped in the user's working directory and that the hieratchy of the files does
not change.

##Output
The output of this program will be a tidy data set containing variables described in the code book as a .txt file

##Method
The general method of creating the tidy data set is as follows
- load all required libraries
- Bring reference tables into R
- determine which columns need to be kept
- load data and assign meaningful column names
- limit data to desired columns
- stack data sets and merge on meaningful information
- Melt table into long format and summarize information at the desired level
- Output data to working directory.
