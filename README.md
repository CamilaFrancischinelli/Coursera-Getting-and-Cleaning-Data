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

## The variables in the data set "mydata2" are:
 activity: each activity is labeled according to the information provided by the file 'activity_labels.txt'
 subject: subjects are identified according to the information on the files "test/subject_test.txt" and "train/subject_train.txt"
 timebodyaccelerometermeanx: corresponds to the time body accelerometer meanx
 timebodyaccelerometermeany: corresponds to the time body accelerometer meany
 timebodyaccelerometermeanz: corresponds to the time body accelerometer meanz
 timebodyaccelerometerstdevx: corresponds to the time body accelerometer stdevx
 timebodyaccelerometerstdevy: corresponds to the time body accelerometer stdevy
 timebodyaccelerometerstdevz: corresponds to the time body accelerometer stdevz
 timegravityaccelerometermeanx: corresponds to the time gravity accelerometer meanx
 timegravityaccelerometermeany: corresponds to the time gravity accelerometer meany
 timegravityaccelerometermeanz: corresponds to the time gravity accelerometer meanz
 timegravityaccelerometerstdevx: corresponds to the time gravity accelerometer stdevx
 timegravityaccelerometerstdevy: corresponds to the time gravity accelerometer stdevy
 timegravityaccelerometerstdevz: corresponds to the time gravity accelerometer stdevz
 timebodyaccelerometerjerkmeanx: corresponds to the time body accelerometer jerk meanx
 timebodyaccelerometerjerkmeany: corresponds to the time body accelerometer jerk meany
 timebodyaccelerometerjerkmeanz: corresponds to the time body accelerometer jerk meanz
 timebodyaccelerometerjerkstdevx: corresponds to the time body accelerometer jerk stdevx
 timebodyaccelerometerjerkstdevy: corresponds to the time body accelerometer jerk stdevy
 timebodyaccelerometerjerkstdevz: corresponds to the time body accelerometer jerk stdevz
 timebodygiroscopemeanx: corresponds to the time body giroscope meanx
 timebodygiroscopemeany: corresponds to the time body giroscope meany
 timebodygiroscopemeanz: corresponds to the time body giroscope meanz
 timebodygiroscopestdevx: corresponds to the time body giroscope stdevx
 timebodygiroscopestdevy: corresponds to the time body giroscope stdevy
 timebodygiroscopestdevz: corresponds to the time body giroscope stdevz
 timebodygiroscopejerkmeanx: corresponds to the time body giroscope jerk meanx
 timebodygiroscopejerkmeany: corresponds to the time body giroscope jerk meany
 timebodygiroscopejerkmeanz: corresponds to the time body giroscope jerk meanz
 timebodygiroscopejerkstdevx: corresponds to the time body giroscope jerk stdevx
 timebodygiroscopejerkstdevy: corresponds to the time body giroscope jerk stdevy
 timebodygiroscopejerkstdevz: corresponds to the time body giroscope jerk stdevz
 timebodyaccelerometermagmean: corresponds to the time body accelerometer mag mean
 timebodyaccelerometermagstdev: corresponds to the time body accelerometer mag stdev
 timegravityaccelerometermagmean: corresponds to the time gravity accelerometer mag mean
 timegravityaccelerometermagstdev: corresponds to the time gravity accelerometer mag stdev
 timebodyaccelerometerjerkmagmean: corresponds to the time body accelerometer jerk mag mean
 timebodyaccelerometerjerkmagstdev: corresponds to the time body accelerometer jerk mag stdev
 timebodygiroscopemagmean: corresponds to the time body giroscope mag mean
 timebodygiroscopemagstdev: corresponds to the time body giroscope mag stdev
 timebodygiroscopejerkmagmean: corresponds to the time body giroscope jerk mag mean
 timebodygiroscopejerkmagstdev: corresponds to the time body giroscope jerk mag stdev
 frequencybodyaccelerometermeanx: corresponds to the frequency body accelerometer meanx
 frequencybodyaccelerometermeany: corresponds to the frequency body accelerometer meany
 frequencybodyaccelerometermeanz: corresponds to the frequency body accelerometer meanz
 frequencybodyaccelerometerstdevx: corresponds to the frequency body accelerometer stdevx
 frequencybodyaccelerometerstdevy: corresponds to the frequency body accelerometer stdevy
 frequencybodyaccelerometerstdevz: corresponds to the frequency body accelerometer stdevz
 frequencybodyaccelerometerjerkmeanx: corresponds to the frequency body accelerometer jerk meanx
 frequencybodyaccelerometerjerkmeany: corresponds to the frequency body accelerometer jerk meany
 frequencybodyaccelerometerjerkmeanz: corresponds to the frequency body accelerometer jerk meanz
 frequencybodyaccelerometerjerkstdevx: corresponds to the frequency body accelerometer jerk stdevx
 frequencybodyaccelerometerjerkstdevy: corresponds to the frequency body accelerometer jerk stdevy
 frequencybodyaccelerometerjerkstdevz: corresponds to the frequency body accelerometer jerk stdevz
 frequencybodygiroscopemeanx: corresponds to the frequency body giroscope meanx
 frequencybodygiroscopemeany: corresponds to the frequency body giroscope meany
 frequencybodygiroscopemeanz: corresponds to the frequency body giroscope meanz
 frequencybodygiroscopestdevx: corresponds to the frequency body giroscope stdevx
 frequencybodygiroscopestdevy: corresponds to the frequency body giroscope stdevy
 frequencybodygiroscopestdevz: corresponds to the frequency body giroscope stdevz
 frequencybodyaccelerometermagmean: corresponds to the frequency body accelerometer mag mean
 frequencybodyaccelerometermagstdev: corresponds to the frequency body accelerometer mag stdev
 frequencybodyaccelerometerjerkmagmean: corresponds to the frequency body accelerometer jerk mag mean
 frequencybodyaccelerometerjerkmagstdev: corresponds to the frequency body accelerometer jerk mag stdev
 frequencybodygiroscopemagmean: corresponds to the frequency body giroscope mag mean
 frequencybodygiroscopemagstdev: corresponds to the frequency body giroscope mag stdev
 frequencybodygiroscopejerkmagmean: corresponds to the frequency body giroscope jerk mag mean
 frequencybodygiroscopejerkmagstdev: corresponds to the frequency body giroscope jerk mag stdev
 angletimebodyaccelerometermeangravity: corresponds to the angle time body accelerometer meangravity
 angletimebodyaccelerometerjerkmeangravitymean: corresponds to the angle time body accelerometer jerk mean gravity mean
 angletimebodygiroscopemeangravitymean: corresponds to the angle time body giroscope mean gravity mean
 angletimebodygiroscopejerkmeangravitymean: corresponds to the angle time body giroscope jerk mean gravity mean
 anglexgravitymean: corresponds to the angle x gravity mean
 angleygravitymean: corresponds to the angle y gravity mean
 anglezgravitymean: corresponds to the angle z gravity mean



## The variables in the data set "averages" are:
 activity: each activity is labeled according to the information provided by the file 'activity_labels.txt'
 subject: subjects are identified according to the information on the files "test/subject_test.txt" and "train/subject_train.txt"
 all measurements in "mydata2" precides by "mean_", which indicates the average per activity per subject for the measurement
