# tidydataproject

The dataset comes from the *Human Activity Recognition Using Smartophones Dataset*.  A reference is given below.

>Human Activity Recognition Using Smartphones Dataset Version 1.0
>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
>Smartlab - Non Linear Complex Systems Laboratory
>DITEN - Universit‡ degli Studi di Genova.
>Via Opera Pia 11A, I-16145, Genoa, Italy.
>activityrecognition@smartlab.ws
>www.smartlab.ws

I merged the training and the test sets from the X_train and X_test files to create one data set. I also read the subject_train, subject_test, activity_train, activity_test files. 

I extracted only the measurements on the mean and standard deviation for each measurement.  To do this, I used a regex expression to choose variables with "mean" or "std" in the file name.  Perhaps if I had a better understanding what these measurements actually represented I could be more specific.  As is, I suspect there are a few of these columns are derived from other columns.  

To label the activities with names instead of numbers, I found all instances of the number 1,2,3, etc and substituted in the appropriate activity name.

For variable names I used the variable names from the features.txt file, because frankly they seem about as descriptive as they can be.  People have opinions about what type of special characters can/cannot be in a file name, but those opinions vary a lot. I see no reason to do heroic regex to get them into an arbitrary format for a class assignment.  R did change any "()" characters to ".." characters when giving the columns names, I suspect because "()" would make names look like functions, that don't exist.

1.  "subjects"
2.  "activities"
3.  "tBodyAcc.mean...X"
4.  "tBodyAcc.mean...Y"
5.  "tBodyAcc.mean...Z"
6.  "tBodyAcc.std...X"
7.  "tBodyAcc.std...Y"
8.  "tBodyAcc.std...Z"
9.  "tGravityAcc.mean...X"
10. "tGravityAcc.mean...Y"
11. "tGravityAcc.mean...Z"
12. "tGravityAcc.std...X"
13. "tGravityAcc.std...Y"
14. "tGravityAcc.std...Z"
15. "tBodyAccJerk.mean...X"
16. "tBodyAccJerk.mean...Y"
17. "tBodyAccJerk.mean...Z"
18. "tBodyAccJerk.std...X"
19. "tBodyAccJerk.std...Y"
20. "tBodyAccJerk.std...Z"
21. "tBodyGyro.mean...X"
22. "tBodyGyro.mean...Y"
23. "tBodyGyro.mean...Z"
24. "tBodyGyro.std...X"
25. "tBodyGyro.std...Y"
26. "tBodyGyro.std...Z"
27. "tBodyGyroJerk.mean...X"
28. "tBodyGyroJerk.mean...Y"
29. "tBodyGyroJerk.mean...Z"
30. "tBodyGyroJerk.std...X"
31. "tBodyGyroJerk.std...Y"
32. "tBodyGyroJerk.std...Z"
33. "tBodyAccMag.mean.."
34. "tBodyAccMag.std.."
35. "tGravityAccMag.mean.."
36. "tGravityAccMag.std.."
37. "tBodyAccJerkMag.mean.."
38. "tBodyAccJerkMag.std.."
39. "tBodyGyroMag.mean.."
40. "tBodyGyroMag.std.."
41. "tBodyGyroJerkMag.mean.."
42. "tBodyGyroJerkMag.std.."
43. "fBodyAcc.mean...X"
44. "fBodyAcc.mean...Y"
45. "fBodyAcc.mean...Z"
46. "fBodyAcc.std...X"
47. "fBodyAcc.std...Y"
48. "fBodyAcc.std...Z"
49. "fBodyAcc.meanFreq...X"
50. "fBodyAcc.meanFreq...Y"
51. "fBodyAcc.meanFreq...Z"
52. "fBodyAccJerk.mean...X"
53. "fBodyAccJerk.mean...Y"
54. "fBodyAccJerk.mean...Z"
55. "fBodyAccJerk.std...X"
56. "fBodyAccJerk.std...Y"
57. "fBodyAccJerk.std...Z"
58. "fBodyAccJerk.meanFreq...X"
59. "fBodyAccJerk.meanFreq...Y"
60. "fBodyAccJerk.meanFreq...Z"
61. "fBodyGyro.mean...X"
62. "fBodyGyro.mean...Y"
63. "fBodyGyro.mean...Z"
64. "fBodyGyro.std...X"
65. "fBodyGyro.std...Y"
66. "fBodyGyro.std...Z"
67. "fBodyGyro.meanFreq...X"
68. "fBodyGyro.meanFreq...Y"
69. "fBodyGyro.meanFreq...Z"
70. "fBodyAccMag.mean.."
71. "fBodyAccMag.std.."
72. "fBodyAccMag.meanFreq.."
73. "fBodyBodyAccJerkMag.mean.."
74. "fBodyBodyAccJerkMag.std.."
75. "fBodyBodyAccJerkMag.meanFreq.."
76. "fBodyBodyGyroMag.mean.."
77. "fBodyBodyGyroMag.std.."
78. "fBodyBodyGyroMag.meanFreq.."
79. "fBodyBodyGyroJerkMag.mean.."
80. "fBodyBodyGyroJerkMag.std.."
81. "fBodyBodyGyroJerkMag.meanFreq.."

Finally, I created an independent tidy data set with the average of each variable for each activity and each subject. I used the group_by and summarize_all commands to get the desired averages, and wrote the output to a text file.
