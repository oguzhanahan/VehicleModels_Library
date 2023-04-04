Ntr=length(t); %% number of points
Ttr=80; %% define time of interval
ttrr=[0:Ntr-1]/Ntr; %% define time
ttrr=ttrr*Ttr; %% define time in seconds
ftr=FK; %%define function
ptr=abs(fft(ftr))/(Ntr/2); %% absolute value of the fft
ptr=ptr(1:Ntr/2).^2; %% take the power of positve freq. half
freqtr=[0:Ntr/2-1]/Ttr; %% find the corresponding frequency in Hz
plot(freqtr,ptr); %% plot on semilog scale
%xlim([0 10]);

fstr=length(t)/10;           % Sample frequency (Hz)
tttrrr=0:1/fstr:10-1/fstr;     % Sample time (s)
xtr=FK;                    % Function
mtr=length(xtr);               % Window length
ntr=pow2(nextpow2(mtr));       % Transform length
ytr=fft(xtr,ntr);              % DFT
ftrtr=(0:ntr-1)*(fstr/ntr);      % Frequency range
powertr=ytr.*conj(ytr)/ntr;    % Power of the DFT
%plot(ftrtr,powertr)
%xlabel('Frequency (Hz)')
%ylabel('Power')
xlim([0 20]);