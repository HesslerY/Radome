
% clear
close all
warning('off')
feature('DefaultCharacterSet','UTF-8');

%--------------------------------------------------%
%   计算瞄准误差变化率
%--------------------------------------------------%

theta=0:50;


% for d=1:length(theta)
%     
%     kk=[1.678 4.27 5.983];% k脱壳
%     thetachange_no_opt(d)=changethick_human_func(kk,theta(d));
%     
% end
% for d=1:length(theta)
%     
%     kk=[1.974 4.871 6.338];% k优化
%     thetachange_opt(d)=changethick_human_func(kk,theta(d));
%     
% end

noopt=thetachange_no_opt*60/60;

opt=thetachange_opt*60/60;

% plot([-20:1:30],noopt,'linewidth',2);
hold on
plot([-20:1:30],opt,'linewidth',2);
% title
xlabel('theta')
ylabel('瞄准误差变化率 ’/\circ')
set(gca,'XTick',[-20:5:30])
legend('优化后')
box off









