clear all
close all
% 利用PSO优化15°方位角
% Data：20190313

ff=@FuncForPsoOptmize;
a=[3.08 1.073 1.885 0.9962 ];

LB=0.8*a;
UB=1.2*a;

[x, fval]=pso(ff,4,[],[],[],[],LB,UB,[],['DemoMode','on','Generations','100'])


