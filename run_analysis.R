library(reshape)
library(reshape2)


# Fetches Activity Data ---------------------------------------------------
destFileActivity <- "./UCI HAR Dataset/activity_labels.txt"
dataActivity <- read.table(destFileActivity,sep="")
dataActivityName <- as.character(dataActivity$V2)


# Fetches Features Data ---------------------------------------------------
destFileFeatures <- "./UCI HAR Dataset/features.txt"
dataFeatures <- read.table(destFileFeatures,sep="")
dataFeaturesName <- as.character(dataFeatures$V2) 


# Fetches Base Data for Training ------------------------------------------
destFileXTrain <- "./UCI HAR Dataset/train/X_train.txt"
dataXTrain <- read.table(destFileXTrain,sep="")


# Fetches Subject Data for Training ---------------------------------------
destFileSubTrain <- "./UCI HAR Dataset/train/subject_train.txt"
dataFileSubTrain <- read.table(destFileSubTrain,sep="")
colnames(dataFileSubTrain) <- "Subject"
dataFileSubTrain$Subject <- as.factor(dataFileSubTrain$Subject)


# Fetches Activity Data for Training --------------------------------------
destFileYTrain <- "./UCI HAR Dataset/train/Y_train.txt"
dataYTrain <- read.table(destFileYTrain,sep="")
names(dataYTrain) <- "Activity"
dataYTrain$Activity <- as.factor(dataYTrain$Activity)
levels(dataYTrain$Activity) <- dataActivityName


# Combines Subject Data, Activity Data and Base Data for Training ---------
dataTrain <- cbind(dataFileSubTrain,dataYTrain,dataXTrain)


# Fetches Base Data for Test ----------------------------------------------
destFileXTest <- "./UCI HAR Dataset/test/X_test.txt"
dataXTest <- read.table(destFileXTest,sep="")


# Fetches Subject Data for Test -------------------------------------------
destFileSubTest <- "./UCI HAR Dataset/test/subject_test.txt"
dataFileSubTest <- read.table(destFileSubTest,sep="")
colnames(dataFileSubTest) <- "Subject"
dataFileSubTest$Subject <- as.factor(dataFileSubTest$Subject)


# Fetches Activity Data for Test ------------------------------------------
destFileYTest <- "./UCI HAR Dataset/test/Y_test.txt"
dataYTest <- read.table(destFileYTest,sep="")
names(dataYTest) <- "Activity"
dataYTest$Activity <- as.factor(dataYTest$Activity)
levels(dataYTest$Activity) <- dataActivityName


# Combines Subject Data, Activity Data and Base Data for Test -------------
dataTest <- cbind(dataFileSubTest,dataYTest,dataXTest)


# Combines Test and Train Data --------------------------------------------
data <- rbind(dataTest,dataTrain)


# Assign column names to data as per features -----------------------------
dataCol <- c("Subject","Activity",dataFeaturesName)
colnames(data) <- dataCol


# Identifies the column containing mean and standard deviation data -------
meanCol <- grep("mean\\(",names(data),value=FALSE)
meanColName <- grep("mean\\(",names(data),value=TRUE)
sdCol <- grep("std",names(data),value=FALSE)
sdColName <- grep("std",names(data),value=TRUE)


# Columns to be fetched for tidy data set ---------------------------------
fetchCol <- c(1,2,meanCol,sdCol)


# Creates dataset with Subject, Activity and the Mean and Standard --------
dataMS <- data[,fetchCol]


# Set ID and Measure Col  -------------------------------------------------
idCol <- c("Subject","Activity")
measureCol <- c(meanColName,sdColName)


# Melt the Data Set -------------------------------------------------------
dataMSMelt <- melt(dataMS,id = idCol, measure.vars = measureCol)


# DCast the data to get the mean for Subject and Activity Combinat --------
tidydataset <- dcast(dataMSMelt,Subject + Activity ~ variable,mean)


# Write output in external file -------------------------------------------
sink("./UCI HAR Dataset/tidydataset.txt")
print(tidydataset)
sink()


# Removes the variable used -----------------------------------------------
rm(destFileActivity ,dataActivity ,dataActivityName ,destFileFeatures ,dataFeatures ,dataFeaturesName ,destFileXTrain ,dataXTrain ,destFileSubTest ,dataFileSubTrain ,destFileYTrain , dataYTrain ,dataTrain ,dataXTest ,destFileXTest ,dataFileSubTest ,dataYTest ,dataTest ,data ,dataCol ,meanCol ,meanColName ,sdCol ,sdColName ,fetchCol ,dataMS ,idCol ,measureCol ,dataMSMelt ,tidydataset)
print("Please check the file tidydataset.txt in the dataset.")