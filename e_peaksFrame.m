function peaksCell = e_peaksFrame(frame, fs, threshold)
%% given a frame and sample rate, return frequencies and amplitudes
[bins, mags] = e_from_hw_3_PeakInterpolate(frame', ...
    e_from_hw_3_PeakExtract(frame, threshold));
freqs = (fs/2)/(length(frame)-1) * bins;

% freqs, mags are both row vectors. But we want two columns. So,
peaksCell = {[freqs' mags']};