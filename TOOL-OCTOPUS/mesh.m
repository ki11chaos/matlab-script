clear all;
%%%%%%%%%%%%%%%%%%%仅供立方晶系%%%%%%%%%%%%%%%%
a=7.98;   %%%%%%%%晶格常数
b=7.98;   
c=6.94;
m=31;     %%%%%%%网格大小
n=31;
l=27;
path1='D:\data\complex oxide\SrFeO2\0.2\222\222\output_iter\td.0000000\density-spin.xsf'; %%%%%%%%%%%%%%%density路径
data=importdata(path1,'',47);     %%%%%%%%%%指定跳过头行数
dat=data.data;  
X=linspace(0,a,m);
Y=linspace(0,b,n);
Z=linspace(0,c,l);
Z=repelem(Z,m*n);
Y=repmat(Y,1,l);
Y=repelem(Y,m);
X=repmat(X,1,l*n);
XYZ=[X',Y',Z'];
data=[XYZ,dat];
