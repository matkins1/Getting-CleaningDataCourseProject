# Description of how run_analysis.R script works (see also comments by line in script file)

  1) Install and loan "plyr" package into R for use in creating tidy data set
  2) Load following data files into R for manipulation and analysis: X_train.txt (main train data), y_train.txt (activity number data to pair with X_train.txt), subject_train.txt (subject number data to pair with X_train.txt), X_test.txt (main test data), y_test.txt (activity number data to pair with X_test.txt), subject_test.txt (subject number data to pair with X_test.txt), features.txt (variable label data to pair with main train and main test data), activity_labels.txt (activity label data to pair with activity number data)
  3) Create one data set, "merge_data" that includes all X_train.txt and X_test.txt data with added subject number variable and activity name variable for each observation as well as names for all  original unamed variables in X_train.txt and X_test.txt data files.
  4) Perform column mean and st devation measurements for each column and save to measurement_means and measurement_sd variables
  5) Create tidy data set for step 5 using "plyr" package and store in tidy_data variable 

Note: script must be updated for location of each file path as indicated in script comments.
