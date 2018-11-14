
%   直接使用该文件夹下面的FunctionHandle
%   各自m文件可直接用help 查看
%   Author:CS.Chen First piblished in 2018.11.14

clear all
close all
clc
%   function
%   cal_down_theta(scan_theta,Farest,b_step,d_down,d_up,FlagDraw)
%   单位均为mm，角度为degree
%   scan_theta为扫描的角度
%   farest为远处射线最远的尺度
%   b_step光线线簇的疏密程度
%   d_down 下边沿抬高的厚度，输入正值
%   d_up为  上边沿抬高的厚度，输入正值
%   FlagDraw 标志位，1就是绘图，0就是不绘图
%   eg.cal_down_theta(10,1200,5,60,60,1)


cal_down_theta(10,1200,5,60,60,1)
figure 
cal_up_theta(-10,1200,5,60,60,0)


