clear all;
path1='D:\data\complex oxide\SrFeO2\0.2\xnomove200meV\output_iter\Tdensity0026000_0050\total_density-sp1.txt';
path2='D:\data\complex oxide\SrFeO2\0.2\xnomove200meV\output_iter\Tdensity0026000_0050\total_density-sp2.txt';
data1=dlmread(path1,'');
data2=dlmread(path2,'');
NT=length(data1(1,:));
w=0.2;
dt=50*0.005;
fn=1/dt;
t=linspace(0,dt*NT,NT).';
f=linspace(0,fn,NT).';

fft1=sum(dt*exp(i*w*t.').*data1(1,:));
for o=2:1:length(data1(:,1))
    fft0=sum(dt*exp(i*w*t.').*data1(o,:));
    fft1=[fft1,fft0];
end
re_fft1=real(fft1).';

fft2=sum(dt*exp(i*w*t.').*data2(1,:));
for o=2:1:length(data2(:,1))
    fft20=sum(dt*exp(i*w*t.').*data2(o,:));
    fft2=[fft2,fft20];
end
re_fft2=real(fft2).';

data3=data1-data2;
fft3=sum(dt*exp(i*w*t.').*data3(1,:));
for o=2:1:length(data3(:,1))
    fft30=sum(dt*exp(i*w*t.').*data3(o,:));
    fft3=[fft3,fft30];
end
re_fft3=real(fft3).';




