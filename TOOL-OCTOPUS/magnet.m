clear all
%%%%%%%%%%%%%%%%%%%%       ��ȡm(q,t)   %%%%%%%%%%%%%%%%%%%%%%
%path0=['D:\data\complex oxide\SrFeO2\test\transverse_magnetization_q001']; %m(q,t)·��

path0=['D:\data\complex oxide\SrFeO2\transverse_magnetization_q001'];
data=dlmread(path0,'',1,0);
t=data(:,1);
t=t*0.03677;     %Hatreeת��eV
mt=data(:,2);
dt=t(2);
T=max(t);
NT=length(t);
%%%%%%  FFT ����
a=10;   %չ��
fn=1/dt;
f=linspace(0,fn,NT);
f=f*pi;
mqw=0;
for w=2:NT
mqw0=sum(dt*exp((f(w)*i-a/T)*t).*mt);
mqw=[mqw,mqw0];
end
mqw=mqw.';
rel_mqw=real(mqw);   %ȡʵ��
imag_mqw=imag(mqw); %ȡ�鲿

subplot(2,1,1)
plot(f,rel_mqw)
axis([0 100 -0.05 0])
subplot(2,1,2);
plot(f,imag_mqw)
axis([0 100 -0.02 0])


