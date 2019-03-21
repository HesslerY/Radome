feature('DefaultCharacterSet','UTF-8');
close all
clear

op_0=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\op_0.TXT');
op_20=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\op_20.TXT');
op_d30=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\op_d30.TXT');
no_op_0=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\no_op_0.TXT');
no_op_20=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\no_op_20.TXT');
no_op_d30=importdata('F:\2018年下\航天七部\1130_9\Polar_txt\no_op_d30.TXT');

x=-159.5:0.5:200;
x=x';


a1=op_0.data(:,3);
aa1=zeros(720,1);
aa1(150:299)=15;
aa1(468:597)=10;
a1=a1-aa1;
a1=rot90(a1,2);
a1=a1-max(a1);

a2=op_20.data(:,3);
aa2=zeros(720,1);
aa2(100:200)=8;
aa2(200:327)=15;
aa2(408:555)=10;
a2=a2-aa2;
a2=rot90(a2,2);
a2=a2-max(a2);


a3=op_d30.data(:,3);
aa3=zeros(720,1);
aa3(117:209)=15;
aa3(471:655)=7;
a3=a3-aa3;
a3=rot90(a3,2);
a3=a3-max(a3);

b1=no_op_0.data(:,3);
bb1=zeros(720,1);
bb1(200:299)=10;
bb1(468:597)=10;
b1=b1-bb1;
b1=rot90(b1,2);
b1=b1-max(b1);


figure
plot(x,a1);
axis([-160 200 -40 0])
title('扫描角度为0\circ---优化后')

figure
plot(x,b1)
axis([-160 200 -40 0])
title('扫描角度为0\circ---优化前')




b2=no_op_20.data(:,3);
bb2=zeros(720,1);
bb2(100:200)=8;
bb2(200:327)=15;
bb2(408:555)=10;
b2=b2-bb2;
b2=rot90(b2,2);
b2=b2-max(b2);


figure
plot(x,a2);
axis([-160 200 -40 0])
title('扫描角度为20\circ---优化后')

figure
plot(x,b2)
axis([-160 200 -40 0])
title('扫描角度为20\circ---优化前')




b3=no_op_d30.data(:,3);
bb3=zeros(720,1);
bb3(117:209)=15;
bb3(471:655)=7;
b3=b3-bb3;
b3=rot90(b3,2);
b3=b3-max(b3);


figure
plot(x,a3);
axis([-160 200 -40 0])
title('扫描角度为-30\circ---优化后')

figure
plot(x,b3);
axis([-160 200 -40 0])
title('扫描角度为-30\circ---优化前')
% set(gcf,'Position',[500 659 887 336], 'color','w')





