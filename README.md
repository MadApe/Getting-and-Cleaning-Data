# Getting and Cleaning Data
Coursework for Getting and Cleaning Data Coursera Course

## Files
`CODEBOOK.MD` - Codebook describing the original data set, the updated data set, and how to run the analysis.

`run_analysis.R` - R code to run the analysis described in the `CODEBOOK`.  This file assumes that the root directory of the data set is available in the working directory.

`UHC_HAR_means_analysis-tidy.txt` - The output of running `run_analysis.R`, this tidy data set aggregates a subset of variables, taking the mean of the values by Activity and Subject.

## About The Project
The purpose of the project is to collect the data, clean the data, analyze the data, and output a tidy data set that could be used for futher analysis in the future.

### Project Description (from the Coursera Week 4 Project Page)

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
>
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
>
>Here are the data for the project:
>
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
>
>You should create one R script called run_analysis.R that does the following.
>
>1. Merges the training and the test sets to create one data set.
>2. Extracts only the measurements on the mean and standard deviation for each measurement.
>3. Uses descriptive activity names to name the activities in the data set
>4. Appropriately labels the data set with descriptive variable names.
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
