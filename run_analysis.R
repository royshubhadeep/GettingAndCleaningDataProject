run_analysis <- function() {

##  This script has been written with the assumption that the dataset has been 
##  downloaded in the folder "UCI HAR Dataset" and the working directory has been
##  set to this directory.

    
##  Read file "activity_labels.txt" and assign row names
activity_labels = read.csv("activity_labels.txt", sep = "", header = FALSE)
names(activity_labels) = c("ActivitySeq", "Activity")


##  Read file "features.txt" and assign row names
features = read.csv("features.txt", sep = "", header = FALSE)
names(features) = c("FeatureSeq", "Features")


##  Read file "subject_test.txt", "y_test.txt" & "x_test.txt" and assign row names
subject_test = read.csv(".//test//subject_test.txt", sep = "", header = FALSE)
y_test = read.csv(".//test//y_test.txt", sep = "", header = FALSE)
x_test = read.csv(".//test//x_test.txt", sep = "", header = FALSE)

names(subject_test) = c("Subject")
names(y_test) = c("ActivitySeq")
names(x_test) <- features$Features


##  Read file "subject_train.txt", "y_train.txt" & "x_train.txt" and assign row names
subject_train = read.csv(".//train//subject_train.txt", sep = "", header = FALSE)
y_train = read.csv(".//train//y_train.txt", sep = "", header = FALSE)
x_train = read.csv(".//train//x_train.txt", sep = "", header = FALSE)

names(subject_train) = c("Subject")
names(y_train) = c("ActivitySeq")
names(x_train) <- features$Features


##  Combine the columns of x, subject and y for the Test and Train datasets
test_data = cbind(x_test, subject_test, y_test)
train_data = cbind(x_train, subject_train, y_train)


##  Merge the Train and Test datasets
proj_data = rbind(train_data, test_data)
names(proj_data) = 1:563


##  Extract only the measurements on the "mean" and "std" columns from the dataset
proj_data = select(proj_data, 1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 562:563)


##  Use descriptive activity names to name the activities in the data set
proj_data = merge(proj_data, activity_labels, by.x="563", by.y="ActivitySeq", all=FALSE)


##  Appropriately label the data set with descriptive variable names
names(proj_data) = c("ActivitySeq", "tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ", "tBodyAccStdX", "tBodyAccStdY", "tBodyAccStdZ", "tGravityAccMeanX", "tGravityAccMeanY", "tGravityAccMeanXZ", "tGravityAccStdX", "tGravityAccStdY", "tGravityAccStdZ", "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ", "tBodyAccJerkStdX", "tBodyAccJerkStdY", "tBodyAccJerkStdZ", "tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ", "tBodyGyroStdX", "tBodyGyroStdY", "tBodyGyroStdZ", "tBodyGyroJerkMeanX", "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkStdX", "tBodyGyroJerkStdY", "tBodyGyroJerkStdZ", "tBodyAccMagMean", "tBodyAccMagStd", "tGravityAccMagMean", "tGravityAccMagStd", "tBodyAccJerkMagMean", "tBodyAccJerkMagStd", "tBodyGyroMagMean", "tBodyGyroMagStd", "tBodyGyroJerkMagMean", "tBodyGyroJerkMagStd", "fBodyAccMeanX", "fBodyAccMeanY", "fBodyAccMeanZ", "fBodyAccStdX", "fBodyAccStdY", "fBodyAccStdZ", "fBodyAccJerkMeanX", "fBodyAccJerkMeanY", "fBodyAccJerkMeanZ", "fBodyAccJerkStdX", "fBodyAccJerkStdY", "fBodyAccJerkStdZ", "fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ", "fBodyGyroStdX", "fBodyGyroStdY", "fBodyGyroStdZ", "fBodyAccMagMean", "fBodyAccMagStd", "fBodyBodyAccJerkMagMean", "fBodyBodyAccJerkMagStd", "fBodyBodyGyroMagMean", "fBodyBodyGyroMagStd", "fBodyBodyGyroJerkMagMean", "fBodyBodyGyroJerkMagStd", "Subject", "ActivityLabel")


##  Create an independent tidy data set with the average of 
##  each variable for each activity and each subject
proj_data = group_by(proj_data, ActivityLabel, Subject)

project_data = summarise(proj_data, mean(tBodyAccMeanX), mean(tBodyAccMeanY), mean(tBodyAccMeanZ), mean(tBodyAccStdX), mean(tBodyAccStdY), mean(tBodyAccStdZ), mean(tGravityAccMeanX), mean(tGravityAccMeanY), mean(tGravityAccMeanXZ), mean(tGravityAccStdX), mean(tGravityAccStdY), mean(tGravityAccStdZ), mean(tBodyAccJerkMeanX), mean(tBodyAccJerkMeanY), mean(tBodyAccJerkMeanZ), mean(tBodyAccJerkStdX), mean(tBodyAccJerkStdY), mean(tBodyAccJerkStdZ), mean(tBodyGyroMeanX), mean(tBodyGyroMeanY), mean(tBodyGyroMeanZ), mean(tBodyGyroStdX), mean(tBodyGyroStdY), mean(tBodyGyroStdZ), mean(tBodyGyroJerkMeanX), mean(tBodyGyroJerkMeanY), mean(tBodyGyroJerkMeanZ), mean(tBodyGyroJerkStdX), mean(tBodyGyroJerkStdY), mean(tBodyGyroJerkStdZ), mean(tBodyAccMagMean), mean(tBodyAccMagStd), mean(tGravityAccMagMean), mean(tGravityAccMagStd), mean(tBodyAccJerkMagMean), mean(tBodyAccJerkMagStd), mean(tBodyGyroMagMean), mean(tBodyGyroMagStd), mean(tBodyGyroJerkMagMean), mean(tBodyGyroJerkMagStd), mean(fBodyAccMeanX), mean(fBodyAccMeanY), mean(fBodyAccMeanZ), mean(fBodyAccStdX), mean(fBodyAccStdY), mean(fBodyAccStdZ), mean(fBodyAccJerkMeanX), mean(fBodyAccJerkMeanY), mean(fBodyAccJerkMeanZ), mean(fBodyAccJerkStdX), mean(fBodyAccJerkStdY), mean(fBodyAccJerkStdZ), mean(fBodyGyroMeanX), mean(fBodyGyroMeanY), mean(fBodyGyroMeanZ), mean(fBodyGyroStdX), mean(fBodyGyroStdY), mean(fBodyGyroStdZ), mean(fBodyAccMagMean), mean(fBodyAccMagStd), mean(fBodyBodyAccJerkMagMean), mean(fBodyBodyAccJerkMagStd), mean(fBodyBodyGyroMagMean), mean(fBodyBodyGyroMagStd), mean(fBodyBodyGyroJerkMagMean), mean(fBodyBodyGyroJerkMagStd))


##  Cleanup
rm("activity_labels")
rm("features")
rm("subject_test")
rm("x_test")
rm("y_test")
rm("subject_train")
rm("x_train")
rm("y_train")
rm("test_data")
rm("train_data")

}
