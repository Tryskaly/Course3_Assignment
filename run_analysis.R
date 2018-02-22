rm(list=ls())
library(stringr)
library(reshape2)

## Download and unzip the dataset: 
if (!file.exists(filename)){ 
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " 
    download.file(fileURL, filename, method="curl") 
}   
if (!file.exists("UCI HAR Dataset")) {  
    unzip(filename)  
} 

features <- read.table("~/UCI HAR Dataset/features.txt",header=FALSE)
feature <- tolower(features[,2])


# train set
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names="subject")
train_set <- read.table("~/UCI HAR Dataset/train/X_train.txt", header=FALSE, col.names = feature)
activities_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names="features")

train_set <- cbind(subject_train, activities_train, kind_of_set="train", train_set)
rm(subject_train,activities_train)

# test set
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names="subject")
test_set <- read.table("~/UCI HAR Dataset/test/X_test.txt", header=FALSE, col.names = feature)
activities_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names="features")

test_set <- cbind(subject_test, activities_test, kind_of_set="test", test_set)
rm(subject_test,activities_test)

# merges training and test sets
final_set <- rbind(test_set,train_set)
rm(test_set, train_set)

# changes the number of the activities to the real name of the each activity
activity1 <- grep("1",final_set$features)
activity2 <- grep("2",final_set$features)
activity3 <- grep("3",final_set$features)
activity4 <- grep("4",final_set$features)
activity5 <- grep("5",final_set$features)
activity6 <- grep("6",final_set$features)

final_set$activities[activity1] <- "walking_mean"
final_set$activities[activity2] <- "walking_upstairs_mean"
final_set$activities[activity3] <- "walking_downstairs_mean"
final_set$activities[activity4] <- "sitting_mean"
final_set$activities[activity5] <- "standing_mean"
final_set$activities[activity6] <- "laying_mean"
rm(activity1,activity2,activity3,activity4,activity5,activity6)

# select the mean() and std() variables

mean_position <- grep("mean()", feature)
mean_position <- mean_position + 3
mean_set <-final_set[,mean_position]

std_position <- grep("std()", feature)
std_position <- std_position + 3
std_set <-final_set[,std_position]

rm(features)

mean_std_set <- cbind(final_set[,1:2],mean_set,std_set)
rm(mean_set,std_set,mean_position,std_position, final_set)

# creates a second set with the average of each variable for each activity and each subject.
melted <- melt(mean_std_set,id=c("subject","activities"))
#list_variable <- unique(melted$variable)
list_variable <- unique(melted$activities)

tidy_set <- data.frame()

for (i in 1:length(list_variable)) {
    submatrix <- subset(melted, melted$activities==list_variable[i])
    submatrix <- dcast(submatrix, subject ~variable, mean)
    dimension <- dim(submatrix)
    submatrix <- cbind(subject=submatrix[,1],activity=list_variable[i],submatrix[,2:dimension[2]])
    tidy_set <- rbind(tidy_set, submatrix)
    rm(submatrix)
}
rm(melted,i,list_variable)

write.table(tidy_set, "tidy.txt", row.names = FALSE, quote = FALSE) 