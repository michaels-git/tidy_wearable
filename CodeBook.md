code book for tidy data set of wearable data
===
data
---
The data are measurements collected from 1) accelerometers, and 2) gyroscopes on Samsung smartphones.  The smartphones were worn by anonymous volunteer subjects who engaged in six different activities at distinct times.  Each record contains pre-processed values derived from the accelerometer and gyroscope measurements from one subject during a distinct activity.  The pre-processing included calculation of means and standard deviations.  There are multiple measurements for each subject for each activity.
subsetting and transformations
---
The tidy data set was subset to contain only the means and standard deviations of the accelerometer and gyroscope measurements.
The values for each subject during each activity were averaged, and the tidy data set contains only these averages.
variables
---
|variable name|description|units/range of values|
|:---|:---|:---|
|activitylabel|textual description of the activity|WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|
|subject|identifier of the anonymous subject|integer|
|[measurements]|see below for explanation of measured variables|normalized and bounded within [-1,1]|
### measurement description
|variable-name part|types|explanation|
|:---|:---|:---|
|1 (first character)|t|time-domain signal|
||f|fast-fourier transform|
|2|BodyAcc|body accelerometer measurement
||GravityAcc|gravity accelerometer measurement
||BodyAccJerk|body accelerometer measurement, jerk signal
||BodyGyro|gyroscope measurement
||BodyGyroJerk|gyroscope measurement, jerk signal
||BodyAccMag|body accelerometer measurement, magnitude of Euclidian norm
||GravityAccMag|gravity accelerometer measurement, magnitude of Euclidian norm
||BodyAccJerkMag|body accelerometer measurement, jerk signal, magnitude of Euclidian norm
||BodyGyroMag|gyroscope measurement, magnitude of Euclidian norm
||BodyGyroJerkMag|gyroscope measurement, jerk signal, magnitude of Euclidian norm
||BodyBodyAccJerkMag|body accelerometer measurement, jerk signal, magnitude of Euclidian norm, additional body measurement
||BodyBodyGyroMag|gyroscope measurement, magnitude of Euclidian norm, additional body measurement
||BodyBodyGryoJerkMag|gyroscope measurement, jerk signal, magnitude of Euclidian norm, additional body measurement
|3|mean|mean of measurements
||std|standard deviation of measurements
|4 (where applicable)|X|measurement in X direction|
||Y|measurement in Y direction|
||Z|measurement in Z direction|
reference
---
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  
See also: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
The data were downloaded from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
