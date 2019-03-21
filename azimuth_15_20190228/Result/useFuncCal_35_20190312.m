clear all
close all

% scan_theta=25;

scan_theta=-30:2:18
for i=1:length(scan_theta)
    noopt(i)=func35_noopt_20190314(scan_theta(i));
   
%     figure
    opt(i)=func35_opt_20190314(scan_theta(i));
%     figure
end


%% 35
%   用来计算侧面的（方位角为35），scan_theta取值-30~19；
%   30°做了特殊的处理，，为了画图~
