# Code Book

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## The dataset includes the following data

**activity** includes one of the following values: `walking`, `walking_upstairs`, `walking_downstairs`, `sitting`, `standing` or `laying` and explains what kind of activity the subject was doing at the time of measuring.

**subject** holds an identifier of the subject who carried out the experiment a number between 1 and 30.

Variables that start with `time_` has values from 3-axial (X, Y, Z) raw signals captured at a constant rate of 50 Hz
Variables that start with `fft_` has values from 3-axial (X, Y, Z) raw signals captured at a constant rate of 50 Hz with a Fast Fourier Transform.


|Variable name                                   |
|------------------------------------------------|
|activity                                        |
|subject                                         |
|time_body_acceleration_mean_x                   |
|time_body_acceleration_mean_y                   |
|time_body_acceleration_mean_z                   |
|time_body_acceleration_standard_deviation_x     |
|time_body_acceleration_standard_deviation_y     |
|time_body_acceleration_standard_deviation_z     |
|time_gravity_acceleration_mean_x                |
|time_gravity_acceleration_mean_y                |
|time_gravity_acceleration_mean_z                |
|time_gravity_acceleration_standard_deviation_x  |
|time_gravity_acceleration_standard_deviation_y  |
|time_gravity_acceleration_standard_deviation_z  |
|time_body_acceleration_jerk_mean_x              |
|time_body_acceleration_jerk_mean_y              |
|time_body_acceleration_jerk_mean_z              |
|time_body_acceleration_jerk_standard_deviation_x|
|time_body_acceleration_jerk_standard_deviation_y|
|time_body_acceleration_jerk_standard_deviation_z|
|time_body_gyro_mean_x                           |
|time_body_gyro_mean_y                           |
|time_body_gyro_mean_z                           |
|time_body_gyro_standard_deviation_x             |
|time_body_gyro_standard_deviation_y             |
|time_body_gyro_standard_deviation_z             |
|time_body_gyro_jerk_mean_x                      |
|time_body_gyro_jerk_mean_y                      |
|time_body_gyro_jerk_mean_z                      |
|time_body_gyro_jerk_standard_deviation_x        |
|time_body_gyro_jerk_standard_deviation_y        |
|time_body_gyro_jerk_standard_deviation_z        |
|fft_body_acceleration_mean_x                    |
|fft_body_acceleration_mean_y                    |
|fft_body_acceleration_mean_z                    |
|fft_body_acceleration_standard_deviation_x      |
|fft_body_acceleration_standard_deviation_y      |
|fft_body_acceleration_standard_deviation_z      |
|fft_body_acceleration_jerk_mean_x               |
|fft_body_acceleration_jerk_mean_y               |
|fft_body_acceleration_jerk_mean_z               |
|fft_body_acceleration_jerk_standard_deviation_x |
|fft_body_acceleration_jerk_standard_deviation_y |
|fft_body_acceleration_jerk_standard_deviation_z |
|fft_body_gyro_mean_x                            |
|fft_body_gyro_mean_y                            |
|fft_body_gyro_mean_z                            |
|fft_body_gyro_standard_deviation_x              |
|fft_body_gyro_standard_deviation_y              |
|fft_body_gyro_standard_deviation_z              |
