function Out = qamdemod2(In,mod)

switch mod
    case 8
        ModSymmbol = [-1+1i 1+1i -1-1i 1-1i -2.731 2.731*1i -2.731*1i 2.731];
        for ii=1:length(In)
            Dis = abs(ModSymmbol-In(ii));
            [~,Ind] = min(Dis);
            Out(ii) = Ind-1;
        end
    case 9
         ModSymmbol =[0 exp(1i*2*pi*(0:6)/7)];
        for ii=1:length(In)
            Dis = abs(ModSymmbol-In(ii));
            [~,Ind] = min(Dis);
            Out(ii) = Ind-1;
        end
end