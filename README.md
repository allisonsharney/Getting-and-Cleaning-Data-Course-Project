# Getting-and-Cleaning-Data-Course-Project
Final course project for Coursera Getting and Cleaning Data

A growing area of data science is wearable computing. In this project the data set was generated from data collected from accelerometers in the Samsung Galaxy S smartphone while 30 volunteer subjects performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained data was then separated into 2 data sets, where 70% of volunteers were used for the training data set and 30% for the test data set.

The R script run_analysis.R retrieves the data, tidies the data and then generates a table that sumamrizes the mean of each variable measured for each subject. 

run_analysis.R performs the following tasks:
1. Downloads and extracts the data files for analysis
2. Merges the training and test sets to create one data set
3. Extracts only the measurements of mean and standard deviation for each  measurement
4. Labels the data set with descriptive variable names
5. Creases a second, tidy data set from the data in step 4 with the average of each variable for each activity and each subject

The repository contains the following files:
- README.md: provides a summary of the data and files
- tidy_data.txt: final summarized data set
- run_analysis.R: the R script used to crease the data table tidy_data.txt
- CodeBook.md: the codebook describes the variables contained in the data set