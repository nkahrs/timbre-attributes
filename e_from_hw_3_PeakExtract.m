function peak = e_from_hw_3_PeakExtract(MagSpec, MagTh)
% Peak detection from magnitude spectrum
% Input
% - MagSpec : magnitude spectrum (pos freqs only) now in RAW AMPLITUDES
% - MagTh : the absolute threshold in dB (peaks above the maximum amplitude minus this value are considered)
% Output
% - peak : frequency bins of detected peaks

% maximum amplitude
maxAmp = max(MagSpec);
% treshold thus determined
threshold = maxAmp*db2mag(-MagTh);
% initialize list of peaks
peak = [];

for i = 2:length(MagSpec)-1
    % local maximum
    if ((MagSpec(i) > MagSpec(i-1)) && (MagSpec(i) > MagSpec(i+1)))
        % above threshold
        if (MagSpec(i) > threshold) 
            peak = [peak, i];
        end
    end
end