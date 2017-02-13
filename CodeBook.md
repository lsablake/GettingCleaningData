
# DATA DICTIONARY



### [01] Activity : 18

		* 6 activities performed by the subjects in the experiment for which data was collected  

    	1. LAYING"
    	2. SITTING"
    	3. STANDING"
    	4. WALKING"
    	5. WALKING_DOWNSTAIRS
    	6. WALKING_UPSTAIRS                                 


### [02] Subjects : 2 

		Unique integer identifier for each of the 30 subjects participating in the experiment.

		* Subject range is from 1 - 30


### [03] Average Means and Average Standard Deviations for Accelerometer and Gyroscope sensor signal variables in the Time domain
		 
		 * The Accelerometer signal variables, measuring total linear acceleration, are broken down by triaxial, body motion, and gravitational
		   force components.
		 * The Gyroscope signal variables, measuring angular velocity, are broken down by triaxial and body motion components.
		 * Triaxial Jerk signals are measured using body linear acceleration and angular velocity derived in time.
		 * The Magnitude of triaxial signals is measured using Euclidean norm.
		 * Variables are normalized and bounded within [-1,1].
		 * Mean    : Mean value
		 * STD     : Standard deviation
		 * XYZ     : used to denote triaxial signals in the X, Y and Z directions

		01. TimeBodyAccelerometerMean-X                      
		02. TimeBodyAccelerometerMean-Y                      
		03. TimeBodyAccelerometerMean-Z                      
		04. TimeBodyAccelerometerSTD-X                       
		05. TimeBodyAccelerometerSTD-Y
		06. TimeBodyAccelerometerSTD-Z                       
		07. TimeGravityAccelerometerMean-X                   
		08. TimeGravityAccelerometerMean-Y                   
		09. TimeGravityAccelerometerMean-Z                   
		10. TimeGravityAccelerometerSTD-X                    
		11. TimeGravityAccelerometerSTD-Y                    
		12. TimeGravityAccelerometerSTD-Z                    
		13. TimeBodyAccelerometerJerkMean-X                  
		14. TimeBodyAccelerometerJerkMean-Y                  
		15. TimeBodyAccelerometerJerkMean-Z                  
		16. TimeBodyAccelerometerJerkSTD-X                   
		17. TimeBodyAccelerometerJerkSTD-Y                   
		18. TimeBodyAccelerometerJerkSTD-Z                   
		19. TimeBodyGyroscopeMean-X                          
		20. TimeBodyGyroscopeMean-Y                          
		21. TimeBodyGyroscopeMean-Z                          
		22. TimeBodyGyroscopeSTD-X                           
		23. TimeBodyGyroscopeSTD-Y                           
		24. TimeBodyGyroscopeSTD-Z                           
		25. TimeBodyGyroscopeJerkMean-X                      
		26. TimeBodyGyroscopeJerkMean-Y                      
		27. TimeBodyGyroscopeJerkMean-Z                      
		28. TimeBodyGyroscopeJerkSTD-X                       
		29. TimeBodyGyroscopeJerkSTD-Y                       
		30. TimeBodyGyroscopeJerkSTD-Z                       
		31. TimeBodyAccelerometerMagnitudeMean               
		32. TimeBodyAccelerometerMagnitudeSTD                
		33. TimeGravityAccelerometerMagnitudeMean            
		34. TimeGravityAccelerometerMagnitudeSTD            
		35. TimeBodyAccelerometerJerkMagnitudeMean           
		36. TimeBodyAccelerometerJerkMagnitudeSTD            
		37. TimeBodyGyroscopeMagnitudeMean                   
		38. TimeBodyGyroscopeMagnitudeSTD                    
		39. TimeBodyGyroscopeJerkMagnitudeMean               
		40. TimeBodyGyroscopeJerkMagnitudeSTD   


### [04] Average Means and Average Standard Deviations for Accelerometer and Gyroscope tri-axial signals in the Frequency Domain

		 * Frequency domain signals were produced by applying a Fast Fourier Transform (FFT) to body motion component measures
		 * Variables are normalized and bounded within [-1,1].
		 * Mean    : Mean value
		 * MeanFreq: mean frequency obtained from the Weighted average of the frequency components.
		 * STD     : Standard deviation
		 * XYZ     : used to denote triaxial signals in the X, Y and Z directions

		01. FrequencyBodyAccelerometerMean-X                 
		02. FrequencyBodyAccelerometerMean-Y                 
		03. FrequencyBodyAccelerometerMean-Z                 
		04. FrequencyBodyAccelerometerSTD-X                  
		05. FrequencyBodyAccelerometerSTD-Y                  
		06. FrequencyBodyAccelerometerSTD-Z                  
		07. FrequencyBodyAccelerometerMeanFreq-X             
		08. FrequencyBodyAccelerometerMeanFreq-Y             
		09. FrequencyBodyAccelerometerMeanFreq-Z             
		10. FrequencyBodyAccelerometerJerkMean-X             
		11. FrequencyBodyAccelerometerJerkMean-Y             
		12. FrequencyBodyAccelerometerJerkMean-Z             
		13. FrequencyBodyAccelerometerJerkSTD-X              
		14. FrequencyBodyAccelerometerJerkSTD-Y              
		15. FrequencyBodyAccelerometerJerkSTD-Z          
		16. FrequencyBodyAccelerometerJerkMeanFreq-X         
		17. FrequencyBodyAccelerometerJerkMeanFreq-Y         
		18. FrequencyBodyAccelerometerJerkMeanFreq-Z         
		19. FrequencyBodyGyroscopeMean-X                     
		20. FrequencyBodyGyroscopeMean-Y                     
		21. FrequencyBodyGyroscopeMean-Z                     
		22. FrequencyBodyGyroscopeSTD-X                      
		23. FrequencyBodyGyroscopeSTD-Y                      
		24. FrequencyBodyGyroscopeSTD-Z                  
		25. FrequencyBodyGyroscopeMeanFreq-X                 
		26. FrequencyBodyGyroscopeMeanFreq-Y                 
		27. FrequencyBodyGyroscopeMeanFreq-Z           
		28. FrequencyBodyAccelerometerMagnitudeMean          
		29. FrequencyBodyAccelerometerMagnitudeSTD       
		30. FrequencyBodyAccelerometerMagnitudeMeanFreq      
		31. FrequencyBodyAccelerometerJerkMagnitudeMean      
		32. FrequencyBodyAccelerometerJerkMagnitudeSTD   
		33. FrequencyBodyAccelerometerJerkMagnitudeMeanFreq  
		34. FrequencyBodyGyroscopeMagnitudeMean
		35. FrequencyBodyGyroscopeMagnitudeSTD
		36. FrequencyBodyGyroscopeMagnitudeMeanFreq
		37. FrequencyBodyGyroscopeJerkMagnitudeMean
		38. FrequencyBodyGyroscopeJerkMagnitudeSTD       
		39. FrequencyBodyGyroscopeJerkMagnitudeMeanFreq

### [05] Additional vectors obtained by averaging the mean signals in a signal window sample. These are used on the angle() variable.

		 * Variables are normalized and bounded within [-1,1].
		 * Angle() : Angle between to vectors
		 * Mean    : Mean value
		 * XYZ     : used to denote triaxial signals in the X, Y and Z directions

		01. Angle(TimeBodyAccelerometerMean,Gravity) 
		02. Angle(TimeBodyAccelerometerJerkMean),GravityMean)
		03. Angle(TimeBodyGyroscopeMean,GravityMean)      
		04. Angle(TimeBodyGyroscopeJerkMean,GravityMean)
		05. Angle(X,GravityMean)                             
		06. Angle(Y,GravityMean)                            
		07. Angle(Z,GravityMean)