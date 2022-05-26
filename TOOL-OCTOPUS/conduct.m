clear all
%%%%%%%%%%%%%%%%%%%%       ��ȡm(q,t)   %%%%%%%%%%%%%%%%%%%%%%
%path0=['D:\data\complex oxide\SrFeO2\test\transverse_magnetization_q001']; %m(q,t)·��

path0=['C:\Users\84778\Desktop\total_current (2)'];
data=dlmread(path0,'',4,1);
t=data(:,1);
%t=t*0.03677;     %1/Hatreeת��1/eV

I=data(:,2);
dt=t(2);
T=max(t);
NT=length(t);
%%%%%%  FFT ����
a=1;   %չ��
fn=1/dt;
f=linspace(0,fn,NT).';
f=f*pi;
Iw=0;
for w=2:NT
Iw0=sum(dt*exp((f(w)*i-a/T)*t).*I);
Iw=[Iw,Iw0];
end
Iw=Iw.';
rel_Iw=abs(Iw);   %ȡʵ��
imag_Iw=imag(Iw); %ȡ�鲿
A=4*pi./f.*rel_Iw;

subplot(3,1,1)
plot(f,rel_Iw)
axis([0 30 0 0.005])
subplot(3,1,2)
plot(f,abs(imag_Iw))
axis([0 30 0 0.005])
subplot(3,1,3)
plot(f,A)
axis([0 30 0 0.005])