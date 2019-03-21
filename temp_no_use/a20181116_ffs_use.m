clear all
close all

% % % % %  计算对比理论偏转和实际偏转
% % 
% % theta_1=[0 0 15 15 30 30];
% % alpha=[15 30 15 30 15 30];
% % 
% % 
% % % % %  3-1 --- 3-6
% % theta_4=asind(sind(theta_1).*cosd(alpha)-sqrt(3.2-(sind(theta_1)).^2).*sind(alpha))

% 3-7对应模型3


theta_1=30;
alpha=15;
theta_4=asind(sind(theta_1).*cosd(alpha)+sqrt(3.2-(sind(theta_1)).^2).*sind(alpha))




%   讨论透波率




