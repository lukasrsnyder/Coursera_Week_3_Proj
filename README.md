# Coursera_Week_3_Proj

This R script titled run_analysis.R is used to transform the raw data provided in the Week 3 project folder into a tidy data set

##Assumptions
The analysis assumes that the data has been unzipped in the user's working directory and that the hieratchy of the files does
not change.

##Output
The output of this program will be a tidy data set containing variables described in the code book as a .txt file

##Method
The general method of creating the tidy data set is as follows
1) load all required libraries
2) Bring reference tables into R
3) determine which columns need to be kept
4) load data and assign meaningful column names
5) limit data to desired columns
6) stack data sets and merge on meaningful information
7) Melt table into long format and summarize information at the desired level
8) Output data to working directory.
