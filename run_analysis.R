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
  
  #I use a regex expression to choose variables with "mean" or "std"
  #in the file name.  Perhaps if I had a better understanding what these
  #measurements actually represented I could be more specific.  As is,
  #I suspect there are a few of these columns are derived from other columns.
  matched_X <- grep("(mean)|(std)", names(X))
  X_extract <- select(X,names(X[matched_X]))
  
  #Use descriptive activity names to name the activities in the data set.
  #I find all instances of the number 1,2,3, etc and substitute in the appropriate
  #activity name
  activity_names <- read.table("activity_labels.txt", col.names = c("num","activity"),sep = "")
  y_sub <- y
  for(i in 1:length(activity_names$num)){
    y_sub <- lapply(y_sub, gsub, pattern = activity_names$num[i], replacement = activity_names$activity[i])
  }
  
  #For some reason it outputs a nested list, this is something I've got to
  #understand...tomorrow
  y_sub <- y_sub[[1]]
  
  #Appropriately label the data set with descriptive variable names.
  #I combine the datasets, at this point, I gave the variables descriptive names
  #at the beginning.  I used the variable names from the features.txt file, because
  #frankly they seem about as descriptive as they can be.  People have opinions
  #about what type of special characters can/cannot be in a file name, but those
  #opinions vary a lot. I see no reason to do heroic regex to get them into an
  #arbitrary format for a class assignment.
  X_extract$activities <- y_sub
  X_extract$subjects <- as.list(subject)[[1]]
  final_data <- X_extract
  
  #From the data set in step 4, create a second, independent tidy data set 
  #with the average of each variable for each activity and each subject.
  final_avgs <- final_data %>%
    group_by(subjects, activities) %>% 
    summarize_all(mean)
  
  #Create a output variable that is a list of the two desired dataframes.
  datas = list(2)
  datas[[1]] = final_data
  datas[[2]] = final_avgs
  write.table(final_avgs,file = "TidyData.txt",row.names = FALSE)
  return(datas)
}