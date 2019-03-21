
clear
close all
warning('off')
feature('DefaultCharacterSet','UTF-8');

%--------------------------------------------------%
%--------------------------------------------------%
% matlabpool 4
theta=0:50;

parfor d=1:length(theta)
    %引入误差
%     kk=[1.678 4.27 5.983];% k脱壳
    kk=[1.974 4.871 6.338].*(1+rand(1,3)*0.02);
    thetachange_no_opt(d)=changethick_human_func_kout(kk,theta(d));
   
end

% kk
parfor d=1:length(theta)
    %精确
    kk=[1.974 4.871 6.338];% k优化
    thetachange_opt(d)=changethick_human_func_kout(kk,theta(d));
    
end
plot(0:50,thetachange_opt);hold on%精确
plot(0:50,thetachange_no_opt)

xlabel('扫描角度\circ')
ylabel('平均偏转角度\circ')
legend('精确','引入波动')





