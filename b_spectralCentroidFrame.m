function centroidScalar = b_spectralCentroidFrame(frame, fs)
%% calculates the individual spectral centroid of a single spectrogram frame
%% assumes first bin is at 0 Hz, last bin at fs/2 Hz

numerator = 0;
denominator = 0;
numBins = length(frame);
binFreqGap = fs / (2 * (numBins - 1));

for i = 1:numBins
    thisBin = frame(i);
    thisBinFreq = (i-1) * binFreqGap;
    numerator = numerator + thisBinFreq * thisBin;
    denominator = denominator + thisBin;
end

centroidScalar = numerator / denominator;