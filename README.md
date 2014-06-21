tidy_wearable
=============
This repo contains R code to download and clean data from an experiment using wearable computers.  The code is contained in a single script: run_analysis.R.  This code performs the following:  

1. downloads data, which are in a zip file  
1. unzips the zip file  
1. reads in the data, in 8 parts:
   - feature names
   - test data measurements
   - test data activities
   - test data subjects
   - training data measurements
   - training data activities
   - training data subjects
   - activity names
1. combines these 8 parts into a single matrix
1. subsets the data set to reduce the variables to only those that are means and standard deviations of the smartphone measurements
1. calculates the average of the measurements for each subject and activity; this becomes the tidy data set
1. writes this tidy data set to a comma-separated-values file  

In addition, this repo contains the code book CodeBook.md, which describes the data, the subsetting and transformations that were performed, and the variables in the tidy data set.