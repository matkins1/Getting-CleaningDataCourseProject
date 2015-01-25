##1 Merges the training and the test sets to create one data set, 3 Uses descriptive activity names to name the activities in the data set, and 4 Appropriately labels the data set with descriptive variable names. 

train_data <- read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/train/X_train.txt") ## insert location of train data file (X_train.txt) in quotations - imports train data to train_data

train_data_activity_number <- c(read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/train/y_train.txt")) ## insert location of train activity number file (y_train.txt) in quotations - train activity number data to train_data_activity_number vector

train_data[,"activity_number"] <- train_data_activity_number ## appends train_data_activity_number column bnamed "activity_number" to train_data

train_subject_test <- c(read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/train/subject_train.txt")) ## insert subject number from subject train file (subject_train.txt) in quotations - subject train number data to train_subject_test vector

train_data[,"subject_number"] <- train_subject_test ## appends train_subject_test column named "subject_number" to train_data

test_data <- read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/test/X_test.txt") ## insert location of test data file (X_test.txt) in quotations - imports test data to test_data

test_data_activity_number <- c(read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/test/y_test.txt")) ## insert location of test activity number file (y_test.txt) in quotations - test activity number data to test_data_activity_number vector

test_data[,"activity_number"] <- test_data_activity_number ## appends test_data_activity_number column named "activity_number" to test_data

test_subject_test <- c(read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/test/subject_test.txt")) ## insert subject number from subject test file (subject_test.txt) in quotations - subject test number data to test_subject_test vector

test_data[,"subject_number"] <- test_subject_test ## appends test_subject_test column named "subject_number" to test_data

variable_names <- read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/features.txt") ## insert location of variable name file in quotations - features.txt (vector of variable names) to variable_names

variable_names <- variable_names[,2] ## subset variable names

colnames(train_data) <- variable_names ## rename columns in train_data with variable_names

colnames(test_data) <- variable_names ## rename columns in test_data with variable_names

colnames(train_data)[562] <- "activity_number" ## renames column to "activity_number"

colnames(test_data)[562] <- "activity_number" ## renames column to "activity_number"

colnames(train_data)[563] <- "subject_number" ## renames column to "subject_number"

colnames(test_data)[563] <- "subject_number" ## renames column to "subject_number"

merge_data <- rbind(test_data, train_data) ## merges training and testing data sets to merge_data 

activity_labels <- read.table("C:/Users/Default.Default-PC/Desktop/R/UCI HAR Dataset/activity_labels.txt") ## insert location of activity lables file (activity_labels.txt) in qhotations = activity labels to activity_lables

colnames(activity_labels)[1] <- "activity_number" ## renames first column of activity_labels to "activity_number" for merging with merge_data

colnames(merge_data)[562] <- "activity_number" ## renames new activity number column of merge_data to "activity_number"

merge_data <- merge(merge_data, activity_labels, by="activity_number") ## add activity names to merge_data

colnames(merge_data)[564] <- "activity_name" ## renames new activity names column of merge_data to "activity_name"

rm(activity_labels, test_data, train_data, test_data_activity_number, train_data_activity_number, variable_names, train_subject_test, test_subject_test) ## remove unused data

##2 Extracts only the measurements on the mean and standard deviation for each measurement

measurement_means <- colMeans(merge_data) ## extracts the mean for each measurement

measurement_sd <- sapply(merge_data, sd) ## extracts the standard deviation for each measurement

##5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

install.packages("plyr") ## install "plyr" package
library(plyr) ## load "plyr" package
tidy_data <- ddply(merge_data, c("subject_number", "activity_name"), function(x) colMeans(x[c(2:562)])) ## create tidy data set by summarizing column means by subject_number and activity_name
