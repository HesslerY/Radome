function  Resut=func35_ForOpt_pso_use(fa2in)

scan_theta=-30:3:19;
parfor i=1:length(scan_theta)
    
    result(i)=abs(func35_ForOpt(fa2in(1),fa2in(2),fa2in(3),fa2in(4),scan_theta(i)));
    
end
Resut=sum(result)

end
