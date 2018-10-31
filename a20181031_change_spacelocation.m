%  移动了结构的空间位置，利于计算
clc
clear
close all

%%  数据拟合
%   轮廓下线拟合
A=[
    -1.19E+03	5.31E+01	-3.90E-04
    -1.19E+03	5.15E+01	-1.87E-04
    -1.05E+03	1.59E+01	-1.21E-07
    -9.40E+02	-1.16E+01	-3.82E-08
    -7.77E+02	-5.23E+01	-2.90E-08
    -6.22E+02	-9.09E+01	-1.09E-08
    -5.93E+02	-9.81E+01	-2.03E-10
    -5.72E+02	-1.04E+02	6.81E-11
    -5.41E+02	-1.12E+02	-1.46E-13
    -4.15E+02	-1.50E+02	-9.95E-14
    -3.38E+02	-1.76E+02	-1.07E-13
    -2.56E+02	-2.08E+02	-1.14E-13
    -2.13E+02	-2.27E+02	0.00E+00
    -1.59E+02	-2.54E+02	6.47E-14
    ];

xa=A(:,1);ya=A(:,2);za=A(:,3);za=0;
fa=fit(xa,ya,'poly3');

% plot(fa,xa,ya);hold on

%   轮廓上线拟合
B=[
    -1.19E+03	5.31E+01	-3.90E-04
    -1.19E+03	5.50E+01	-2.50E-04
    -1.59E+02	2.42E+02	1.53E-07
    0.00E+00	2.55E+02	9.29E-14
    ];

xb=B(:,1);yb=B(:,2);zb=B(:,3);zb=0;
fb=fit(xb,yb,'poly2');

% plot(fb,xb,yb);hold on

fa2=fa;
fa2.p4=fa2.p4+30;
fb2=fb;
fb2.p3=fb2.p3-30;

%%  绘图
%   上下轮廓，及内部
plot(fa,'b');hold on;
plot(fb,'b');hold on;
plot(fa2);hold on;
plot(fb2);hold on;

x=-1200:0;

%   绘制阵列所在位置
array_k=tand(110);
array_x_start=-200;
array_x_stop=-100;
array_x=array_x_start:10:array_x_stop;

array_b=52.83-array_k*mean(array_x);

array_y=array_k*array_x+array_b;
array_y_start=max(array_y);
array_y_stop=min(array_y);
plot(array_x, array_y,'linewidth',2,'color',[.5 .5 .5]);hold on
ArrayLong=sqrt(   (array_x_start-array_x_stop)^2+(array_y_start-array_y_stop)^2);

%k1俯角30，对应50d，k2垂直出射对应20d，k3仰角10对应170d

k1=tand(50);k2=tand(20);k3=tand(170);
L=length(array_x);  %   绘制出射波能用到

out_flag=1;
%% k1

if out_flag==1 || out_flag==666
    %k1
    x1=-800:10:-100;
    
    b1up=array_y(1)-k1*array_x(1);
    b1down=array_y(L)-k1*array_x(L);
    y1up=k1*x1+b1up;
    y1down=k1*x1+b1down;
    plot(x1,y1up,x1,y1down);hold on
    
end

syms x b1
%   求交点
sl11=solve(fa2.p1*x^3+fa2.p2*x^2+fa2.p3*x+fa2.p4-k1*x-b1==0);
Xr1(b1) = vpa(sl11(1)); Xr2(b1) = vpa(sl11(2));Xr3(b1) = vpa(sl11(3));

X = @(b1) [Xr1(b1)];
b1=b1down:20:b1up;   b1=b1';

%   X1,Y1 为焦点坐标
X1=double(X(b1));Y1=fa2(X1);

fa2a=@(x) fa2.p1*x.^3+fa2.p2*x.^2+fa2.p3*x+fa2.p4;
dfa2a=diff(fa2a,x);
x=X1;
k1_x1=eval(dfa2a);
k1_x1_theta=asind(k1_x1)+90; %    交点处的斜率值 及与水平的夹角角度
k1_in_epsilon=k1_x1_theta-50;%    入射介质的入射角
k1_out1_theta=asind(sind(k1_in_epsilon)/sqrt(3.2));%     入射介质出射角

%   在介质之中的传播
k12_theta=k1_x1_theta-k1_out1_theta;%   入介质，的出射角度与水平

syms x b12 k12
sl12=solve(fa.p1*x^3+fa.p2*x^2+fa.p3*x+fa.p4-k12*x-b12==0);
Xr21(b12,k12) = vpa(sl11(1));Xr22(b12,k12) = vpa(sl11(2));Xr23(b12,k12) = vpa(sl11(3));

XX = @(b12,k12) [Xr21(b12,k12)];
k12=sind(k12_theta);
b12=Y1-k12.*X1;
X2=double(XX(b12,k12))









%%  k2
if out_flag==2 || out_flag==666
    %k2
    x2=-800:10:-100;
    b2up=array_y(1)-k2*array_x(1);
    b2down=array_y(L)-k2*array_x(L);
    y2up=k2*x2+b2up;
    y2down=k2*x2+b2down;
    plot(x2,y2up,x2,y2down);hold on
    %     plot(x2,);hold on
end
%%  k3
if out_flag==3 || out_flag==666
    %k3
    x3=-800:10:-100;
    b3up=array_y(1)-k3*array_x(1);
    b3down=array_y(L)-k3*array_x(L);
    y3up=k3*x3+b3up;
    y3down=k3*x3+b3down;
    plot(x3,y3up,x3,y3down);hold on
    %     plot(x2,);hold on
end
%% k4
if out_flag==4 || out_flag==666
    %k4
    k4=0
    x4=-800:10:-100;
    b4up=array_y(1)-k4*array_x(1);
    b4down=array_y(L)-k4*array_x(L);
    y4up=k4*x4+b4up;
    y4down=k4*x4+b4down;
    plot(x4,y4up,x4,y4down);hold on
    %     plot(x2,);hold on
end




%   辅助线
plot([-1200,0],[52.83,52.83],'--','linewidth',1,'color',[.5 .5 .5])
