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
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
training_data <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
