# Coursera-Getting-and-Cleaning-Data

README - run_analysis.R

The script run_analysis.R is a routine created to evaluate data collected from the accelerometers from the Samsung Galaxy S smartphone.

The dataset used for this exercise can be retrieved from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data should be saved in your qorking directory in R. If it's saved in a different file, remember to set your working directory using the setwd() fucntion in R.

This routine creates a new data set that merges both training and and test data sets and the selects only the variables that measure mean and standard deviation:
1. Extracts the measurements ("train/X_train.txt" and "test/X_test.txt"), then merges it with the file identifying the subject ("train/subject_train.txt" and "test/subject_test.txt")
2. Labels all measurements taken during the exercise ("features.txt"), as well as identifies the activities using descriptive names for the activities ("activity_labels.txt").
3. Merges both data sets (train and test) - the new data set is called "mydata"
4. Selects only the measurements on the mean and standard deviation for each measurement - the new dataset is called "mydata2"
5. Renames the measurements for easier understanding of the variables

This routine also summarizes the data set per activity and per subject and calculates the average for "mydata2" in a new data set called "averages".

The variables in the data set "mydata2" are:

-activity: each activity is labeled according to the information provided by the file 'activity_labels.txt'
-subject: subjects are identified according to the information on the files "test/subject_test.txt" and "train/subject_train.txt"
-timebodyaccelerometermeanX: corresponds to the time body accelerometer mean X
-timebodyaccelerometermeanY: corresponds to the time body accelerometer mean Y
-timebodyaccelerometermeanZ: corresponds to the time body accelerometer mean Z
-timebodyaccelerometerstdevX: corresponds to the time body accelerometer stdev X
-timebodyaccelerometerstdevY: corresponds to the time body accelerometer stdev Y
-timebodyaccelerometerstdevZ: corresponds to the time body accelerometer stdev Z
-timegravityaccelerometermeanX: corresponds to the time gravity accelerometer mean X
-timegravityaccelerometermeanY: corresponds to the time gravity accelerometer mean Y
-timegravityaccelerometermeanZ: corresponds to the time gravity accelerometer mean Z
-timegravityaccelerometerstdevX: corresponds to the time gravity accelerometer stdev X
-timegravityaccelerometerstdevY: corresponds to the time gravity accelerometer stdev Y
-timegravityaccelerometerstdevZ: corresponds to the time gravity accelerometer stdev Z
-timebodyaccelerometerjerkmeanX: corresponds to the time body accelerometer jerk mean X
-timebodyaccelerometerjerkmeanY: corresponds to the time body accelerometer jerk mean Y
-timebodyaccelerometerjerkmeanZ: corresponds to the time body accelerometer jerk mean Z
-timebodyaccelerometerjerkstdevX: corresponds to the time body accelerometer jerk stdev X
-timebodyaccelerometerjerkstdevY: corresponds to the time body accelerometer jerk stdev Y
-timebodyaccelerometerjerkstdevZ: corresponds to the time body accelerometer jerk stdev Z
-timebodygiroscopemeanX: corresponds to the time body giroscope mean X
-timebodygiroscopemeanY: corresponds to the time body giroscope mean Y
-timebodygiroscopemeanZ: corresponds to the time body giroscope mean Z
-timebodygiroscopestdevX: corresponds to the time body giroscope stdev X
-timebodygiroscopestdevY: corresponds to the time body giroscope stdev Y
-timebodygiroscopestdevZ: corresponds to the time body giroscope stdev Z
-timebodygiroscopejerkmeanX: corresponds to the time body giroscope jerk mean X
-timebodygiroscopejerkmeanY: corresponds to the time body giroscope jerk mean Y
-timebodygiroscopejerkmeanZ: corresponds to the time body giroscope jerk mean Z
-timebodygiroscopejerkstdevX: corresponds to the time body giroscope jerk stdev X
-timebodygiroscopejerkstdevY: corresponds to the time body giroscope jerk stdev Y
-timebodygiroscopejerkstdevZ: corresponds to the time body giroscope jerk stdev Z
-timebodyaccelerometermagmean: corresponds to the time body accelerometer mag mean
-timebodyaccelerometermagstdev: corresponds to the time body accelerometer mag stdev
-timegravityaccelerometermagmean: corresponds to the time gravity accelerometer mag mean
-timegravityaccelerometermagstdev: corresponds to the time gravity accelerometer mag stdev
-timebodyaccelerometerjerkmagmean: corresponds to the time body accelerometer jerk mag mean
-timebodyaccelerometerjerkmagstdev: corresponds to the time body accelerometer jerk mag stdev
-timebodygiroscopemagmean: corresponds to the time body giroscope mag mean
-timebodygiroscopemagstdev: corresponds to the time body giroscope mag stdev
-timebodygiroscopejerkmagmean: corresponds to the time body giroscope jerk mag mean
-timebodygiroscopejerkmagstdev: corresponds to the time body giroscope jerk mag stdev
-frequencybodyaccelerometermeanX: corresponds to the frequency body accelerometer mean X
-frequencybodyaccelerometermeanY: corresponds to the frequency body accelerometer mean Y
-frequencybodyaccelerometermeanZ: corresponds to the frequency body accelerometer mean Z
-frequencybodyaccelerometerstdevX: corresponds to the frequency body accelerometer stdev X
-frequencybodyaccelerometerstdevY: corresponds to the frequency body accelerometer stdev Y
-frequencybodyaccelerometerstdevZ: corresponds to the frequency body accelerometer stdev Z
-frequencybodyaccelerometerjerkmeanX: corresponds to the frequency body accelerometer jerk mean X
-frequencybodyaccelerometerjerkmeanY: corresponds to the frequency body accelerometer jerk mean Y
-frequencybodyaccelerometerjerkmeanZ: corresponds to the frequency body accelerometer jerk mean Z
-frequencybodyaccelerometerjerkstdevX: corresponds to the frequency body accelerometer jerk stdev X
-frequencybodyaccelerometerjerkstdevY: corresponds to the frequency body accelerometer jerk stdev Y
-frequencybodyaccelerometerjerkstdevZ: corresponds to the frequency body accelerometer jerk stdev Z
-frequencybodygiroscopemeanX: corresponds to the frequency body giroscope mean X
-frequencybodygiroscopemeanY: corresponds to the frequency body giroscope mean Y
-frequencybodygiroscopemeanZ: corresponds to the frequency body giroscope mean Z
-frequencybodygiroscopestdevX: corresponds to the frequency body giroscope stdev X
-frequencybodygiroscopestdevY: corresponds to the frequency body giroscope stdev Y
-frequencybodygiroscopestdevZ: corresponds to the frequency body giroscope stdev Z
-frequencybodyaccelerometermagmean: corresponds to the frequency body accelerometer mag mean
-frequencybodyaccelerometermagstdev: corresponds to the frequency body accelerometer mag stdev
-frequencybodyaccelerometerjerkmagmean: corresponds to the frequency body accelerometer jerk mag mean
-frequencybodyaccelerometerjerkmagstdev: corresponds to the frequency body accelerometer jerk mag stdev
-frequencybodygiroscopemagmean: corresponds to the frequency body giroscope mag mean
-frequencybodygiroscopemagstdev: corresponds to the frequency body giroscope mag stdev
-frequencybodygiroscopejerkmagmean: corresponds to the frequency body giroscope jerk mag mean
-frequencybodygiroscopejerkmagstdev: corresponds to the frequency body giroscope jerk mag stdev


The variables in the data set "averages" are:

-activity: each activity is labeled according to the information provided by the file 'activity_labels.txt'
-subject: subjects are identified according to the information on the files "test/subject_test.txt" and "train/subject_train.txt"
-all measurements in "mydata2" precides by "mean_", which indicates the average per activity per subject for the measurement



