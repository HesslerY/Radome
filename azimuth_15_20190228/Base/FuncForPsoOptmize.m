function  Result=FuncForPsoOptmize(fa2in)

scan_theta=-28:3:19;
parfor i=1:length(scan_theta)
    
    result(i)=abs(FuncBase(fa2in(1),fa2in(2),fa2in(3),fa2in(4),scan_theta(i)));
    
end
Result=sum(result)
end
