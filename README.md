This is a readme file for Getting and Cleaning Data Course Project. (Clara Myonghee Choi)

1. Download dataset and unzip it.
2. Load sets of files for test and train into r with column names.
  ** The second column components of features.txt file become variables of X_test and X_train observations.
      features <- read.table("UCI HAR Dataset/features.txt", col.names=c("number", "stats"))

      subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "volunteer")
      xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$stats)
      ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")

      subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "volunteer")
      xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$stats)
      ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

3. Combine each sets of test and train respectively.
      test <- cbind(subjecttest, ytest, xtest)
      train <- cbind(subjecttrain, ytrain, xtrain)

4. Merge test and train sets into one data set.
      mergeddata <- rbind(train, test)

5. Extracts only the measurements on the mean and standard deviation for each measurement.
      extractdata <- select(mergeddata, volunteer, label, contains("mean"), contains("std"))

6. Load activity_labels.txt file into r and use descriptive activity names to name the activities in the dataset.
      activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("label", "activity"))
      extractdata$label <- activitylabels[extractdata$label, 2]

7. Appropriately labels the data set with descriptive variable names.
      colnames(extractdata)[2] <- "activity"
      colnames(extractdata) <- gsub("^t", "Time", colnames(extractdata))
      colnames(extractdata) <- gsub("Acc", "Accelermeter", colnames(extractdata))
      colnames(extractdata) <- gsub("Gyro", "Gyroscope", colnames(extractdata))
      colnames(extractdata) <- gsub("Mag", "Magnitude", colnames(extractdata))
      colnames(extractdata) <- gsub("^f", "Frequency", colnames(extractdata))

8. From the extracted data set, creates a second, independent tidy data set with the average of each variable for each activity and each student.
      tidydata <- group_by(extractdata, volunteer, activity) %>%
		              summarize_all(funs(mean(., na.rm=TRUE)))
