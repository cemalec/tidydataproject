1. Train and Test data from X_train and X_test are merged.
2. Train and Test data from subject_train and subject_test are merged.
3. Train and Test data from activity_train and activity_test are merged.
4. Numbers in the activity files are substituted with their descriptive phrase (e.g. 1 = "walking") and placed in the activity column.
5. Feature data in X is selected for only mean and std values
6. X feature data, subject, and activity columns are merged into one dataframe
7. Data is sorted by subject and activity
8. Averages for each feature are calculated by subject and activity
