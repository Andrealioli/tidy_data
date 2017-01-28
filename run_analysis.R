library('dplyr')


#reading files Labels and Features
file_path_labels <- paste(getwd(), paste("activity_labels", ".txt", sep=""), sep="/")
act_labels <- read.table(file_path_labels)
file_path_features <- paste(getwd(), paste("features", ".txt", sep=""), sep="/")
features <- read.table(file_path_features)

#reading files Train
file_path_train <- paste(getwd(), "train", sep="/")
subjct_train <- read.table(paste(file_path_train, paste("subject_train", ".txt", sep=""), sep="/"))
training_sets <- read.table(paste(file_path_train, paste("X_train", ".txt", sep=""), sep="/"))
training_labels <-  read.table(paste(file_path_train, paste("y_train", ".txt", sep=""), sep="/"))
train_act <-cbind(subjct_train,training_labels)
colnames(train_act)[2]<-c("act") 
training_sets <- cbind(training_sets, train_act)



#read file test
file_path_test <- paste(getwd(), "test", sep="/")
subjct_test <- read.table(paste(file_path_test, paste("subject_test", ".txt", sep=""),sep="/"))
test_sets <- read.table(paste(file_path_test, paste("X_test", ".txt", sep=""), sep="/"))
test_labels <-  read.table(paste(file_path_test, paste("y_test", ".txt", sep=""), sep="/"))
test_act <- cbind(subjct_test, test_labels)
colnames(test_act)[2]<-c("act")
test_sets <- cbind(test_sets, test_act)


#Step 1 Merges the training and the test sets to create one data set.

merged_dt <- rbind(test_sets, training_sets)

#Step2 Extracts only the measurements on the mean and standard deviation for each measurement.
feature_mean<- features[grep("mean",features$V2),]
feature_std<- features[grep("std",features$V2),]
feature_mean_std <- rbind(feature_mean,feature_std)
selection <-as.factor(rownames(feature_mean_std))
merged_dt_sub <- merged_dt[,c(selection, 562, 563)]

#Step3 Uses descriptive activity names to name the activities in the data set

#merging the subject with the labels
colnames(act_labels)[1]<- c("act")
merged_dt_sub <- merge(merged_dt_sub, act_labels, by="act")


#Step4 Appropriately labels the data set with descriptive variable names.
colnames(merged_dt_sub)[2:80] <-c(as.character(feature_mean_std$V2)) 

#Step 5 From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.
tidy_data <- merged_dt_sub[, -c(1)]
colnames(tidy_data)[80:81]<- c("Subject", "Activity")
agg_tidy_data <- aggregate(.~Activity + Subject, data= tidy_data, FUN="mean")

#Saving the tidy file
write.table(agg_tidy_data,paste(getwd(), "agg_tidy_data.txt", sep="/"))
