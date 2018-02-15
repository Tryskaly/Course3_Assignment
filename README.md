==================================================================
run_analysis.R
==================================================================

The script creates a tidy data set with the average of each variable for each activity and each subject from the data base "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
In this case, the folder used to save the files were: "~/Coursera/DataScience/Course3/Week4/Assignment".

In order to obtain the tidy data set, now called "tidy_set", first of all, the files called "subject_train.txt", "x_train.txt" and "y_train.txt" were open and saved in "train_set" and changed the names of the variables with the file "features.txt". 
The files called "subject_test.txt", "x_test.txt" and "y_test.txt" were also opened and saved in "test_set" and changed the names of the variables with the file "features.txt". 
Both sets were merge in the "final_set" and the values (1 to 6) of the variable "activities" where changed for the name of the activity explained in the file "activity_labels.txt".
The variables partially named, in any position, as "mean()" and "std()" where saved in "mean_std_set".
The "mean_std_set" was melted taking into account the variables "subject" and "activities".
A for was created to calculate the activity mean of each subject and each variable partially named as "mean()" or "std()" in any position, and all these means where saved in the tidy_set.

======================================