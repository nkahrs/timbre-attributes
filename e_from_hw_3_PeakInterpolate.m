function [peak, peakAmp] = e_from_hw_3_PeakInterpolate(MagSpec, peak)
% Quadratic interpolation
% Input
% - MagSpec : magnitude spectrum measured in dB (as row vector)
% - peak : frequency bins of detected peaks
% Output
% - peak : interpolated peak frequencies (in frequency bins)
% - peakAmp : interpolated peak amplitudes (in dB)

peakOut = [];
peakAmp = [];

for i = peak
    % x-values for interpolation (peak bin and adjacent)
    xs = [-1:1]+i;
    % y-values for interpolation (magnitude lookup for x-values)
    ys = MagSpec(xs);
    % get coefficients for quadratic interpolation
    % I shift the center to 0 (ie subtract i from x-values)
    % to avoid warnings, but I then have to keep track of this
    querp = polyfit(xs-i, ys, 2);
    % interpolated freq in bins: -b/2a
    querpFreq = -querp(2)/(2*querp(1));
    % interpolated magnitude: ax^2+bx+c, x=querpFreq
    querpMag = querp(1)*(querpFreq^2)+querp(2)*querpFreq+querp(3);
    % append values, remembering that querpFreq is shifted to be
    % zero-centered rather than i-centered
    peakOut = [peakOut, querpFreq+i];
    peakAmp = [peakAmp, querpMag];
end

% change "peak" value to reflect output rather than input
peak = peakOut;