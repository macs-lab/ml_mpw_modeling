clc; clear all; close all

load('Data')

%7 Train
%2 Predict


plot(t,mpwall)
hold on

%Initialization (T is the x value and X is the y value)
train_num = 7;
total_pattern = 9;

X = zeros(train_num, 100);
T = ones(train_num, 200);
m = zeros(train_num,100);
%Collect each points from the pattern
for cycle = 1:train_num
    for i = 1:100
%Starts from m = 96 (Start of the pattern)
%Reshapes data for Linear Regression
         m(cycle, i) = 95+i + (cycle-1)*100 ;        
         X(cycle, i) = mpwall(m(cycle, i));
         T(cycle, 2*i) = t(m(cycle, i));
    end
end

%Intial Guess
theta = zeros(2,100);

% %Gradient Descent
for i = 2:2:200
[theta(:,i/2), J_history(:,i/2)] = gradientDescent(T(:,i-1:i), X(:,i/2),...
    theta(:,i/2), 0.1, 10000);
end


%For loop to find y_predict & plotting trained pattern
y_predict = zeros(100,9);



% %Verification m=101//6
% 
% x = [0.0505000000000000;0.100500000000000;0.150500000000000;0.200500000000000;0.250500000000000;0.300500000000000;0.350500000000000;0.4050;0.4505];
% x = [ones(9,1),x];
% y= x*theta(:,6);
%     plot(x, y,'m')

    
    
for i = 1:total_pattern
    predict = [ones(100,1), t((100*(i-1))+96:(100*i)+95)];
    for k = 1:100
    yp = predict(k,:) * theta(:,k);
    y_predict(k,i) = yp;
    end
    plot(predict(:,2),y_predict(:,i),'r')
end



hold off
legend('Data','Prediction')

%For loop to reshape exact y values
y_exact = zeros(100,total_pattern);
for i = 1:total_pattern
    y_exact(:,i) = mpwall((100*(i-1))+96:(100*i)+95);    
end

%Rsq value 
Rsq=zeros(1,total_pattern);
for i=1:total_pattern
R = corrcoef(y_predict(:,i),y_exact(:,i));
Rsq(i) = R(1,2).^2;
end


figure(3)
plot(Rsq)



