#library(data.table)
# get data
filename <- "dataset.zip"
if(!file.exists(filename)) {
print("the file does not appear to have been downloaded... start download")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileURL, destfile = filename, method = "wget")
}
# extract zip file
if(!file.exists("UCI HAR Dataset")) {
unzip(filename)
}
# read in the column names for the "featues"... V1 is just a sequence number, but V2
# has the text of the column names (use those when reading in the
# data)
feature_names <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
# clean up the column names a bit
feature_names$V2 <- gsub("-", "", feature_names$V2)
feature_names$V2 <- gsub(",", "", feature_names$V2)
feature_names$V2 <- gsub("\\)", "", feature_names$V2)
feature_names$V2 <- gsub("\\(", "", feature_names$V2)
# create a vector for all column names (including the subjects and
# activities)
column_names <- c("subject", "activity", feature_names$V2)
# read in measurement data... the data comprises three parts: 1)
# subjects, 2) activities, 3) measurements
# 1st get "test" data
# read in subjects, activities, and measurements into data frames, and
# then merge them
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
test_measurements <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_data <- cbind(test_subjects, test_activities, test_measurements)
# now get the "training" data
# read in subjects, activities, and measurements into data frames, and
# then merge them
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
train_measurements <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_data <- cbind(train_subjects, train_activities, train_measurements)
# "merge" the data sets... although the instrutions use the term "merge"
# I believe what is really intended was to append the two data sets
combined <- rbind(test_data, train_data)
names(combined) <- column_names
sel_column_names <- column_names[grep("subject|activity|mean$|mean[^Freq]|std",column_names)]
subset <- combined[, sel_column_names]
# read in the activity labels merge with data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE, col.names = c("activity_label_id", "activity_label"))
subset <- merge(activity_labels, subset, by.x = "activity_label_id", by.y = "activity")
tidy <- aggregate(. ~ activity_label + subject, data=subset, mean)
