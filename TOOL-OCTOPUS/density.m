clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�������%%%%%%%%%%%%%%%%
prompt1='path of output_iter\?';    
prompt2='total number of steps?';
prompt3='time step?';
%path0='D:\data\complex oxide\SrFeO2\0.2\200meVx2\output_iter';
%n=100;
%t=50;
path0=input(prompt1,'s');   %%%%%%%%%%%%%%%%%%%%%%%%%%%%output_iterλ�ã���\
n=input(prompt2);
t=input(prompt3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%�������Ŀ¼
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�ж�Ŀ¼�Ƿ����
pathout=[path0,'\','Tdensity',sprintf('%07d',n),'_',sprintf('%04d',t)];
if exist(pathout)
rmdir(pathout,'s');
end
mkdir(pathout);
%%%%%%%%%%%%%%%%%%%%%%%%%��ȡ����
for spin=1:2   %%%%%%%%%%%%%%%%%�ж�����
path1=[path0,'\td.0000000\density-sp',sprintf('%01d',spin),'.xsf'];
data=importdata(path1,'',31);
dat=data.data;   

for o=0:t:n-t
str2=sprintf('%07d',[o+t]);
path=[path0,'\td.',str2,'\density-sp',sprintf('%01d',spin),'.xsf'];
data0=importdata(path,'',31);
dat0=data0.data;
dat=[dat,dat0];
fprintf('%d\n',o);
end
fprintf('%s','end');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ļ�
writematrix(dat,[pathout,'\total_density-sp',sprintf('%01d',spin),'.txt'],'Delimiter','tab');

end

