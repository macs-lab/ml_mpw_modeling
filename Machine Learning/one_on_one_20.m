clc; clear all; close all

%15 train
%4 predict
%Start from t=0.05 which is m=100

%y_predict is wrong


%% 
load('Data2')

%%
plot(t,mpwall)
hold on

%Initialization (T is the x value and X is the y value)
train_num = 15;
total_pattern = 19;

X = zeros(train_num, 100);
T = ones(train_num, 200);
m = zeros(train_num,100);
%Collect each points from the pattern
for cycle = 1:train_num
    for i = 1:100
%Starts from m = 100 (Start of the pattern)
%Reshapes data for Linear Regression
         m(cycle, i) = (i-1) + cycle*100 ;        
         X(cycle, i) = mpwall(m(cycle, i));
         T(cycle, 2*i) = t(m(cycle, i));
    end
end
%% Intial Guess and Gradient Descent Part i (downpeak only lasts till 1100, T(1:2,1:11))
%  theta(:,1) is the first 10 patterns
%  theta(:,2) is the last 5 patterns 
theta = zeros(2,101);

%Gradient Descent
[theta(:,1), J_history(:,1)] = gradientDescent(T(1:10,3:4), X(1:10,2),...
    theta(:,1), 0.1, 10000);

[theta(:,2), J_history(:,2)] = gradientDescent(T(11:15,3:4), X(11:15,2),...
    theta(:,2), 0.1, 10000);

[theta(:,3), J_history(:,3)] = gradientDescent(T(:,1:2), X(:,1),...
    theta(:,3), 0.1, 10000);


%% Gradient Descent Part ii 

for i = 6:2:200
[theta(:,i/2 + 1), J_history(:,i/2 + 1)] = gradientDescent(T(:,i-1:i), X(:,i/2),...
    theta(:,i/2 +1), 0.1, 10000);
end


%% For loop to find y_predict 

y_predict = zeros(100, total_pattern );

for i = 1:total_pattern
    predict = [ones(1,1), t(100)];
    yp = predict * theta(:,3);
    y_predict(1,i) = yp;

end


for i = 1:total_pattern
    predict = [ones(100,1), t(100*(i):(100*(i+1)-1))];
    for k = 1:98
    yp = predict(k+2,:) * theta(:,k+3);
    y_predict( k+2 ,i) = yp;
    end
  
end


%% For loop to find y_predict ii
% for the 101th points

for i = 1:10
    predict = [ones(1,1), t(100*(i)+1)];
    yp = predict * theta(:,1);
    y_predict(2,i) = yp;

end


for i = 11:total_pattern
    predict = [ones(1,1), t(100*(i)+1)];
    yp = predict * theta(:,2);
    y_predict(2,i) = yp;
   
end





%% For loop to plot

for pattern = 1:total_pattern
    plot(t(100*(pattern):(100*(pattern+1)-1)),y_predict(:,pattern),'r')
    
    
end
hold off

%% For loop to reshape exact y values
y_exact = zeros(100,total_pattern);
for i = 1:total_pattern 
    y_exact(:,i) = mpwall((100*i:(100*(i+1)-1)));    
end

%Rsq value 
Rsq=zeros(1,total_pattern);
for i=1:total_pattern
R = corrcoef(y_predict(:,i),y_exact(:,i));
Rsq(i) = R(1,2).^2;
end



figure(3)
plot(Rsq)



