clear all
close all
% 利用PSO优化35°方位角
% Data：20190313

ff=@FuncForPsoOptmize_35;
a=[3.013 1.658 3.033 1.522];

LB=0.8*a;
UB=1.2*a;
[x, fval]=pso(ff,4,[],[],[],[],LB,UB)


