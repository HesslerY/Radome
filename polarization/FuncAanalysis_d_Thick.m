function FuncAanalysis_d_Thick(InputDegree,freq,dmin,dmax,epsr,polar_flag)
%   InputDegree为要分析得入射角度，可以是数组，但是数量不要太多
%   dmin为实际物理尺寸，单位m
%   dmax为实际物理尺寸，单位m
%   epsr为相对介电常数
%   polar_flag选择极化， 1为平行极化，2为垂直极化


%   考虑适合不同极化的厚度

warning off
for index=1:length(InputDegree)

    
    c=3e8;
    f=freq;
    lambda=c/f;
    
    % phi_i=45;
    d=dmin:0.0001:dmax;
    % d=lambda./(2*sqrt(epsr1-sind(theta).^2))*1000*4;
    % plot(theta,d)
    Degree=InputDegree(index);
  

    
    if polar_flag==1
        
        %   平行极化p
        r_01=(sqrt(epsr)*cosd(Degree)-sqrt(epsr-sind(Degree).*sind(Degree))) ./ ...
            (sqrt(epsr)*cosd(Degree)+sqrt(epsr-sind(Degree).*sind(Degree)));
        
        y0=1./cosd(Degree);
        y1=epsr./sqrt(epsr-sind(Degree).*sind(Degree));
    elseif  polar_flag==2
        
        % %   垂直极化s
        r_01=(cosd(Degree)-sqrt(epsr-sind(Degree).*sind(Degree))) ./...
            (cosd(Degree)+sqrt(epsr-sind(Degree).*sind(Degree)));
        y0=cosd(Degree);
        y1=sqrt(epsr-sind(Degree).*sind(Degree));
        
    end
    % 3-46
    
    beta1=2*pi*d/lambda*sqrt(epsr-sind(Degree).*sind(Degree));%rad
    
    T=(1-r_01.^2)./(cos(beta1)+1i*sin(beta1)-r_01.^2.*(cos(beta1)-1i*sin(beta1)));
    
    % % 3-50
    % beta1=2*pi*d/lambda*sqrt(epsr1-sind(phi_i).*sind(phi_i));%rad
    % T=2.*y0.*y1./(2.*y0.*y1.*cos(beta1)+1i*(y1.^2+y0.^2).*sin(beta1)  );
    
    
    plot(d,abs(T).^2,'DisplayName',num2str(Degree));

    if polar_flag==1
        title('平行极化')   %   平行极化p
    elseif  polar_flag==2 
        title('垂直极化')   %   垂直极化s

    end
    axis([min(d) max(d) 0 1])
    set(gcf,'Position',[680 427 838 551], 'color','w')
    hold on
    legend

    
end
end
