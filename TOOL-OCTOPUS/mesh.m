clear all;
%%%%%%%%%%%%%%%%%%%����������ϵ%%%%%%%%%%%%%%%%
a=7.98;   %%%%%%%%������
b=7.98;   
c=6.94;
m=31;     %%%%%%%�����С
n=31;
l=27;
path1='D:\data\complex oxide\SrFeO2\0.2\222\222\output_iter\td.0000000\density-spin.xsf'; %%%%%%%%%%%%%%%density·��
data=importdata(path1,'',47);     %%%%%%%%%%ָ������ͷ����
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
