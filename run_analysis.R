##The R script run_analysis does the following:
##1. Merges the training and test data sets to create one data set
##2. Extracts the mean and standard deviation for each measurement
##3. Uses descriptive names for activity variables in the data set
##4. Labels the data (columns) with the descriptive variable names
##5. From the tidy data create a second, independent tidy data set
## with average of each variable for each activity and subject


##download and unzip the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download <- download.file(fileUrl, destfile = "./data/dataset.zip")

##unzip the dataset in the /data directory
unzip(zipfile = "./data/dataset.zip", exdir = "./data")

##read in required files as individual data tables from the unzipped folder UCI HAR Dataset
##read training tables
## x data sets are the data sets 
## y data sets are labels (activities)

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)
activitylabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

##combine training and test datasets for each file type (x, y and subject)
##add test data to end of training datasets by appending rows of test to train

data_x <- rbind(x_train, x_test)
data_y <- rbind(y_train, y_test)
data_subject <- rbind(subject_train, subject_test)

## assign column names to tables
colnames(data_x) <- features[,2]
colnames(data_y) <- c("activityID")
colnames(data_subject) <- c("subject")
colnames(activitylabels) <- c("activityID", "activityType")

##combine datasets into one table
combined_data <- cbind(data_subject, data_y)
final_data <- cbind(data_x, combined_data)

##subset features to identify measurements of "mean()" and "std()"
mean_std <- grepl("subject|activityID|mean|std", colnames(final_data))

data_mean_std <- final_data[,mean_std == TRUE]

##add descriptive activity names to activityID by merging with activitylabels to get activityType
data_mean_std_names <- merge(data_mean_std, activitylabels, by = "activityID", all.x = TRUE)

## appropriately label the data set with descriptive variable names
## substitute acronyms for full words

names(data_mean_std_names) <- gsub("^t", "timeDomain", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("^f", "frequencyDomain", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("Acc", "Accelerometer", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("Gyro", "Gyroscope", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("Mag", "Magnitude", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("Freq", "Frequency", names(data_mean_std_names))
names(data_mean_std_names) <- gsub("std", "standardDeviation", names(data_mean_std_names))

##make a second tidy data set with the average of each variable for each activity and each subject
library(dplyr)
tidy2 <- aggregate(. ~subject + activityType, data_mean_std_names, mean)
tidy2 <- tidy2[order(tidy2$subject, tidy2$activityType),]

##write the second tidy data set to a txt file
write.table(tidy2, "tidy_data.txt", row.names = FALSE, quote = FALSE)