function pitch = e_cepsPitch(frame, fs);
%% given a frame and sample rate, estimate pitch as max nonzero cepstrum value
% this is admittedly a very crude way of doing this, since I currently make
% no effort at interpolation.

xhat = ifft(log(frame(2:end)));

% 11 is an arbitrary cutoff to minimize attack transients.
[~, maxBin] = max(abs(xhat(11:(length(xhat)/2))));
maxBin = maxBin + 10;

% maxBin is number of samples, convert to freq
% first convert to seconds: samples * sec / sample = samples / sampleRate
% then 1 / period = frequency
pitch = fs / maxBin;

