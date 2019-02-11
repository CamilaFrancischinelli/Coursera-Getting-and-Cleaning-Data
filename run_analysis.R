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
x_train <- cbind(x_train, y_train, subject_train)           
x_train <- merge(labels, x_train, by.x = "V1", by.y = "activity")
x_train <- x_train[2:564]
x_train$type = "train"


## Reading and creating data frames for the test set of data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
names(x_test) <- features                   
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
names(y_test) <- "activity"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(subject_test) <- "subject"


## Combining all data frames and identify activities
x_test <- cbind(x_test, y_test, subject_test)           
x_test <- merge(labels, x_test, by.x = "V1", by.y = "activity")
x_test <- x_test[2:564]
x_test$type = "test"


## Combining train and test data frames
mydata <- rbind(x_test,x_train)


## Reorganizing columns
mydata <- mydata[,c(1,563,564,2:562)]


## Subsetting columns with mean, standard deviation, activity and subject
mydata2 <- mydata[, grepl("[Mm]ean|std|activity|subject", names(mydata))]
mydata2 <- mydata2[, !grepl("meanFreq", names(mydata2))]


## Re-writing the headers 
headers <- names(mydata2)
headers <- sub("Acc"," accelerometer",headers)
headers <- sub("Gyro"," giroscope",headers)
headers <- sub("Mag"," mag",headers)
headers <- sub("Jerk"," jerk",headers)
headers <- sub("gravityMean"," gravity mean",headers)
headers <- sub("jerkMean"," jerk mean",headers)
headers <- sub("giroscopeMean"," giroscope mean",headers)
headers <- sub("BodyBody","Body",headers)
headers <- sub("^t","time ",headers)
headers <- sub("^f","frequency ",headers)
headers <- sub("tBody","time body",headers)
headers <- sub("-mean"," mean",headers)
headers <- sub("Mean"," mean",headers)
headers <- sub("-std"," stdev",headers)
headers <- sub("Body","body",headers)
headers <- sub("Gravity","gravity",headers)
headers <- sub("X","x",headers)
headers <- sub("Y","y",headers)
headers <- sub("Z","z",headers)
headers <- sub("-","",headers)
headers <- gsub("[()]","",headers)
headers <- gsub(",","",headers)
headers <- gsub(" ","",headers)
names(mydata2) <- headers


## Calculating the average per activity per subject
averages <- mydata2 %>%
  group_by(activity, subject) %>%
  summarize(mean_timebodyaccelerometermeanx = mean(timebodyaccelerometermeanx),
            mean_timebodyaccelerometermeany = mean(timebodyaccelerometermeany),
            mean_timebodyaccelerometermeanz = mean(timebodyaccelerometermeanz),
            mean_timebodyaccelerometerstdevx = mean(timebodyaccelerometerstdevx),
            mean_timebodyaccelerometerstdevy = mean(timebodyaccelerometerstdevy),
            mean_timebodyaccelerometerstdevz = mean(timebodyaccelerometerstdevz),
            mean_timegravityaccelerometermeanx = mean(timegravityaccelerometermeanx),
            mean_timegravityaccelerometermeany = mean(timegravityaccelerometermeany),
            mean_timegravityaccelerometermeanz = mean(timegravityaccelerometermeanz),
            mean_timegravityaccelerometerstdevx = mean(timegravityaccelerometerstdevx),
            mean_timegravityaccelerometerstdevy = mean(timegravityaccelerometerstdevy),
            mean_timegravityaccelerometerstdevz = mean(timegravityaccelerometerstdevz),
            mean_timebodyaccelerometerjerkmeanx = mean(timebodyaccelerometerjerkmeanx),
            mean_timebodyaccelerometerjerkmeany = mean(timebodyaccelerometerjerkmeany),
            mean_timebodyaccelerometerjerkmeanz = mean(timebodyaccelerometerjerkmeanz),
            mean_timebodyaccelerometerjerkstdevx = mean(timebodyaccelerometerjerkstdevx),
            mean_timebodyaccelerometerjerkstdevy = mean(timebodyaccelerometerjerkstdevy),
            mean_timebodyaccelerometerjerkstdevz = mean(timebodyaccelerometerjerkstdevz),
            mean_timebodygiroscopemeanx = mean(timebodygiroscopemeanx),
            mean_timebodygiroscopemeany = mean(timebodygiroscopemeany),
            mean_timebodygiroscopemeanz = mean(timebodygiroscopemeanz),
            mean_timebodygiroscopestdevx = mean(timebodygiroscopestdevx),
            mean_timebodygiroscopestdevy = mean(timebodygiroscopestdevy),
            mean_timebodygiroscopestdevz = mean(timebodygiroscopestdevz),
            mean_timebodygiroscopejerkmeanx = mean(timebodygiroscopejerkmeanx),
            mean_timebodygiroscopejerkmeany = mean(timebodygiroscopejerkmeany),
            mean_timebodygiroscopejerkmeanz = mean(timebodygiroscopejerkmeanz),
            mean_timebodygiroscopejerkstdevx = mean(timebodygiroscopejerkstdevx),
            mean_timebodygiroscopejerkstdevy = mean(timebodygiroscopejerkstdevy),
            mean_timebodygiroscopejerkstdevz = mean(timebodygiroscopejerkstdevz),
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
            mean_frequencybodyaccelerometermeanx = mean(frequencybodyaccelerometermeanx),
            mean_frequencybodyaccelerometermeany = mean(frequencybodyaccelerometermeany),
            mean_frequencybodyaccelerometermeanz = mean(frequencybodyaccelerometermeanz),
            mean_frequencybodyaccelerometerstdevx = mean(frequencybodyaccelerometerstdevx),
            mean_frequencybodyaccelerometerstdevy = mean(frequencybodyaccelerometerstdevy),
            mean_frequencybodyaccelerometerstdevz = mean(frequencybodyaccelerometerstdevz),
            mean_frequencybodyaccelerometerjerkmeanx = mean(frequencybodyaccelerometerjerkmeanx),
            mean_frequencybodyaccelerometerjerkmeany = mean(frequencybodyaccelerometerjerkmeany),
            mean_frequencybodyaccelerometerjerkmeanz = mean(frequencybodyaccelerometerjerkmeanz),
            mean_frequencybodyaccelerometerjerkstdevx = mean(frequencybodyaccelerometerjerkstdevx),
            mean_frequencybodyaccelerometerjerkstdevy = mean(frequencybodyaccelerometerjerkstdevy),
            mean_frequencybodyaccelerometerjerkstdevz = mean(frequencybodyaccelerometerjerkstdevz),
            mean_frequencybodygiroscopemeanx = mean(frequencybodygiroscopemeanx),
            mean_frequencybodygiroscopemeany = mean(frequencybodygiroscopemeany),
            mean_frequencybodygiroscopemeanz = mean(frequencybodygiroscopemeanz),
            mean_frequencybodygiroscopestdevx = mean(frequencybodygiroscopestdevx),
            mean_frequencybodygiroscopestdevy = mean(frequencybodygiroscopestdevy),
            mean_frequencybodygiroscopestdevz = mean(frequencybodygiroscopestdevz),
            mean_frequencybodyaccelerometermagmean = mean(frequencybodyaccelerometermagmean),
            mean_frequencybodyaccelerometermagstdev = mean(frequencybodyaccelerometermagstdev),
            mean_frequencybodyaccelerometerjerkmagmean = mean(frequencybodyaccelerometerjerkmagmean),
            mean_frequencybodyaccelerometerjerkmagstdev = mean(frequencybodyaccelerometerjerkmagstdev),
            mean_frequencybodygiroscopemagmean = mean(frequencybodygiroscopemagmean),
            mean_frequencybodygiroscopemagstdev = mean(frequencybodygiroscopemagstdev),
            mean_frequencybodygiroscopejerkmagmean = mean(frequencybodygiroscopejerkmagmean),
            mean_frequencybodygiroscopejerkmagstdev = mean(frequencybodygiroscopejerkmagstdev),
            mean_angletimebodyaccelerometermeangravity = mean(angletimebodyaccelerometermeangravity),
            mean_angletimebodyaccelerometerjerkmeangravitymean = mean(angletimebodyaccelerometerjerkmeangravitymean),
            mean_angletimebodygiroscopemeangravitymean = mean(angletimebodygiroscopemeangravitymean),
            mean_angletimebodygiroscopejerkmeangravitymean = mean(angletimebodygiroscopejerkmeangravitymean),
            mean_anglexgravitymean = mean(anglexgravitymean),
            mean_angleygravitymean = mean(angleygravitymean),
            mean_anglezgravitymean = mean(anglezgravitymean)) %>%
  arrange(activity, subject)

averages <- unique(averages)
View(averages)

write.table(averages, file = "my_analysis.txt", row.names = FALSE)
