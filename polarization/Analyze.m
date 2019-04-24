close all;clear all;
feature('DefaultCharacterSet','UTF-8');


InputDegree=[0,30,45,60,90];
freq=1e10;
dmin=0.01;
dmax=0.04;
epsr=3.2;
polar_flag=1;


FuncAanalysis_d_Thick(InputDegree,freq,dmin,dmax,epsr,polar_flag)
%   InputDegree为要分析得入射角度，可以是数组，但是数量不要太多
%   freq为要分析得频率,单位Hz
%   dmin为实际物理尺寸,单位m
%   dmax为实际物理尺寸,单位m
%   epsr为相对介电常数
%   polar_flag选择极化,1为平行极化,2为垂直极化
