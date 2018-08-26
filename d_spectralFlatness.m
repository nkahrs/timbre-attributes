function flatnessVector = d_spectralFlatness(...
    spectrogram)
%% given a spectrogram and sample rate,
%% calculate the spectral flatness at each frame

flatnessVector = zeros(1, size(spectrogram,2));

for i = 1:length(flatnessVector)
    thisFrame = spectrogram(:,i);
    flatnessVector(i) = geomean(thisFrame) / mean(thisFrame);
end
