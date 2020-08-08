## Introduction

There are 6 different files in this folder: ConvertData.m, ConvertData20.m, computeCost.m, gradientDescent.m, one_on_one.m, one_on_one_20.m.

The actual machine learning codes that trains the data are one_on_one.m and one_on_one20.m, however, in order to understand this code, comprehension of other codes are necessary.
I plan to explain to the best of my ability the method and logic that were used to solve this problem of fitting the curve to predict future melt pool width.

1. Cost function and Gradient Descent:




2. [convertData.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/ConvertData.m) and [convertData20.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/ConvertData20.m): 

This file takes in the given data (10tracks_mpw.mat and 20tracks_mpw.mat) and gives out two values t and mpwall in a file named Data.mat and Data2.mat.
The first is used for training the 10 tracks example and the latter for the 20 tracks. t is time in seconds and mpwall is melt pool width in meters.

3. [computeCost.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/computeCost.m):

This code calculates the cost function from our data. Cost function 
