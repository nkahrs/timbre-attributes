function centroidVector = b_spectralCentroid(spectrogram, fs)
%% given a spectrogram, calculates spectral centroid for each frame
%% assumes columns are frames, rows cover exactly the positive frequency range

centroidVector = zeros(1, size(spectrogram,2));

for i = 1:length(centroidVector)
    centroidVector(i) = b_spectralCentroidFrame(spectrogram(:,i), fs);
end
