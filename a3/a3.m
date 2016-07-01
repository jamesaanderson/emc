clear; close all; clc;

laser = xlsread('LaserData.xlsx');
X = laser(:,1);
Y = laser(:,2);

f = fit(X,Y,'gauss1');
plot(f,X,Y);
xlabel('x(um)');
ylabel('NA=0.1');