# Code Book
## Getting and Cleaning Data 
## Course Project

### Data Source

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original Project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Set Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Data Set Contents

The following data files in the source data are used:

Files with descriptive information
  + 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name (Y data).
  + 'UCI HAR Dataset/features.txt': List of all features in the telemetry data (X data).

Data
  + 'UCI HAR Dataset/test/subject_train.txt': Subject providing telemetry data (Training data)
  + 'UCI HAR Dataset/train/X_train.txt': Telemetry (Training data)
  + 'UCI HAR Dataset/train/y_train.txt': Activities (Training data)
  + 'UCI HAR Dataset/test/subject_test.txt': Subject providing telemetry data (Test data)
  + 'UCI HAR Dataset/test/X_test.txt': Telemetry (Test data)
  + 'UCI HAR Dataset/test/y_test.txt': Activities (Test data)

The UCI HAR Dataset/Inertial Signal directory contains x,y,z data for the sensors, which is not used in this study. 

###  Processing

The run_analysis.R script performs the following actions on the dataset:

1. Merge the training and the test sets to create one data set.
2. Extract the mean and standard deviation measurements from the data set. 
3. Name the activities in the data set with descriptive names.
4. Label the data set with descriptive variable names. 
5. Create an independent tidy data set with the average of each variable for each activity and subject.

### Prerequisites

The UCI Human Activity Recognition Smartphone data set must be downloaded
and extracted into the working directory the run_analysis.R script is executed in. The directory must be named the same as in the original dataset, "UCI HAR Dataset". The script will stop executing if the dataset is not found in the working directory.

### Output

The run_analysis.R script will create a new file with the tidy dataset in the current working directory. The filename created is named UCI_HAR_tidy_data.txt 

