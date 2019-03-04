This is a readme file for Getting and Cleaning Data Course Project.

CodeBook.md is a code book that describes the variables, the data sets, and any work that I have performed to clean up the data.


run_analysis.R executes the steps instructed in the course project:

      1. Download dataset and unzip it.

      2. Load sets of files for test and train into r with column names.

      3. Combine each sets of test and train respectively.

      4. Merge test and train sets into one data set.

      5. Extracts only the measurements on the mean and standard deviation for each measurement.

      6. Load activity_labels.txt file into r and use descriptive activity names to name the
       activities in the dataset.

      7. Appropriately labels the data set with descriptive variable names.

      8. From the extracted data set, creates a second, independent tidy data set with the average of each variable for each activity and each student.


tidydata.txt is the final data set resulted from taking the above described steps.
