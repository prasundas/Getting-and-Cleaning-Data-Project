File Directory:
===============
working directory/UCI HAR Dataset/

Packages:
=========
reshape and reshape2

Variables:
===========
destFileActivity - stores file location for activity_labels.txt
dataActivity - stores the data of activity_labels.txt
dataActivityName - stores the name of the activity
destFileFeatures - stores file location for features.txt
dataFeatures - stores the data of features.txt
dataFeaturesName - stores the name of the features
destFileXTrain - stores file location of base data for traning
dataXTrain - stores base data for training
destFileSubTrain - stores file location for training Subject
dataFileSubTrain - stores data for training Subject
destFileYTrain - stores file location for activity
Y_train - stores data for Y_train 
dataTrain - stores training base data, subject and activity data
destFileXTest - stores file location of base data for test
dataXTest - stores base data for test 
destFileSubTest - stores file location for test Subject 
dataFileSubTest - stores data for test Subject 
destFileYTest - stores file location for activity 
Y_test dataYTest - stores data for Y_test dataTest - stores test base data, subject and activity data data - stores train and test data dataCol - stores column names to be fetched 
meanCol - identifies mean column 
meanColName - stores names of mean columns
sdCol - identifies standard deviation column 
sdColName - stores names of standard deviation columns
fetchCol - Columns which are to be fetched dataMS - data for subject, activity, mean and standard deviation data 
idCol - id for subject and activity - for melt function 
measureCol - identifying measure column - for melt function dataMSMelt - stores melt data
tidydataset - stores the final output
