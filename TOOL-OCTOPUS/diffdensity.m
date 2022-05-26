clear all;
path1='D:\data\complex oxide\SrFeO2\0.2\xnomove200meV\output_iter\Tdensity0026000_0050\total_density-sp1.txt';
path2='D:\data\complex oxide\SrFeO2\0.2\xnomove200meV\output_iter\Tdensity0026000_0050\total_density-sp2.txt';
data1=dlmread(path1,'');
data2=dlmread(path2,'');
data10=data1(:,1);
data20=data2(:,1);
pathout='D:\data\complex oxide\SrFeO2\0.2\xnomove200meV\output_iter';
L=length(data1(1,:));
dif10=[0];
dif20=[0];
for p=2:L
    data=data1(:,p)-data10;

    writematrix(data,[pathout,'\Tdensity0026000_0050\diff_density-sp1','_',sprintf('%06d',p*50),'.txt'],'Delimiter','tab'); 
   
    data=data2(:,p)-data20;

    writematrix(data,[pathout,'\Tdensity0026000_0050\diff_density-sp2','_',sprintf('%06d',p*50),'.txt'],'Delimiter','tab'); 
   

end
%%%%%%%%%%%%%spin density
dataspin=data1-data2;
dat30=[0];
for p=2:L
    data=dataspin(:,p)-dataspin(:,1);

    writematrix(data,[pathout,'\Tdensity0026000_0050\diff_density-totspin','_',sprintf('%06d',p*50),'.txt'],'Delimiter','tab'); 
end
