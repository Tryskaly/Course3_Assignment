features <- a table which describes the variables in train_set and test_set.

## train set
train_set <- a table with all the information of each variables in "features", "subject_train" and "activities_train".
subject_train <- a table with the subject number linked to each row in "train_set".
acivities_train <- a table with the activity information linked to each row of the "train_set".


## test set
test_set <- a table with all the information of each variables in "features", "subject_test" and "activities_test".
subject_test <- a table with the subject number linked to each row in "test_set".
acivities_test <- a table with the activity information linked to each row of the "test_set".

## merges training and test sets
final_set <- combination of "train_set" and "test_set".

## changes the number of the activities to the real name of the each activity
activity1/2/3/4/5/6 <- a vector with the position where there are the numbers 1/2/3/4/5/6 in the variable final_set$activities.

## select the mean() and std() variables
mean_position <- a vector with the position of the variables named as "mean()" in any position.
mean_set <- a matrix with the variables from final_set which are in the "mean_position".
std_position <- a vector with the position of the variables named as "std()" in any position.
std_set <- a matrix with the variables from final_set which are in the "std_position".
mean_std_set <- combination of the "mean_set" and "std_set" including also the "final_set$subject" and "final_set$activity".

## creates a second set with the average of each variable for each activity and each subject.
melted <- melt of "mean_std_set" taking into account the variables "subject" and "activities".
list_variable <- a list with the different names of the "activities" variable.

tidy_set <- a tidy data set with the average of each variable for each activity and each subject.

submatrix <- temporal data frame to obtain the mean of each variable for each activity and subject
dimension <- dimensions of submatrix





