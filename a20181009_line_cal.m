
clc
clear
close all

%------------------------------------%

A=[
    5.77E+00	1.53E+02	-3.90E-04;
7.20E+00	1.52E+02	-1.87E-04;
1.50E+02	1.16E+02	-1.21E-07;
2.60E+02	8.84E+01	-3.82E-08;
4.23E+02	4.77E+01	-2.90E-08;
5.78E+02	9.11E+00	-1.09E-08;
6.07E+02	1.90E+00	-2.03E-10;
6.28E+02	-3.68E+00	6.81E-11;
6.59E+02	-1.19E+01	-1.46E-13;
7.85E+02	-4.97E+01	-9.95E-14;
8.62E+02	-7.59E+01	-1.07E-13;
9.44E+02	-1.08E+02	-1.14E-13;
9.87E+02	-1.27E+02	0.00E+00;
1.04E+03	-1.54E+02	6.47E-14;
];
xa=A(:,1);
ya=A(:,2);
za=A(:,3);za=0;

fa=fit(xa,ya,'poly5');
plot(fa,xa,ya);hold on
fa1=fit(xa,ya,'poly3');
plot(fa1,'k')


%------------------------------------------%


B=[
    5.77E+00	1.53E+02	-3.90E-04
7.20E+00	1.55E+02	-2.50E-04
1.04E+03	3.42E+02	1.53E-07
1.20E+03	3.55E+02	9.29E-14
    ];
xb=B(:,1);
yb=B(:,2);
zb=B(:,3);zb=0;

hold on
fb=fit(xb,yb,'poly2');
plot(fb,xb,yb)

%----------------------------------------%

input_k=tand(110);

input_x_start=950;
input_x_stop=1050;
input_x=input_x_start:10:input_x_stop;

input_y=input_k*input_x+2800;
input_y_start=max(input_y);
input_y_stop=min(input_y);

%   ArrayLong阵列总长度
ArrayLong=sqrt((input_x_stop-input_x_start)^2+(input_y_start-input_y_stop)^2)

%   阵列位置
hold on 
plot(input_x, input_y,'linewidth',2,'color','g')
%------------------------------------%
%   辅助线
%------------------------------------%
axis equal
clear x
x=400:10:1100;

%   水平辅助线
hold on
plot([0,1200],[154.4,154.4],'--','linewidth',1,'color',[.5 .5 .5])

%   阵列铅锤辅助线
hold on 
y1=tand(20)*(x-mean(input_x))+mean(input_y);
plot(x,y1,'--','linewidth',1,'color',[.5 .5 .5])
clear x
%   上仰角10degree

x=500:10:1100;
y2=tand(-10)*(x-mean(input_x))+mean(input_y);
plot(x,y2,'--','linewidth',1,'color',[.5 .5 .5])
clear x
%   俯角50degree

x=700:10:1100;
y3=tand(50)*(x-mean(input_x))+mean(input_y);
plot(x,y3,'--','linewidth',1,'color',[.5 .5 .5])
clear x



