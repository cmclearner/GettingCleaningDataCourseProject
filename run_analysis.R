##download dataset and unzip it

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
destfile="dataset.zip")
unzip("dataset.zip")

## load sets of files for test and train into r with column names

features <- read.table("UCI HAR Dataset/features.txt", col.names=c("number", "stats"))

subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "volunteer")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$stats)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")

subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "volunteer")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$stats)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

##Combine each set of test and train respectively

test <- cbind(subjecttest, ytest, xtest)
train <- cbind(subjecttrain, ytrain, xtrain)

## merge test and training sets into one data set

mergeddata <- rbind(train, test)


## Extracts only the measurements on the mean and standard deviation for each measurement.

library(dplyr)
extractdata <- select(mergeddata, volunteer, label, contains("mean"), contains("std"))


## Use descriptive activity names to name the activities in the dataset

activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("label", "activity"))

extractdata$label <- activitylabels[extractdata$label, 2]

## Appropriately labels the data set with descriptive variable names

colnames(extractdata)[2] <- "activity"
colnames(extractdata) <- gsub("^t", "Time", colnames(extractdata))
colnames(extractdata) <- gsub("Acc", "Accelermeter", colnames(extractdata))
colnames(extractdata) <- gsub("Gyro", "Gyroscope", colnames(extractdata))
colnames(extractdata) <- gsub("Mag", "Magnitude", colnames(extractdata))
colnames(extractdata) <- gsub("^f", "Frequency", colnames(extractdata))

## From the extracted data set, creates a second, independent tidy data set 
## with the average of each variable for each activity and each student.

tidydata <- group_by(extractdata, volunteer, activity) %>%
		summarize_all(funs(mean(., na.rm=TRUE)))

write.table(tidydata, "tidydata.txt", row.names = FALSE)

