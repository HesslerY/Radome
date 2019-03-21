feature('DefaultCharacterSet','UTF-8');
close all
clear
% 2019.03.15
% 对应不同方位角度，”窗函数“

x=-159:200;

%% 15-50
% op_15_50=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\15-50.txt');

% a1=op_15_50.data(:,3);
% aa1=zeros(360,1);aa1(55:91)=15;
% a1=a1-aa1; 
% a1=a1-max(a1);
% a1=rot90(a1,2);
% figure
% % plot(a1)
% plot(x,a1);
% axis([-160 200 -40 0])
% title('方位角15\circ,扫描角度为-30\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 15-0
% op_15_0=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\15-0.txt');
% figure
% a2=op_15_0.data(:,3);
% aa2=zeros(360,1);
% aa2(171:173)=0.8;
% a2=a2-aa2; 
% a2=a2-max(a2);
% a2=rot90(a2,2);
% figure
% % plot(a2);
% plot(x,a2);
% axis([-160 200 -40 0])
% title('方位角15\circ,扫描角度为20\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 15-20 
% op_15_20=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\15-20.txt');
% 
% 
% % figure
% a3=op_15_20.data(:,3);
% aa3=zeros(360,1);
% aa3(100:121)=15;
% a3=a3-aa3; 
% a3=a3-max(a3);
% a3=rot90(a3,2);
% figure
% % plot(a3);
% plot(x,a3);
% axis([-160 200 -40 0])
% title('方位角15\circ,扫描角度为0\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 25-0 
% op_25_0=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\25-0.txt');
% % figure
% a4=op_25_0.data(:,3);
% aa4=zeros(360,1);
% a4=a4-aa4; 
% a4=a4-max(a4);
% a4=rot90(a4,2);
% figure
% plot(a4);
% plot(x,a4);
% axis([-160 200 -40 0])
% title('方位角25\circ,扫描角度为20\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 25-20
% op_25_20=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\25-20.txt');
% 
% a5=op_25_20.data(:,3);
% aa5=zeros(360,1);
% aa5(87:100)=12;
% a5=a5-aa5; 
% a5=a5-max(a5);
% a5=rot90(a5,2);
% figure
% plot(a5);
% plot(x,a5);
% axis([-160 200 -40 0])
% title('方位角25\circ,扫描角度为0\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 25-50

% op_25_50=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\25-50.txt');
% 
% a6=op_25_50.data(:,3);
% aa6=zeros(360,1);
% aa6(57:88)=12;
% a6=a6-aa6; 
% a6=a6-max(a6);
% a6=rot90(a6,2);
% figure
% plot(a6);
% plot(x,a6);
% axis([-160 200 -40 0])
% title('方位角25\circ,扫描角度为-30\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')

%% 35-0

% op_35_0=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\35-0.txt');
% 
% a7=op_35_0.data(:,3);
% aa6=zeros(360,1);
% aa6(21:88)=9;
% a7=a7-aa6; 
% a7=a7-max(a7);
% a7=rot90(a7,2);
% figure
% plot(a7);
% plot(x,a7);
% axis([-160 200 -40 0])
% title('方位角35\circ,扫描角度为20\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')


%% 35-20

% op_35_20=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\35-20.txt');
% 
% a8=op_35_20.data(:,3);
% aa8=zeros(360,1);
% aa8(54:92)=9;
% aa8(74:85)=13;
% aa8(307:329)=5;
% a8=a8-aa8; 
% a8=a8-max(a8);
% a8=rot90(a8,2);
% figure
% % plot(a8);
% plot(x,a8);
% axis([-160 200 -40 0])
% title('方位角35\circ,扫描角度为0\circ')
% set(gcf,'Position',[680 642 920 336], 'color','w')
% 

%% 35-50

op_35_50=importdata('F:\2018年下\航天七部\方位角不同_方向图_txt\35-50.txt');

a9=op_35_50.data(:,3);
aa9=zeros(360,1);
aa9(51:89)=9;
aa9(56:72)=20;
a9=a9-aa9; 
a9=a9-max(a9);
a9=rot90(a9,2);
figure
plot(a9);
plot(x,a9);
axis([-160 200 -40 0])
title('方位角35\circ,扫描角度为-30\circ')
set(gcf,'Position',[680 642 920 336], 'color','w')



