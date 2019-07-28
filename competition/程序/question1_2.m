clc
clear

n1=1e5;
M1=4;
Tx=randint(n1,1,M1);
h=modem.pskmod(M1); %��������QPSK���
y1=modulate(h,Tx); %��QPSK�������Tx�ź�
EbNo1=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb1=zeros(1,26);
for  i=1:26
Eb=EbNo1(1,i);
yNoise=awgn(y1,Eb,'measured'); %������
g=modem.pskdemod(M1); %����������
Rx=demodulate(g,yNoise); %����ź�
num_biterr=biterr(Tx,Rx); %�������ı�����
P=num_biterr/n1; %�������ı��ظ���
Pb1(1,i)=P;
end

M2=8;
n2=1e5;
x2=randint(n2,1,M2);
y2=modulate(modem.qammod(M2),x2);%��������8QAM���,����8QAM��������ź�
EbNo2=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb2=zeros(1,26);
for  i=1:26
Eb=EbNo2(1,i);
ynoisy=awgn(y2,Eb,'measured');%������
z2=demodulate(modem.qamdemod(M2),ynoisy);%����������������ź�
num_biterr=biterr(x2,z2); %�������ı�����
P=num_biterr/n2; %�������ı��ظ���
Pb2(1,i)=P;
end

M3=16;
n3=1e5;
x3=randint(n3,1,M3);
y3=modulate(modem.qammod(M3),x3);%��������16QAM���,����8QAM��������ź�
EbNo3=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb3=zeros(1,26);
for  i=1:26
Eb=EbNo3(1,i);
ynoisy=awgn(y3,Eb,'measured');%������
z3=demodulate(modem.qamdemod(M3),ynoisy);%����������������ź�
num_biterr=biterr(x3,z3); %�������ı�����
P=num_biterr/n3; %�������ı��ظ���
Pb3(1,i)=P;
end

n=1/0.026;%80kmʱ�ķŴ����Ŵ���
%n=1/0.01;%100kmʱ�ķŴ����Ŵ���
Gain=10*log10(n);
h=6.62606896*10^(-34);
f=193.1*10^(12);
B=50*10^(9);
NF=4;
P=2*pi*h*f*B*(NF-1/Gain);
P1=P*2/3;
P2=P*Gain;
Ps=10^(-3);
finaly=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
BER1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
BER2=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
BER3=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

for i=3:20
BER1(1,i-2)=Pb1(1,i+1);
BER2(1,i-2)=Pb2(1,i+1);
BER3(1,i-2)=Pb3(1,i+1);
snr=EbNo1(1,i+1);
Pn=Ps/(10^(snr/10));
finaly(1,i-2)=Pn/(P1+P2);
end
figure('NumberTitle','off','Name','80kmʱ BER_�������ϵ����');
%figure('NumberTitle','off','Name','100kmʱ BER_�������ϵ����');
semilogy(finaly,BER1,'-+',finaly,BER2,'-*',finaly,BER3,'r:.');
legend('QPSK','8QAM','16QAM');
xlabel('�����');ylabel('BER');
axis([0 120 10^(-4) 1]);
grid on; box on;
