# tidy_data
Project
This project is part of the Coursera "Getting and Cleaning Data Course"


The file run_analysis.R is divided in the steps suggested in the project infos:

1- First the folder with the data was download in this link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unziped and saved in the working directory called data_project, with the inner folder named "UCI HAR Dataset" the working directory was configured to work directly with this folder.
The following tables were read, using read.table:
activity_labels; features; X_train; y_train
subject_train ; X_test ; y_test ; subject_test

2- Data from each group Train and Test were combined with the list of subject and activity, separetely 

3- Data from test and train sets are Merged creating one data set, named "merged_dt"

4 - The feature table is used to identify the variables names that have mean and std that represents mean and standard deviation for each measurement and then used to select these conlumns from the data set "merged_dt" , keeping the columns of the activity

5- The column corresponding the number of the activity is merged with the activity_label table. 

6- The table with the features contending only means and standard deviatons is transformad by as.character and used to substitute the names of the corresponding variable names

7 - Unnecessary columns are removed and the data is aggregate by activity, and calculated the mean using the function "aggregate"










