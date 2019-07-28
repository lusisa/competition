clear all;clc;close all;

SnrSeq =  (0:1:25);
Iters = 1e4;

result = zeros(3,length(SnrSeq));
for ii=1:length(SnrSeq)
    
    TxBit1 = randi([0 7],1,Iters);
    TxSym1 = qammod2(TxBit1,8)/sqrt(4.7);
    
    TxBit2 = randi([0 7],1,Iters);    
    TxSym2 = qammod2(TxBit2,9)/sqrt(0.8793);
    
    Noise = (randn(1,Iters)+randn(1,Iters)*1i)*10^(-SnrSeq(ii)/20)/sqrt(2);
    RxSym1 = TxSym1+Noise;
    RxSym2 = TxSym2+Noise;
    
    RxBit1 = qamdemod2(RxSym1*sqrt(4.7),8);
    RxBit2 = qamdemod2(RxSym2*sqrt(0.8793),9);
    
    Bc1 = dec2bin(RxBit1,3)==dec2bin(TxBit1,3);
    Bc2 = dec2bin(RxBit2,3)==dec2bin(TxBit2,3);
    
    result(1,ii) = sum(Bc1(:)==0)/Iters/2;
    result(2,ii)  = sum(Bc2(:)==0)/Iters/3;
end

figure('NumberTitle','off','Name','BER_SNR关系曲线');clf;hold on;
plot(SnrSeq,result(1,:),'r-*');
plot(SnrSeq,result(2,:),'b-o');
plot(SnrSeq,result(3,:),'k-x');
xlabel('SNR/dB');ylabel('BER');
set(gca,'yscale','log');
legend('8QAM','讨论1新方案');
grid on; box on;

Iters = 100;
TxBit1 = randi([0 7],1,Iters);
TxSym1 = qammod2(TxBit1,8)/sqrt(4.7);
TxBit2 = randi([0 7],1,Iters);
TxSym2 = qammod2(TxBit2,9)/sqrt(0.8793);

figure('NumberTitle','off','Name','发射星座图');clf;hold on;
subplot(1,2,1);plot(TxSym1,'b*');title('8QAM发射星座图');axis equal;axis([-2 2 -2 2])
subplot(1,2,2);plot(TxSym2,'b*');title('讨论1QAM发射星座图');axis equal;axis([-2 2 -2 2])


SNR = 10;
Noise = (randn(1,Iters)+randn(1,Iters)*1i)*10^(-SnrSeq(ii)/20)/sqrt(2);
RxSym1 = TxSym1+Noise;
RxSym2 = TxSym2+Noise;
figure('NumberTitle','off','Name','10dB时接收星座图');clf;hold on;
subplot(1,2,1);plot(RxSym1,'b*');title('10dB 8QAM接收星座图');axis equal;axis([-2 2 -2 2])
subplot(1,2,2);plot(RxSym2,'b*');title('10dB 讨论1QAM接收星座图');axis equal;axis([-2 2 -2 2])



