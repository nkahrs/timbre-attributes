%% Problem 2a
% read in audio file
violinWav = audioread('b_from_hw_3_violin.wav');

% all window start points in samples, leaving enough room for the last
% window to be calculated. Encode hop size 512 here.
windowStarts = 1:512:length(violinWav)-1024;

% allocate violin spectrogram matrix to fill
violinSpectrogram = zeros(2049, length(windowStarts));

% only calculate 1024-size Hamming window once
hw1024 = hamming(1024);

for j = 1:length(windowStarts)
    % signal chunk
    i = windowStarts(j);
    signal = violinWav(i:i+1023);
    % apply Hamming window
    signal = hw1024 .* signal;
    % 4x zero pad
    signal = b_from_hw_3_zeropad(signal', 4);
    % take fft magnitudes for pos freqs
    spectrum = b_from_hw_3_fftPosFreqMag(signal);
    % add to the matrix
    violinSpectrogram(:,j) = spectrum';
end

% the issue here is that now high frequencies appear on top, which is an
% issue, so we flip the spectrum matrix before plotting
% plot window
figure;
imagesc(flipud(violinSpectrogram));
xlabel("time (s)");
ylabel("frequency (Hz)");
title("spectrogram of violin.wav");
% adjust x axis labels to be in seconds (multiply # of hops by calculated
% hop size in seconds
xticklabels(arrayfun(@(numhops) round( ...
    numhops * length(violinWav)/22050/length(windowStarts), 2), xticks));
% likewise adjust y axis labels to correspond to bin frequencies
yticklabels(arrayfun(@(inversebin) round( ...
    (2049 - inversebin) * (22050/2/2049), 2), yticks));

