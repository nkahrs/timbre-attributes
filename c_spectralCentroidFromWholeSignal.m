function foo = c_spectralCentroidFromWholeSignal(filepath, fftSize, ...
    hopSize, zeroPadding, startpos, endpos)
% combine the previous weeks' stuff into one big function
% this may or may not be useful, since we'll want to share the spectrogram
% with other measures later on...
% start, end: where in the signal (from 0 to 1) to start looking at

% first, read in file
fullSignal = audioread(filepath);
% set sample rate
foo = audioinfo(filepath);
fs = foo.SampleRate;

% truncate signal as appropriate
len = length(fullSignal);
fullSignal = fullSignal(floor(startpos*len)+1:floor(endpos*len));

% before going into spectrogram, make sure signal is just a row vector
size(fullSignal)

% make magnitude spectrogram
spectrogram = b_abstracted_spectrogram_magnitude(fullSignal, ...
    fftSize, hopSize, zeroPadding);

% calculate spectral centroid
fullCentroid = b_spectralCentroid(spectrogram, fs);

% return spectral centroid
foo = fullCentroid;


% now, plot!
figure;

% timepoints for waveform (in minutes!)
waveformX = (1 / fs / 60) .* (1:length(fullSignal));
subplot(3,1,1);
plot(waveformX, fullSignal);
title("waveform");
xlabel("time (minutes)");
xlim([0 waveformX(end)]);
ylabel("sample value");

% timepoints for spectral measures (also in minutes!)
spectralX = (hopSize / fs / 60) .* (1:size(spectrogram,2));

subplot(3,1,2);
imagesc(flipud(spectrogram));
title("spectrogram");
% again from hw3: adjust axis labels
% adjust x axis labels to be in minutes (multiply # of hops by calculated
% hop size in minutes)
xticklabels(arrayfun(@(numhops) round(spectralX(numhops),2), xticks));
% likewise adjust y axis labels to correspond to bin frequencies
xlabel("time (min)");
numBins = (zeroPadding * fftSize / 2 + 1);
disp(numBins)
yticklabels(arrayfun(@(inversebin) round( ...
    (numBins - inversebin) * (fs/2/numBins), 2), yticks));
ylabel("frequency (Hz)");


subplot(3,1,3);
plot(spectralX, fullCentroid);
title("spectral centroid");
xlabel("time (minutes)");
xlim([0 spectralX(end)]);
ylabel("spectral centroid (Hz)");


% current status: this makes a decent plot, I should adjust contrast and
% scaling on the actual spectrogram.