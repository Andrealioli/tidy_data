# tidy_data
Project
This project is part of the Coursera "Getting and Cleaning Data Course"
The folder with the data was download in this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unziped and saved in the working directory with the inner folder named "UCI HAR Dataset" the working directory was configured to work directly with this folder.

The file run_analysis.R is divided in the steps suggested in the project infos:

1- First a preparation was done the needed data are read using read.table
activity_labels
features

X_train
y_train
subject_train

X_test
y_test
subject_test

2- Data from each group Train and Test were combined with the list of subject and activity, separetely 

3- Data from test and train sets are Merged creating one data set, named "merged_dt"

4 - The feature table is used to identify the variables names that have mean and std that represents mean and standard deviation for each measurement and then used to select these conlumns from the data set "merged_dt" , keeping the columns of the activity

5- The column corresponding the number of the activity is merged with the activity_label table. 

6- The table with the features contending only means and standard deviatons is transformad by as.character and used to substitute the names of the corresponding variable names

7 - Unnecessary columns are removed and the data is aggregate by activity, and calculated the mean using the function "aggregate"

Code book

act_labels: is the table with the labels of the activities from 1 to 6
features: contain the labels of the variables
subjct_train: contain the file Subject train, where each row identifies the subject who performed the activity for each window sample.Its range is from 1 to 30. 
training_labels: contain the y_train 
training_act: is the binded columns of train_labels and subjct_train
training_sets:contain the table x_train, joined with the table subject training_act

subjct_test:  contain the file Subject test.
test_labels: contain the y_test 
test_act: is the binded columns of test_labels and subjct_test
test_sets:contain the table x_test, joined with the table subject test_act
merged_dt: is the binded rows of training_sets and test_sets

feature_mean: the features that are mean values of variables considered on the analysis
feature_std: the features that are standard deviations values of variables considered on the analysis
feature_mean_std: binded rows of the valueas filtered above (i.e. feature_mean and feature_std)
merged_dt_sub: mean and standard deviation variables selected from merged_dt_sub using feature_mean_std, and merged with the name of the activities (i.e. act_labels)
tidy_data: merged_dt_sub with correct names of variables and without unecessary columns
agg_tidy_data <- tidy data aggregate by activity and calculated the mean value of the variables









