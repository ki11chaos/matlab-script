clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%读文件%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path0='D:\data\complex oxide\SrFeO2\x800nmmove\output_iter\';
%path0='D:\data\complex oxide\SrFeO2\0.2\200meVx2\output_iter\';
%path0='D:\data\complex oxide\SrFeO2\0.2\222\222\output_iter\';
n=26000;   %%%%%%%%%%%总步数
t=50;  %%%%%%%%输出间隔
[data1,data2,data3]=textread([path0,'td.0000000\geometry.xsf'],'%*s %f %f %f','headerlines',7);
data=[data1,data2,data3];
for o=0:t:n-t
str2=sprintf('%07d',[o+t]);
path2=[path0,'td.',str2,'\geometry.xsf'];
[data21,data22,data23]=textread(path2,'%*s %f %f %f','headerlines',7);
data20=[data21,data22,data23];
data=[data,data20];
end
%data=data(8:16,:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算RMSD
%%%%%%%%基态对比
for i=1:n/t
 %r(:,i)=(data(:,3*i-2).^2 + data(:,3*i-1).^2 +data(:,3*i).^2).^0.5;
%%%%%%%%%%%%%%%%%RMSD
 a(:,i)=data(:,3*i+1)-data(:,1);
 b(:,i)=data(:,3*i+2)-data(:,2);
 c(:,i)=data(:,3*i+3)-data(:,3);
%%%%%%%%%%%%%%%%%%
%a(:,i)=data(:,3*i+1)-data(:,i);
%b(:,i)=data(:,3*i+2)-data(:,i+1);
%c(:,i)=data(:,3*i+3)-data(:,i+2);
end
delta2=a.^2+b.^2+c.^2;
RMSD=(sum(delta2)/length(data1)).';
L=length(RMSD);
dt2=n/L;
xpath=dt2:dt2:n;
xpath=0.005/1.52*xpath.';
%%%%%%%%%%%%%%%%%%%%%%%%%fitting
sRMSD=polyfit(xpath,RMSD,3);
xi=(0:0.2:n*0.005/1.52).';
yi=polyval(sRMSD,xi);
plot(xpath,RMSD,'b',xi,yi,'r')
