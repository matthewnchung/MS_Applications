# MS_Applications
The following are a series of tests to help Multiple Sclerosis researchers better detect and track the progression of MS overtime. They are to be used in clinical trials to guage the effectiveness of different pharmeceuticals and medications on MS at the National Institutes of Health Clinical Center.  
All applications write directly to a centralized Google Sheet using the Google Sheets API. Researchers take the data inputted data and can plot graphs to view a patients progress. In addition, users create accounts by using Google SignIn or their personal emails. A unique key is provided to each user and that information is what is used to identify each user in the centralized Google Sheet.
Some metrics such as accuracy and other scores are computed in the background and not presented to the user. This was a request by the client due to the negative effects it could have on patient morale in the case that their scores decreased.

## Homescreen
![image](https://cloud.githubusercontent.com/assets/22035418/25635139/0f667598-2f4b-11e7-84d6-f73f6ebb895f.png)    
The homescreen consists of a scrollview of all tests a patient may have to take. This is controlled by a navigation controller.

## Tap Test
![ezgif com-video-to-gif](https://cloud.githubusercontent.com/assets/22035418/25636136/7de8ce00-2f4e-11e7-9cc7-f024eb4f0743.gif)  
The tap test tests a user's motor control and dexterity. The user's number of taps over 10 seconds is recorded and 3 trials are averaged, then sent to a centralized Google Sheet. There is also an option to send scores via email to the patient's doctor but this is optional.

## Trace Test
![ezgif com-video-to-gif 1](https://cloud.githubusercontent.com/assets/22035418/25636263/e0cf1d12-2f4e-11e7-9bf8-3b8e8a19a100.gif)  
The trace test asks a user to trace a spiral and the accuracy/time of the user's trace is recorded. Accuracy was measured by measuring deviance of red pixels from the original black lines.

## Reflex Test
![ezgif com-video-to-gif 2](https://cloud.githubusercontent.com/assets/22035418/25636414/502b6116-2f4f-11e7-95b0-2f71b7fc338e.gif)  
The reflex test measures 2 different metrics, reaction time as well as overall speed. Overall speed is measured by calculating how long it took to tap 10 randomly placed circles on the screen. Reaction time was measured by measuring the time between when a dot appeared and the time it took to tap it. All of those reaction times were averaged to calculate an average reaction time.

## Currently
Currently I am working on developing other tests to measure other motor functions
### Stand Still Test
Since patients with MS tend to sway their upper bodies heavily, I am developing an application that will have the patient stand in one place and measure deviances from the center point they originally stood at. To achieve this, I am working with the iPhone's accelerometer. To calculate position change I had to write algorithms going from acceleration to just XY position.
### Curl Test
Another metric to test was a patient's ability to perform a basic arm curl. The patient holds the phone and tries to do 10  curls. Measuring a curl just using the accelerometer proved to be difficult because of the inaccuracy of the accelerometer at quick movements, so the gyroscope was also used to supplement accelrometer data. I had to create a low-pass filter algorithm to filter out unnecessary information sent from the gyoscope/accelerometer and that allowed me to accurately measure a curl.
