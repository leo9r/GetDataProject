#Codebook for run_analysis.R in Course Project of Getting and Cleaning Data

Data source [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

##Data Columns
Given that the meaning of the columns in this dataset involve around **SIX concepts**, the full names would make the code very large and dificult to follow. Therefore, and given that one of the skills measured in the project is that of **RENAMING** the columns of the mean and standard deviation from the original dataset, I've decided to factorize the names according to the following pattern that makes the whole dataset more homogeneous. **Please note that this is just and exercise, and in real cases, the full, human readable names, are the best way to go for columns**:

* tba = Time Body Accelerometer
* tga = Time Gravity Accelerometer
* tbg = Time Body Gyroscope
* fba = Fourier Body Accelerometer
* fbg = Fourier Body Gyroscope

##Semantics
Values in the dataset represent the mean of the values for the corresponding subject-activity-feature triple.
