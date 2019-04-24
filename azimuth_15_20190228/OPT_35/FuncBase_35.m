function [scan_thetac]=FuncBase_35(fa2p1,fa2p2,fa2p3,fa2p4,scan_theta)

%   Be careful！If you can't see chinese
%   please run
%   feature('DefaultCharacterSet','UTF-8');

%   用来计算侧面的（方位角），scan_theta取值-30~19；
%   30°做了特殊的处理，，为了画图~


%   51行用来做优化
%   用来计算单纯脱壳时候的折射率变化情况
%   单位均为mm，角度为degree
%   scan_theta为扫描的角度,
%   farest为远处射线最远的尺度
%   b_step光线线簇的疏密程度
%   d_down 边沿向下移动的数值，输入正值
%   FlagDraw 标志位，1就是绘图，0就是不绘图
%   eg. cal_down_theta(10,1200,5,60,60,1)
%   Author:CS.Chen
%   First piblished in 2018.11.14
% clear all
% close all

warning('off')
feature('DefaultCharacterSet','UTF-8');
scan_theta=scan_theta;%   天线扫描角度
Farest=900;       %   远处的射线
% b_step=15;           %   光线簇疏密程度
bnum=15;              % 光线个数
d_down=40;         %   下边沿厚度
FlagDraw=1;         %  1是画，2是不画


%%  数据拟合
%   轮廓下线拟合
A=[
-2.98E+02	3.15E+00	8.87E-12
-1.90E+02	1.98E+02	8.87E-12
-5.17E+00	3.82E+02	8.98E-12
8.60E+01	4.00E+02	8.98E-12
1.76E+02	3.72E+02	8.98E-12
2.68E+02	1.98E+02	8.98E-12
2.98E+02	3.15E+00	1.14E-13
    ];

xa=A(:,1);ya=A(:,2);za=A(:,3);za=0;
fa=fit(xa,ya,'poly4');

%内轮廓
fa2=fa;

fa2.p1=-fa2p1*1e-08;
fa2.p2=-fa2p2*1e-05;
fa2.p3=-fa2p3*1e-03;
fa2.p4=fa2p4;

fa2.p5=fa2.p5-d_down;


%%  阵列出射

xxx=Farest:200;

%   绘制阵列所在位置
array_k=tand(20);
array_x_start=0;
array_x_stop=200;
array_x=array_x_start:20:array_x_stop;
array_b=42.83+array_k*mean(array_x);

array_y=array_k*array_x+array_b;
array_y_start=max(array_y);
array_y_stop=min(array_y);



% ArrayLong=sqrt(   (array_x_start-array_x_stop)^2+(array_y_start-array_y_stop)^2);

%k1俯角30，对应50d，k2垂直出射对应20d，k3仰角10对应170d

k1=tand(110-scan_theta);
L=length(array_x);  %   绘制出射波能用到

% k1

b1up=array_y(1)-k1*array_x(1);
b1down=array_y(L)-k1*array_x(L);
x_temp_min=(Farest-b1up)/k1;
x_temp_max=(Farest-b1down)/k1;
x_temp_up=linspace(x_temp_min,x_temp_max,L);% 完全是为了画图好看


%%   阵列出射到罩壁，求交点   mark1
syms xxx b1

sl11=solve(fa2.p1*xxx^4+fa2.p2*xxx^3+fa2.p3*xxx^2+fa2.p4*xxx+fa2.p5-k1*xxx-b1==0);
Xr1(b1) = vpa(sl11(1)); Xr2(b1) = vpa(sl11(2));Xr3(b1) = vpa(sl11(3)); Xr4(b1) = vpa(sl11(4));


%   用来选择正确的解
if scan_theta<20    
    X = @(b1) [Xr1(b1)]; % Xr1,或者Xr2
else if scan_theta>20
        X = @(b1) [Xr2(b1)];
    end
end


b1=linspace(b1down,b1up,bnum);
% b1=b1down:b_step:b1up;  % 步长决定密度
b1=b1';
%   X1,Y1 为焦点坐标
X1=double(X(b1));
Y1=fa2(X1);
fa2a=@(xxx) fa2.p1*xxx^4+fa2.p2*xxx^3+fa2.p3*xxx^2+fa2.p4*xxx+fa2.p5;
dfa2a=diff(fa2a,xxx);
xxx=X1;
k1_x1=eval(dfa2a);
k1_x1_theta=atand(k1_x1);%    交点处的斜率值 及与水平的夹角角度
k1_in_epsilon=k1_x1_theta+scan_theta-20;%    入射介质的入射角(计算厚度的关键)      20°是因为相控阵摆放20
k1_out1_theta=asind(sind(k1_in_epsilon)/sqrt(3.2));%     入射介质出射角


%%   阵列交点
syms xxx b1

sl00=solve(k1*xxx+b1-array_k*xxx-array_b==0);
Xr0(b1)=vpa(sl00(1));

b1=linspace(b1down,b1up,bnum);
b1=b1';
% X = @(b1) [Xr0(b1)];
X0=double(Xr0(b1));

Y0=array_k*X0+array_b;


%%   在介质之中的传播    mark 2

k12_theta=k1_x1_theta+90-k1_out1_theta; %   第一次入介质,出射角度与水平夹角

syms xxx b12 k12

sl12=solve(fa.p1*xxx^4+fa.p2*xxx^3+fa.p3*xxx^2+fa.p4*xxx+fa.p5-k12*xxx-b12==0);
Xr21(b12,k12) = vpa(sl12(1));
Xr22(b12,k12) = vpa(sl12(2));
Xr23(b12,k12) = vpa(sl12(3));
% XX = @(b12,k12) Xr21;
k12=tand(k12_theta);
b12=Y1-k12.*X1;

X2_1=double( Xr21(b12,k12)); %     可能会修改Xr21，Xr22
X2_2=double( Xr22(b12,k12)); %     可能会修改Xr21，Xr22

%   用来筛选哪个是符合要求的
SelectMat=find(X2_1>300|X2_1<-300);
X2_1(SelectMat)=X2_2(SelectMat);
clear SelectMat
X2=X2_1;
Y2=fa(X2);


%%  出射介质    mark3

syms xxx
% sl13=solve(fa.p1*xxx^3+fa.p2*xxx^2+fa.p3*xxx+fa.p4-k12*xxx-b12==0);
fa1a=@(xxx) fa.p1*xxx^4+fa.p2*xxx^3+fa.p3*xxx^2+fa.p4*xxx+fa.p5;
dfa1a=diff(fa1a,xxx);
xxx=X2;
k1_x2=eval(dfa1a);  %   出射介质板，介质斜率
k1_x2_theta=atand(k1_x2)+90;   %出射介质板,法线与水平夹角

k21_theta=k1_x2_theta-k12_theta;%   出射介质板的-入射角度
k22_theta=asind( sqrt(3.2)*sind(k21_theta) );%   出射介质板的-出射角度

%   离开介质，出射角度与水平夹角
%
SelectMat=find(k22_theta<0);
%   筛选数据
kout_theta_1=k1_x2_theta-k22_theta;
kout_theta_2=-k1_x2_theta+k22_theta;
kout_theta_1(SelectMat)=kout_theta_2(SelectMat);
kout_theta=kout_theta_1;
clear SelectMat

if scan_theta==30
    
    kout_theta_1=k1_x2_theta-k22_theta;
    kout_theta_2=-k1_x2_theta+k22_theta;
    kout_theta_1(8:15)=kout_theta_2(8:15);
    kout_theta=kout_theta_1;
end

% if k1_x2_theta+k22_theta<180
%     kout_theta=-k1_x2_theta+k22_theta;
% else
%     kout_theta=k1_x2_theta-k22_theta;
% end
kout=tand(kout_theta);

b22=Y2-kout.*X2;

Y3=ones(length(X1),1)*Farest;
X3=(Y3-b22)./kout;



%% 绘图
%%%-----------------------%%%
%         绘图               %
%%%-----------------------%%%
if FlagDraw==1
    
    xxx=-300:1:300;
    fa1_plot=fa.p1*xxx.^4+fa.p2*xxx.^3+fa.p3*xxx.^2+fa.p4*xxx+fa.p5;
    fa2_plot=fa2.p1*xxx.^4+fa2.p2*xxx.^3+fa2.p3*xxx.^2+fa2.p4*xxx+fa2.p5;
    plot(xxx,fa1_plot,'linewidth',2,'color','b');hold on;   %   绘制边界
    plot(xxx,fa2_plot,'linewidth',1.5,'color','g');hold on;
    %     plot(xxx,fa2_plot_nochange,'linewidth',1,'color','k','linestyle','--');hold on;
    
    plot(array_x, array_y,'linewidth',4,'color',[.5 .5 .5]);hold on    %   绘制阵列
    plot([x_temp_min,array_x(1)],[Farest,array_y(1)],'linewidth',2,'color',[.5 .9 .5]);hold on    %   目标出射光路
    plot([x_temp_max,array_x(L)],[Farest,array_y(L)],'linewidth',2,'color',[.5 .9 .5]);hold on
    for n=1:length(X1)
        plot([X1(n),X0(n)],[Y1(n),Y0(n)],'r','linewidth',1.2);hold on  %   绘制阵列出射
        plot([X1(n),X2(n)],[Y1(n),Y2(n)],'r','linewidth',1.2);hold on  %   绘制介质内光路
        plot([X2(n),X3(n)],[Y2(n),Y3(n)],'r','linewidth',1.2);hold on  %   绘制出射光路
    end
    
    title(['扫描角度是',num2str(scan_theta),'\circ'])
    legend off
%     view(-90,90)
    
end

%% 返回结果

scan_thetac=mean(kout_theta-110+scan_theta); % 扫描角度偏转量
end


