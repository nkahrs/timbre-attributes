function inharmonicityFrame = e_inharmonicityFrame_old(peaks)
%% for a given list of peaks, calculate inharmonicity as if they're just all harmonics
%% deprecated in favor of a better one

peaks = cell2mat(peaks);

% formula from Farbood/Price
% first, null case if no peaks
if (isempty(peaks))
    inharmonicityFrame = 0;
else
    % first, extract peak frequencies and amplitudes from the cell
    freqs = peaks(:,1);
    mags = peaks(:,2);
    % establish fundamental
    f_0 = freqs(1);
    numerator = 0;
    denominator = 0;
    for n = 1:length(freqs)
        atn2 = mags(n)^2;
        fnmnf0 = abs(freqs(n) - (n*f_0));
        numerator = numerator + (fnmnf0 * atn2);
        denominator = denominator + atn2;
    end
    inharmonicityFrame = (2 * numerator) / (f_0 * denominator);
end