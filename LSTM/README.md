# Predicting melt pool width with Long Short Term Memory (LSTM) Network

## Introduction
The linear regression model I previously created is easy to understand and utilize, however, there are a few, yet critical drawbacks of that model. The biggest issue is that the model presumes that each pattern is created by the same number of data. For example, for the 10 tracks example, each pattern is consisted of 100 points. If some pattern has 99 points and some has 101 points, that model cannot be implemented. To resolve not only that specific issue but also many others such as having to manually change the for loops when initializing data, I created a new model that can take in any sort of data, and predict the future melt pool width by implementing an LSTM network.

## Files
1. [LSTM_10_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_10_Tracks.ipynb)
2. [LSTM_20_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_20_Tracks.ipynb)
3. 
4. 

## What to look out for
If you look at the code, it will be apparent that I am using Google Colaboratory. The first block of code is used to bring data in from my Google Drive. Therefore, it can be ignored and you can start from the second block of code. There are three important factos that determine the accuarcy, as well as, the time it takes to train the model: Learning rate, number of epoch, and training window. I have found that the best input for the learning rate is around 0.05 and the training window is around 150-200. Having a GPU will decrease the required training time to about 3-4 times, however, this model can be also trained entirely by a CPU.
