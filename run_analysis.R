
#---------------------------------------------------------------------------------------------------
#1. Download and extract raw datasets from source (unnecessary to repeat if datasets are unchanged).


if(!file.exists("./data")) {
  dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "Dataset.zip")
unzip("Dataset.zip", overwrite = TRUE, exdir = "./data")

dateDownloaded <- date()

#---------------------------------------------------------------------------------------------------
#2. Read relevant datasets into R environment

# Read "activity" dataset into R
actLabelFile <- "./data/UCI HAR Dataset/activity_labels.txt"
activity_labels <- read.table(actLabelFile, quote = "")

# Read "features" data into R
featuresFile <- "./data/UCI HAR Dataset/features.txt"
features <- read.table(file=featuresFile, header = FALSE, quote = "")


# Read "test" datasets into R
X_testFile <- "./data/UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(X_testFile, quote = "")

y_testFile <- "./data/UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(y_testFile, quote = "")

testsubjFile <- "./data/UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(testsubjFile, quote = "")

# Read training datasets into R
X_trainFile <- "./data/UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(X_trainFile, quote = "")

y_trainFile <- "./data/UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(y_trainFile, quote = "")

trainsubjFile <- "./data/UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(trainsubjFile, quote = "")



#---------------------------------------------------------------------------------------------------
#1. Merge the training and the test features datasets to create one data set
#   (excludes the 'subject' data sets at this point.)

library(dplyr)


total_data <- bind_rows(X_test, X_train) #combine test and train datasets by rows
names(total_data) <- features[,2] #assign column names to the merged dataset



#---------------------------------------------------------------------------------------------------
#2. Extract only the measurements on the mean and standard deviation for each measurement.

MeanDevData <- total_data[,grepl("[Mm]ean|[Ss]td()", names(total_data))]
#select only the 'mean' and 'std()' variables from the total_data dataset



#---------------------------------------------------------------------------------------------------
#3. Use descriptive activity names to name the activities in the data set


# Add the "activityNum" vector as the first column in the MeanDevData dataset
activityNum <- bind_rows(y_test, y_train)
MeanDevData <- bind_cols(activityNum,MeanDevData)


#replace activity numbers with descriptive activity labels
activity_labels[,2] <- as.character(activity_labels[,2])
MeanDevData$V1 <- as.character(MeanDevData$V1)

for(i in seq_along(activity_labels[,1])) {
  MeanDevData$V1[MeanDevData$V1==as.character(i)] <- activity_labels[i,2]
} 


#---------------------------------------------------------------------------------------------------
#4. Appropriately label the data set with descriptive variable names.

library(data.table)
#rename the activity variable from "V1" to "Activity"
setnames(MeanDevData, "V1", "Activity") # {data.table package}

#replace ambiguous abbreviations with more complete descriptors.
#remove unneccesary symbolic notations. Standardize format.
names(MeanDevData) <- gsub("Acc", "Accelerometer", names(MeanDevData))
names(MeanDevData) <- gsub("Gyro", "Gyroscope", names(MeanDevData))
names(MeanDevData) <- gsub("BodyBody", "Body", names(MeanDevData))
names(MeanDevData) <- gsub("Mag", "Magnitude", names(MeanDevData))
names(MeanDevData) <- gsub("^t", "Time", names(MeanDevData))
names(MeanDevData) <- gsub("-std|-STD", "STD", names(MeanDevData))
names(MeanDevData) <- gsub("^f","Frequency", names(MeanDevData))
names(MeanDevData) <- gsub("freq","Freq", names(MeanDevData), ignore.case = FALSE)
names(MeanDevData) <- gsub("angle", "Angle", names(MeanDevData), ignore.case = FALSE)
names(MeanDevData) <- gsub("gravity", "Gravity", names(MeanDevData),ignore.case = FALSE )
names(MeanDevData) <- gsub("\\(\\)", "", names(MeanDevData))
names(MeanDevData) <- gsub("-[Mm]ean", "Mean", names(MeanDevData), ignore.case = FALSE)
names(MeanDevData) <- gsub("tBody", "TimeBody", names(MeanDevData))


#---------------------------------------------------------------------------------------------------
#5. From the data set in step 4, create a second, independent tidy data set
#   with the average of each variable for each activity and each subject.

library(reshape2)

subjectsData <- bind_rows(subject_test, subject_train)
#combine test and training subjects data (not necessary before this point)

MeanDevData2 <- bind_cols(subjectsData, MeanDevData)
#append the subjectsData dataset to the MeanDeveData dataset

setnames(MeanDevData2, "V1", "Subjects") # {data.table package}
#Create descriptive variable name for newly appended data

MeanDevData2 <- MeanDevData2[order(MeanDevData2$Subjects,MeanDevData2$Activity),]
#Order rows by subect and activity for more efficient evaluation

MeanDevMelt <- melt(MeanDevData2, id =c("Subjects", "Activity"), 
                    measure.vars = names(MeanDevData2[,3:88]))
#Prepare dataframe for reshaping by specifying "id" variables and "measure" variables

SubjectsMean <- dcast(MeanDevMelt, variable ~ Subjects,mean)
#Average each variable by subjects 

ActivityMean <- dcast(MeanDevMelt, variable ~ Activity, mean)
#Average each variable by activity

SummaryMean <- merge(ActivityMean,SubjectsMean,
                     by.x = "variable", by.y = "variable", all = TRUE)
#Merge both ActivityMean and SubjectsMean datatables by the common variable "variable" 

#End of file.