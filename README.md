# GettingAndCleaningDataProject
Repo for Project Work of Getting and Cleaning Data

##R script - "run_analysis.R
This script has been written with the assumption that the dataset has been downloaded in the folder "UCI HAR Dataset" and the working directory has been set to this directory.

Steps-
1. Read file "activity_labels.txt" and assign row names
2. Read file "features.txt" and assign row names
3. Read files "subject_test.txt", "y_test.txt" & "x_test.txt" and assign row names
4. Read files "subject_train.txt", "y_train.txt" & "x_train.txt" and assign row names
5. Combine the columns of x, subject and y for the Test and Train datasets
6. Merge the Train and Test datasets
7. Extract only the measurements on the "mean" and "std" columns from the dataset
8. Use descriptive activity names to name the activities in the data set
9. Appropriately label the data set with descriptive variable names
10. Create an independent tidy data set with the average of each variable for each activity and each subject
11. Cleanup the intermediate files/objects
