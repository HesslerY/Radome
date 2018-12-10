
%----------------------------%
%   计算偏转角度
%----------------------------%


%   sind(theta_4)=sind(theta_1)*cosd(alpha)-sqrt(3.2-(sind(theta_1))^2)*sind(alpha) %

clear
close all
clc
%   三角函数，均采用角度制
alpha=5;
theta_1=0:1:89;
theta_2=asind(sind(theta_1)/sqrt(3.2));
plot(theta_1,theta_2);
title('\theta_2随\theta_1变化')
xlabel('\theta_1^{ \circ}')
ylabel('\theta_2^{ \circ}')

figure
theta_4=asind( sind(theta_1)*cosd(alpha)-sqrt(3.2-(sind(theta_1)).^2)*sind(alpha) );
plot(theta_1,theta_4+alpha-theta_1)
title('\alpha=5^{ \circ}')
xlabel('\theta_1^{ \circ}')
ylabel('偏转角度{ \circ}')

clear theta_4

hold on
theta_4=asind( sind(theta_1)*cosd(alpha)+sqrt(3.2-(sind(theta_1)).^2)*sind(alpha) );
% plot(theta_1,theta_4-alpha-theta_1,'r.')
hold on 
plot(theta_1,-(theta_4-alpha-theta_1),'r.')
legend('\theta_4+\alpha-\theta_1','\theta_4-\alpha-\theta_1')

% figure 
% plot(theta_1, sind(theta_1)*cosd(alpha)+sqrt(3.2-(sind(theta_1)).^2)*sind(alpha) )
%   情况二提示复数超出，实际上是达到临界角度，不能出射了

%   综合比较了一下，其实还是情况一的合适一些
% figure
% plot(theta_1,sind(theta_1)*cosd(alpha)-sqrt(3.2-(sind(theta_1)).^2)*sind(alpha))

