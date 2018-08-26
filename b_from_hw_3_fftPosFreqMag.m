function mags = fftPosFreqMag(signal)
% return only the magnitudes, and only for the positive freqs
% calculate fft
fftSig = fft(signal);
% note signal length
sigLen = length(signal);
% ceiling of half of signal length
halfLen = ceil((sigLen+1)/2);
% take positive frequencies only
fftSig = fftSig(1:halfLen);
% calculate magnitudes
%mags = mag2db(abs(fftSig)/sigLen);
% 4/17: leave as amplitudes rather than in dB
mags = abs(fftSig)/sigLen; 
