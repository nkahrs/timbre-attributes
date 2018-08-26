function inharmonicityFrame = e_inharmonicityFrame(peaks)
%% given list of peaks, calculate inharmonicity

peaks = cell2mat(peaks);

% formula from Farbood/Price
% first, null case if no peaks
if (isempty(peaks))
    inharmonicityFrame = 0;
else
    % get freqs, mags
    freqs = peaks(:,1);
    mags = peaks(:,2);
    % first, estimate pitch as average distance between successive peaks
    % (median so that extremes don't skew it)
    peakDists = freqs;
    for i = 2:length(freqs)
        peakDists(i) = freqs(i) - freqs(i-1);
    end
    f_0 = median(peakDists);
    
    % initialize calculation
    numerator = 0;
    denominator = 0;
    % for as many harmonics as there are peaks, look for the nearest actual
    % peak to theoretical harmonic and add to inharmonicity calculation
    % appropriately
    
    % only look as far in the harmonic series as is relevant for the list
    % of peaks
    maxPartial = round(max(freqs) / f_0);
    maxPartial = min(maxPartial, length(freqs));
    
    for n = 1:maxPartial
        % all absolute values relative to nth harmonic
        freqDiffs = abs(freqs - (n * f_0));
        [thisDiff, index] = min(freqDiffs);
        % relevant peak magnitude
        mag_n = mags(index);
        atn2 = mag_n^2;
        numerator = numerator + (thisDiff * atn2);
        denominator = denominator + atn2;
    end
    inharmonicityFrame = (2 * numerator) / (f_0 * denominator);
end
