function Out = qammod2(In,mod)

switch mod
    case 8
        ModSymmbol = [-1+1i 1+1i -1-1i 1-1i -2.731 2.731*1i -2.731*1i 2.731];
        Out = ModSymmbol(In+1);
    case 9
        ModSymmbol =[0 exp(1i*2*pi*(0:6)/7)];
        Out = ModSymmbol(In+1);
end