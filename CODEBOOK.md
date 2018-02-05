# CODEBOOK
This codebook details of the original data being used as well as the additional analysis performed by the `run_analysis.R` code.

## Source
This project is based on the 'Human Activity Recognition Using Smartphones Data Set' provided by the 'UCI Center for Machine Learning and Intelligent Systems.'

A description of the data set can be found at the following web location (also referred to as 'UCI HAR site'):
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data itself can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Set Information (from the UCI HAR site)
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
>
>Check the README.txt file for further details about this dataset.

### Attribute Information (from the UCI HAR site)
>For each record in the dataset it is provided: 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

### Source Data Files
The following is a list and description of the files found in the "UCI HAR Dataset.zip" data set.  The following comes from the README.txt file found in the aforementioned .zip file.

>- 'README.txt'
>- 'features_info.txt': Shows information about the variables used on the feature vector.
>- 'features.txt': List of all features.
>- 'activity_labels.txt': Links the class labels with their activity name.
>- 'train/X_train.txt': Training set.
>- 'train/y_train.txt': Training labels.
>- 'test/X_test.txt': Test set.
>- 'test/y_test.txt': Test labels.
>
>The following files are available for the train and test data. Their descriptions are equivalent. 
>- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
>- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
>- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
>- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Additional Notes From Source Data Set
>- Features are normalized and bounded within [-1,1].
>- Each feature vector is a row on the text file.
>
>For more information about this dataset contact: activityrecognition@smartlab.ws

For additional details on the data set, including license and usage information, refer to the Source files and web site.

### Data Source Features
These are the variables/features found in the data source as described in the `features_info.txt` file found in the data source.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>- tBodyAcc-XYZ
>- tGravityAcc-XYZ
>- tBodyAccJerk-XYZ
>- tBodyGyro-XYZ
>- tBodyGyroJerk-XYZ
>- tBodyAccMag
>- tGravityAccMag
>- tBodyAccJerkMag
>- tBodyGyroMag
>- tBodyGyroJerkMag
>- fBodyAcc-XYZ
>- fBodyAccJerk-XYZ
>- fBodyGyro-XYZ
>- fBodyAccMag
>- fBodyAccJerkMag
>- fBodyGyroMag
>- fBodyGyroJerkMag
>
>
>The set of variables that were estimated from these signals are: 
>
>- mean(): Mean value
>- std(): Standard deviation
>- mad(): Median absolute deviation 
>- max(): Largest value in array
>- min(): Smallest value in array
>- sma(): Signal magnitude area
>- energy(): Energy measure. Sum of the squares divided by the number of values. 
>- iqr(): Interquartile range 
>- entropy(): Signal entropy
>- arCoeff(): Autorregresion coefficients with Burg order equal to 4
>- correlation(): correlation coefficient between two signals
>- maxInds(): index of the frequency component with largest magnitude
>- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>- skewness(): skewness of the frequency domain signal 
>- kurtosis(): kurtosis of the frequency domain signal 
>- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>- angle(): Angle between to vectors.
>
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
>- gravityMean
>- tBodyAccMean
>- tBodyAccJerkMean
>- tBodyGyroMean
>- tBodyGyroJerkMean
>
>
>The complete list of variables of each feature vector is available in 'features.txt'


### Note on Variable Names from Source to Tidy Data
The Tidy Data Set uses descriptive variable names determined by substituting descriptive words for the following abbrevitions used in variable names in the source data set:
- Leading 't' - Time
- Leading 'f' - Frequency
- Acc - Acceleration (standard gravity units 'g')
- Gyro - Angular Velocity (radians/sec)
- Mag - Magnitude

## Transformation and Analysis
The following describes the transformation and analysis performed on the source data set.

### Analysis Workflow (as captured in the run_analysis.R file)
1. Open the Test/Training data set, activities, subjects, features, and activity label files
2. `rbind` the test and training measurements data sets
3. `rbind` the test and training subject data sets
4. `rbind` the test and training activities data set
5. `cbind` the combined subject, activities, and measurements data sets
6. Subset the combined data set to only include the Activity, Subject, and the mean and standard deviation Measurement columns
7. Rename the variable/measurement column names by substituting descriptive names for the abbreviations used in the original variable names
8. Merge the activity labels into the combined data set on the "Activity ID"
9. Aggregate the combined data set taking the mean of each variable column by the Activity and Subject
10. Arrange the aggregated data by Activity, Subject, and the Average Value columns
11. Output the tidy data set as a text file

### Setup
1. Download the data set from the location listed above and unzip the file
2. Locate the run_analysis.R file in the root directory of the source data set (where the README.txt file resides)

### Running The Analysis
Executing run_analysis.R produces a file named 'UHC_HAR_means_analysis-tidy.txt' that represents a tidy data set with the average of each variable for each activity and each subject.



