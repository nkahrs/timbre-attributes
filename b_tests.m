violinWav = audioread('b_from_hw_3_violin.wav');

violinSpectrogram = b_abstracted_spectrogram_magnitude(...
    violinWav, 1024, 512, 4);

figure;
imagesc(violinSpectrogram)
title('upside-down spectrogram, fft size 1024, hop size 512, 4x zero-padding');

figure;
subplot(2,1,1);
imagesc(violinSpectrogram)
subplot(2,1,2);
plot(b_spectralCentroid(violinSpectrogram, 44100));
xlim([1 size(violinSpectrogram, 2)])

% figure;
% violinSpectrogram = b_abstracted_spectrogram_magnitude(...
%     violinWav, 256, 128, 1);
% imagesc(violinSpectrogram);
% title('upside-down spectrogram, fft size 256, hop size 128, 1x zero-padding');
% 
% figure;
% violinSpectrogram = b_abstracted_spectrogram_magnitude(...
%     violinWav, 4096, 1024, 16);
% imagesc(violinSpectrogram);
% title('upside-down spectrogram, fft size 4096, hop size 1024, 16x zero-padding');

