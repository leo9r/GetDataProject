#README for run_analysis.R in Course Project of Getting and Cleaning Data

## Step 0
Loading data files assuming that they are available in the working directory.

## Step 1
Merging the training and test sets to create one data set. features, activity and subject are combiend by column, and then the training and test dataset are combined by row, resulting in one full dataframe.

## Step 2
Extracting only the measurements on the mean and standard deviation for each measurement by using grep on "mean" and "std"

## Step 3 and 4
Creating tidy data and naming columns by using the plyr package ---> Check Codebook 

## Step 5
Exporting tidy dataset by means of write.table