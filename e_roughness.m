function roughnessVector = e_roughness(peakss)
%% given a spectrogram, calculates spectral centroid for each frame
%% assumes columns are frames, rows cover exactly the positive frequency range

roughnessVector = zeros(1, size(peakss,2));

for i = 1:length(roughnessVector)
    roughnessVector(i) = e_roughnessFrame(peakss(i));
end
