## CodeBook

In this document, the reader can find information about the original data used to generate the tidy data set, a description of the variables, a description of the tidy data set, and transformations performed to clean up the data. Note that the tidy data set has been saved as *dataset.txt*.

### Original data
The tidy data set has been derived from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This  data set contains data collected in an experiment on wearable computing. More specifically, it contains the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone, the Samsung Galaxy S, with embedded inertial sensors. More information about the experiment can be found in the *README.txt* file included in the [original data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Variables
The tidy data set contains 68 variables. The first and second variable are used to identify the entry:
* `Subject` (integer): the experiments metioned above have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. These volunteers can be referred to as 'subjects'. As a result, the dataset contains 30 different subjects: 1, 2, ..., 30.
* `Activity` (factor): the subjects performed six different activities of daily living, each associated with one level of the factor variable `Activity`. These six levels are: *LAYING*, *SITTING*, *STANDING*, *WALKING*, *WALKING_DOWNSTAIRS*, and *WALKING_UPSTAIRS*.

The other 66 variables were derived from the original features of the raw data. The features selected for the original database came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These signals were used to estimate variables of the feature vector for each pattern. More information about these features, signals, and variables can be found in the *features_info.txt* file included in the [original data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

From the variables included in the original dataset, only the 66 variables containing measurements on the mean and standard deviation are included in the tidy data set (`tBodyAcc-mean()-X`, `tBodyAcc-mean()-Y`, `tBodyAcc-mean()-Z`, `tBodyAcc-std()-X`, `tBodyAcc-std()-Y`, `tBodyAcc-std()-Z`, etc.). However, note that this data set does not contain the variables themselves, but the mean of these variables per subject per activity.

### Tidy data set
The tidy data set, saved as *dataset.txt*, contains 180 entries, i.e. one for each subject performing one of the six activities. As stated above, each entry shows the `Subject`, the `Activity`, and the mean of the recordings of the 66 measurements on the mean and standard deviation.

### Transformations
To conclude, a summary of the clean up process of the original data to get the tidy data set is given below:
* The training and test sets were merged together.
* Only the variables on the mean and standard deviation were included.
* The dataset was labelled.
* The activity names were used to replace the numeric indicators in the `Activity` column.
* The measurements were averaged over all observations by subject and activity.