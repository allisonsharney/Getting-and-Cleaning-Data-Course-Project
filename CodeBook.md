##CodeBook for Getting and Cleaning Data courese project

This codebook provides a description of the data and variables in the file tidy_data.txt. 

##Study Design
The experiments performed at UCI and described here:
_30 volunteers aged 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data._ 

_The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain._

##Data Transformations
The zip file containing the source data measurements is downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data to generate tidy_data.txt:

1. The training and test sets were merged to create one data set.
2. The measurements of mean and standard deviation (i.e. variables the strings mean and std) were extracted.
3. The activity identifiers (integers between 1 and 6) were used to add descriptive activity types.
4. The abbreviated variable names were replaced with descriptive variable names, using the following set of rules:

-The initial f and t were replaced with frequencyDomain and timeDomain respectively.
-Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively.

5. From the tidied data set in step 4, a second tidy data set was created with the mean of each variable for each activity and each subject.
6. Downloading and extracting the source data and the transformations listed above were implemented by the run_analysis.R R script resulting in the data table tidy_data.txt.

##Code Book
Each row contains, for a given subject and activity, the mean of 79 measurements.

###Variables
- subject : integer 1-30
- activityType: string with 6 possible values of daily activity
  WALKING: subject was walking
  WALKING_UPSTAIRS: subject was walking upstairs
  WALKING_DOWNSTAIRS: subject was walking downstairs
  SITTING: subject was sitting
  STANDING: subject was standing
  LAYING: subject was laying down 
- activityID: integer 1-6, used to identify activityType from features

####Time Domain variables
Time-domain variables (timeDomain), are a result of  accelerometer and gyroscope raw measurements.

* Mean time-domain body acceleration in the X, Y and Z directions:
  + timeDomainBodyAccelerometer-mean()-X
  + timeDomainBodyAccelerometer-mean()-Y
  + timeDomainBodyAccelerometer-mean()-Z

* Standard deviation of the time-domain body acceleration in the X, Y and Z directions:
  + timeDomainBodyAccelerometer-standardDeviation()-X
  + timeDomainBodyAccelerometer-standardDeviation()-Y
  + timeDomainBodyAccelerometer-standardDeviation()-Z
  
* Mean time-domain gravity acceleration in the X, Y and Z directions:
  + timeDomainGravityAccelerometer-mean()-X
  + timeDomainGravityAccelerometer-mean()-Y
  + timeDomainGravityAccelerometer-mean()-Z
  
* Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:
  + timeDomainGravityAccelerometer-standardDeviation()-X
  + timeDomainGravityAccelerometer-standardDeviation()-Y
  + timeDomainGravityAccelerometer-standardDeviation()-Z

* Mean time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
  + timeDomainBodyAccelerometerJerk-mean()-X
  + timeDomainBodyAccelerometerJerk-mean()-Y
  + timeDomainBodyAccelerometerJerk-mean()-Z
  
* Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
  + timeDomainBodyAccelerometerJerk-standardDeviation()-X
  + timeDomainBodyAccelerometerJerk-standardDeviation()-Y
  + timeDomainBodyAccelerometerJerk-standardDeviation()-Z
  
* Average time-domain body angular velocity in the X, Y and Z directions:
  + timeDomainBodyGyroscopeMeanX
  + timeDomainBodyGyroscopeMeanY
  + timeDomainBodyGyroscopeMeanZ

* Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:
  + timeDomainBodyGyroscope-standardDeviation()-X
  + timeDomainBodyGyroscope-standardDeviation()-Y
  + timeDomainBodyGyroscope-standardDeviation()-Z

* Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:
  + timeDomainBodyGyroscopeJerk-mean()-X
  + timeDomainBodyGyroscopeJerk-mean()-Y
  + timeDomainBodyGyroscopeJerk-mean()-Z

* Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:
  + timeDomainBodyGyroscopeJerk-standardDeviation()-X
  + timeDomainBodyGyroscopeJerk-standardDeviation()-Y
  + timeDomainBodyGyroscopeJerk-standardDeviation()-Z

* Mean and standard deviation of the time-domain magnitude of body acceleration:
  + timeDomainBodyAccelerometerMagnitude-mean()
  + timeDomainBodyAccelerometerMagnitude-standardDeviation()

* Mean and standard deviation of the time-domain magnitude of gravity acceleration:
  + timeDomainGravityAccelerometerMagnitude-mean()
  + timeDomainGravityAccelerometerMagnitude-standardDeviation()
  
* Mean and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
  + timeDomainBodyAccelerometerJerkMagnitude-mean()
  + timeDomainBodyAccelerometerJerkMagnitude-standardDeviation()
  
* Mean and standard deviation of the time-domain magnitude of body angular velocity:
  + timeDomainBodyGyroscopeMagnitude-mean()
  + timeDomainBodyGyroscopeMagnitude-standardDeviation()
  
* Mean and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
  + timeDomainBodyGyroscopeJerkMagnitude-mean()
  + timeDomainBodyGyroscopeJerkMagnitude-standardDeviation()
  
####Frequency-domain signals

* Mean frequency-domain body acceleration in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometer-mean()-X
  + frequencyDomainBodyAccelerometer-mean()-Y
  + frequencyDomainBodyAccelerometer-mean()-Z
  
* Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometer-standardDeviation()-X
  + frequencyDomainBodyAccelerometer-standardDeviation()-Y
  + frequencyDomainBodyAccelerometer-standardDeviation()-Z

* Weighted mean of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometer-meanFrequency()-X
  + frequencyDomainBodyAccelerometer-meanFrequency()-Y
  + frequencyDomainBodyAccelerometer-meanFrequency()-Z

* Mean frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometerJerk-mean()-X
  + frequencyDomainBodyAccelerometerJerk-mean()-Y
  + frequencyDomainBodyAccelerometerJerk-mean()-Z
  
* Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometerJerk-standardDeviation()-X
  + frequencyDomainBodyAccelerometerJerk-standardDeviation()-Y
  + frequencyDomainBodyAccelerometerJerk-standardDeviation()-Z
  
* Weighted mean of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
  + frequencyDomainBodyAccelerometerJerk-meanFrequency()-X
  + frequencyDomainBodyAccelerometerJerk-meanFrequency()-Y
  + frequencyDomainBodyAccelerometerJerk-meanFrequency()-Z
  
* Mean frequency-domain body angular velocity in the X, Y and Z directions:
  + frequencyDomainBodyGyroscope-mean()-X
  +frequencyDomainBodyGyroscope-mean()-Y
  +frequencyDomainBodyGyroscope-mean()-Z
  
* Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions:
  + frequencyDomainBodyGyroscope-standardDeviation()-X
  + frequencyDomainBodyGyroscope-standardDeviation()-Y
  + frequencyDomainBodyGyroscope-standardDeviation()-Z
  
* Weighted mean of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions:
  + frequencyDomainBodyGyroscope-meanFrequency()-X
  + frequencyDomainBodyGyroscope-meanFrequency()-Y
  + frequencyDomainBodyGyroscope-meanFrequency()-Z
  
* Mean, standard deviation, and weighted mean of the frequency components of the frequency-domain magnitude of body acceleration:
  + frequencyDomainBodyAccelerometerMagnitude-mean()
  + frequencyDomainBodyAccelerometerMagnitudeS-standardDeviation()
  + frequencyDomainBodyAccelerometerMagnitude-meanFrequency()
  
* Mean, standard deviation, and weighted mean of the frequency components of the frequency-domain magnitude of body acceleration jerk:
  + frequencyDomainBodyAccelerometerJerkMagnitude-mean()
  + frequencyDomainBodyAccelerometerJerkMagnitude-standardDeviation()
  + frequencyDomainBodyAccelerometerJerkMagnitude-meanFrequency()
  
* Mean, standard deviation, and weighted mean of the frequency components of the frequency-domain magnitude of body angular velocity:
  + frequencyDomainBodyGyroscopeMagnitude-mean()
  + frequencyDomainBodyGyroscopeMagnitude-standardDeviation()
  + frequencyDomainBodyGyroscopeMagnitude-meanFrequency()

* Mean, standard deviation, and weighted Mean of the frequency components of the frequency-domain magnitude of body angular velocity jerk:
  + frequencyDomainBodyGyroscopeJerkMagnitude-mean()
  + frequencyDomainBodyGyroscopeJerkMagnitude-standardDeviation()
  + frequencyDomainBodyGyroscopeJerkMagnitude-meanFrequency()
