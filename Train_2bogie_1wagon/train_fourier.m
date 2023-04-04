fstr=length(ttr)/10;                          % Sample frequency (Hz)
Ttr=0:1/fstr:10-1/fstr;                % 10 sec sample
Xtr=Ftrtop;

%Use fft to compute the DFT y and its power:

mtr=length(Xtr);          % Window length
ntr=pow2(nextpow2(mtr));  % Transform length
Ytr=fft(Xtr,ntr);           % DFT
ftr=(0:ntr-1)*(fstr/ntr);     % Frequency range
powertr=Ytr.*conj(Ytr)/ntr;   % Power of the DFT

%nextpow2 finds the exponent of the next power of two greater 
%than or equal to the window length (ceil(log2(m))), and pow2 
%computes the power. Using a power of two for the transform length 
%optimizes the FFT algorithm, though in practice there is usually 
%little difference in execution time from using n = m.

%To visualize the DFT, plots of abs(y), abs(y).^2, and log(abs(y)) 
%are all common. A plot of power versus frequency is called a periodogram:

plot(ftr,powertr,'k')
xlabel('Frekans (Hz)')
ylabel('Y(f)')
title('Tren Frekans Cevabý')
xlim([0 32]);