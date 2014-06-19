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
# read in the column names... V1 is just a sequence number, but V2
# has the text of the column names (use those when reading in the
# data)
column_names <- read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
# clean up the column names a bit
column_names$V2 <- gsub("-", "", column_names$V2)
column_names$V2 <- gsub(",", "", column_names$V2)
column_names$V2 <- gsub("\\)", "", column_names$V2)
column_names$V2 <- gsub("\\(", "", column_names$V2)
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE, col.names = column_names$V2)
training_data <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE, col.names = column_names$V2)
# "merge" the data sets... although the instrutions use the term "merge"
# I believe what is really intended was to append the two data sets
combined <- rbind(test_data, training_data)
sel_column_names <- column_names$V2[grep("mean$|mean[^Freq]|std",column_names$V2)]
subset <- combined[, sel_column_names]
