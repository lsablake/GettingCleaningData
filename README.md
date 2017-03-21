
==================================================================
### Getting And Cleaning Data Course Project
### Coursera/John Hopkins University
### Completed by L Blake, Feb 2017
==================================================================
#### The project includes the following files:
* 'README.md'      : Explanation of project requirements, and data transformations to achieve tidy data requirements.
* 'Codebook.md'    : Explanation of the variables and values in the output tidy dataset.
* 'run_analysis.R' : R code used to transform source files to tidy data.
* 'tidydata.txt'   : Output text file containing tidy dataset.

==================================================================
#### Project Requirements
==================================================================

The project requires course participants to "demonstrate [the] ability to collect, work with, and clean a data set".
Requirements: Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
   activity and each subject.

==================================================================
#### How Project Requirements Were Satisfied
==================================================================

Steps performed in run_analysis.R:

1. Performed a "guardian check" to verify/create a local directory to which source files would be downloaded.

2. downloaded and extracted the relevant source datafiles to the local directory (./data).

3. From the local directory, read the relevant source files into the R environment using read.table().
   Relevant source files excluded the "Inertial Signals" files, which were not necessary for completing the project.
	 
4. Merged the X_test/train datasets via dplyr::bind_rows() into one large dataset. The "Subjects" test/train datasets were 
   purposely excluded from the merged dataset because aren't required at this point. The "Subjects" test/train datasets are
   added at a later point in the script.
	 
5. Column names were then assigned to the large dataset variables using the "features" dataset. These names, while more descriptive, 
   are not the final names assigned to variables in the tidy data.
	 
6. Extracted the mean and standard deviation measures from the original merged dataset, thereby creating a new dataset called
    MeanDevData. The extracted variables include the "additional variables related to the angle() measures":
	* angle(tBodyAccMean,gravity)
	* angle(tBodyAccJerkMean),gravityMean)
	* angle(tBodyGyroMean,gravityMean)
	* angle(tBodyGyroJerkMean,gravityMean)
	* angle(X,gravityMean)
	* angle(Y,gravityMean)
	* angle(Z,gravityMean)
	 
	The decision to include these angle() means had two rationales:
	a. These variable represent unique and distinct measures.
	b. They are "de minimis" relative to the overall dataset, and can be easily excluded should they be later deemed unnecessary.
			
7. Merged "Activity Numbers", represented by y_test/train datasets, and added them to the MeanDevData dataset as a variable. 
	 This step assigned activity numbers to each observation in the MeanDevData dataset.
	 
8. Immediately replaced "Activity Numbers" with more descriptive "Activity Labels", in keeping with project requirement 3.

9. Relabeled the remaining variables with more descriptive labels by replacing abbreviations with more complete descriptors, and
   removing unnecessary symbolic notations. Used the gsub() function to replace abbreviations with more complete descriptors.
	 
10. Merged the "Subjects" data, represented by subject_test/train datasets, and added the "Subjects" variable to the MeanDevData 
	dataset, thereby creating a new dataset called MeanDevData2.
	 
11. Reordered the columns of the MeanDevData2 dataset to evaluate more efficiently.

12. Melted the MeanDevData2 dataset, creating identifier "Subjects" and "Actvity", thereby creating a new
    dataset called MeanDevMolt in preparation for casting
	
13. Casted the MeanDevMolt dataset by Subject and Activity, creating a final tidy dataset called SummaryData which provides the 
    average of each feature for each Subject and each Activity.
		
14. Create an output file "tidydata.txt for project review. The final dataset fulfills the requirements of a tidy dataset because:
		
	* Each variable is represented by its own column
			
	* Each observational unit is represented in its own row
			
	* Each type of observational unit forms a table - in this case, there is one type of observational unit,
	  therefore one table.

#### Additional Considerations
1. The decision was deliberately made to leave axial signals (XYZ) alone and not create an additional column called "Axial Signal",
   which might have made the final dataset "tidier", but would have also resulted in structural NA values.

==================================================================
### Source Data
==================================================================
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
A full description of the source data is available at: 
[link]http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The source data for the project can be found at:
[link]https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* For more information about the source dataset contact: activityrecognition@smartlab.ws
[link]http://www.smartlab.ws

==================================================================
