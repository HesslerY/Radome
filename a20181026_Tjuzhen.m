clear all
close all

%   利用传输矩阵
%水平计划
% lambda=0.018; theta=0:90;  %对应17Ghz
c=3e8;
fmin=2e9;
fmax=18e9;

d=0.005;        %厚度
Z0=120*pi;
epsilon_r=2.9*(1-i*tan(0.003));

[lambda,theta]=meshgrid(linspace(c/fmin,c/fmax,100),0:90);


Z_e1p=Z0./epsilon_r.*sqrt(epsilon_r-(sind(theta)).^2);%   水平
Z_e1v=Z0./sqrt(epsilon_r-(sind(theta)).^2);          %   垂直

%   水平
Zc1=Z_e1p;
Zc0=Z0.*cosd(theta);
% %   垂直
% Zc1=Z_e1v;
% Zc0=Z0./cosd(theta);

gam=2*pi./lambda.*sqrt(epsilon_r-(sind(theta)).^2);
A=cosh(i*d*gam);
B=Zc1.*sinh(i*d.*gam);
C=sinh(i*d*gam)./Zc1;
D=cosh(i*d*gam);

T=2./( (A+B./Zc0)+(Zc0.*C+D) );
mesh(lambda,theta,abs(real(T)))

% plot(theta,abs(T).^2),hold on 
