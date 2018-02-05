# run_analysis.R
# loads, cleans, transforms and tidies the UCI HAR Dataset
#
# Author: madapebanjo
# Date: 02/01/2018
#
# Follows Google R style guidelines: 
#   https://google.github.io/styleguide/Rguide.xml
#
# Loads the following files:
#   - features.txt - Contains the variable names
#   - X_*.txt - Contain the training and test data
#   - Y_*.txt - Contain the activity ID for each observation in X files
#   - subject_*.txt - Contains the Subject ID for each observation in X files
#   - activity_labels.txt - Contains activity ID to activity label mapping


# load required libraries
library(data.table)
library(dplyr)
library(tidyr)

# initialize file paths
projectPath <- "./"
dataTestFile <- file.path(projectPath, "test", "X_test.txt")
dataTrainingFile <- file.path(projectPath, "train", "X_train.txt")
activityTestFile <- file.path(projectPath, "test", "Y_test.txt")
activityTrainingFile <- file.path(projectPath, "train", "Y_train.txt")
activityLabelFile <- file.path(projectPath, "activity_labels.txt")
subjectTestFile <- file.path(projectPath, "test", "subject_test.txt")
subjectTrainingFile <- file.path(projectPath, "train", "subject_train.txt")
variableNameFile <- file.path(projectPath, "features.txt")

# Verify all necessary files exist
if (!file.exists(dataTestFile)) {stop("File does not exist: ", dataTestFile)}
if (!file.exists(dataTrainingFile)) {stop("File does not exist: ", dataTrainingFile)}
if (!file.exists(activityTestFile)) {stop("File does not exist: ", activityTestFile)}
if (!file.exists(activityTrainingFile)) {stop("File does not exist: ", activityTrainingFile)}
if (!file.exists(activityLabelFile)) {stop("File does not exist: ", activityLabelFile)}
if (!file.exists(subjectTestFile)) {stop("File does not exist: ", subjectTestFile)}
if (!file.exists(subjectTrainingFile)) {stop("File does not exist: ", subjectTrainingFile)}
if (!file.exists(variableNameFile)) {stop("File does not exist: ", variableNameFile)}

# read feature/variable and activity files as data frame for easy manipulation
# set the column names
dtActivityLabels <- tbl_df(read.table(activityLabelFile, stringsAsFactors = FALSE))
colnames(dtActivityLabels) <- c("activityID", "activityName")

dtVariables <- tbl_df(read.table(variableNameFile, stringsAsFactors = FALSE))
colnames(dtVariables) <- c("variableID", "variableName")

# read the test data files as data frames for easy manipulation
dtTestData <- tbl_df(read.table(dataTestFile, stringsAsFactors = FALSE))
dtTestActivity <- tbl_df(read.table(activityTestFile, stringsAsFactors = FALSE))
dtTestSubjects <- tbl_df(read.table(subjectTestFile, stringsAsFactors = FALSE))

# read the training data files as data frames for easy manipulation
dtTrainData <- tbl_df(read.table(dataTrainingFile, stringsAsFactors = FALSE))
dtTrainActivity <- tbl_df(read.table(activityTrainingFile, stringsAsFactors = FALSE))
dtTrainSubjects <- tbl_df(read.table(subjectTrainingFile, stringsAsFactors = FALSE))

# combine the test and training data tables
dtAllData <- rbind(dtTestData, dtTrainData)
dtAllActivity <- rbind(dtTestActivity, dtTrainActivity)
dtAllSubjects <- rbind(dtTestSubjects, dtTrainSubjects)

# name the columns for the combined data tables
colnames(dtAllData) <- dtVariables$variableName
colnames(dtAllActivity) <- c("activityID")
colnames(dtAllSubjects) <- c("subjectID")

# bind the activity, subject, and data columns into a single data table
dtFullData <- cbind(dtAllActivity, dtAllSubjects, dtAllData)

# pattern to use to subset the table according to matching column names
# keep "activityID, subjectID, and all columns with "-mean()" or -std()
pattern <- c("^activityID$", "^subjectID$", "-mean\\(\\)", "-std\\(\\)")

# subset the full data table grabbing the columns that match the pattern
dtData <- dtFullData[, grep(paste(pattern, collapse = "|"), names(dtFullData))]

# rename the columns to be more descriptive by substituting abbreviations
# with more descriptive terms using gsub
#   1. names starting with a 't' are Time measures
#   2. names starting with an 'f' are Frequency measures
#   3. Acc measures Acceleration
#   4. Gyro mesures Angular Velocity
#   5. Mag indicates Magnitude
#   6. names ending in X, Y, or Z are axis specific so label it so
#   7. if name has "-mean()" move "mean" to start of name
#   8. if name has "-std()" move "stdev" to start of name
#   9. some names have "Body" repeated despite documentation so get rid of one
#  10. finally remove any remaining -'s
dataNames <- names(dtData)
dataNames <- gsub("^t", "Time", dataNames)
dataNames <- gsub("^f", "Frequency", dataNames)
dataNames <- gsub("Acc", "Acceleration", dataNames)
dataNames <- gsub("Gyro", "AngularVelocity", dataNames)
dataNames <- gsub("Mag", "Magnitude", dataNames)
dataNames <- gsub("([XYZ])$", "\\1Axis", dataNames)
dataNames <- gsub("(.+)-mean\\(\\)(.*)", "mean\\1\\2", dataNames)
dataNames <- gsub("(.+)-std\\(\\)(.*)", "stdev\\1\\2", dataNames)
dataNames <- gsub("(Body){2}", "\\1", dataNames)
dataNames <- gsub("-", "", dataNames)

# rename the dtData columns based on the updated dataNames
colnames(dtData) <- dataNames

# apply the activity labels by merging on "activityID"
dtData <- merge(dtActivityLabels, dtData, by = "activityID", all.x = TRUE)

# aggregate the data into a summary table
dfAggregate <- aggregate(. ~ subjectID - activityName , data = dtData, mean)

# arrange the aggregate data frame into a summary data table 
dtSummaryData <- tbl_df(arrange(dfAggregate, subjectID, activityName))

write.table(dtSummaryData, "./UCI_HAR_means_analysis-tidy.txt", row.names = FALSE)
write.csv(dtSummaryData, "./UCI_HAR_means_analysis-tidy.csv", row.names = FALSE)

