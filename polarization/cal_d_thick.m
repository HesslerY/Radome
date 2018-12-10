
clear 
close all
% 考虑适合不同极化的厚度
%--------------------------------%
%   Data: 2018 11 29
%--------------------------------%
for phi_i=[0 45 60 80]

c=3e8;
f=9.375e9;
lambda=c/f;
epsr1=3.2;

% phi_i=45;
d=0.01:0.0001:0.04;
% d=lambda./(2*sqrt(epsr1-sind(theta).^2))*1000*4;
% plot(theta,d)

%%  3-47 3-48
%   选择极化， 1为平行极化，2为垂直极化
polar_flag=2;

if polar_flag==1
    
    %   平行极化p
    r_01=(sqrt(epsr1)*cosd(phi_i)-sqrt(epsr1-sind(phi_i).*sind(phi_i))) ./ ...
        (sqrt(epsr1)*cosd(phi_i)+sqrt(epsr1-sind(phi_i).*sind(phi_i)));
    
    y0=1./cosd(phi_i);
    y1=epsr1./sqrt(epsr1-sind(phi_i).*sind(phi_i));

    title('平行极化')
    set(gcf,'Position',[680 427 838 551], 'color','w')
elseif  polar_flag==2
    
    % %   垂直极化s
    r_01=(cosd(phi_i)-sqrt(epsr1-sind(phi_i).*sind(phi_i))) ./...
           (cosd(phi_i)+sqrt(epsr1-sind(phi_i).*sind(phi_i)));
    y0=cosd(phi_i);
    y1=sqrt(epsr1-sind(phi_i).*sind(phi_i));
    title('垂直极化')
    set(gcf,'Position',[680 427 838 551], 'color','w')

end
% 3-46

beta1=2*pi*d/lambda*sqrt(epsr1-sind(phi_i).*sind(phi_i));%rad

T=(1-r_01.^2)./(cos(beta1)+1i*sin(beta1)-r_01.^2.*(cos(beta1)-1i*sin(beta1)));

% % 3-50
% beta1=2*pi*d/lambda*sqrt(epsr1-sind(phi_i).*sind(phi_i));%rad
% T=2.*y0.*y1./(2.*y0.*y1.*cos(beta1)+1i*(y1.^2+y0.^2).*sin(beta1)  );


plot(d,abs(T).^2) 
hold on
axis([min(d) max(d) 0 1])
legend('0','45','60','90')
end
