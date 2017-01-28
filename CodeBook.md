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
agg_tidy_data: tidy data aggregate by activity and subject, then the mean was calculated for each variable
