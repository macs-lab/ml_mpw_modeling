# Predicting melt pool width with Long Short Term Memory (LSTM) Network

## Introduction
The linear regression model I previous created is very powerful and easy to understand and utilize, however, there are a few, yet critical drawbacks of that model. The biggest issue is that the model presumes that each pattern is created by the same number of data. For example, for the 10 tracks example, each pattern is consisted of 100 points. If some pattern has 99 points and some has 101 points, that model cannot be implemented. To resolve not only that specific issue but also many others, I created a new model that can take in any sort of data, and predict future melt pool width by implementing a LSTM network.

## Contents
1. [LSTM_10_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_10_Tracks.ipynb)
2. [LSTM_20_Tracks.ipynb](https://github.com/macs-lab/ml_mpw_modeling/blob/master/LSTM/LSTM_20_Tracks.ipynb)
