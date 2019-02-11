## Cleaning workspace
rm(list=ls())


## Loading packages
library(dplyr)
library(data.table)
library(tidyr)


## Reading labels and features
labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
names(labels)[2] <- "activity"
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
features <- as.vector(features$V2)


## Reading and creating data frames for the training set of data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
names(x_train) <- features                   
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
names(y_train) <- "activity"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(subject_train) <- "subject"


## Combining all data frames and identify activities
x_train <- cbind(x_train, y_train)           
x_train <- merge(labels, x_train, by.x = "V1", by.y = "activity")
x_train <- x_train[2:563]
x_train <- cbind(x_train, subject_train)
x_train$type = "train"


## Reading and creating data frames for the test set of data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
names(x_test) <- features                   
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
names(y_test) <- "activity"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(subject_test) <- "subject"


## Combining all data frames and identify activities
x_test <- cbind(x_test, y_test)           
x_test <- merge(labels, x_test, by.x = "V1", by.y = "activity")
x_test <- x_test[2:563]
x_test <- cbind(x_test, subject_test)
x_test$type = "test"


## Combining train and test data frames
mydata <- rbind(x_test,x_train)


## Reorganizing columns
mydata <- mydata[,c(1,563,564,2:562)]


## Subsetting columns with mean, standard deviation, activity and subject
mydata2 <- mydata[, grepl("mean|std|activity|subject", names(mydata))]
mydata2 <- mydata2[, !grepl("meanFreq", names(mydata2))]


## Re-writing the headers 
headers <- names(mydata2)
headers <- sub("Acc"," accelerometer",headers)
headers <- sub("Gyro"," giroscope",headers)
headers <- sub("Mag"," mag",headers)
headers <- sub("Jerk"," jerk",headers)
headers <- sub("^t","time ",headers)
headers <- sub("^f","frequency ",headers)
headers <- sub("-mean"," mean",headers)
headers <- sub("-std"," stdev",headers)
headers <- sub("Body","body",headers)
headers <- sub("bodyBody","body",headers)
headers <- sub("Gravity","gravity",headers)
headers <- sub("-"," ",headers)
headers <- gsub("[()]","",headers)
headers <- gsub(" ","",headers)
names(mydata2) <- headers


## Calculating the average per activity per subject
averages <- mydata2 %>%
  group_by(activity, subject) %>%
  summarize(mean_timebodyaccelerometermeanX = mean(timebodyaccelerometermeanX),
            mean_timebodyaccelerometermeanY = mean(timebodyaccelerometermeanY),
            mean_timebodyaccelerometermeanZ = mean(timebodyaccelerometermeanZ),
            mean_timebodyaccelerometerstdevX = mean(timebodyaccelerometerstdevX),
            mean_timebodyaccelerometerstdevY = mean(timebodyaccelerometerstdevY),
            mean_timebodyaccelerometerstdevZ = mean(timebodyaccelerometerstdevZ),
            mean_timegravityaccelerometermeanX = mean(timegravityaccelerometermeanX),
            mean_timegravityaccelerometermeanY = mean(timegravityaccelerometermeanY),
            mean_timegravityaccelerometermeanZ = mean(timegravityaccelerometermeanZ),
            mean_timegravityaccelerometerstdevX = mean(timegravityaccelerometerstdevX),
            mean_timegravityaccelerometerstdevY = mean(timegravityaccelerometerstdevY),
            mean_timegravityaccelerometerstdevZ = mean(timegravityaccelerometerstdevZ),
            mean_timebodyaccelerometerjerkmeanX = mean(timebodyaccelerometerjerkmeanX),
            mean_timebodyaccelerometerjerkmeanY = mean(timebodyaccelerometerjerkmeanY),
            mean_timebodyaccelerometerjerkmeanZ = mean(timebodyaccelerometerjerkmeanZ),
            mean_timebodyaccelerometerjerkstdevX = mean(timebodyaccelerometerjerkstdevX),
            mean_timebodyaccelerometerjerkstdevY = mean(timebodyaccelerometerjerkstdevY),
            mean_timebodyaccelerometerjerkstdevZ = mean(timebodyaccelerometerjerkstdevZ),
            mean_timebodygiroscopemeanX = mean(timebodygiroscopemeanX),
            mean_timebodygiroscopemeanY = mean(timebodygiroscopemeanY),
            mean_timebodygiroscopemeanZ = mean(timebodygiroscopemeanZ),
            mean_timebodygiroscopestdevX = mean(timebodygiroscopestdevX),
            mean_timebodygiroscopestdevY = mean(timebodygiroscopestdevY),
            mean_timebodygiroscopestdevZ = mean(timebodygiroscopestdevZ),
            mean_timebodygiroscopejerkmeanX = mean(timebodygiroscopejerkmeanX),
            mean_timebodygiroscopejerkmeanY = mean(timebodygiroscopejerkmeanY),
            mean_timebodygiroscopejerkmeanZ = mean(timebodygiroscopejerkmeanZ),
            mean_timebodygiroscopejerkstdevX = mean(timebodygiroscopejerkstdevX),
            mean_timebodygiroscopejerkstdevY = mean(timebodygiroscopejerkstdevY),
            mean_timebodygiroscopejerkstdevZ = mean(timebodygiroscopejerkstdevZ),
            mean_timebodyaccelerometermagmean = mean(timebodyaccelerometermagmean),
            mean_timebodyaccelerometermagstdev = mean(timebodyaccelerometermagstdev),
            mean_timegravityaccelerometermagmean = mean(timegravityaccelerometermagmean),
            mean_timegravityaccelerometermagstdev = mean(timegravityaccelerometermagstdev),
            mean_timebodyaccelerometerjerkmagmean = mean(timebodyaccelerometerjerkmagmean),
            mean_timebodyaccelerometerjerkmagstdev = mean(timebodyaccelerometerjerkmagstdev),
            mean_timebodygiroscopemagmean = mean(timebodygiroscopemagmean),
            mean_timebodygiroscopemagstdev = mean(timebodygiroscopemagstdev),
            mean_timebodygiroscopejerkmagmean = mean(timebodygiroscopejerkmagmean),
            mean_timebodygiroscopejerkmagstdev = mean(timebodygiroscopejerkmagstdev),
            mean_frequencybodyaccelerometermeanX = mean(frequencybodyaccelerometermeanX),
            mean_frequencybodyaccelerometermeanY = mean(frequencybodyaccelerometermeanY),
            mean_frequencybodyaccelerometermeanZ = mean(frequencybodyaccelerometermeanZ),
            mean_frequencybodyaccelerometerstdevX = mean(frequencybodyaccelerometerstdevX),
            mean_frequencybodyaccelerometerstdevY = mean(frequencybodyaccelerometerstdevY),
            mean_frequencybodyaccelerometerstdevZ = mean(frequencybodyaccelerometerstdevZ),
            mean_frequencybodyaccelerometerjerkmeanX = mean(frequencybodyaccelerometerjerkmeanX),
            mean_frequencybodyaccelerometerjerkmeanY = mean(frequencybodyaccelerometerjerkmeanY),
            mean_frequencybodyaccelerometerjerkmeanZ = mean(frequencybodyaccelerometerjerkmeanZ),
            mean_frequencybodyaccelerometerjerkstdevX = mean(frequencybodyaccelerometerjerkstdevX),
            mean_frequencybodyaccelerometerjerkstdevY = mean(frequencybodyaccelerometerjerkstdevY),
            mean_frequencybodyaccelerometerjerkstdevZ = mean(frequencybodyaccelerometerjerkstdevZ),
            mean_frequencybodygiroscopemeanX = mean(frequencybodygiroscopemeanX),
            mean_frequencybodygiroscopemeanY = mean(frequencybodygiroscopemeanY),
            mean_frequencybodygiroscopemeanZ = mean(frequencybodygiroscopemeanZ),
            mean_frequencybodygiroscopestdevX = mean(frequencybodygiroscopestdevX),
            mean_frequencybodygiroscopestdevY = mean(frequencybodygiroscopestdevY),
            mean_frequencybodygiroscopestdevZ = mean(frequencybodygiroscopestdevZ),
            mean_frequencybodyaccelerometermagmean = mean(frequencybodyaccelerometermagmean),
            mean_frequencybodyaccelerometermagstdev = mean(frequencybodyaccelerometermagstdev),
            mean_frequencybodyaccelerometerjerkmagmean = mean(frequencybodyaccelerometerjerkmagmean),
            mean_frequencybodyaccelerometerjerkmagstdev = mean(frequencybodyaccelerometerjerkmagstdev),
            mean_frequencybodygiroscopemagmean = mean(frequencybodygiroscopemagmean),
            mean_frequencybodygiroscopemagstdev = mean(frequencybodygiroscopemagstdev),
            mean_frequencybodygiroscopejerkmagmean = mean(frequencybodygiroscopejerkmagmean),
            mean_frequencybodygiroscopejerkmagstdev = mean(frequencybodygiroscopejerkmagstdev)) %>%
  arrange(activity, subject)

averages <- unique(averages)
View(averages)
