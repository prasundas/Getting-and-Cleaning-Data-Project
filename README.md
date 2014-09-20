Getting-and-Cleaning-Data-Project
=================================

Project work for the course getting and cleaning data

The function run_analysis.R assumes that the folder "UCI HAR Dataset" is stored in the working directory of R. The folder contains all the given Samsung data.

Make sure to install the reshape and reshape2 packages before executing the function.

The function inlcudes reshape and reshape2 libraries so as to use the melt and decast functions.

The function fetches the Activity and Features data from the activity_labels.txt file and features.txt respectively.

Base data for Training, Traning Subject and Traning Activity is fetched from X_train, subject_train and Y_train text files in the train folder. Activity name is feteched from the Activity variable. The data from all three data set is combined.

Base data for Test, Test Subject and Test Activity is fetched from X_test, subject_test and Y_test text files in the test folder. Activity name is feteched from the Activity variable. The data from all three data set is combined.

The two sets of data (test and train) is then combined into one.

Column names are assigned - Subject, activity then the features name. The columns containing mean and standard deviation are identified using the grep function.

Based on the columns identified, a data set is created containing subject, activity and mean and standard deviation column only.

MELT function is applied to the dataset with Subject and Activity as id and rest as variable.

DDCAST is then used to generate the mean for the combination of Subject and Activity.

Sink is used to write the output tidydataset.txt in the "UCI HAR Dataset" folder of working directory. The variables generated are then removed and a message is printed to check the output once the function is executed.
