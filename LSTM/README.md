# Predicting melt pool width with Long Short Term Memory (LSTM) Network

## Introduction
The linear regression model I previously created is easy to understand and utilize, however, there are a few, yet critical drawbacks of that model. The biggest issue is that the model presumes that each pattern is created by the same number of data. For example, for the 10 tracks example, each pattern is consisted of 100 points. If some pattern has 99 points and some has 101 points, that model cannot be implemented. To resolve not only that specific issue but also many others such as having to manually change the for loops when initializing data, I created a new model that can take in any sort of data, and predict the future melt pool width by implementing an LSTM network.

## Files
1. [LSTM_10_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_10_Tracks.ipynb)
2. [LSTM_20_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_20_Tracks.ipynb)
3. [LSTM_10.csv](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_10.csv)
4. [LSTM_20.csv](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_20.csv)

## Contents (LSTM 20 Tracks)
1. Importing Data
2. Preprocessing Data
3. GPU
4. Creating and Training Model
5. Evaluating Model

## Importing Data
I used Google Colaboratory to make and train this model, therefore, I had to import the data from my Google Drive. Skip this step and simply import your data if you are not using Google Colab(I want to point out that downloaded.GetContentFile('DNN_20.csv') needs to be downloaded.GetContentFile('LSTM_20.csv'). Also the id for downloaded = drive.CreateFile({}) is going to be different for each person, however, there are many blogs on the Internet that explains how to find the id for your file in Google Drive).
![](images/Importing%20Data.JPG)


## Preprocessing Data
We read in the csv file by using the pandas library and then modify the window of the variables so we can put more emphasis on the trend of the patterns. I set the training size to be around 75% of the data testing size to be 25%.
![](images/Preprocessing1.JPG)

If we graph the data, it would look as such:

![](images/Graph1.JPG)

The next step is to normalize the data and change the type from numpy array to tensor. Normalizing is critical because without it, the trained model can predict the shape of the pattern, however, the predicted values are out of scale and incorrect.

![](images/Preprocessing2.JPG)

This function is the key for training our LSTM model. We input our data and set a training window, and in return it outputs a list of multiple tuples. To illustrate what the function does, given a vector [a, b, c, d, e] and the training window is 2, we would get [([a, b], [c]), ([b, c], [d]), ([c, d], [e])].


![](images/Preprocessing3.JPG)

Applying the create_inout_sequences function for our data will look like this:

![](images/Preprocessing4.JPG)

## What to look out for
There are three important factors that determine the accuarcy, as well as, the time it takes to train the model: Learning rate, number of epoch, and training window. I have found that the best input for the learning rate is around 0.05 and the training window is around 150-200. Having a GPU will decrease the required training time to about 3-4 times, however, this model can also be trained entirely by a CPU.
