# helper function to read data from file
read_table <- function(filename) {
  read.table(filename, stringsAsFactors=FALSE)
}

# require the dplyr library
library(dplyr)

# Get the activities from the test and the  train datasets and combine them
test_activities <- read_table('./data/test/y_test.txt')
train_activities <- read_table('./data/train/y_train.txt')
activities <- rbindlist(list(test_activities, train_activities))

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

# creates a new data frame with the activity labels and id
labels <- data.frame(read_table('./data/activity_labels.txt'))
colnames(labels) <- c('activity_id', 'activity')

# merge data with labels to get descriptive activity names
df <- merge(labels, df)

# convert the data frame to tbl_df from the dplyr library
df <- tbl_df(df)

# select columns activity, all that contains mean and std and remove angle
df <- select(df, activity, contains('mean'), contains('std'), -contains('angle'))

# group by activity and calculate the mean for all columns except activity
by_activity <- df %>% group_by(activity) %>% summarise_each(funs(mean), -contains('activity'))

# write the cleaned dataset to txt
write.table(by_activity, 'by_activity.txt', row.names=FALSE)
