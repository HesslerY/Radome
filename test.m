
clear all;clc;
a = -10;
c = 0.5;
d = 11;
h = 8;
syms b x;
sl=solve(0.25.*(((x-a)./h).^2)./(1+(((x-a)./h)^2)) == (((b-x)./(h-d)).^2)/(1+(((b-x)./(h-d)).^2)),x);
Xr1(b) = vpa(sl(1));
Xr2(b) = vpa(sl(2));
Xr3(b) = vpa(sl(3));
Xr4(b) = vpa(sl(4));
X = @(b) [Xr4(b),Xr3(b),Xr2(b),Xr1(b)];
b=[10;9;0;1;1;];

double(X(b))