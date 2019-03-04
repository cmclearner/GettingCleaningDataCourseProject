This is a codebook for Getting and Cleaning Data Course Project.

Dataset: Human Activity Recognition Using Smartphones Data Dataset
        - subject : group of 30 volunteers within an age bracket of 18-48 years
        - experiment: each person performed 6 activities wearing a smartphone--walking, walking_upstairs, walking_downstairs, sitting, standing, laying
        - characteristics: randomly partioned into two sets: 70% of volunteers for the training data, and 30% for the test data

First, load all datasets for each test and training data, merge them together.
Labelled this dataset as mergeddata: 10299 rows, 563 columns (variables)

Second, extract only the measurements on the mean and the standard deviation for each measurement.
Labelled this dataset as extractdata: 10299 rows, 88 columns (variables)
        - Variables (88): volunteers, label, the rest with estimated either mean or SD

Third, load activitylabels data into r and use descriptive activity names (from activitylabels file) to name the activities in the "extractdata" data set.

Fourth, label appropriately the data set with descriptive variable names:
        - Rename 'label' with activity
        - Rename 't' with Time
        - Rename 'Acc' with Accelerometer
        - Rename 'Gyro' with Gyroscope
        - Rename 'Mag' with Magnitude
        - Rename 'f' with Frequency

Finally, create a tidy data from the extractdata with the average of each variable for each activity and each volunteer.
Labelled this dataset as tidydata: 180 rows, 88 columns (variables)
          Tatal list of variables from this 'tidydata':
          [1] "volunteer"                                            
          [2] "activity"  
          - variables with mean estimation: [3:55]                                           
          [3] "TimeBodyAccelermeter.mean...X"                        
          [4] "TimeBodyAccelermeter.mean...Y"                        
          [5] "TimeBodyAccelermeter.mean...Z"                        
          [6] "TimeGravityAccelermeter.mean...X"                     
          [7] "TimeGravityAccelermeter.mean...Y"                     
          [8] "TimeGravityAccelermeter.mean...Z"                     
          [9] "TimeBodyAccelermeterJerk.mean...X"                    
          [10] "TimeBodyAccelermeterJerk.mean...Y"                    
          [11] "TimeBodyAccelermeterJerk.mean...Z"                    
          [12] "TimeBodyGyroscope.mean...X"                           
          [13] "TimeBodyGyroscope.mean...Y"                           
          [14] "TimeBodyGyroscope.mean...Z"                           
          [15] "TimeBodyGyroscopeJerk.mean...X"                       
          [16] "TimeBodyGyroscopeJerk.mean...Y"                       
          [17] "TimeBodyGyroscopeJerk.mean...Z"                       
          [18] "TimeBodyAccelermeterMagnitude.mean.."                 
          [19] "TimeGravityAccelermeterMagnitude.mean.."              
          [20] "TimeBodyAccelermeterJerkMagnitude.mean.."             
          [21] "TimeBodyGyroscopeMagnitude.mean.."                    
          [22] "TimeBodyGyroscopeJerkMagnitude.mean.."                
          [23] "FrequencyBodyAccelermeter.mean...X"                   
          [24] "FrequencyBodyAccelermeter.mean...Y"                   
          [25] "FrequencyBodyAccelermeter.mean...Z"                   
          [26] "FrequencyBodyAccelermeter.meanFreq...X"               
          [27] "FrequencyBodyAccelermeter.meanFreq...Y"               
          [28] "FrequencyBodyAccelermeter.meanFreq...Z"               
          [29] "FrequencyBodyAccelermeterJerk.mean...X"               
          [30] "FrequencyBodyAccelermeterJerk.mean...Y"               
          [31] "FrequencyBodyAccelermeterJerk.mean...Z"               
          [32] "FrequencyBodyAccelermeterJerk.meanFreq...X"           
          [33] "FrequencyBodyAccelermeterJerk.meanFreq...Y"           
          [34] "FrequencyBodyAccelermeterJerk.meanFreq...Z"           
          [35] "FrequencyBodyGyroscope.mean...X"                      
          [36] "FrequencyBodyGyroscope.mean...Y"                      
          [37] "FrequencyBodyGyroscope.mean...Z"                      
          [38] "FrequencyBodyGyroscope.meanFreq...X"                  
          [39] "FrequencyBodyGyroscope.meanFreq...Y"                  
          [40] "FrequencyBodyGyroscope.meanFreq...Z"                  
          [41] "FrequencyBodyAccelermeterMagnitude.mean.."            
          [42] "FrequencyBodyAccelermeterMagnitude.meanFreq.."        
          [43] "FrequencyBodyBodyAccelermeterJerkMagnitude.mean.."    
          [44] "FrequencyBodyBodyAccelermeterJerkMagnitude.meanFreq.."
          [45] "FrequencyBodyBodyGyroscopeMagnitude.mean.."           
          [46] "FrequencyBodyBodyGyroscopeMagnitude.meanFreq.."       
          [47] "FrequencyBodyBodyGyroscopeJerkMagnitude.mean.."       
          [48] "FrequencyBodyBodyGyroscopeJerkMagnitude.meanFreq.."   
          [49] "angle.tBodyAccelermeterMean.gravity."                 
          [50] "angle.tBodyAccelermeterJerkMean..gravityMean."        
          [51] "angle.tBodyGyroscopeMean.gravityMean."                
          [52] "angle.tBodyGyroscopeJerkMean.gravityMean."            
          [53] "angle.X.gravityMean."                                 
          [54] "angle.Y.gravityMean."                                 
          [55] "angle.Z.gravityMean."   
          - variables with SD estimation: [56:88]                              
          [56] "TimeBodyAccelermeter.std...X"                         
          [57] "TimeBodyAccelermeter.std...Y"                         
          [58] "TimeBodyAccelermeter.std...Z"                         
          [59] "TimeGravityAccelermeter.std...X"                      
          [60] "TimeGravityAccelermeter.std...Y"                      
          [61] "TimeGravityAccelermeter.std...Z"                      
          [62] "TimeBodyAccelermeterJerk.std...X"                     
          [63] "TimeBodyAccelermeterJerk.std...Y"                     
          [64] "TimeBodyAccelermeterJerk.std...Z"                     
          [65] "TimeBodyGyroscope.std...X"                            
          [66] "TimeBodyGyroscope.std...Y"                            
          [67] "TimeBodyGyroscope.std...Z"                            
          [68] "TimeBodyGyroscopeJerk.std...X"                        
          [69] "TimeBodyGyroscopeJerk.std...Y"                        
          [70] "TimeBodyGyroscopeJerk.std...Z"                        
          [71] "TimeBodyAccelermeterMagnitude.std.."                  
          [72] "TimeGravityAccelermeterMagnitude.std.."               
          [73] "TimeBodyAccelermeterJerkMagnitude.std.."              
          [74] "TimeBodyGyroscopeMagnitude.std.."                     
          [75] "TimeBodyGyroscopeJerkMagnitude.std.."                 
          [76] "FrequencyBodyAccelermeter.std...X"                    
          [77] "FrequencyBodyAccelermeter.std...Y"                    
          [78] "FrequencyBodyAccelermeter.std...Z"                    
          [79] "FrequencyBodyAccelermeterJerk.std...X"                
          [80] "FrequencyBodyAccelermeterJerk.std...Y"                
          [81] "FrequencyBodyAccelermeterJerk.std...Z"                
          [82] "FrequencyBodyGyroscope.std...X"                       
          [83] "FrequencyBodyGyroscope.std...Y"                       
          [84] "FrequencyBodyGyroscope.std...Z"                       
          [85] "FrequencyBodyAccelermeterMagnitude.std.."             
          [86] "FrequencyBodyBodyAccelermeterJerkMagnitude.std.."     
          [87] "FrequencyBodyBodyGyroscopeMagnitude.std.."            
          [88] "FrequencyBodyBodyGyroscopeJerkMagnitude.std.."   
