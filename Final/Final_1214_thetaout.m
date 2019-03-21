
clear
close all
warning('off')
feature('DefaultCharacterSet','UTF-8');

%--------------------------------------------------%
%--------------------------------------------------%

theta=0:10:50;

for d=1:length(theta)
    
    kk=[1.678 4.27 5.983];% k脱壳
    thetachange_no_opt(d)=changethick_human_func_kout(kk,theta(d));
    display(1)
end


for d=1:length(theta)
    
    kk=[1.974 4.871 6.338];% k优化
    thetachange_opt(d)=changethick_human_func_kout(kk,theta(d));
    
end



table_use=[thetachange_no_opt,thetachange_opt];
plot(thetachange_no_opt);hold on
plot(thetachange_opt)








