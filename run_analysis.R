library(dplyr)


# read data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description
column_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activityId","activity")


# 1 Merges the training and the test sets to create one data set
X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)
Sub_merged <- rbind(sub_train, sub_test)

# Assigning column names:
colnames(X_merged) <- column_names[,2] 
colnames(Y_merged) <-"activityId"
colnames(Sub_merged) <- "subjectId"

# 2 Extracts only the measurements on the mean and standard deviation for each measurement
cols_selected <- column_names[grep("mean|std",column_names[,2]),]
X_merged <- X_merged[,cols_selected[,1]]

# 3 Uses descriptive activity names to name the activities in the data set

Y_merged$activity_name <- factor(Y_merged$activityId, labels = as.character(activity_labels[,2]))
activity_name_ <- Y_merged$activity_name

# 4 Appropriately labels the data set with descriptive variable names.
colnames(X_merged) <- column_names[cols_selected[,1],2]

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

merged_all <- cbind(X_merged,activity_name_,Sub_merged)
merged_mean <- merged_all %>% group_by(activity_name_,subjectId) %>% summarise_all(funs(mean))

#write final tidy data

write.table(merged_mean, file = "./tidy_data.txt",col.names = TRUE)

