[x fs]=audioread('clean.wav');
[y fs]=audioread('enhanced.wav');
if length(x)~=length(y)  
    if length(x)>length(y)
        z=x(1:length(y));
        audiowrite('1.wav',z,fs);
        audiowrite('2.wav',y,fs);
    elseif length(x)<length(y)
        z=y(1:length(x));
         audiowrite('1.wav',x,fs);
        audiowrite('2.wav',z,fs);
    else
         audiowrite('1.wav',x,fs);
         audiowrite('2.wav',y,fs);
    end
    
end    
pval = pesq ('1.wav','2.wav');
% pval1 = pesq ('clean.wav','enhanced.wav');
disp(pval);

[x1 fs]=audioread('1.wav');
[y1 fs]=audioread('2.wav');
est=estoi(x1, y1, fs);
disp(est);
st=stoi(x1, y1, fs);
disp(st);

[SDR,SIR,SAR,perm] = bss_eval_sources(y1',x1');
disp(SDR)