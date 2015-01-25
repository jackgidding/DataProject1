## run_analysis.R
## Author: Jack Gidding
## 

## Purpose: run_analysis.R reads in the UCI Human Activity Recognition 
##          Smartphone data set and processes it to create a tidy data set
##          with the mean of 78 telemetry variables for 30 volunteers over 
##          six activities. The project that collected the data is at:
##          http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##          The data collected by the project is at:
##          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## Notes:   Please see the README.md and CodeBook.md for further information

# Check for reshape2 library and load if not present
if (!require(reshape2)) {
  install.packages(reshape2)
}
library(reshape2)

# Check for the availability of the dataset
if (!file.exists("./UCI HAR Dataset")) {
  stop("Dataset not present.")
}

# Read the subject dataset into memory and set the names
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_data <- rbind(subj_test, subj_train)
subject_names = c("subject")
names(subject_data) = subject_names

# Remove test and train datasets to conserve memory
remove(subj_test, subj_train)

# Read the X data into memory and process columns
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_data <- rbind(X_test, X_train)
X_names <- read.table("./UCI HAR Dataset/features.txt")[,2]
names(X_data) = X_names
X_data <- X_data[,grepl("mean|std", X_names)]
  
# Remove test and train datasets to conserve memory
remove(X_test, X_train)

# Read the Y data into memory and process columns
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
Y_data <- rbind(Y_test, Y_train)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
Y_data[,2] = activity_labels[Y_data[,1]]
Y_names = c("activityID", "activity")
names(Y_data) = Y_names

# Remove test and train datasets to conserve memory
remove(Y_test, Y_train)

# Merge all data into one data.frame
Merged_data = cbind(subject_data, Y_data, X_data)

# Remove pre-merged datasets to conserve memory
remove(subject_data, Y_data, X_data)

# Reshape the data and create the tidy data set
id_labels = c(subject_names, Y_names)
measure_labels = setdiff(colnames(Merged_data), id_labels)
melt_data = melt(Merged_data, id_labels, measure.vars=measure_labels)
tidyset <- dcast(melt_data, subject + activity ~ variable, mean)

# Write the tidy data set to a file
write.table(tidyset, row.names=FALSE, file="./UCI_HAR_tidy_data.txt")

