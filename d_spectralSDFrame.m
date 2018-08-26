function spectralSDScalar = d_spectralSDFrame(frame, centroidFrame, fs)
%% given one frame of a spectrogram, single centroid value corresponding
%% to that frame, sample rate
%% calculate spectral standard deviation from that data

numerator = 0;
denominator = 0;
numBins = length(frame);
binFreqGap = fs / (2 * (numBins - 1));

for i = 1:numBins
    thisBin = frame(i);
    thisBinFreq = (i-1) * binFreqGap;
    numerator = numerator + ...
        (((thisBinFreq - centroidFrame)^2) * thisBin);
    denominator = denominator + thisBin;
end

spectralSDScalar = sqrt(numerator / denominator);
