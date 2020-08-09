# Predicting melt pool width with linear regression

## Introduction

There are 6 different files in this folder: ConvertData.m, ConvertData20.m, computeCost.m, gradientDescent.m, one_on_one.m, one_on_one_20.m. The actual machine learning codes that trains the data are one_on_one.m and one_on_one20.m, however, in order to understand this code, comprehension of other codes are necessary.
I plan to explain to the best of my ability the method and logic that were used to find the best fitting curves that predicts future melt pool width.

## Contents
1. [computeCost.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/computeCost.m)
2. [gradientDescent.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/gradientDescent.m)
3. [convertData.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/ConvertData.m) & [convertData20.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/ConvertData20.m)
4. [one_on_one.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/one_on_one.m)
5. [one_on_one_20.m](https://github.com/macs-lab/ml_mpw_modeling/blob/master/Machine%20Learning/one_on_one_20.m)


## computeCost.m
This code calculates the cost function J of the data. Cost function is the average of the sum of least squared difference of the predicted melt pool width and the actual melt pool width. Since we are training the melt pool width linearly, we multiply a parameter vector that is 2 by 1 (varaible name of the parameter is called theta) by an X matrix which the size is n by 2 (n is the number of training patterns) to calculate the 'hypothesis function.'
Hypothesis function, thus, has the form h(x) = theta0 + theta1 * x and the cost function 1/(2*m) * sum(h(x) - y).^2
The computed cost function is 3-dimensional with axes theta0, theta1, and J.

## gradientDescent.m
Gradient descent is used to optimize the multidimensional cost function. By using this function, it outputs a parameter vector which minimizes the squared difference of the predictied mpw and the actual mpw. Alpha is also known as the learning rate, and finding the right value of alpha is key for the efficiency of linear regression. Choosing an alpha that is too big could hinder the convergence of the parameter vector.

## convertData.m & convertData20.m
This file takes in the given data (10tracks_mpw.mat and 20tracks_mpw.mat) and gives out two values t and mpwall in a file named Data.mat and Data2.mat.
The first is used for training the 10 tracks example and the latter for the 20 tracks. t is time in seconds and mpwall is melt pool width in meters.

