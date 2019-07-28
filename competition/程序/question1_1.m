clc
clear

n1=1e5;
M1=4;
Tx=randint(n1,1,M1);
h=modem.pskmod(M1); %产生调制QPSK句柄
y1=modulate(h,Tx); %用QPSK句柄调制Tx信号
EbNo1=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb1=zeros(1,26);


for  i=1:26
Eb=EbNo1(1,i);
yNoise=awgn(y1,Eb,'measured'); %加噪声
g=modem.pskdemod(M1); %产生解调句柄
Rx=demodulate(g,yNoise); %解调信号
num_biterr=biterr(Tx,Rx); %计算错误的比特数
P=num_biterr/n1; %计算错误的比特概率
Pb1(1,i)=P;
end

%semilogy(EbNo,Pb,'*b-')



M2=8;
n2=1e5;
x2=randint(n2,1,M2);
y2=modulate(modem.qammod(M2),x2);%产生调制8QAM句柄,并用8QAM句柄调制信号
EbNo2=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb2=zeros(1,26);
for  i=1:26
Eb=EbNo2(1,i);
yNoise=awgn(y2,Eb,'measured');%加噪声
z2=demodulate(modem.qamdemod(M2),yNoise);%产生解调句柄并解调信号
num_biterr=biterr(x2,z2); %计算错误的比特数
P=num_biterr/n2; %计算错误的比特概率
Pb2(1,i)=P;
end
%semilogy(EbNo2,Pb2,'*b-')
%hold on;

M3=16;
n3=1e5;
x3=randint(n3,1,M3);
y3=modulate(modem.qammod(M3),x3);%产生调制16QAM句柄,并用8QAM句柄调制信号
EbNo3=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
Pb3=zeros(1,26);
for  i=1:26
Eb=EbNo3(1,i);
yNoise=awgn(y3,Eb,'measured');%加噪声
z3=demodulate(modem.qamdemod(M3),yNoise);%产生解调句柄并解调信号
num_biterr=biterr(x3,z3); %计算错误的比特数
P=num_biterr/n3; %计算错误的比特概率
Pb3(1,i)=P;
end
figure('NumberTitle','off','Name','BER_SNR关系曲线');
semilogy(EbNo1,Pb1,'-+',EbNo2,Pb2,'-*',EbNo3,Pb3,'r:.');
xlabel('SNR/dB');ylabel('BER');
axis([0 20 10^(-4) 1]);
legend('QPSK','8QAM','16QAM');
grid on; 
box on;

