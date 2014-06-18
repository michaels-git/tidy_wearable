#library(data.table)
# get data
filename <- "dataset.zip"
if(!file.exists(filename)) {
print("the file does not appear to have been downloaded... start download")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = fileURL, destfile = filename, method = "wget")
}
# extract zip file
#temp <- tempfile()
#download.file(url = filename, destfile = temp, method = "wget")
#data <- read.table(unz(filename, "a1.dat"))
#unlink(temp)
unzip(filename)
