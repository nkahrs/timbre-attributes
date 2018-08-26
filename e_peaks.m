function peaksVector = e_peaks(spectrogram, fs, threshold)
%% given a spectrogram, return a vector with peak values and amplitudes at each frame

peaksVector = cell(1, size(spectrogram,2));

for i = 1:length(peaksVector)
    peaksVector(i) = e_peaksFrame(spectrogram(:,i), fs, threshold);
end

