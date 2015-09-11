# UCI HAR Dataset Cleaner

The goal for this project is to produce a tidy and clean dataset from the data "_Human Activity Recognition Using Smartphones Data Set_" available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


1. If not already downloaded the script downloads the zip archive and extracts it to `./data`.


1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
