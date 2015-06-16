## Load packages
library(plyr)


# 1 - Merge training and test sets ----------------------------------------

## Import the training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Import the test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merge training and testing data
x_train_test <- rbind(x_train, x_test)
y_train_test <- rbind(y_train, y_test)
subject_train_test <- rbind(subject_train, subject_test)

# Note: these three sets (x_train_test, y_train_test & subject_train_test) will be merged
# together into one dataset step by step (see steps 2 - 5 below). 


# 2 - Extract measurements on the mean and std ----------------------------

## Import features
features <- read.table("UCI HAR Dataset/features.txt")

## Do a grep to identify the appropriate columns
selected_features <- grep("(mean|std)\\(\\)", features[, 2])

## Subset the data
x_train_test <- x_train_test[, selected_features]


# 3 - Name the activities in the dataset ----------------------------------

## Import activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Name activities in dataset
y_train_test[, 1] <- activity_labels[y_train_test[, 1], 2]
names(y_train_test) <- "Activity"


# 4 - Label the dataset with descriptive variable names -------------------

## Label the x_train_set data.frame
names(x_train_test) <- features[selected_features, 2]

## Name the column of subject_train_test
names(subject_train_test) <- "Subject"

## Merge all data together
dataset <- cbind(subject_train_test, y_train_test, x_train_test)


# 5 - Create new "average" dataset ----------------------------------------

# Create new dataset containing the averages of each variable for each activity for each subject
avg_dataset <- ddply(dataset, .(Subject, Activity), function(x) {colMeans(x[, 3:68])})

## Export result
write.table(avg_dataset, "dataset.txt", row.names = FALSE)