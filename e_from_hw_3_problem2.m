%% Problem 2a from hw 3: included here to test peak interpolation in context
% read in audio file
violinWav = audioread('b_from_hw_3_violin.wav');

violinSpectrogram = b_abstracted_spectrogram_magnitude(violinWav', 1024, 512, 4);

%% problem 2b: see PeakExtract.m

%% problem 2c: see PeakInterpolate.m

%% problem 2d
figure;
% first, consider 20th frame
spectrum2d = violinSpectrogram(:,20); % need to consider in db
% establish frequencies
xs2d = 0:(22050/2)/2048:22050/2;
plot(xs2d, spectrum2d');
title("magnitude spectrum of 20th frame of violin.wav");
xlabel("frequency (Hz)");
ylabel("magnitude (raw)");

% interpolate peaks
[bins2d, mags2d] = e_from_hw_3_PeakInterpolate(spectrum2d', ...
    e_from_hw_3_PeakExtract(spectrum2d, 40));
% label each bin by its min frequency
freqs2d = (22050/2)/2048 * bins2d;

% plot as red circles
hold on;
scatter(freqs2d, mags2d)
