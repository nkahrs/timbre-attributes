function sdVector = d_spectralStandardDeviation(...
    spectrogram, centroidVector, fs)
%% given a spectrogram, pre-calculated spectral centroid, and sample rate,
%% calculate the spectral standard deviation at each frame

% initialize
sdVector = zeros(size(centroidVector));
for i = 1:length(sdVector)
    sdVector(i) = d_spectralSDFrame(spectrogram(:,i), centroidVector(i), fs);
end
