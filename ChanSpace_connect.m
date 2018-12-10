
%   用来计算单纯脱壳时候的折射率变化情况
%   单位均为mm，角度为degree
%   scan_theta为扫描的角度
%   farest为远处射线最远的尺度
%   b_step光线线簇的疏密程度
%   d_down 下边沿抬高的厚度，输入正值
%   d_up为  上边沿抬高的厚度，输入正值
%   FlagDraw 标志位，1就是绘图，0就是不绘图
%   eg. cal_down_theta(10,1200,5,60,60,1)
%   Author:CS.Chen First piblished in 2018.11.14

% Farest=-Farest;       %   远处的射线
% scan_theta=scan_theta;      %   天线扫描角度
% b_step=b_step;           %   光线簇疏密程度
% d_down=d_down;         %   下边沿厚度
% d_up=-d_up;           %   上沿厚度
% FlagDraw=FlagDraw;

feature('DefaultCharacterSet','UTF-8');

Farest=-1200;       %   远处的射线
scan_theta=30;      %   天线扫描角度
b_step=5;           %   光线簇疏密程度
d_down=60;         %   下边沿厚度
d_up=-60;           %   上沿厚度
FlagDraw=1;


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

%   轮廓上线拟合
B=[
    -1.19E+03	5.31E+01	-3.90E-04
    -1.19E+03	5.50E+01	-2.50E-04
    -1.59E+02	2.42E+02	1.53E-07
    0.00E+00	2.55E+02	9.29E-14
    ];


xa=A(:,1);ya=A(:,2);za=A(:,3);za=0;
fa=fit(xa,ya,'poly3');
xb=B(:,1);yb=B(:,2);zb=B(:,3);zb=0;
fb=fit(xb,yb,'poly2');


%内轮廓
fa2=fa;
fa2.p4=fa2.p4+d_down;

fb2=fb;
fb2.p3=fb2.p3+d_up;





plot(fa,'b');hold on;



% % % % % % % %%  绘图
% % % % % % % %   上下轮廓，及内部
% % % % % % % 
% % % % % % % if FlagDraw==1
% % % % % % %     plot(fa,'b');hold on;
% % % % % % %     plot(fb,'b');hold on;
% % % % % % %     plot(fa2,'g');hold on;
% % % % % % %     plot(fb2,'g');hold on;
% % % % % % % end
% % % % % % % x=-1200:0;
% % % % % % % 
% % % % % % % %   绘制阵列所在位置
% % % % % % % array_k=tand(110);
% % % % % % % array_x_start=-150;
% % % % % % % array_x_stop=-100;
% % % % % % % array_x=array_x_start:20:array_x_stop;
% % % % % % % array_b=52.83-array_k*mean(array_x);
% % % % % % % 
% % % % % % % array_y=array_k*array_x+array_b;
% % % % % % % array_y_start=max(array_y);
% % % % % % % array_y_stop=min(array_y);
% % % % % % % %   绘制阵列
% % % % % % % 
% % % % % % % if FlagDraw==1
% % % % % % %     
% % % % % % %     plot(array_x, array_y,'linewidth',2,'color',[.5 .5 .5]);hold on
% % % % % % % end
% % % % % % % 
% % % % % % % ArrayLong=sqrt(   (array_x_start-array_x_stop)^2+(array_y_start-array_y_stop)^2);
% % % % % % % 
% % % % % % % %k1俯角30，对应50d，k2垂直出射对应20d，k3仰角10对应170d
% % % % % % % 
% % % % % % % k1=tand(scan_theta);
% % % % % % % L=length(array_x);  %   绘制出射波能用到
% % % % % % % 
% % % % % % % out_flag=1;
% % % % % % % %% k1
% % % % % % % 
% % % % % % % if out_flag==1 || out_flag==666
% % % % % % %     %k1
% % % % % % %     x1=-1200:10:-100;
% % % % % % %     
% % % % % % %     b1up=array_y(1)-k1*array_x(1);
% % % % % % %     b1down=array_y(L)-k1*array_x(L);
% % % % % % %     y1up=k1*x1+b1up;
% % % % % % %     y1down=k1*x1+b1down;
% % % % % % %     %   目标出射光路
% % % % % % %     if FlagDraw==1
% % % % % % %         plot(x1,y1up,x1,y1down,'linewidth',2,'color',[.5 .5 .5]);hold on
% % % % % % %         
% % % % % % %     end
% % % % % % %     
% % % % % % % end
% % % % % % % 
% % % % % % % syms x b1
% % % % % % % %   求交点
% % % % % % % sl11=solve(fa2.p1*x^3+fa2.p2*x^2+fa2.p3*x+fa2.p4-k1*x-b1==0);
% % % % % % % Xr1(b1) = vpa(sl11(1)); Xr2(b1) = vpa(sl11(2));Xr3(b1) = vpa(sl11(3));
% % % % % % % 
% % % % % % % X = @(b1) [Xr1(b1)];
% % % % % % % b1=b1down:b_step:b1up;  % 步长决定密度
% % % % % % % b1=b1';
% % % % % % % 
% % % % % % % %   X1,Y1 为焦点坐标
% % % % % % % X1=double(X(b1));
% % % % % % % Y1=fa2(X1);
% % % % % % % 
% % % % % % % fa2a=@(x) fa2.p1*x.^3+fa2.p2*x.^2+fa2.p3*x+fa2.p4;
% % % % % % % dfa2a=diff(fa2a,x);
% % % % % % % x=X1;
% % % % % % % k1_x1=eval(dfa2a);
% % % % % % % k1_x1_theta=atand(k1_x1)+90; %    交点处的斜率值 及与水平的夹角角度
% % % % % % % k1_in_epsilon=k1_x1_theta-scan_theta;%    入射介质的入射角
% % % % % % % k1_out1_theta=asind(sind(k1_in_epsilon)/sqrt(3.2));%     入射介质出射角
% % % % % % % 
% % % % % % % 
% % % % % % % %%   阵列交点
% % % % % % % syms x b1
% % % % % % % sl00=solve(k1*x+b1-array_k*x-array_b==0);
% % % % % % % Xr0(b1)=vpa(sl00(1));
% % % % % % % b1=b1down:b_step:b1up;   b1=b1';
% % % % % % % X0=double(Xr0(b1));Y0=array_k*X0+array_b;
% % % % % % % 
% % % % % % % if FlagDraw==1
% % % % % % %     for n=1:length(X1)  %绘制阵列出射
% % % % % % %         plot([X1(n),X0(n)],[Y1(n),Y0(n)],'r');hold on
% % % % % % %     end
% % % % % % % end
% % % % % % % %%   在介质之中的传播
% % % % % % % k12_theta=k1_x1_theta-k1_out1_theta;%   第一次入介质,出射角度与水平夹角
% % % % % % % 
% % % % % % % syms x b12 k12
% % % % % % % sl12=solve(fa.p1*x^3+fa.p2*x^2+fa.p3*x+fa.p4-k12*x-b12==0);
% % % % % % % Xr21(b12,k12) = vpa(sl12(1));
% % % % % % % Xr22(b12,k12) = vpa(sl12(2));
% % % % % % % Xr23(b12,k12) = vpa(sl12(3));
% % % % % % % % XX = @(b12,k12) Xr21;
% % % % % % % k12=tand(k12_theta);
% % % % % % % b12=Y1-k12.*X1;
% % % % % % % X2=double( Xr21(b12,k12));Y2=fa(X2);
% % % % % % % 
% % % % % % % %   绘制介质内光路
% % % % % % % if FlagDraw==1
% % % % % % %     for n=1:length(X1)
% % % % % % %         plot([X1(n),X2(n)],[Y1(n),Y2(n)],'k');hold on
% % % % % % %     end
% % % % % % % end
% % % % % % % 
% % % % % % % %%  出射介质
% % % % % % % 
% % % % % % % syms x
% % % % % % % sl13=solve(fa.p1*x^3+fa.p2*x^2+fa.p3*x+fa.p4-k12*x-b12==0);
% % % % % % % fa1a=@(x) fa.p1*x.^3+fa.p2*x.^2+fa.p3*x+fa.p4;
% % % % % % % dfa1a=diff(fa1a,x);
% % % % % % % x=X2;
% % % % % % % k1_x2=eval(dfa1a);  %   出射介质板，介质斜率
% % % % % % % k1_x2_theta=atand(k1_x2)+90;   %出射介质板,法线与水平夹角
% % % % % % % 
% % % % % % % 
% % % % % % % %   出射介质板的-入射角度
% % % % % % % k21_theta=k1_x2_theta-k12_theta;
% % % % % % % k22_theta=asind( sqrt(3.2)*sind(k21_theta) );
% % % % % % % %   离开介质，出射角度与水平夹角
% % % % % % % kout_theta=k1_x2_theta-k22_theta;
% % % % % % % kout=tand(kout_theta);
% % % % % % % b22=Y2-kout.*X2;
% % % % % % % X3=ones(length(X1),1)*Farest;
% % % % % % % Y3=kout.*X3+b22;
% % % % % % % %   绘制出射光路
% % % % % % % 
% % % % % % % if FlagDraw==1
% % % % % % %     for n=1:length(X1)
% % % % % % %         plot([X2(n),X3(n)],[Y2(n),Y3(n)],'r');hold on
% % % % % % %     end
% % % % % % %     % k_out_theta
% % % % % % %     hold on
% % % % % % %     title(['扫描角度是-',num2str(scan_theta),'\circ'])
% % % % % % %     legend off
% % % % % % %     
% % % % % % % end
% % % % % % % scan_theta
% % % % % % % kout_theta
% % % % % % % mean_change_theta=mean(kout_theta)-scan_theta
% % % % % % % 
