options(warn=-1)

# helper function to read data from file
read_table <- function(filename) {
  read.table(filename, stringsAsFactors=FALSE)
}

library(httr)

if (!file.exists('./data')) {
  print("Downloading dataset, please be patient it's a large file...")
  file <- GET('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
               write_disk('./uci_har_dataset.zip'))

  unzip('./uci_har_dataset.zip')
  print("Unzipping dataset...")
  file.rename('./UCI HAR Dataset', './data')
  unlink('./uci_har_dataset.zip')
}

library(data.table)
# require the dplyr library
library(dplyr)

# Get the activities from the test and the train datasets and combine them
print("Merging data...")
test_activities <- read_table('./data/test/y_test.txt')
train_activities <- read_table('./data/train/y_train.txt')
activities <- rbindlist(list(test_activities, train_activities))

test_subjects <- read_table('./data/test/subject_test.txt')
train_subjects <- read_table('./data/train/subject_train.txt')
subjects <- rbindlist(list(test_subjects, train_subjects))

# Get the measurements from the test and the train datasets and combine them
test <- read_table('./data/test/X_test.txt')
train <- read_table('./data/train/X_train.txt')
data <- rbindlist(list(test, train))

# create a data frame with the measurements data
df <- data.frame(data, stringsAsFactors=FALSE)

# Get all the different measurements and use them as column names
headers <- read_table('./data/features.txt')
colnames(df) <- headers[, 2]

# add a column to the measurements data frame with the type of activity
df$activity_id <- unlist(activities)
df$subject <- unlist(subjects)

head(df)

# creates a new data frame with the activity labels and id
labels_list <- read_table('./data/activity_labels.txt')
labels_list[, 2] <- tolower(labels_list[, 2])
labels <- data.frame(labels_list)
colnames(labels) <- c('activity_id', 'activity')

# merge data with labels to get descriptive activity names
df <- merge(labels, df)

# convert the data frame to tbl_df from the dplyr library
df <- tbl_df(df)

# select columns activity, all that contains mean and std and remove angle
print("Cleaning data...")
df <- select(df, activity, subject, matches("\\S*-(std|mean)\\(\\)-(X|Y|Z)"))

# Adds descriptive colnames
colnames(df) <- gsub("Body","body_", colnames(df))
colnames(df) <- gsub("Acc","acceleration_", colnames(df))
colnames(df) <- gsub("-std\\(\\)-","standard_deviation_", colnames(df))
colnames(df) <- gsub("Gravity","gravity_", colnames(df))
colnames(df) <- gsub("Jerk","jerk_", colnames(df))
colnames(df) <- gsub("Gyro","gyro_", colnames(df))
colnames(df) <- gsub("-mean\\(\\)-","mean_", colnames(df))
colnames(df) <- gsub("^t","time_", colnames(df))
colnames(df) <- gsub("^f","fft_", colnames(df))
colnames(df) <- tolower(colnames(df))

# group by activity and calculate the mean for all columns except activity
by_activity_and_subject <- df %>% group_by(activity, subject) %>% summarise_each(funs(mean), -contains('activity'), -contains('subject'))

# write the cleaned dataset to txt
print("Writing cleaned dataset to file 'tidy_dataset.csv'...")
write.table(by_activity_and_subject, 'tidy_dataset.txt', row.names=FALSE)

options(warn=1)
