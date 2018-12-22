
clear
close all
warning('off')
feature('DefaultCharacterSet','UTF-8');
%--------------------------------------------------%
%--------------------------------------------------%

theta=0:50;


for d=1:length(theta)
    
%     figure
    kk=[1.678 4.27 5.983];% k脱壳
    thetachange_no_opt(d)=changethick_human_func(kk,theta(d));
%     saveas(gcf,['E:\Matlab\Radome\Final\figure\no_opt\',num2str(theta(d)),'_no_opt','.png'])
    
    
%     figure
    kk=[1.974 4.871 6.338];% k优化
    thetachange__opt(d)=changethick_human_func(kk,theta(d));
%     saveas(gcf,['E:\Matlab\Radome\Final\figure\opt\',num2str(theta(d)),'_opt','.png'])
   
    
end
%%  注释，曲线，备注
%   cst 曲线 -0.1678*(0.01*t)^3-0.000427*t^2-0.5983*t-337.2

% %        p1 =  -1.678e-07  (-1.974e-07, -1.381e-07)
% %        p2 =   -0.000427  (-0.0004871, -0.0003668)
% %        p3 =     -0.5983  (-0.6338, -0.5628)
% %        p4 =      -337.2  (-343.1, -331.3)
% % fb =
% %    cst 曲线 -0.8449*(0.001*t)^2+0.06833*t+255
% %      Linear model Poly2:
% %      fb(x) = p1*x^2 + p2*x + p3
% %      Coefficients (with 95% confidence bounds):
% %        p1 =  -8.449e-05  (-0.0002226, 5.365e-05)
% %        p2 =     0.06833  (-0.1054, 0.242)
% %        p3 =         255  (237.9, 272.1)
% %
% % fb2 =
% %
% %      Linear model Poly2:
% %      fb2(x) = p1*x^2 + p2*x + p3
% %      Coefficients:
% %        p1 =  -8.449e-05
% %        p2 =     0.06833
% %        p3 =         225







