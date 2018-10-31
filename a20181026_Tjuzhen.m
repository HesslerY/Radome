clear all
close all

%   利用传输矩阵
lambda=0.018;  %对应17Ghz
dd=0.02:0.00005:0.03;        %厚度3cm
Z0=120*pi;
epsilon_r=3.2;
theta=0;


gam=2*pi./lambda*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1p=Z0*epsilon_r*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1v=Z0./sqrt(epsilon_r-(sin(theta)).^2);


A=cosh(i*dd*gam);
B=Z_e1p.*sinh(i*dd.*gam);
C=sinh(i*dd*gam)./Z_e1p;
D=cosh(i*dd*gam);

figure
T=2./( (A+B./Z0./cos(theta))+(Z0.*cos(theta).*C+D) );
plot(dd,abs(T))

hold on 


theta=10;


gam=2*pi./lambda*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1p=Z0*epsilon_r*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1v=Z0./sqrt(epsilon_r-(sin(theta)).^2);

A=cosh(i*dd*gam);
B=Z_e1p.*sinh(i*dd.*gam);
C=sinh(i*dd*gam)./Z_e1p;
D=cosh(i*dd*gam);

T=2./( (A+B./Z0./cos(theta))+(Z0.*cos(theta).*C+D) );
plot(dd,abs(T))
hold on 
theta=20;


gam=2*pi./lambda*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1p=Z0*epsilon_r*sqrt(epsilon_r-(sin(theta)).^2);
Z_e1v=Z0./sqrt(epsilon_r-(sin(theta)).^2);

A=cosh(i*dd*gam);
B=Z_e1p.*sinh(i*dd.*gam);
C=sinh(i*dd*gam)./Z_e1p;
D=cosh(i*dd*gam);

T=2./( (A+B./Z0./cos(theta))+(Z0.*cos(theta).*C+D) );
plot(dd,abs(T))








title('T')
xlabel('d')
ylabel('%')
legend('\theta=0\circ','\theta=10\circ','\theta=20\circ')
