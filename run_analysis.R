#run_analysis runs various preprocessing steps to create a tidy dataset 
#from the given data

run_analysis <- function(){
  library(dplyr)
  
  #Merge the training and the test sets to create one data set.
  #Each column in our dataset is presented as a text file, so those
  #files must all be read for the "test" and the "training" data
  cnames <- read.table("features.txt", sep = "", stringsAsFactors = FALSE)
  cnames <- select(cnames,V2)
  
  X_test <- read.table("test/X_test.txt", sep = "", col.names = t(cnames), stringsAsFactors = FALSE)
  y_test <- read.table("test/y_test.txt", sep = "", col.names = "test_label", stringsAsFactors = FALSE)
  subject_test <- read.table("test/subject_test.txt", sep = "", col.names = "subject", stringsAsFactors = FALSE)
  
  X_train <- read.table("train/X_train.txt", sep = "", col.names = t(cnames), stringsAsFactors = FALSE)
  y_train <- read.table("train/y_train.txt", sep = "", col.names = "test_label", stringsAsFactors = FALSE)
  subject_train <- read.table("train/subject_train.txt", sep = "", col.names = "subject", stringsAsFactors = FALSE)
  
  X <- rbind(X_test,X_train)
  y <- rbind(y_test,y_train)
  subject <- rbind(subject_test,subject_train)

  #Extract only the measurements on the mean and 
  #standard deviation for each measurement.
  matched_X <- grep("(mean)|(std)", names(X))
  matched_X2 <- grep("(mean)",names(X))
  X_extract <- select(X,names(X[matched_X]))
  X_extract2 <- select(X,names(X[matched_X2]))
  
  #Use descriptive activity names to name 
  #the activities in the data set
  activity_names <- read.table("activity_labels.txt", col.names = c("num","activity"),sep = "")
  y_sub <- y
  for(i in 1:length(activity_names$num)){
    y_sub <- gsub(activity_names$num[i],activity_names$activity[i],y_sub)
  }
  
  #Appropriately label the data set 
  #with descriptive variable names.
  
  X_extract$activities <- y_sub
  X_extract$subjects <- subject
  final_data <- X_extract                            
  #From the data set in step 4, 
  #create a second, independent tidy data set 
  #with the average of each variable for each 
  #activity and each subject.
  
  X_extract2$activities <- y_sub
  X_extract2$subjects <- subject
  final_avgs <- X_extract2
  
  datas = list(2)
  datas[[1]] = final_data
  datas[[2]] = final_avgs
  return(datas)
}