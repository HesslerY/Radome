 
clc;
clear;close all;

%-----------------------------%
%   平行极化透射率
%   data: 2018 10 25
%-----------------------------%

epsilon_r=3.2;
theta=0:1:90;
%   平行极化---存在问题
n_p=epsilon_r*cosd(theta)./sqrt(epsilon_r-(sind(theta)).^2);
%   平行极化功率反射系数
R_p=((1-n_p)./(2+n_p)).^2;

%   垂直极化 ---存在问题
n_v=epsilon_r*sqrt(epsilon_r-(sind(theta)).^2)./cosd(theta);
%   垂直极化功率反射系数
R_v=((1-n_v)./(2+n_v)).^2;


%   电磁场与波245
F_v=(cosd(theta)-sqrt(epsilon_r-(sind(theta)).^2))./...
      (cosd(theta)+sqrt(epsilon_r-(sind(theta)).^2));
F_v=abs(F_v);  
T_v=2*cosd(theta)./(cosd(theta)+sqrt(epsilon_r-(sind(theta)).^2));
F_p=(epsilon_r*cosd(theta)-sqrt(epsilon_r-(sind(theta)).^2))./...
    (epsilon_r*cosd(theta)+sqrt(epsilon_r-(sind(theta)).^2));
T_p=2*sqrt(epsilon_r)*cosd(theta)./(cosd(theta)*epsilon_r+sqrt(epsilon_r-(sind(theta)).^2));

T_p=abs(T_p);   %只看绝对值，复数代表场 方向相反










plot(theta,T_v);hold on
plot(theta,T_p);hold on
legend('V','P')
title('\epsilon_r=3.2,Tran')
xlabel('\theta\circ')
ylabel('%')

figure
plot(theta,T_v.^2);hold on
plot(theta,T_p.^2);hold on
legend('V^2','P^2')
title('\epsilon_r=3.2,Power')
xlabel('\theta\circ')
ylabel('%')






% % plot(theta,F_v.^2);hold on
% plot(theta,T_v.^2);hold on 
% % plot(theta,F_v.^2+Tao_v.^2)
% legend('F','tao')
% figure
% plot(theta,n_p);hold on
% figure
% plot(theta,n_v)
% 
% figure
% plot(theta,R_p);hold on
% % figure
% plot(theta,R_v)
% 
% 


% plot(theta,n_p);hold on
% figure
% plot(theta,n_v);hold on
% legend('parallel','vertical')

