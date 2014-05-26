run_analysis <- function()
{
  library(plyr)
  ############ Loading data files assuming that they are available in the working directory.
  features <- read.table('features.txt')
  actLabels <- read.table('activity_labels.txt', col.names=c('ID','Activity'))
  sTrain <- read.table('subject_train.txt', col.names='subject')
  yTrain <- read.table('y_train.txt', col.names='Activity')
  XTrain <- read.table('X_train.txt',col.names=features$V2)  
  sTest <- read.table('subject_test.txt', col.names='subject')
  yTest <- read.table('y_test.txt', col.names='Activity')
  XTest <- read.table('X_test.txt',col.names=features$V2)    
  
  ############ Step 1 - Merging the training and test sets to create one data set
  yTest$Activity <- factor(yTest$Activity,labels=as.character(actLabels$Activity))
  yTrain$Activity <- factor(yTrain$Activity,labels=as.character(actLabels$Activity))    
  fullDT <- rbind(cbind(XTest,yTest, sTest),cbind(XTrain, yTrain, sTrain))
  
  ############ Step 2 - Extracting only the measurements on the mean and standard deviation for each measurement  
  extDT <- fullDT[,c(grep("mean.",colnames(fullDT), fixed=TRUE),grep("std.",colnames(fullDT)),562, 563)]
  
  ############ Step 3 & 4 - Creating tidy data and naming columns ---> Check Codebook  
  tidyDT <- ddply(extDT,.(subject,Activity),summarize, tbaMeanX = mean(tBodyAcc.mean...X),
                    tbaMeanY = mean(tBodyAcc.mean...Y), tbaMeanZ = mean(tBodyAcc.mean...Z),
                    tbaStdDevX = mean(tBodyAcc.std...X), tbaStdDevY = mean(tBodyAcc.std...Y),
                    tbaStdDevZ = mean(tBodyAcc.std...Z), tgaMeanX = mean(tGravityAcc.mean...X),
                    tgaMeanY = mean(tGravityAcc.mean...Y), tgaMeanZ = mean(tGravityAcc.mean...Z),
                    tgaStdDevX = mean(tGravityAcc.std...X), tgaStdDevY = mean(tGravityAcc.std...Y),
                    tgaStdDevZ = mean(tGravityAcc.std...Z), tgaJerkMeanX = mean(tBodyAccJerk.mean...X),
                    tgaJerkMeanY = mean(tBodyAccJerk.mean...Y), tgaJerkMeanZ = mean(tBodyAccJerk.mean...Z),
                    tgaJerkStdDevX = mean(tBodyAccJerk.std...X), tgaJerkStdDevY = mean(tBodyAccJerk.std...Y),
                    tgaJerkStdDevZ = mean(tBodyAccJerk.std...Z), tbgMeanX = mean(tBodyGyro.mean...X),
                    tbgMeanY = mean(tBodyGyro.mean...Y), tbgMeanZ = mean(tBodyGyro.mean...Z),
                    tbgStdDevX = mean(tBodyGyro.std...X), tbgStdDevY = mean(tBodyGyro.std...Y),
                    tbgStdDevZ = mean(tBodyGyro.std...Z), tbgJerkMeanX = mean(tBodyGyroJerk.mean...X),
                    tbgJerkMeanY = mean(tBodyGyroJerk.mean...Y), tbgJerkMeanZ = mean(tBodyGyroJerk.mean...Z),
                    tbgJerkStdDevX = mean(tBodyGyroJerk.std...X), tbgJerkStdDevY = mean(tBodyGyroJerk.std...Y),
                    tbgJerkStdDevZ = mean(tBodyGyroJerk.std...Z), tbaMagnitudeMean = mean(tBodyAccMag.mean..),
                    tgaMagnitudeMean = mean(tGravityAccMag.mean..), tbaJerkMagnitudeMean = mean(tBodyAccJerkMag.mean..),
                    tbgMagnitudeMean = mean(tBodyGyroMag.mean..), tbgJerkMagnitudeMean = mean(tBodyGyroJerkMag.mean..),
                    tbaMagnitudeStdDev = mean(tBodyAccMag.std..), tgaMagnitudeStdDev = mean(tGravityAccMag.std..),
                    tbaJerkMagnitudeStdDev = mean(tBodyAccJerkMag.std..), tbgMagnitudeStdDev = mean(tBodyGyroMag.std..),
                    tbgJerkMagnitudeStdDev = mean(tBodyGyroJerkMag.std..), fbaMeanX = mean(fBodyAcc.mean...X),
                    fbaMeanY = mean(fBodyAcc.mean...Y), fbaMeanZ = mean(fBodyAcc.mean...Z),
                    fbaStdDevX = mean(fBodyAcc.std...X), fbaStdDevY = mean(fBodyAcc.std...Y),
                    fbaStdDevZ = mean(fBodyAcc.std...Z), fbaJerkMeanX = mean(fBodyAccJerk.mean...X),
                    fbaJerkMeanY = mean(fBodyAccJerk.mean...Y), fbaJerkMeanZ = mean(fBodyAccJerk.mean...Z),
                    fbaJerkStdDevX = mean(fBodyAccJerk.std...X), fbaJerkStdDevY = mean(fBodyAccJerk.std...Y),
                    fbaJerkStdDevZ = mean(fBodyAccJerk.std...Z), fbgMeanX = mean(fBodyGyro.mean...X),
                    fbgMeanY = mean(fBodyGyro.mean...Y), fbgMeanZ = mean(fBodyGyro.mean...Z),
                    fbgStdDevX = mean(fBodyGyro.std...X), fbgStdDevY = mean(fBodyGyro.std...Y),
                    fbgStdDevZ = mean(fBodyGyro.std...Z), fbaMagnitudeMean = mean(fBodyAccMag.mean..),
                    fbaMagnitudeStdDev = mean(fBodyAccMag.std..), fbaJerkMagnitudeMean = mean(fBodyBodyAccJerkMag.mean..),
                    fbaJerkMagnitudeStdDev = mean(fBodyBodyAccJerkMag.std..), fbgMagnitudeMean = mean(fBodyBodyGyroMag.mean..),
                    fbgMagnitudeStdDev = mean(fBodyBodyGyroMag.std..), fbgJerkMagnitudeMean = mean(fBodyBodyGyroJerkMag.mean..),
                    fbgJerkMagnitudeStdDev = mean(fBodyBodyGyroJerkMag.std..))
  
  ############ Step 5 - exporting tidy dataset
  write.table(tidyDT,file="tidyDT.txt",sep=",")
}