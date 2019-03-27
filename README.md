# getting_and_cleaning_data
This project was created as per the final assignment requirement of Getting and Cleaning Data course. 
The dataset has been derived from a series of experiments.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The Sensor data has been loaded into X variable with X_train and X_test representing training and test sets. Rbind has been used to combine training and test data sets. Similarly activity identifier ID and subject have been loaded in variable Y  and Sub respectively with similar naming conventions. 
The names of the columns for X variables have been extracted from the feature.txt file and the activity identifier name, from activity_label.txt.
Each variable X,Y,Z have been merged separately into (X|Y|Sub)_merged variables which have been finally merged into merged_all variable from which means have been calculated on the data based on each activity and each subject (stored in merged_mean).
The final tidy data was dumped into tidy_data.txt.

The script run_analysis.R complies to the following requirements:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
