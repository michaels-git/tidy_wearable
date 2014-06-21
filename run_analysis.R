# see the accompanying files README.md and CodeBook.md for more
# information on the data and function of this script

# get data, checking first if it has already been downloaded
filename <- "dataset.zip"
if(!file.exists(filename)) {
print("the file does not appear to have been downloaded... start download")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileURL, destfile = filename, method = "wget")
}
# extract zip file, checking first if it has already been extracted
if(!file.exists("UCI HAR Dataset")) {
unzip(filename)
}

# read in the column names for the "featues"... column "V1" is just a
# sequence number, but V2 has the text of the column names (use the
# latter to provide variable names to the main set of data)
feature_names <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
# clean up the column names by removing problematic characters
feature_names$V2 <- gsub("-", "", feature_names$V2)
feature_names$V2 <- gsub(",", "", feature_names$V2)
feature_names$V2 <- gsub("\\)", "", feature_names$V2)
feature_names$V2 <- gsub("\\(", "", feature_names$V2)
# create a vector for all column names (including the subjects and
# activities)
column_names <- c("subject", "activity", feature_names$V2)

# read in measurement data... the data comprise three parts:
#    1) subjects
#    2) activities
#    3) measurements

# first get "test" data by reading in subjects, activities, and
# measurements into data frames, and then merging them
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
test_measurements <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_data <- cbind(test_subjects, test_activities, test_measurements)

# next get the "training" data by reading in subjects, activities, and
# measurements into data frames, and then merging them
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
train_measurements <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_data <- cbind(train_subjects, train_activities, train_measurements)

# "merge" these two main data sets... note that although the
# instrutions use the term "merge," what seems to be intended was to
# appending the two data sets... also, use the column_names that were
# read in earlier to give variable names to the columns
combined <- rbind(test_data, train_data)
names(combined) <- column_names

# subset the data set by selecting only those columns that are desired
# ... these are the mean, standard deviation, the subject and
# activity
sel_column_names <- column_names[grep("subject|activity|mean$|mean[^Freq]|std",column_names)]
subset <- combined[, sel_column_names]

# replace the activity codes with their descriptive names: read in the
# activity labels and then merge with data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE, col.names = c("activitylabelid", "activitylabel"))
subset <- merge(activity_labels, subset, by.x = "activitylabelid", by.y = "activity")

# create a tidy data set that is the mean of the measurements for each
# subject and activity
tidy <- aggregate(. ~ activitylabel + subject, data=subset, mean)
# clean up this data set by getting rid of the activity label ID
tidy$activitylabelid <- NULL

# write the tidy data set to csv for uploading
write.table(x=tidy, file="tidy.csv", sep=",", row.names=FALSE, quote=FALSE)
